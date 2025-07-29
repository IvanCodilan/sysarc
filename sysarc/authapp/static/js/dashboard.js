function toggleSidebar() {
    let sidebar = document.querySelector(".sidebar");
    let toggleIcon = document.querySelector(".toggle-icon");

    sidebar.classList.toggle("collapsed");

    // Change the arrow direction based on the sidebar state
    toggleIcon.innerHTML = sidebar.classList.contains("collapsed") ? "&#8594;" : "&#8592;";

    // Resize Chart.js chart if it exists
    if (populationChart) {
        populationChart.resize();
    }
}

let populationChart;

function renderChart(data) {
    const ctx = document.getElementById('populationChart').getContext('2d');
    populationChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
}

// SORTING DASHBOARD CARDS
document.addEventListener("DOMContentLoaded", function () {
    const sortSelect = document.getElementById("sortOption");
    const gridContainer = document.querySelector(".grid-container");

    sortSelect.addEventListener("change", function () {
        const cards = Array.from(gridContainer.querySelectorAll(".card"));
        const sortOrder = sortSelect.value;

        cards.sort((a, b) => {
            const aOrder = parseInt(a.getAttribute('data-order'));
            const bOrder = parseInt(b.getAttribute('data-order'));
            return sortOrder === "ascending" ? aOrder - bOrder : bOrder - aOrder;
        });

        gridContainer.innerHTML = "";
        cards.forEach(card => gridContainer.appendChild(card));
    });
});

