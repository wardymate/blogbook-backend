require 'spec_helper'

feature "User browses the list of blogs" do

  before(:each) {
    Blog.create(:url => "http://www.blog.com/",
                :tags => [Tag.first_or_create(:text => 'personal')])

    Blog.create(:url => "http://www.tumblr.com/bill_gates",
                :tags => [Tag.first_or_create(:text => 'technology')])

    Blog.create(:url => "http://www.blogger.com/nigella",
                :tags => [Tag.first_or_create(:text => 'cooking')])
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("http://www.blog.com/")
  end

  scenario "filtered by a tag" do
    visit '/tags/technology'
    expect(page).not_to have_content("http://www.blog.com/")
    expect(page).not_to have_content("http://www.blogger.com/nigella")
    expect(page).to have_content("http://www.tumblr.com/bill_gates")
  end

end