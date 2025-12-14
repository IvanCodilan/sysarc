// officials.js
function officialsAlert(message, options = {}) {
  if (window.showAlertDialog) {
    return showAlertDialog(message, { confirmText: 'OK', ...options });
  }
  alert(message);
  return Promise.resolve();
}

function openOfficialsModal() {
  fetch('/get-officials/')
    .then(response => response.json())
    .then(data => {
      const container = document.getElementById('officialsEditContainer');
      container.innerHTML = '';
      
      data.forEach(official => {
        const div = document.createElement('div');
        div.style.marginBottom = '15px';
        
        // Handle empty names - show empty textbox
        const displayName = official.name || '';
        
        div.innerHTML = `
          <h4>${official.position}${official.committee !== 'None' ? ' - ' + official.committee : ''}</h4>
          <input type="text" value="${displayName}" data-id="${official.id}" required aria-required="true" placeholder="Enter Full Name" 
                 style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
        `;
        container.appendChild(div);
      });
      
      document.getElementById('officialsModal').style.display = 'flex';

      if (document && document.body) {
        document.body.style.overflow = "hidden";
      }
    })
    .catch(error => {
      console.error('Error loading officials:', error);
      officialsAlert('Failed to load officials data. Please try again.');
    });
}

function closeOfficialsModal() {
  document.getElementById('officialsModal').style.display = 'none';
  if (document && document.body) {
    document.body.style.overflow = "";
  }
}

function saveOfficials() {
  const inputs = document.querySelectorAll('#officialsEditContainer input');
  const officialsData = [];
  let firstEmpty = null;
  
  inputs.forEach(input => {
    const name = input.value.trim();
    if (!name && !firstEmpty) {
      firstEmpty = input;
    }

    officialsData.push({
      id: parseInt(input.dataset.id),
      name: name
    });
  });
  
  if (firstEmpty) {
    officialsAlert("Please fill out all officials' names before saving.");
    firstEmpty.focus();
    return;
  }

  fetch('/update-officials/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRFToken': getCookie('csrftoken')
    },
    body: JSON.stringify(officialsData)
  })
  .then(response => response.json())
  .then(async data => {
    if (data.success) {
      await officialsAlert('Officials updated successfully!');
      closeOfficialsModal();
      updateCertificatePreview();
    } else {
      await officialsAlert('Error: ' + data.error);
    }
  })
  .catch(async error => {
    console.error('Error:', error);
    await officialsAlert('An error occurred while saving');
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
    })
    .catch(error => {
      console.error('Error updating preview:', error);
    });
}

// Initialize event listeners when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Add any initialization code here if needed
});