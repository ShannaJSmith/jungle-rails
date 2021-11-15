require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new
    @product = Product.new(:name => 'zebra pants', :price => 100, :quantity => 3, :category => @category)
    @product1 = Product.new(:name => nil, :price => 100, :quantity => 3, :category => @category)
    @product2 = Product.new(:name => 'zebra pants', :price => nil, :quantity => 3, :category => @category)
    @product3 = Product.new(:name => 'zebra pants', :price => 100, :quantity => nil, :category => @category)
    @product4 = Product.new(:name => 'zebra pants', :price => 100, :quantity => 3, :category => nil)
  end

  describe 'Validations' do
    it 'product is valid' do
      expect(@product).to be_valid
      expect(@product.name).to be_truthy
    end
    it 'product1 name is nil' do
      expect(@product1).to_not be_valid
      expect(@product1.name).to be_nil
      expect(@product1.errors.full_messages).to include "Name can't be blank"
    end
    it 'product2 price is nil' do
      expect(@product2).to_not be_valid
      expect(@product2.price).to be_nil
      expect(@product2.errors.full_messages).to include "Price can't be blank"
    end
    it 'product3 quantity is nil' do
      expect(@product3).to_not be_valid
      expect(@product3.quantity).to be_nil
      expect(@product3.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'product4 category is nil' do
      expect(@product4).to_not be_valid
      expect(@product4.category).to be_nil
      expect(@product4.errors.full_messages).to include "Category can't be blank"
    end
  end
end
