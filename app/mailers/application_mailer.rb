class ApplicationMailer < Devise::Mailer
  helper :devise_mailer
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
end
