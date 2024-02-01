class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :payer
  belongs_to :region
  belongs_to :shipping_day

  validates :image, :category, :condition, :payer, :region, :shipping_day, :price, presence: true
  validates :commodity, :description, presence: { message: "can't be blank" }
  validates :category_id, :condition_id, :payer_id, :region_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, message: 'is not a number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'must be greater than or equal to 300' }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'must be less than or equal to 9,999,999' }

  has_one_attached :image
end
