require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'has valid user' do
      user = User.new(
        :email => 'test@test.com',
        :first_name => 'Inuyasha',
        :last_name => 'Takahashi',
        :password => '123',
        :password_confirmation => '123'
      )
      expect(user).to be_valid
    end

    # it 'password matches password_confirmation' do
    #     expect(subject.password).to eq(subject.password_confirmation)
    #   end
    # it 'password does not match password_confirmation' do
    #     subject.password_confirmation = '321'
    #     expect(subject.password).not_to eq(subject.password_confirmation)
    #   end
    # it 'email must be unique' do
    #     @user = User.new(
    #       :email => 'inuyasha@test.com',
    #       # :first_name => 'Inuyasha',
    #       # :last_name => 'Takahashi',
    #       :password => '123',
    #       :password_confirmation => '123'
    #     )
    #     @user.save!
    #     user2 = User.new(
    #       :email => 'inuyasha@test.com',
    #       # :first_name => 'Inuyasha',
    #       # :last_name => 'Takahashi',
    #       :password => '123',
    #       :password_confirmation => '123'
    #     )
    #     expect(user2).to_not be_valid
    #    end

    # end
  
  
    # it 'email, firstname and lastname are required' do
    # end
    # describe '.authenticate_with_credentials' do
    #   # examples for this class method here
    # end
  end
end
