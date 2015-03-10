require 'spec_helper'

feature "User adds a new link" do

  scenario "when browsing the homepage" do
    expect(Blog.count).to eq(0)
    visit '/'
    add_blog("http://www.blog.com/")
    expect(Blog.count).to eq(1)
    blog = Blog.first
    expect(blog.url).to eq("http://www.blog.com/")
  end

  scenario "with a few tags" do
    visit "/"
    add_blog("http://www.blog.com/",
                ['personal'])
    blog = Blog.first
    expect(blog.tags.map(&:text)).to include "personal"
  end

  def add_blog(url, tags = [])
    within('#new-blog') do
      fill_in 'url', :with => url
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add blog'
    end
  end
end