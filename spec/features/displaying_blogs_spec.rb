require 'spec_helper'

feature "User browses the list of blogs" do

  before(:each) {
    Blog.create(:url => "http://www.blog.com/",
                :title => "My blog")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("My blog")
  end


end