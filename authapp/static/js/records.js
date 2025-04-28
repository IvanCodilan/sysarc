// Toggle sidebar collapse
function toggleSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.classList.toggle('collapsed');

    const records = document.querySelector('.records');
    if (sidebar.classList.contains('collapsed')) {
        records.style.marginLeft = '70px';
    } else {
        records.style.marginLeft = '270px';
    }
}

// Open Add Form
function openAddForm() {
    document.getElementById('addForm').style.display = 'block';
}

// Close Add Form
function closeAddForm() {
    document.getElementById('addForm').style.display = 'none';
}

// Add Resident
function submitAddForm() {
    const data = {
        first_name: document.getElementById('first_name').value,
        middle_name: document.getElementById('middle_name').value,
        last_name: document.getElementById('last_name').value,
        date_of_birth: document.getElementById('date_of_birth').value,
        place_of_birth: document.getElementById('place_of_birth').value,
        gender: document.getElementById('gender').value,
        civil_status: document.getElementById('civil_status').value,
        occupation: document.getElementById('occupation').value,
        citizenship: document.getElementById('citizenship').value,
        relationship_to_household_head: document.getElementById('relationship_to_household_head').value,
        educational_background: document.getElementById('educational_background').value,
        region: document.getElementById('region').value,
        province: document.getElementById('province').value,
        city: document.getElementById('city').value,
        barangay: document.getElementById('barangay').value,
        street_number: document.getElementById('street_number').value,
        street: document.getElementById('street').value,
    };

    fetch('/add_resident/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': '{{ csrf_token }}',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Resident added!');
            location.reload();
        } else {
            alert('Failed to add!');
        }
    });
}

// Delete Resident
function deleteResident(id) {
    if (confirm('Are you sure you want to delete this resident?')) {
        fetch(`/delete_resident/${id}/`, {
            method: 'POST',
            headers: {
                'X-CSRFToken': '{{ csrf_token }}',
            },
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Resident deleted!');
                document.getElementById(`row-${id}`).remove();
            } else {
                alert('Failed to delete!');
            }
        });
    }
}

// Edit Resident (Improved version)
function editResident(id) {
    let row = document.getElementById(`row-${id}`);
    let columns = row.getElementsByTagName('td');
    let fullName = columns[1].innerText.trim().split(' ');
    let birthdate = columns[2].innerText.trim();
    let gender = columns[3].innerText.trim();
    let address = columns[4].innerText.trim().split(',');

    row.classList.add('editing-row');

    row.innerHTML = `
        <td>${columns[0].innerText}</td>
        <td>
            <div class="edit-field-group">
                <input type="text" id="edit_first_name" value="${fullName[0] || ''}" placeholder="First Name">
                <input type="text" id="edit_middle_name" value="${fullName[1] || ''}" placeholder="Middle Name">
                <input type="text" id="edit_last_name" value="${fullName[2] || ''}" placeholder="Last Name">
            </div>
        </td>
        <td>
            <input type="date" id="edit_date_of_birth" value="${birthdate}">
        </td>
        <td>
            <select id="edit_gender">
                <option value="Male" ${gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${gender == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${gender == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </td>
        <td>
            <div class="edit-field-group">
                <input type="text" id="edit_street_number" value="${address[0]?.trim() || ''}" placeholder="Street No.">
                <input type="text" id="edit_street" value="${address[1]?.trim() || ''}" placeholder="Street">
                <input type="text" id="edit_barangay" value="${address[2]?.trim() || ''}" placeholder="Barangay">
                <input type="text" id="edit_city" value="${address[3]?.trim() || ''}" placeholder="City">
                <input type="text" id="edit_province" value="${address[4]?.trim() || ''}" placeholder="Province">
            </div>
        </td>
        <td>
            <div class="edit-field-group">
                <input type="text" id="edit_occupation" value="${columns[5].innerText.trim()}" placeholder="Occupation">
                <input type="text" id="edit_citizenship" value="${columns[6].innerText.trim()}" placeholder="Citizenship">
                <input type="text" id="edit_relationship_to_household_head" value="${columns[7].innerText.trim()}" placeholder="Relationship">
                <input type="text" id="edit_educational_background" value="${columns[8].innerText.trim()}" placeholder="Education">
                <input type="text" id="edit_region" value="${columns[9].innerText.trim()}" placeholder="Region">
            </div>
        </td>
        <td>
            <button onclick="saveResident(${id})" class="save-btn">Save</button>
            <button onclick="cancelEdit(${id})" class="cancel-btn">Cancel</button>
        </td>
    `;
}

// Cancel Edit and revert back to original state
function cancelEdit(id) {
    location.reload(); // Simply reload the page to restore original state
}

// Save updated Resident
function saveResident(id) {
    const data = {
        first_name: document.getElementById('edit_first_name').value,
        middle_name: document.getElementById('edit_middle_name').value,
        last_name: document.getElementById('edit_last_name').value,
        date_of_birth: document.getElementById('edit_date_of_birth').value,
        gender: document.getElementById('edit_gender').value,
        street_number: document.getElementById('edit_street_number').value,
        street: document.getElementById('edit_street').value,
        barangay: document.getElementById('edit_barangay').value,
        city: document.getElementById('edit_city').value,
        province: document.getElementById('edit_province').value,
        occupation: document.getElementById('edit_occupation').value,
        citizenship: document.getElementById('edit_citizenship').value,
        relationship_to_household_head: document.getElementById('edit_relationship_to_household_head').value,
        educational_background: document.getElementById('edit_educational_background').value,
        region: document.getElementById('edit_region').value,
    };

    fetch(`/update_resident/${id}/`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': '{{ csrf_token }}',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Resident updated!');
            location.reload();
        } else {
            alert('Failed to update!');
        }
    });
}
