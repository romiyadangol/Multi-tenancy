class MembersController < AuthorizedController
  def index
    @member = @current_tenancy.members
  end

  def invite
    email = params[:email]
    return redirect_to tenancy_members_path(@current_tenancy), alert: "Email is required" if email.blank?

    user = User.find_by(email:) || User.invite!({email: }, current_user)
    return redirect_to tenancy_members_path(@current_tenancy), alert: "Email is invalid" unless user.valid?
    return redirect_to tenancy_members_path(@current_tenancy), alert: "User #{email} is already a member" if @current_tenancy.members.exists?(user: user)

    user.members.find_or_create_by(tenancy: @current_tenancy, roles: { owner: false , editor: true })
    redirect_to tenancy_members_path(@current_tenancy), notice: "User #{email} invited"
  end
end
