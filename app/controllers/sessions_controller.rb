# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      remember(user) if params[:remember_me] == '1'
      flash[:success] = t('.success') + " #{current_user.name_or_email}!"
      redirect_to root_path
    else
      flash.now[:warning] = t('.invalid_creds')
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    sign_out
    flash[:success] = t('.success')
    redirect_to root_path
  end
end
