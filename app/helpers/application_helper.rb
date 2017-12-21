module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to  "Login", new_user_session_path, class: style) + " ".html_safe +
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
  def nav_items
    # Hash
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: about_me_path,
        title: 'About'
      },
    ]
  end
  #link_to  "Login", new_user_session_path, class: style
  def nav_helper style, tag
    nav_links = '';
      nav_items.each do |nav|
         nav_links << "<#{tag}><a href='#{nav[:url]}' class='#{style} #{active? nav[:url]}'>#{nav[:title]}</a></#{tag}>".html_safe
      end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

end
