class AddNotNullConstraintsToItems < ActiveRecord::Migration[7.0]
  def change
    Item.where(category_id: nil).update_all(category_id: 0)
    Item.where(condition_id: nil).update_all(condition_id: 0)
    Item.where(payer_id: nil).update_all(payer_id: 0)
    Item.where(region_id: nil).update_all(region_id: 0)
    Item.where(shipping_day_id: nil).update_all(shipping_day_id: 0)

    change_column :items, :category_id, :integer, null: false
    change_column :items, :condition_id, :integer, null: false
    change_column :items, :payer_id, :integer, null: false
    change_column :items, :region_id, :integer, null: false
    change_column :items, :shipping_day_id, :integer, null: false
  end
end
