# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  #  validations, associations, and class scope methods
  # username
  # password
  # email
  # session_token
  # password_digest

  describe "validation" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { should have_many :comments }
    it { should have_many :goals }
  end

  describe "User class scope" do
    describe "User::find_by_credentials" do
    
      subject(:user) { FactoryBot.build(:user) }
      before(:each) do
        user.save!
      end

      it "should return nil for invalid credentials" do
        expect(User.find_by_credentials(user.username, "Xyzxyz")).to be_nil
        expect(User.find_by_credentials("Potato", user.password)).to be_nil
      end
      
      it "should find user by credentials" do
        expect(User.find_by_credentials(user.username, user.password)).to_not be_nil
        expect(User.find_by_credentials(user.username, user.password)).to eq(:user)
      end
    end
  end 
  
  describe "user instance methods" do 
    subject(:user) {FactoryBot.create(:user)}

        it "session token should not be nil" do
          expect(user.reset_session_token).to_not be_nil
        end

        it "should reset the session token" do
          user_session_token = user.session_token
          expect(user.reset_session_token).to_not eq(user_session_token)
        end
      end
end
