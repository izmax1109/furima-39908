class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :city, presence: true
    validates :house_number, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'input only correctly' }
  end
  validates :region_id, numericality: { other_than: 1, message: 'Select' }

  def save
    record = Record.new(user_id: user_id, item_id: item_id) # rubocop:disable Style/HashSyntax
    return false unless record.save

    address = Address.new(
      postal_code: postal_code, # rubocop:disable Style/HashSyntax
      region_id: region_id, # rubocop:disable Style/HashSyntax
      city: city, # rubocop:disable Style/HashSyntax
      house_number: house_number, # rubocop:disable Style/HashSyntax
      building_name: building_name, # rubocop:disable Style/HashSyntax
      phone_number: phone_number, # rubocop:disable Style/HashSyntax
      record_id: record.id
    )
    address.save
    true
  end
end
