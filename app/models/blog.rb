class Blog

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

  # has n, :users, :through => Resource
  # has n, :tags, :through => Resource

end