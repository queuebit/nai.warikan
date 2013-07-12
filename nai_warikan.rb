require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///nai_warikan.db"

class User < ActiveRecord::Base

end

get "/" do
  @users = User.order("name ASC")
  erb :"users/index"
end

helpers do
  def name
    if @name
      "#{@name} -- nai warikan"
    else
      "nai warikan"
    end
  end

  def pretty_date(time)
    time.strftime("%d %b %Y")
  end
end
