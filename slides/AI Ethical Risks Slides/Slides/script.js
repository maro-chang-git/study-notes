const slides = document.querySelectorAll(".slide");
const counter = document.getElementById("counter");
const progress = document.getElementById("progress");
let i = 0;

const pad = n => String(n).padStart(2, "0");

function show(n) {
  i = Math.max(0, Math.min(slides.length - 1, n));
  slides.forEach((s, k) => s.classList.toggle("active", k === i));
  counter.innerHTML = "<b>" + pad(i + 1) + "</b> / " + pad(slides.length);
  progress.style.width = ((i + 1) / slides.length * 100) + "%";
  location.hash = i + 1;
}

document.addEventListener("keydown", e => {
  if (["ArrowRight", " ", "PageDown", "Enter"].includes(e.key)) { e.preventDefault(); show(i + 1); }
  else if (["ArrowLeft", "PageUp", "Backspace"].includes(e.key)) { e.preventDefault(); show(i - 1); }
  else if (e.key === "Home") show(0);
  else if (e.key === "End") show(slides.length - 1);
  else if (e.key === "f" || e.key === "F") {
    document.fullscreenElement ? document.exitFullscreen() : document.documentElement.requestFullscreen();
  }
});
document.getElementById("nextzone").addEventListener("click", () => show(i + 1));
document.getElementById("prevzone").addEventListener("click", () => show(i - 1));

// word-cloud reveal (warm-up Q2)
const revealBtn = document.getElementById("reveal-models");
if (revealBtn) {
  revealBtn.addEventListener("click", e => {
    e.stopPropagation();
    document.getElementById("model-cloud").classList.add("revealed");
    revealBtn.classList.add("hidden");
  });
}

const fromHash = parseInt(location.hash.slice(1), 10);
show(isNaN(fromHash) ? 0 : fromHash - 1);
