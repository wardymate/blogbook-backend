class User

  include Datamapp::Resource

   property :id,               Serial
   property :name,             String
   property :username,         String, :unique => true
   property :email,            String, :unique => true
   property :password_digest,  Text

   # has n, :blogs, :through => Resource

end
