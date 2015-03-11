class Blog

  include DataMapper::Resource

  has n, :tags, :through => Resource
  # has n, :users, :through => Resource
  belongs_to :user, :required => false

  property :id,     Serial
  property :url,    String

  attr_reader :url

  def css_id
   self.url.gsub('.','_')
  end

end