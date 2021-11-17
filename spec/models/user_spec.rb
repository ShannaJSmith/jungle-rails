require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Validations' do
  	it 'should be able to create a valid user' do
			@user = User.new(:name => "Inuyasha", :email => "inuyasha@gmail.com", :password => "inuhanyou", :password_confirmation => "inuhanyou")
			@user.save!
			expect(@user).to be_valid
		end

  	it 'is invalid without a password field' do
			@user = User.new(:name => "Inuyasha", :email => "inuyasha@gmail.com")
			expect(@user).to_not be_valid
			expect(@user.errors.full_messages).to include "Password can't be blank"
		end

		it "is invalid without a name field" do
      @user = User.new(:name => nil, :email => "inuyasha@gmail.com", :password => "inuhanyou", :password_confirmation => "inuhanyou")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

		it "is invalid without an email field" do
      @user = User.new(:name => "inuyasha", :password => "inuhanyou", :password_confirmation => "inuhanyou")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
		
		it "is invalid if passwords don't match" do
      @user = User.new(:name => "inuyasha", :email => "inuyasha@gmail.com", :password => "inuhanyou", :password_confirmation => "dogdemon")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include 'Password confirmation doesn\'t match Password'
    end
		
		it "is invalid if password is less than 8 characters" do
      @user = User.new(:name => "inuyasha", :email => "inuyasha@gmail.com", :password => "inu", :password_confirmation => "inu")
			expect(@user).to_not be_valid
			expect(@user.errors.full_messages).to include 'Password is too short (minimum is 8 characters)'
		end
	
		it "is invalid if email is not unique " do
      @user1 = User.new(:name => "inuyasha", :email => "inuyasha@gmail.com", :password => "inuhanyou", :password_confirmation => "inuhanyou")
      @user2 = User.new(:name => "inuyasha", :email => "inuyasha@gmail.com", :password => "inuhanyou", :password_confirmation => "inuhanyou")
      @user1.save
      @user2.save
			
			expect(@user1).to be_valid
      expect(@user2).to_not be_valid

      expect(@user2.errors.full_messages).to include 'Email has already been taken'
    end

	end
end


