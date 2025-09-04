// records.js - unified and fixed for your template
// Features: sidebar toggle, add/edit modals, add/edit/delete via fetch, excel upload, live search & filter, record counting

// ---------- Configurable endpoints ----------
const ENDPOINTS = {
  add: '/add_resident/',        // change if your backend uses a different route
  update: '/update_resident/',  // expects /update_resident/<id>/
  delete: '/delete_resident/',  // expects /delete_resident/<id>/
  upload: '/upload_excel/'      // excel upload endpoint
};

// ---------- CSRF helper ----------
function getCookie(name) {
  const v = `; ${document.cookie}`;
  const parts = v.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(';').shift();
  return null;
}
const csrftoken = getCookie('csrftoken');

// ---------- Sidebar toggle (keeps existing behaviour) ----------
function toggleSidebar() {
  const sidebar = document.querySelector(".sidebar");
  const toggleIcon = document.querySelector(".toggle-icon");
  if (!sidebar || !toggleIcon) return;
  sidebar.classList.toggle("collapsed");
  toggleIcon.innerHTML = sidebar.classList.contains("collapsed") ? "&#8594;" : "&#8592;";
}

// ---------- Modal open/close ----------
function openAddForm(){ const m = document.getElementById('addResidentModal'); if(m) m.style.display='flex'; }
function closeAddForm(){ const m = document.getElementById('addResidentModal'); if(m) m.style.display='none'; }
function openEditForm(){ const m = document.getElementById('editResidentModal'); if(m) m.style.display='flex'; }
function closeEditForm(){ const m = document.getElementById('editResidentModal'); if(m) m.style.display='none'; }
window.addEventListener('click', (e) => {
  const addModal = document.getElementById('addResidentModal');
  const editModal = document.getElementById('editResidentModal');
  if (e.target === addModal) closeAddForm();
  if (e.target === editModal) closeEditForm();
});

// ---------- Add Resident ----------
document.addEventListener('DOMContentLoaded', () => {
  const addForm = document.getElementById('addResidentForm');
  if (addForm) {
    addForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const fd = new FormData(addForm);
      try {
        const res = await fetch(ENDPOINTS.add, {
          method: 'POST',
          headers: { 'X-CSRFToken': csrftoken },
          body: fd
        });
        if (res.ok) {
          location.reload();
        } else {
          const txt = await res.text();
          console.error('Add failed:', res.status, txt);
          alert('Failed to add resident');
        }
      } catch (err) {
        console.error(err);
        alert('Network error while adding resident');
      }
    });
  }
});

// ---------- Edit Resident (populate modal from hidden data) ----------
function editResident(id) {
  const row = document.getElementById(`row-${id}`);
  const dataDiv = document.getElementById(`resident-data-${id}`);
  if (!row || !dataDiv) {
    alert('Resident data not found');
    return;
  }

  // Names from visible cell (simple split; works for first middle last)
  const full = row.querySelector('td:nth-child(2)')?.innerText.trim() || '';
  const parts = full.split(/\s+/);
  document.getElementById('edit_first_name').value = parts[0] || '';
  document.getElementById('edit_middle_name').value = parts.length > 2 ? parts.slice(1, -1).join(' ') : (parts[1] || '');
  document.getElementById('edit_last_name').value = parts.length > 1 ? parts[parts.length - 1] : '';

  // Hidden inputs
  const getHidden = cls => (dataDiv.querySelector(`.${cls}`) ? dataDiv.querySelector(`.${cls}`).value : '');

  document.getElementById('edit_resident_id').value = id;
  document.getElementById('edit_date_of_birth').value = getHidden('date_of_birth') || '';
  document.getElementById('edit_place_of_birth').value = getHidden('place_of_birth') || '';
  document.getElementById('edit_gender').value = row.querySelector('td:nth-child(4)')?.innerText.trim() || getHidden('gender') || '';
  document.getElementById('edit_civil_status').value = getHidden('civil_status') || '';
  document.getElementById('edit_occupation').value = getHidden('occupation') || '';
  document.getElementById('edit_citizenship').value = getHidden('citizenship') || '';
  document.getElementById('edit_relationship_to_household_head').value = getHidden('relationship_to_household_head') || '';
  document.getElementById('edit_educational_background').value = getHidden('educational_background') || '';

  document.getElementById('edit_region').value = getHidden('region') || '';
  document.getElementById('edit_province').value = getHidden('province') || '';
  document.getElementById('edit_city').value = getHidden('city') || '';
  document.getElementById('edit_barangay').value = getHidden('barangay') || '';
  document.getElementById('edit_street_number').value = getHidden('street_number') || '';
  document.getElementById('edit_street').value = getHidden('street') || '';
  document.getElementById('edit_pwd_status').value = dataDiv.querySelector('.pwd_status').value;
  document.getElementById('edit_voter_status').value = dataDiv.querySelector('.voter_status').value;

  document.getElementById('editResidentModal').style.display = 'block';

  openEditForm();
}

// ---------- Submit Edit ----------
document.addEventListener('DOMContentLoaded', () => {
  const editForm = document.getElementById('editResidentForm');
  if (editForm) {
    editForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const id = document.getElementById('edit_resident_id').value;
      if (!id) { alert('Missing resident id'); return; }
      const fd = new FormData(editForm);
      try {
        // endpoint: /update_resident/<id>/
        const res = await fetch(`${ENDPOINTS.update}${id}/`, {
          method: 'POST',
          headers: { 'X-CSRFToken': csrftoken },
          body: fd
        });
        if (res.ok) {
          location.reload();
        } else {
          const txt = await res.text();
          console.error('Update failed', res.status, txt);
          alert('Failed to update resident');
        }
      } catch (err) {
        console.error(err);
        alert('Network error while updating resident');
      }
    });
  }
});

// ---------- Delete Resident ----------
async function deleteResident(id) {
  if (!confirm('Are you sure you want to delete this resident?')) return;
  try {
    const res = await fetch(`${ENDPOINTS.delete}${id}/`, {
      method: 'POST',
      headers: { 'X-CSRFToken': csrftoken }
    });
    if (res.ok) {
      // remove row from DOM
      const r = document.getElementById(`row-${id}`);
      if (r) r.remove();
      // re-run search to update counts / renumber
      if (typeof runLiveSearch === 'function') runLiveSearch();
    } else {
      console.error('Delete failed', res.status);
      alert('Failed to delete resident');
    }
  } catch (err) {
    console.error(err);
    alert('Network error while deleting resident');
  }
}

// ---------- Excel Upload ----------
document.addEventListener('DOMContentLoaded', () => {
  const excelForm = document.getElementById('excelUploadForm');
  if (!excelForm) return;
  excelForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const fd = new FormData(excelForm);
    try {
      const res = await fetch(ENDPOINTS.upload, {
        method: 'POST',
        headers: { 'X-CSRFToken': csrftoken },
        body: fd
      });
      if (res.ok) {
        const json = await res.json().catch(()=>null);
        alert((json && json.message) ? json.message : 'Upload successful');
        location.reload();
      } else {
        const txt = await res.text();
        console.error('Excel upload failed', res.status, txt);
        alert('Excel upload failed');
      }
    } catch (err) {
      console.error(err);
      alert('Network error during Excel upload');
    }
  });
});

// ---------- Live search + filter + record count + renumber ----------
let liveSearchEl, filterSelectEl, residentsBodyEl, recordCountEl;

function setupLiveSearch() {
  liveSearchEl = document.getElementById('liveSearch');
  filterSelectEl = document.getElementById('filterSelect');
  residentsBodyEl = document.getElementById('residents-body');
  recordCountEl = document.getElementById('recordCount');

  if (!residentsBodyEl) return;

  if (liveSearchEl) liveSearchEl.addEventListener('input', runLiveSearch);
  if (filterSelectEl) filterSelectEl.addEventListener('change', runLiveSearch);

  // initial count/renumber
  runLiveSearch();
}

function runLiveSearch() {
  if (!residentsBodyEl) return;
  const searchTerm = (liveSearchEl?.value || '').toLowerCase().trim();
  const filterValue = (filterSelectEl?.value || '').toLowerCase().trim();

  const rows = Array.from(residentsBodyEl.querySelectorAll('tr'));
  const originalRows = rows.filter(r => !r.querySelector('td[colspan]')); // exclude the empty-row placeholder

  let visibleCount = 0;
  const today = new Date();

  originalRows.forEach(row => {
    const fullName = (row.cells[1]?.textContent || '').toLowerCase();
    const birthdateText = (row.cells[2]?.textContent || '').trim();
    const gender = (row.cells[3]?.textContent || '').toLowerCase();
    const address = (row.cells[4]?.textContent || '').toLowerCase();
    const searchContent = `${fullName} ${gender} ${address}`;

    const matchesSearch = !searchTerm || searchContent.includes(searchTerm);

    let matchesFilter = true;

    if (filterValue) {
        const pwd = row.querySelector('.pwd_status')?.value.toLowerCase() || '';
        const voter = row.querySelector('.voter_status')?.value.toLowerCase() || '';

        if (filterValue === 'seniors' || filterValue === 'kids') {
            if (birthdateText) {
                const parsed = new Date(birthdateText);
                if (!isNaN(parsed)) {
                    const age = today.getFullYear() - parsed.getFullYear();
                    matchesFilter = filterValue === 'seniors' ? age >= 60 : age <= 17;
                } else {
                    matchesFilter = false;
                }
            } else {
                matchesFilter = false;
            }
        } else if (filterValue === 'male' || filterValue === 'female') {
            matchesFilter = gender === filterValue;
        } else if (filterValue === 'pwd') {
            matchesFilter = pwd === 'pwd';
        } else if (filterValue === 'nonpwd') {
            matchesFilter = pwd === 'non-pwd' || pwd === 'nonpwd';
        } else if (filterValue === 'voter') {
            matchesFilter = voter === 'voter';
        } else if (filterValue === 'nonvoter') {
            matchesFilter = voter === 'non-voter' || voter === 'nonvoter';
        }
    }


    if (matchesSearch && matchesFilter) {
      row.style.display = '';
      visibleCount++;
    } else {
      row.style.display = 'none';
    }
  });

  // handle empty placeholder row (the one created by {% empty %})
  const emptyRow = residentsBodyEl.querySelector('tr td[colspan]');
  if (emptyRow) {
    const tr = emptyRow.parentElement;
    if (visibleCount === 0) {
      tr.style.display = '';
      emptyRow.textContent = (searchTerm || filterValue) ? 'No matching residents found' : 'No residents found';
    } else {
      tr.style.display = 'none';
    }
  }

  if (recordCountEl) recordCountEl.textContent = `Total Records: ${visibleCount}`;

  // renumber visible rows
  let counter = 1;
  originalRows.forEach(row => {
    if (row.style.display !== 'none') {
      if (row.cells[0]) row.cells[0].textContent = counter++;
    }
  });
}

// initialize live search and other DOM wiring
document.addEventListener('DOMContentLoaded', () => {
  setupLiveSearch();


});
