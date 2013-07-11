require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///nai_warikan.db"

class User < ActiveRecord::Base

end
