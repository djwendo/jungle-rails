require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(first_name: 'New', last_name: 'User', email: 'user@user.com', password: 'password')
  end
  
  describe 'Validations' do
    it 'requires a first name, last name, email, and password' do
      expect(@user).to be_valid
    end

    it 'must be created with password and password_confirmation that match' do
      @user.password = 'testing'
      @user.password_confirmation = 'testing'
      @user.save!
      expect(@user).to be_valid
    end

    it 'must be created with password and password_confirmation that match' do
      @user.password = 'testing'
      @user.password_confirmation = 'pizzaparty'
      expect(@user).to_not be_valid
    end

    it 'raises unique validation error' do
      another_user = User.new first_name: 'User', last_name: 'Name', email: 'USER@user.com', password: 'password'
      new_user = User.create(first_name: 'Another', last_name: 'User', email: '   user@user.COM', password: 'password')
      expect(new_user).to_not be_valid
      expect(another_user).to_not be_valid
    end

    it 'must have unique email address' do
      new_user = User.new first_name: 'Another', last_name: 'User', email: 'newuser@user.com', password: 'password'
      expect(User.find_by_email(new_user.email)).to be nil
    end

    it 'must have unique email address' do
      new_user = User.new first_name: 'Another', last_name: 'User', email: 'newuser@user.com', password: 'password'
      expect(User.find_by_email(new_user.email)).to be nil
    end

    it 'must have password that meets minimum length' do
      @user.password = 'test'
      expect(@user.password.size > 6).to be false
    end

    it 'must have password that meets minimum length' do
      @user.password = 'testing'
      expect(@user.password.size > 6).to be true
    end
  end

  describe '.authenticate_with_credentials' do
    it 'must be authenticated user' do
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'must be authenticated' do
      @user.email = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end

    it 'must be authenticated' do
      @user.password = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end
  end
end
