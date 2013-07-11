require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///nai.rb"

class User < ActiveRecord::Base

end
