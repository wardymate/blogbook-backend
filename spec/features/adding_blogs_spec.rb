require 'spec_helper'

require_relative 'helpers/session'
include SessionHelpers

feature "User adds a new link" do

  scenario "when browsing the homepage" do
    expect(Blog.count).to eq(0)
    visit '/blogs/new'
    add_blog("http://www.blog.com/", ['personal'])
    expect(Blog.count).to eq(1)
    blog = Blog.first
    expect(blog.url).to eq("http://www.blog.com/")
  end

  scenario "with a few tags" do
    visit "/blogs/new"
    add_blog("http://www.blog.com/", ['personal'])
    blog = Blog.first
    expect(blog.tags.map(&:text)).to include "personal"
  end

end