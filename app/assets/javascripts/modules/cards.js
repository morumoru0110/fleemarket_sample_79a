console.log("test");
$(function () {
  Payjp.setPublicKey("pk_test_07db780e7718d3fb4bd5d472");

  $("#regist_card").on("click", function (e) {
    e.preventDefault();

    var card = {
      number: $("#card_number_form").val(),
      exp_month: $("#exp_month_form").val(),
      exp_year: $("#exp_year_form").val(),
      cvc: $("#cvc_form").val(),
    };
    Payjp.createToken(card, function (status, response) {
      if (status === 200) {
        $("#card_number_form").removeAttr("name");
        $("#exp_month_form").removeAttr("name");
        $("#exp_year_form").removeAttr("name");
        $("#cvc_form").removeAttr("name");

        var payjphtml = `<input type="hidden" name="card_token" value=${response.id}>`;
        $("#charge-form").append(payjphtml);

        document.inputForm.submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません。");
        $("#charge-form").prop("disabled", false);
      }
    });
  });
});
