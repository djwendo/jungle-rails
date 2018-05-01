require 'rails_helper'

RSpec.feature "Visitors can register and sign in", type: :feature, js: true do
  
  before :each do
    @user = User.create!(
      first_name: 'Test',
      last_name: 'User',
      email: 'test@test.test',
      password: '123456',
      password_confirmation: '123456'
    )

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

  scenario "They are logged in" do
    visit root_path
    find_link('Login').click

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end

    expect(page).to have_content 'Logout'
  end

end
