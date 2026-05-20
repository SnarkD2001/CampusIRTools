document.addEventListener("DOMContentLoaded", function () {
  // Act card toggle
  document.querySelectorAll(".act-header").forEach(function (header) {
    header.addEventListener("click", function () {
      var card = this.closest(".act-card");
      if (card.classList.contains("act-locked")) return;
      card.classList.toggle("open");
    });
  });

  // Complete act button
  document.querySelectorAll(".btn-complete").forEach(function (btn) {
    btn.addEventListener("click", function (e) {
      e.stopPropagation();
      var card = this.closest(".act-card");
      var next = card.nextElementSibling;

      card.classList.add("completed");
      card.querySelector(".act-status").textContent = "COMPLETED";
      card.querySelector(".act-status").className = "act-status act-done";
      var feedback = card.querySelector(".act-feedback");
      if (feedback) feedback.classList.add("show");

      if (next && next.classList.contains("act-card")) {
        next.classList.remove("locked");
        next.classList.add("active");
        next.querySelector(".act-status").textContent = "ACTIVE";
        next.querySelector(".act-status").className = "act-status act-active";
      }

      updateTimeline();
    });
  });

  // Rotating footer quotes
  var quotes = document.querySelectorAll(".footer-quotes .quote");
  if (quotes.length > 1) {
    var idx = 0;
    quotes[idx].style.display = "block";
    setInterval(function () {
      quotes[idx].style.display = "none";
      idx = (idx + 1) % quotes.length;
      quotes[idx].style.display = "block";
    }, 5000);
  } else if (quotes.length === 1) {
    quotes[0].style.display = "block";
  }

  // Timeline activation based on completed acts
  function updateTimeline() {
    var items = document.querySelectorAll(".tl-item");
    var acts = document.querySelectorAll(".act-card");
    var completedCount = 0;
    acts.forEach(function (a) {
      if (a.classList.contains("completed")) completedCount++;
    });
    items.forEach(function (item, i) {
      if (i < completedCount + 1) {
        item.classList.add("active");
      } else {
        item.classList.remove("active");
      }
    });
  }

  // Lock interaction for locked cards
  document.querySelectorAll(".act-card.locked").forEach(function (card) {
    card.querySelector(".act-header").style.cursor = "not-allowed";
  });
});