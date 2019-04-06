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

FactoryBot.define do 
  factory :user do  
    username {Faker::Internet.unique.username }
    password { "password" }
    email {Faker::Internet.unique.safe_email}
  end 

  
end
