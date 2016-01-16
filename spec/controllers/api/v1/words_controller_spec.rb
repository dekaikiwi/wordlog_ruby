require 'spec_helper'

describe Api::V1::WordsController do
  describe "GET #show" do
    before(:each) do
      @word = FactoryGirl.create :word
      get :show, id: @word.id
    end

    it "returns the information on a hash" do
      word_response = json_response[:word]
      expect(word_response[:target_word]).to eql @word.target_word
    end


    it "has the user as an embedded object" do
      word_response = json_response[:word]
      expect(word_response[:user][:email]).to eql @word.user.email
    end

    it { should respond_with 200 }
  end


  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :word }
      get :index
    end

    it "returns 4 records from the database" do
      words_response = json_response
      expect(words_response[:words]).to have(4).items
    end

    it "returns the user object into each word" do
      words_response = json_response[:words]
      words_response.each do |word_response|
        expect(word_response[:user]).to be_present
      end
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(":each") do
        list = FactoryGirl.create :list
        user = FactoryGirl.create :user
        @word_attributes = FactoryGirl.attributes_for :word
        api_authorization_header user.auth_token
        post :create, { list_id: list.id, user_id: user.id, word: @word_attributes}
      end

      it "renders the json representation for the word record just created" do
        word_response = json_response[:word]
        expect(word_response[:target_word]).to eql @word_attributes[:target_word]
      end

      it { should respond_with 201 }
    end

# TODO: Implement Failing Tests

#    context "when is not created" do
#      before(:each) do
#        user = FactoryGirl.create :user
#        @invalid_word_attributes = {}
#        api_authorization_header user.auth_token
#        post :create, { user_id: user.id, word: @invalid_word_attributes }
#      end

#      it "renders an errors json" do
#        word_response = json_response
#        expect(word).to have_key(:errors)
#      end

#      it { should respond_with 422 }
#    end
  end
end