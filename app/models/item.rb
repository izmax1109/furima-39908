class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :payer
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_day

  validates :image, :category_id, :condition_id, :payer_id, :region_id, :shipping_day_id, :price, presence: true
  validates :commodity, :description, presence: { message: "can't be blank" }
  validates :category_id, :condition_id, :payer_id, :region_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, message: 'is not a number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'must be greater than or equal to 300' }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'must be less than or equal to 9,999,999' }

  has_one_attached :image
  has_one :record
end
