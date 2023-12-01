# frozen_string_literal: true

module Users
  # app/controllers/users/omniauth_callbacks_controller.rb:
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :set_user, only: [:google_oauth2]

    def google_oauth2
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end

    private

    def set_user
      @user = User.from_omniauth(request.env['omniauth.auth'])
    end
  end
end
