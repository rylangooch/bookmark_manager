require_relative '../data_mapper_setup'

require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_test")

DataMapper.finalize

DataMapper.auto_upgrade!
