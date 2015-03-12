require 'uri'

class Blog

  include DataMapper::Resource

  has n, :tags, :through => Resource
  # has n, :users, :through => Resource
  belongs_to :user, :required => false

  property :id,     Serial
  property :url,    String

  attr_reader :url

  def good_url
    if self.url.include?('http://')
      self.url
    else
      ("http://") + self.url
    end
  end

  def clean_url
    URI.parse(good_url.gsub('www.','')).host
  end

end
