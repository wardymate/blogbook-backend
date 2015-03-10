require 'spec_helper'

describe Blog do

  context 'Demonstration of datamapper working' do
    it 'should be created and then retrieved from the db' do
      expect(Blog.count).to eq(0)
      Blog.create(url: 'http://www.blog.com')
      expect(Blog.count).to eq(1)
      blog = Blog.first
      expect(blog.url).to eq('http://www.blog.com')
      blog.destroy
      expect(Blog.count).to eq(0)
    end

  end

end