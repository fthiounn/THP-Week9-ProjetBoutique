$(document).ready(function() {
/************************************************************************
  MODAL LOGIN LOGOUT
  ************************************************************************/
  // display the modal
  var modal = document.getElementById("loginModal");
  var loginbtn = document.getElementById("login");
  var span = document.getElementById("close-modal");
  // When the user clicks the button, open the modal 
  loginbtn.onclick = function(e) {
     e.preventDefault();
     modal.style.display = "block";
  }
  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
});