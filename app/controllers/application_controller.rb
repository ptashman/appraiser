class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :add_access_header

  def add_access_header
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
