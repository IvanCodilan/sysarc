document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("login-form");
    const errorBanner = document.getElementById("error-banner");
    const errorText = document.getElementById("error-text");
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");

    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent default form submission

        const formData = new FormData(form);

        fetch(form.action, {
            method: "POST",
            body: formData,
            headers: {
                "X-Requested-With": "XMLHttpRequest" // Django detects AJAX request
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.href = "/dashboard/"; // Redirect on success
            } else {
                errorText.textContent = data.error; // Set error message
                errorBanner.style.display = "flex"; // Show banner
                
                // Clear password field only
                passwordInput.value = "";

                // Add red border for error indication
                usernameInput.classList.add("input-error");
                passwordInput.classList.add("input-error");
            }
        })
        .catch(error => console.error("Error:", error));
    });

    // Remove red border when user focuses on the input fields
    usernameInput.addEventListener("focus", function () {
        usernameInput.classList.remove("input-error");
    });

    passwordInput.addEventListener("focus", function () {
        passwordInput.classList.remove("input-error");
    });
});
