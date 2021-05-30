class AddTypeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :type, foreign_key: true, null: false
  end
end
