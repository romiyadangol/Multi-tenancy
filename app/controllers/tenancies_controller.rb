class TenanciesController < ApplicationController
  before_action :set_tenancy, only: %i[ show edit update destroy ]
  before_action :authorize_member, only: %i[ show edit update destroy ]
  # GET /tenancies or /tenancies.json
  def index
    @tenancies = current_user.tenancies
  end
  

  # GET /tenancies/1 or /tenancies/1.json
  def show
  end

  # GET /tenancies/new
  def new
    @tenancy = Tenancy.new
  end

  # GET /tenancies/1/edit
  def edit
  end

  # POST /tenancies or /tenancies.json
  def create
    @tenancy = Tenancy.new(tenancy_params)

    respond_to do |format|
      if @tenancy.save
        @tenancy.members.create(user: current_user, roles: { owner: true })
        format.html { redirect_to tenancy_url(@tenancy), notice: "Tenancy was successfully created." }
        format.json { render :show, status: :created, location: @tenancy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenancies/1 or /tenancies/1.json
  def update
    respond_to do |format|
      if @tenancy.update(tenancy_params)
        format.html { redirect_to tenancy_url(@tenancy), notice: "Tenancy was successfully updated." }
        format.json { render :show, status: :ok, location: @tenancy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenancies/1 or /tenancies/1.json
  def destroy
    @tenancy.destroy!

    respond_to do |format|
      format.html { redirect_to tenancies_url, notice: "Tenancy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def authorize_member
    return redirect_to root_path, alert: "You are not a member of this tenancy" unless @tenancy.members.exists?(user: current_user)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tenancy
      @tenancy = Tenancy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tenancy_params
      params.require(:tenancy).permit(:name)
    end
end
