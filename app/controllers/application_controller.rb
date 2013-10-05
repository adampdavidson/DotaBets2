class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    # Sorcery automatically looks for a method called not_authenticated  
  def not_authenticated
    redirect_to new_user_session_path, :alert => "Please login first."
  end

  def not_admin
    redirect_to :root, :alert => "You are not authorized to access this page."
  end

end
