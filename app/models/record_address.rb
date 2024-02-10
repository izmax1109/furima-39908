class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    ActiveRecord::Base.transaction do
      record = Record.create(user_id:, item_id:)
      address = Address.create(postal_code:, prefecture_id:, city:, house_number:,
                               phone_number:)

      raise ActiveRecord::Rollback unless record.valid? && address.valid?
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    false
  end
end
