class GuestUser < User
  def admin?
    false
  end

  def logged_in?
    false
  end
end
