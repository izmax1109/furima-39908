class RemoveUnusedColumnsFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :category_id, :integer
    remove_column :items, :condition_id, :integer
    remove_column :items, :payer_id, :integer
    remove_column :items, :region_id, :integer
    remove_column :items, :shipping_day_id, :integer
  end
end
