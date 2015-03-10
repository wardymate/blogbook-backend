class Tag

  include DataMapper::Resource

  has n, :blogs, :through => Resource

  property :id, Serial
  property :text, String

end