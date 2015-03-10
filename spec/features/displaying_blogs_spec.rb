require 'spec_helper'

feature "User browses the list of blogs" do

  before(:each) {
    Blog.create(:url => "http://www.blog.com/",
                :title => "My blog",
                :tags => [Tag.first_or_create(:text => 'personal')])

    Blog.create(:url => "http://www.tumblr.com/bill_gates",
                :title => "Bill's blog",
                :tags => [Tag.first_or_create(:text => 'technology')])

    Blog.create(:url => "http://www.blogger.com/nigella",
                :title => "Nigella's blog",
                :tags => [Tag.first_or_create(:text => 'cooking')])
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("My blog")
  end

  scenario "filtered by a tag" do
    visit '/tags/technology'
    expect(page).not_to have_content("My blog")
    expect(page).not_to have_content("Nigella's blog")
    expect(page).to have_content("Bill's blog")
  end

end