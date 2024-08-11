class AuthorizedController < ApplicationController
  before_action :set_current_tenant
  before_action :authorize_member
  private
  def authorize_member
    return redirect_to root_path, alert: "You are not a member of this tenancy" unless @current_tenancy.members.exists?(user: current_user)
    end
  def set_current_tenant
    @current_tenancy = Tenancy.find(params[:tenancy_id])
  end
end