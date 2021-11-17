require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Can visit home page and click 'Add to Cart' button for a product" do
    visit root_path

    page.all('.product .actions .btn')[0].click

    expect(page).to have_text 'My Cart (1)'

  end
end
