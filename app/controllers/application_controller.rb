class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  breadcrumb 'Home', :root_path

    #include Pundit
    #protect_from_forgery # sebelumnya
    #protect_from_forgery prepend: true


    #rescue_from Pundit::NotAuthorizedError do |exception|
        #render_error_page(status: 403, render: 'public/403')
    #end

    #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    attr_writer :login


    def login
        @login || self.username || self.email
    end


    private

    def user_not_authorized
        # flash[:alert] = "You are not authorized to perform this action."
        # redirect_to(request.referrer || root_path)
        render file: "#{Rails.root}/public/403.html", layout: false, status: 403
    end

    protected

    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
