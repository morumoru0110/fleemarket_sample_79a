FactoryBot.define do
  factory :address do
    prefecture            {"北海道"}
    zip_code              {"111-1111"}
    city                  {"札幌市"}
    street                {"青葉区1-1-1"}
    first_name_kanji      {"太郎"}
    last_name_kanji       {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
  end
end