function toggleSidebar() {
    let sidebar = document.querySelector(".sidebar");
    let toggleIcon = document.querySelector(".toggle-icon");

    sidebar.classList.toggle("collapsed");

    // Change the arrow direction based on the sidebar state
    toggleIcon.innerHTML = sidebar.classList.contains("collapsed") ? "&#8594;" : "&#8592;";
}

function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let cookie of cookies) {
            cookie = cookie.trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function editResident(resident) {
    // Ito ilalagay mo lahat ng input fields
    document.getElementById('first_name').value = resident.first_name || '';
    document.getElementById('middle_name').value = resident.middle_name || '';
    document.getElementById('last_name').value = resident.last_name || '';
    document.getElementById('date_of_birth').value = resident.date_of_birth || '';
    document.getElementById('place_of_birth').value = resident.place_of_birth || '';
    document.getElementById('gender').value = resident.gender || '';
    document.getElementById('civil_status').value = resident.civil_status || '';
    document.getElementById('occupation').value = resident.occupation || '';
    document.getElementById('citizenship').value = resident.citizenship || '';
    document.getElementById('relationship_to_household_head').value = resident.relationship_to_household_head || '';
    document.getElementById('educational_background').value = resident.educational_background || '';
    document.getElementById('region').value = resident.region || '';
    document.getElementById('province').value = resident.province || '';
    document.getElementById('city').value = resident.city || '';
    document.getElementById('barangay').value = resident.barangay || '';
    document.getElementById('street_number').value = resident.street_number || '';
    document.getElementById('street').value = resident.street || '';

    // Ipakita ang form kung naka-hide
    document.getElementById('resident_form').style.display = 'block';

    // Kung gusto mo, pwede mo rin itago muna yung table para focused sa form
    document.getElementById('resident_table').style.display = 'none';

    // Save the resident ID para alam natin sino sine-save mamaya
    document.getElementById('resident_form').dataset.residentId = resident.id;
}


// Save resident info (update)
function saveResident() {
    const residentId = document.getElementById('resident_form').dataset.residentId;

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
        street: document.getElementById('street').value
    };

    fetch(`/update_resident/${residentId}/`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': getCookie('csrftoken') // if needed
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('Resident updated!');
            fetchResidents(); // reload table
            document.getElementById('resident_form').style.display = 'none';
            document.getElementById('resident_table').style.display = 'block';
        } else {
            alert('Update failed.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}


// Clear the form after save or cancel
function clearForm() {
    document.getElementById('resident_id').value = '';

    document.getElementById('region').value = '';
    document.getElementById('barangay').value = '';
    document.getElementById('last_name').value = '';
    document.getElementById('first_name').value = '';
    document.getElementById('middle_name').value = '';
    document.getElementById('street_number').value = '';
    document.getElementById('street').value = '';
    document.getElementById('city').value = '';
    document.getElementById('province').value = '';
    document.getElementById('date_of_birth').value = '';
    document.getElementById('place_of_birth').value = '';
    document.getElementById('gender').value = '';
    document.getElementById('civil_status').value = '';
    document.getElementById('occupation').value = '';
    document.getElementById('citizenship').value = '';
    document.getElementById('relationship_to_household_head').value = '';
    document.getElementById('educational_background').value = '';

    document.getElementById('addForm').style.display = 'none'; // Hide form after save/cancel
}

