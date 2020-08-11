FactoryBot.define do
  factory :user do
    nickname              {"ヤマ"}
    password              {"aaaa111"}
    password_confirmation {"aaaa111"}
    first_name_kanji      {"太郎"}
    last_name_kanji        {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birthday              {"2000/01/01"}
  end
end