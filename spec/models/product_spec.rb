require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'has all mandatory fields' do
      @category = Category.new()
      @product = Product.new(:name=> "test" , :price => 10, :quantity => 5, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages.empty?).to be true
    end

    it 'has no name' do  
      @product = Product.new(:name=> nil)
      @product.valid? 
      expect(@product.errors.full_messages).to include "Name can't be blank" 
    end
    
    it 'has no price' do
     @product = Product.new(:price => nil)
     @product.valid?
     expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'has no quantity' do
    @product = Product.new(:quantity => nil)
    @product.valid?
    expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'has a category' do
      @product = Product.new(:category => nil)
      @product.valid?
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
