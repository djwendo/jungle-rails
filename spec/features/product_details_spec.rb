require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a product page" do
    visit root_path
    first('article.product').find_link('Details').click

    sleep 2
    save_screenshot 'jungle.png'

    expect(page).to have_css 'section.products-show'
  end

end
