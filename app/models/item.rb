class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :payer
  belongs_to :region
  belongs_to :shipping_day

  validates :image, :category, :condition, :payer, :region, :shipping_day, :price, presence: true
  validates :category_id, :condition_id, :payer_id, :region_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  has_one_attached :image
end
