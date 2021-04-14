json.array! @products do |product|
  json.extract! product, :id, :name, :code, :quantity, :brand, :price, :category_id
end
