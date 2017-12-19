module ApplicationHelper
  def login_helper style
    if current_user.is_a?(GuestUser)
      (link_to  "Login", new_user_session_path, class: style) +
      (link_to  "Signup", new_user_registration_path, class: style)
    else
      link_to  "Logout", destroy_user_session_path, method: :delete, class: style
      end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thank for visiting me from #{session[:source]} and you are on #{layout_name} layout"
      content_tag :p, greeting, class: "source-greeting"
    end
  end

  def copyright_generator
      PortfolioModuleViewTool::Renderer.copyright 'Meas Outdam', 'All right reserved'
  end
end
