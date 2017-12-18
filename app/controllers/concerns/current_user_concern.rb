module CurrentUserConcern
  extend ActiveSupport::Concern
  # Override current_user of Devise
    # If user logged in : the left handside Super will return the data normally,
    # if not the default value in the right hand side will be returned.
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.last_name = "User"
    guest.first_name = "Guest"
    guest.email = "guest@example.com"
    guest
  end
end
