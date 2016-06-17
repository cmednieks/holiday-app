module SessionsHelper
  
  def log_in(admin)
    session[:admin_user_id] = admin.id
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:admin_user_id)
    @current_user = nil
  end
  
end
