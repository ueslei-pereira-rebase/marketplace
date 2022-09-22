$(function() {
  $('#cadastrar').on('click', function() {
    $('.field-error').fadeOut(300).delay(3000).fadeIn( 700 )

  });

if ($('.alert-danger, .alert-info').length) {
  $('.alert-danger').fadeIn( 3000 ).delay(3000).fadeOut(3000)
}

const KEYCODE = {
  A: 0
}

$(window).keydown(function (e) {
  if (e.code == 'CapsLock')  {
    $('.capslock-off').toggleClass('capslock-on');
  }
});


});