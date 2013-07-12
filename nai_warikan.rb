require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///nai_warikan.db"

class User < ActiveRecord::Base

end

get "/" do
  @users = User.order("name ASC")
  erb :"users/index"
end

get "/users/:id" do
  @user = User.find(params[:id])
  @name = @user.name
  erb :"users/show"
end


get "/about" do
  @name = "about"
  erb :"pages/about"
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
