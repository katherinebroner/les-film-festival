require 'rails_helper'

feature "User navigates to category index page" do
  scenario "when user clicks Categories link on home page" do
    visit '/'
    click_link( "Categories" )
    expect( page ).to have_content( "All Film Categories" )
  end
end

feature "User visits category show page" do
  let( :category ) { Category.create!( title: "Drama" ) }
  scenario "user sees category selections" do
    visit "/categories/#{ category.id }"
    expect( page ).to have_content( "Selections" )
  end

  scenario "user can navigate back to category index page" do
    visit "/categories/#{ category.id }"
    page.find( "#category-back-link" ).click_link( "Categories" )
    expect( page ).to have_content( "All Film Categories" )
  end
end
