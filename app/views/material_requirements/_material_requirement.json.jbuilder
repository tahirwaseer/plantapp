json.extract! material_requirement, :id, :plant_id, :order_date, :item_code, :item_description, :item_type, :item_type_description, :uom, :demand, :receipts, :inv_on_hand, :inventory_run_out_time, :created_at, :updated_at
json.url material_requirement_url(material_requirement, format: :json)