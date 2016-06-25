require 'rails_helper'

RSpec.describe "Categories", :type => :request do
  let( :category ) { Category.create!( title: "drama" ) }
  describe "GET /categories" do
    it "is successful" do
      get categories_path
      expect(response.status).to be(200)
    end
  end

  describe "GET /show" do
    it "is successful" do
      get category_path( category )
      expect(response.status).to be(200)
    end
  end
end
