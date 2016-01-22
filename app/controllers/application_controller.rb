class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :render_ember_index_file

  def render_ember_index_file
    render(file: EmberPaths.index_file, layout: true) and return
  end
end
