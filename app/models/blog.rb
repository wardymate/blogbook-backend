class Blog

  include DataMapper::Resource

  has n, :tags, :through => Resource
  has n, :users, :through => Resource

  property :id,     Serial
  property :url,    String

end