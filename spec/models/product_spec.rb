require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new name: 'Category 1'
    @product = Product.new name: 'New Product', price: 19, quantity: 20, category: @category
  end
  
  describe 'Validations' do
    it 'requires a name, price, quantity, and category' do
      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

    it 'requires a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include ("can't be blank")
      puts @product.errors.full_messages
    end

    it 'requires a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include ("can't be blank")
      puts @product.errors.full_messages
    end

    it 'requires a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include ("can't be blank")
      puts @product.errors.full_messages
    end

    it 'requires a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price_cents]).to include ("is not a number")
      puts @product.errors.full_messages
    end
  end
end
