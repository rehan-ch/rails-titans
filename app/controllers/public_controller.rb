# frozen_string_literal: true

# public controller to show public pages
class PublicController < ApplicationController
  def welcome
    @artilces = Article.all
  end

  def about; end
  def contact_us
    @contact_form_info = ContactFormInfo.new
  end

  def create_contact_form_info
    @contact_form_info = ContactFormInfo.new(contact_form_info_params)
    if @contact_form_info.save
      redirect_to root_path
    else
      render 'contact_us'
    end
  end

  private

  def contact_form_info_params
    params.require(:contact_form_info).permit(:first_name, :last_name, :email, :content)
  end
end
