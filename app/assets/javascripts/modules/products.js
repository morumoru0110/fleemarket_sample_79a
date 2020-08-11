$(document).on("turbolinks:load", function () {
  //削除ボタンをクリックしたとき、処理が動く。
  $(document).on("click", ".image-preview_btn_delete", function () {
    var append_input = $(
      `<li class="input" style="width: calc(100%);"><label class="upload-label"><div class="upload-label__text">クリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
    );
    $ul = $("#previews");
    $lis = $ul.find(".image-preview");
    $input = $ul.find(".input");
    $ul = $("#previews");
    $li = $(this).parents(".image-preview");

    //"li"ごと削除
    $li.remove();

    // inputボタンのサイズを更新する、または追加させる
    // まずはプレビューの数を数える。
    $lis = $ul.find(".image-preview");
    $label = $ul.find(".input");
    if ($lis.length <= 4) {
      // inputのサイズを変更
      $("#previews li:last-child").css({
        width: `calc(100% - (20% * ${$lis.length}))`,
      });
    } else if ($lis.length == 5) {
      $ul.append(append_input);
      $("#previews li:last-child").css({
        width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
      }),
        $(".upload-label__text").css({
          display: `none`,
        });
    }
  });

  //new
  $(document).on("click", ".image_upload", function () {
    var preview = $(
      '<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div><div class="image-preview_btn_delete">削除</div></div>'
    );
    //次の画像を読み込むためのinput。
    var append_input = $(
      `<li class="input"><label class="upload-label"><div class="upload-label__text">クリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
    );
    $ul = $("#previews");
    $li = $(this).parents("li");
    $label = $(this).parents(".upload-label");
    $inputs = $ul.find(".image_upload");
    //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
    $(".image_upload").on("change", function (e) {
      //inputで選択した画像を読み込む
      var reader = new FileReader();

      // プレビューに追加させるために、inputから画像ファイルを読み込む。
      reader.readAsDataURL(e.target.files[0]);

      //画像ファイルが読み込んだら、処理が実行される。
      reader.onload = function (e) {
        // <img>タグに画像を追加させる
        $(preview).find(".preview").attr("src", e.target.result);
      };

      //inputの画像を付与した,previewを$liに追加。
      $li.append(preview);

      //プレビュー完了後は、inputを非表示にさせる。
      $label.css("display", "none");
      $li.removeClass("input");
      $li.addClass("image-preview");
      $lis = $li.find(".image-preview");
      $("#previews li").css({
        width: `114px`,
      });

      //"ul"に新しい"li(inputボタン)"を追加させる。
      if ($lis.length <= 4) {
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * ${$lis.length}))`,
        });
      } else if (($lis.length = 5)) {
        $li.addClass("image-preview");
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
        });
        $(".upload-label__text").css({
          display: `none`,
        });
        $(".input").css({
          display: `none`,
        });
      }

      //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
      // これをしないと、それぞれのinputの区別ができず、最後の1枚しかDBに保存されません。
      // 全部のプレビューの番号を更新することで、プレビューを削除して、新しく追加しても番号が1,2,3,4,5,6と綺麗に揃う。だから全部の番号を更新させる
      $inputs.each(function (num, input) {
        //nameの番号を更新するために、現在の番号を除去
        $(input).removeAttr("image");
        $(input).attr({
          name: "product[images_attributes][" + num + "][image]",
          id: "product_images_attributes_" + num + "_image",
        });
      });
    });
  });
});
