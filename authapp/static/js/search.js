function toggleSidebar() {
    let sidebar = document.querySelector(".sidebar");
    let toggleIcon = document.querySelector(".toggle-icon");

    sidebar.classList.toggle("collapsed");

    // Change the arrow direction based on the sidebar state
    toggleIcon.innerHTML = sidebar.classList.contains("collapsed") ? "&#8594;" : "&#8592;";
}