FactoryGirl.define do
  factory :material_requirement do
    plant nil
    order_date "2017-05-24"
    item_code "MyString"
    item_description "MyString"
    item_type "MyString"
    item_type_description "MyString"
    uom "MyString"
    demand 1
    receipts 1
    inv_on_hand 1
    inventory_run_out_time "2017-05-24 20:29:10"
  end
end
