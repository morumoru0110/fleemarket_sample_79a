$(function () {
  $("#reveal_password_password-check").change(function () {
    if ($(this).prop("checked")) {
      $("#user_password_confirmation").attr("type", "text");
    } else {
      $("#user_password_confirmation").attr("type", "password");
    }
  });
});
