module DeviseMailerHelper

  def front_end_domain
    if Rails.env.development?
      return "http://#{Rails.application.secrets.frontend_domain_name}/"
    else
      return "https://#{Rails.application.secrets.frontend_domain_name}/"
    end
  end

  def link_to_frontend(link_text, url_path)
    link_to link_text, "#{front_end_domain}#{url_path}"
  end

end
