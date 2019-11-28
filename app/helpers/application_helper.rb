module ApplicationHelper
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_user_admin?(admin)
    current_user.id == admin.id
  end
end
