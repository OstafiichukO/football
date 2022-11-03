class PoolsController < ApplicationController
  before_action :set_pool, only: %i[ show edit update destroy ]
  def index
    @pools = Pool.where(user: current_user)
  end

  def show
  end

  def new
    @pool = Pool.new
  end

  def edit
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    respond_to do |format|
      if @pool.save
        format.html { redirect_to pool_url(@pool), notice: "Pool was successfully created." }
        format.json { render :show, status: :created, location: @pool }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pool.update(pool_params)
        format.html { redirect_to pool_url(@pool), notice: "Pool was successfully updated." }
        format.json { render :show, status: :ok, location: @pool }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pool.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pool.destroy

    respond_to do |format|
      format.html { redirect_to pools_url, notice: "Pool was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pool_params
      params.require(:pool).permit(:home_team_score, :visitor_team_score, :match_id, :user_id)
    end

end
