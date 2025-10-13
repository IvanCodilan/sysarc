// certificate-officials.js
document.addEventListener('DOMContentLoaded', function() {
  // Function to load officials
  function loadOfficials() {
    fetch('/get-officials/?t=' + new Date().getTime())  // Cache-busting
      .then(response => response.json())
      .then(officials => {
        const positionMap = {
          'Punong Barangay': 'punong-barangay',
          'Secretary': 'secretary',
          'Treasurer': 'treasurer',
          'SK Chairman': 'sk-chairperson'
        };

        // Update non-Kagawad officials
        officials.forEach(official => {
          if (positionMap[official.position]) {
            const element = document.getElementById(positionMap[official.position]);
            if (element) element.textContent = official.name;

            // If it's the Punong Barangay, also update the signature
            if (official.position === 'Punong Barangay') {
              const signatureName = document.getElementById('signature-name');
              if (signatureName) signatureName.textContent = official.name;
            }

            if (official.position === 'Secretary') {
              const signatureName = document.getElementById('signature-secretary');
              if (signatureName) signatureName.textContent = official.name;
            }
          }
        });

        // Update Kagawads in fixed order
        const kagawads = officials
          .filter(o => o.position === 'Kagawad')
          .sort((a, b) => a.order - b.order);

        for (let i = 0; i < 7; i++) {
          const element = document.getElementById(`kagawad-${i+1}`);
          if (element && kagawads[i]) {
            element.textContent = kagawads[i].name;
          }
        }

        // Wait for the DOM to visually update
        setTimeout(() => {
        }, 300); // Small delay (adjustable)
      })
      .catch(error => {
        console.error('Error loading officials:', error);
      });
  }

  loadOfficials(); // load once done
});
