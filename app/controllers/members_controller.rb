class MembersController < ApplicationController
  before_action :set_current_tenant

  def index
    @member = @current_tenant.members
  end

  def invite
    email = params[:email]
    return redirect_to tenancy_members_path(@current_tenant), alert: "Email is required" if email.blank?

    user = User.find_by(email:) || User.invite!({email: }, current_user)
    return redirect_to tenancy_members_path(@current_tenant), alert: "Email is invalid" unless user.valid?
    return redirect_to tenancy_members_path(@current_tenant), alert: "User #{email} is already a member" if @current_tenant.members.exists?(user: user)
    user.members.find_or_create_by(tenancy: @current_tenant, roles: { owner: false , editor: true })
    redirect_to tenancy_members_path(@current_tenant), notice: "User #{email} invited"
  end

  private
  def set_current_tenant
    @current_tenant = Tenancy.find(params[:tenancy_id])
  end
end
