require 'rails_helper'

describe CategoriesController do
  let!(:category) { Category.create!(title: "drama") }

  describe "GET #index" do
    it "assigns all categories as @category" do
      get :index
      expect(assigns(:categories)).to eq(Category.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested category as @category" do
      get :show, { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end
end
