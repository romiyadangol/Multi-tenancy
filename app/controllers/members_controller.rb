class MembersController < ApplicationController
  before_action :set_current_tenant

  def index
    @member = @current_tenant.members
  end

  private
  def set_current_tenant
    @current_tenant = Tenancy.find(params[:tenancy_id])
  end
end
