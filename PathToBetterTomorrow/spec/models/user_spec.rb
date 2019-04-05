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
    
  end

end
