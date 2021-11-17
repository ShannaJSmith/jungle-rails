require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "Can navigate from home page to product details page by clicking on a product" do
    visit root_path

    page.all('.product .actions a')[0].click

    expect(page).to have_css '.products-show'
    # puts page.html
    # save_screenshot
    expect(page).to have_css '.main-img'
  end
end
