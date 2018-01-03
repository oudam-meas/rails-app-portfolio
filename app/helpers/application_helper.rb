module ApplicationHelper
  def login_helper style = '', tag = ''
    start_tag = (tag.empty? ? ("") : ("<#{tag}>")).html_safe
    end_tag = (tag.empty? ? ("") : ("</#{tag}>")).html_safe

    if current_user.is_a?(GuestUser)
      start_tag + (link_to  "Login", new_user_session_path, class: style) + end_tag +
      start_tag + (link_to  "Signup", new_user_registration_path, class: style) + end_tag
    else
      start_tag + (link_to  "Logout", destroy_user_session_path, method: :delete, class: style) + end_tag
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thank for visiting me from #{session[:source]}, Please feel free to #{ link_to 'contact me', contact_path} if you'd like to work together."
      content_tag :div, greeting.html_safe, class: styles
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
      {
        url: tech_news_path,
        title: 'Tech News'
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

  def alerts_helper
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Portfolio by Outdam", sticky: false)
  end
end
