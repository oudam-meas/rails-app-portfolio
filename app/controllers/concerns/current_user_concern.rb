module CurrentUserConcern
  extend ActiveSupport::Concern
  # Override current_user of Devise
    # If user logged in : the left handside Super will return the data normally,
    # if not the default value in the right hand side will be returned.
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
      name: "Guest User",
      first_name: "Guest",
      last_name: "User",
      email: "guest@user.com")
  end
end