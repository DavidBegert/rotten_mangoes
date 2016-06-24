$(document).ready(function() {
  var lastScrollTop = $(this).scrollTop();
  var navBarScrollDelta = 15

  $(window).scroll(function () {
  // Navbar
  var st = $(this).scrollTop();
  var navbar = $("#header-navbar")

  // Make sure they scroll more than delta
  if(st <= navbar.height() || Math.abs(lastScrollTop - st) > navBarScrollDelta) {
    if (st <= navbar.height() || st < lastScrollTop) {
      navbar.removeClass("navbar-up")
    } 
    else {
      navbar.addClass("navbar-up")
    }
  }

  lastScrollTop = st;
  });


});