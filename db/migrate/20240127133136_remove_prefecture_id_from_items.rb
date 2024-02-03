class RemovePrefectureIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :prefecture_id
  end
end
