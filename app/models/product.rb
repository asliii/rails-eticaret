class Product < ApplicationRecord
    has_many :brand, class_name: "Brand", foreign_key: "brand_id"
    has_many :type, class_name: "Type", foreign_key: "type_id"
end
