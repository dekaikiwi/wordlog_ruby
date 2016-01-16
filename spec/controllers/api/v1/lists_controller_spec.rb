require 'spec_helper'

describe Api::V1::ListsController do
  describe "GET #show" do
    before(:each) do
      @list = FactoryGirl.create :list
      get :show , id: @list.id
    end

    it "returns the information in a hash" do
      list_response = json_response[:list]
      expect(list_response[:title]).to eql @list.title
    end

    it {should respond_with 200}
  end


  describe "GET #index" do
    before(:each) do
      @list = 4.times { FactoryGirl.create :list }
      get :index
    end

    it "returns 4 records from the database" do
      lists_response = json_response
      expect(lists_response[:lists]).to have(4).items
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(":each") do
        user = FactoryGirl.create :user
        @list_attributes = FactoryGirl.attributes_for :list
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, list: @list_attributes}
      end

      it "renders the json representation for the word record just created" do
        list_response = json_response[:list]
        expect(list_response[:title]).to eql @list_attributes[:title]
      end

      it { should respond_with 201 }
    end
  end

end
