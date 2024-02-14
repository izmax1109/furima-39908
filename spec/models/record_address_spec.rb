require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある時' do
      it 'postal_codeが空では保存できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが正しい形式でないと保存できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code input correctly')
      end

      it 'region_idが1の場合は保存できない' do
        @record_address.region_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Region Select')
      end

      it 'cityが空では保存できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが正しい形式でないと保存できない' do
        @record_address.phone_number = '123-4567-8901'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number input only correctly')
      end

      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
