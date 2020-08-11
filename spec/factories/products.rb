FactoryBot.define do

  factory :product do
    name              {"ジャケット"}
    description       {"新品です"}
    category_id       {111}
    brand             {111}
    price             {300}
    condition         {"新品"}
    shipping_charge   {1}
    shipping_area     {"東京"}
    shipping_day      {1}
  end

end