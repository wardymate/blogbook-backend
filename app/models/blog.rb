class Blog

  include DataMapper::Resource

  has n, :tags, :through => Resource
  belongs_to :user, :required => false

  property :id,     Serial
  property :url,    String

end