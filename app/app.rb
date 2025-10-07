require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'erubis'
require 'sinatra/content_for'
require 'bcrypt'
require 'pg'
require 'date'

require_relative 'config/db_connection'
require_relative '../db/db_setup'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true

  DatabaseSetup.db_setup
  DatabaseConnection.connection
  also_reload 'config/db_connection.rb'
  also_reload 'models/*.rb'
end

before do
end

# ROUTES

# INDEX PAGE:
get '/' do
  erb :home
end

# LOG OUT:
get '/logout' do
end

# GET SIGN UP PAGE:
get '/signup' do
end

# POST SIGN UP FORM:
post '/signup' do
end

# GET LOGIN PAGE:
get '/login' do
  erb :login
end

# POST LOGIN CREDENTIALS:
post '/login' do
end

# GET USER PROJECTS PAGE:
get '/projects' do
end

# GET NEW PROJECT FORM:
get '/projects/new' do
end

# POST NEW PROJECT:
post '/projects/new' do
end

# GET A PROJECT PAGE:
get '/projects/:project_id' do
end

# GET EDIT FORM FOR A PROJECT:
get '/projects/:project_id/edit' do
end

# POST CHANGES FOR A PROJECT:
post '/projects/:project_id/edit' do
end

# DELETE A PROJECT:
post '/projects/:project_id/destroy' do
end

# GET NEW BUG FORM:
get '/projects/:project_id/new_bug' do
end

# POST NEW BUG:
post '/projects/:project_id/new_bug' do
end

# GET EDIT FORM FOR BUG:
get '/projects/:project_id/edit_bug/:bug_id' do
end

# DELETE BUG:
post '/projects/:project_id/destroy/:bug_id' do
end