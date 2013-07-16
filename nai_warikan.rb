require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///nai_warikan.db"

class User < ActiveRecord::Base
  has_many :tabulations, :foreign_key => :user_id
  has_many :guests, :through => :tabulations, :class_name => "User"
end

class Tabulation < ActiveRecord::Base
  belongs_to :guest, :class_name => "User"
  belongs_to :user
end

get "/" do
  @users = User.order("name ASC")
  erb :"users/index"
end

get "/users/:id" do
  @user = User.find(params[:id])
  @name = @user.name
  @guests = User.where("id != ?", params[:id])
  @tabs = Tabulation.where("user_id = ? OR guest_id = ?", params[:id], params[:id]).order('created_at desc')
  erb :"users/show"
end

post "/users/:id" do
  @tabulation = Tabulation.new(user_id: params[:id], guest_id: params[:guest_id])
  if @tabulation.save
    redirect "users/#{params[:id]}"
  else 
    "Sorry it failed because of #{params.inspect}"
  end
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
