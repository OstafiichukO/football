require_relative "./application_api_controller"

class Api::V2::TeamsController < ApplicationApiController
  # GET /teams or /teams.json (or xml)
  def index
    @teams = Team.all
    # @names = []
    # @teams.each do |team| @names.push(team.name) end
    respond_to do |format|
      format.json { render json: @teams, status: 200}
      format.xml { render xml: @teams, status: 200 }
    end
  end

  # GET /teams/:id or /teams/:id.json (or xml)
  def show
    @team = Team.find(params[:id])
    respond_to do |format|
      format.json { render json: @team, status: 200}
      format.xml { render xml: @team, status: 200 }
    end 
  end

  # POST /teams or /teams.json (or xml)
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.json  { render json: @team }
        format.xml  { render xml: @team }
      else
        render error: { error: "Unable to create Team"}, status: 400
      end
    end
  end

  # PATCH/PUT /teams/:id or /teams/:id.json (or xml)
  def update
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team
        @team.update(team_params)
        format.json { render json: { message: "Team successfully updated!" }, status: 200 }
        format.xml { render xml: { message: "Team successfully updated!" }, status: 200 }
      else
        format.json { render json: { error: "Unable to update Team" }, status: 400 }
        format.xml { render xml: { error: "Unable to update Team" }, status: 400 }
      end
    end
  end

  # DELETE /teams/:id or /teams/:id.json (or xml)
  def destroy
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team
        @team.destroy
        format.json { render json: { message: "Team succesfuly deleted" }, status: 200 }
        format.xml { render xml: { message: "Team succesfuly deleted" }, status: 200 }
      else
        format.json { render json: { error: "Unable to delete Team" }, status: 400 }
        format.xml { render xml: { error: "Unable to delete Team" }, status: 400 }
      end
    end
  end

  private
    def team_params
      params.require(:team).permit(:name, :logo, :players)
    end
end
