require 'spec_helper'

require_relative 'helpers/session'
include SessionHelpers

feature "User adds a blog" do

  before(:each) do
    User.create(:name => "Marissa Mayer",
                :username => "MarissaM",
                :email => "marissa@example.com",
                :password => "yahoo!",
                :password_confirmation => "yahoo!")
  end

  scenario "when browsing the homepage" do
    sign_in('MarissaM', 'yahoo!')
    expect{add_blog("http://www.blog.com/", ['personal'])}.to change{Blog.count}.by(1)
  end

  scenario "only when signed in" do
    visit ('/')
    expect(page).not_to have_content("Url:")
    sign_in('MarissaM', 'yahoo!')
    expect(page).to have_content("Url:")
  end


end
