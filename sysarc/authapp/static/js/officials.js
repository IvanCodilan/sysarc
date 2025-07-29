// officials.js
function openOfficialsModal() {
  fetch('/get-officials/')
    .then(response => response.json())
    .then(data => {
      const container = document.getElementById('officialsEditContainer');
      container.innerHTML = '';
      
      data.forEach(official => {
        const div = document.createElement('div');
        div.style.marginBottom = '15px';
        div.innerHTML = `
          <h4>${official.position}${official.committee !== 'None' ? ' - ' + official.committee : ''}</h4>
          <input type="text" value="${official.name}" data-id="${official.id}" 
                 style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
        `;
        container.appendChild(div);
      });
      
      document.getElementById('officialsModal').style.display = 'flex';
    });
}

function closeOfficialsModal() {
  document.getElementById('officialsModal').style.display = 'none';
}

function saveOfficials() {
  const inputs = document.querySelectorAll('#officialsEditContainer input');
  const officialsData = [];
  
  inputs.forEach(input => {
    officialsData.push({
      id: parseInt(input.dataset.id), // Ensure ID is a number
      name: input.value
    });
  });
  
  fetch('/update-officials/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRFToken': getCookie('csrftoken')
    },
    body: JSON.stringify(officialsData)
  })
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      alert('Officials updated successfully!');
      closeOfficialsModal();
      updateCertificatePreview();
    } else {
      alert('Error: ' + data.error);
    }
  })
  .catch(error => {
    console.error('Error:', error);
    alert('An error occurred while saving');
  });
}

// Helper function to get CSRF token
function getCookie(name) {
  let cookieValue = null;
  if (document.cookie && document.cookie !== '') {
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      if (cookie.substring(0, name.length + 1) === (name + '=')) {
        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
        break;
      }
    }
  }
  return cookieValue;
}
// Update certificate preview with current officials
function updateCertificatePreview() {
  fetch('/get-officials/')
    .then(response => response.json())
    .then(data => {
      // Implement this based on your preview update needs
      console.log('Officials data loaded for preview:', data);
    });
}

// Initialize event listeners when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Add any initialization code here if needed
});