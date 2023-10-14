// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("DOMContentLoaded", function() {
    var toggle = document.getElementById("toggle");
    if (toggle) {
      toggle.addEventListener("change", function() {
        if (this.checked) {
          this.value = "true";
        } else {
          this.value = "false";
        }
        var id = this.dataset.id;
        var url = "/recipes/" + id;
        var data = { public: this.value };
        fetch(url, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": Rails.csrfToken()
          },
          body: JSON.stringify(data)
        });
      });
    }
  });
  
