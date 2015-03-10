require 'spec_helper'

describe Blog do

  context 'Demonstration of datamapper working' do
    it 'should be created and then retrieved from the db' do
      expect(Blog.count).to eq(0)
      Blog.create(title: "Marissa's Tumblr",
                  url: 'http://marissamayr.tumblr.com/')
      expect(Blog.count).to eq(1)
      blog = Blog.first
      expect(blog.url).to eq('http://marissamayr.tumblr.com/')
      expect(blog.title).to eq("Marissa's Tumblr")
      blog.destroy
      expect(Blog.count).to eq(0)
    end

  end

end