function toggle () {
  if (viewportWidth > 500) {
  document.getELementById("mobile_rules").classList.remove("show");
} else {
  document.getELementById("rules").className = "hide";
  }
}
