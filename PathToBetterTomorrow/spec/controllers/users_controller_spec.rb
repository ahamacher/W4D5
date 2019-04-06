require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do 
    it "should render new user sign up page" do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context "with vaild params" do
      before(:each) do
        User.create!(username: "bob12345", password: "password", email: "a@a.com")
      end

      it "should login and redirect to user's page" do
        user = User.last
        get :show, params: {id: user.id}
        expect(response).to render_template(:show)
      end
      
      describe 'params' do
        it "should have valid params" do 
          user = User.new(username: "bob2345", password: "p", email: "ab@a.com")
          post :create, params: { user: user.attributes }
          expect(response).to render_template(:new)
        end 
      end
    end
  end


  describe 'POST #destroy' do
    user = User.create(username: "user123", password: "123456", email: "you@youtube.com")
    it "should delete a user" do 
      user.destroy 
      expect(User.find_by(username: 'user123')).to be_nil 
    end
    it "should redirect to user index" do 
      expect(response).to redirect_to(users_url)
    end 
  end
end
