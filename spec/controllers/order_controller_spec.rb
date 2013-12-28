require 'spec_helper'

describe OrderController do

  describe "GET 'confirm'" do
    it "returns http success" do
      get 'confirm'
      response.should be_success
    end
  end

  describe "GET 'execute'" do
    it "returns http success" do
      get 'execute'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'recommend'" do
    it "returns http success" do
      get 'recommend'
      response.should be_success
    end
  end

end
