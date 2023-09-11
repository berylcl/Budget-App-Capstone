# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:exp_cats) }
    it { should have_many(:expenses).through(:exp_cats).dependent(:destroy) }
  end

  describe '#sum_amount' do
    it 'returns the sum of expenses' do
      category = FactoryBot.create(:category, user:)
      FactoryBot.create(:expense, category:, amount: 100)
      FactoryBot.create(:expense, category:, amount: 200)

      expect(category.sum_amount).to eq(300)
    end

    it 'returns 0 if there are no expenses' do
      category = FactoryBot.create(:category, user:)

      expect(category.sum_amount).to eq(0)
    end
  end
end
