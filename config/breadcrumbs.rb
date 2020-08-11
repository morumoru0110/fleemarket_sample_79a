#トップページ
crumb :root do
  link "トップページ", root_path
end

#マイページ
crumb :mypage do
  link "マイページ", users_path
  parent :root
end

#クレジットカード登録情報
crumb :card do
  link "クレジットカード登録", new_user_path
  parent :mypage
end

#商品出品ページ
crumb :products_new do
  link "商品出品", new_product_path
  parent :mypage
end

#商品詳細ページ
crumb :products_show do
  link "商品詳細", products_path
  parent :root
end

#商品編集ページ
crumb :products_edit do
  link "商品編集", edit_product_path
  parent :products_show
end

#購入確認ページ
crumb :products_buy do
  link "商品購入確認", buy_products_path
  parent :products_show
end

#検索ページ
crumb :products_search do
  link "検索結果", search_products_path
  parent :root
end