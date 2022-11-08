require_relative "./application_api_controller"
class Api::V1::MatchesController < ApplicationController 
    # before_action :authorize_request 
  # GET /matches or /matches.json (or xml)
  def index
    # @matches = Match.all
    @matches = Match.all.map do |match| 
      match.attributes.merge({
        home_team: match.home_team.name, 
        visitor_team: match.visitor_team.name 
      })
    end
    # join tables

    # render json: @matches, include: [:pools], only: [:stage, :home_team_id, :visitor_team_id, ], status: 200
    # @matches_teams = @matches.collect {|match| [ "#{match.home_team.name} vs #{match.visitor_team.name}"] }
    respond_to do |format|
      format.json { render json: @matches, status: 200 }
      format.xml { render xml: @matches, status: 200 }
    end
  end

  # GET /matches/:id or /matches/:id.json (or xml)
  def show
    @match = Match.find(params[:id])
    respond_to do |format|
      format.json { render json: @match, status: 200}
      format.xml { render xml: @match, status: 200 }
    end 
  end

  # POST /matches or /matches.json (or xml)
  def create
    @match = Match.new(match_params)

    # if(@match.home_team_id == @match.visitor_team_id)
    #   render error: { error: "A team cannot play against itself"}, status: 400 
    #   return
    # end 

    respond_to do |format|
      if @match.save
        format.json  { render json: @match }
        format.xml  { render xml: @match }
      else
        render error: { error: "Unable to create Match"}, status: 400
      end
    end
  end

  # PATCH/PUT /matches/:id or /matches/:id.json (or xml)
  def update
    @match = Match.find(params[:id])

    # if(match_params[:home_team_id] == match_params[:visitor_team_id])
    #   respond_to do |format|
    #     format.json { render json: @match.errors, status: :unprocessable_entity }
    #     format.xml { render xml: @match.errors, status: :unprocessable_entity }
    #   end  
    #   return
    # end 
         
    respond_to do |format|
      if @match
        @match.update(match_params)
        format.json { render json: { message: "Match successfully updated!" }, status: 200 }
        format.xml { render xml: { message: "Match successfully updated!" }, status: 200 }
      else
        format.json { render json: { error: "Unable to update Match" }, status: 400 }
        format.xml { render xml: { error: "Unable to update Match" }, status: 400 }
      end
    end
    if(match_params[:stage] == "finished")
      CalculatePointsJob.perform_later()
    end
  end

  # DELETE /matches/:id or /matches/:id.json (or xml)
  def destroy
    @match = Match.find(params[:id])
    respond_to do |format|
      if @match
        @match.destroy
        format.json { render json: { message: "Match succesfuly deleted" }, status: 200 }
        format.xml { render xml: { message: "Match succesfuly deleted" }, status: 200 }
      else
        format.json { render json: { error: "Unable to delete Match" }, status: 400 }
        format.xml { render xml: { error: "Unable to delete Match" }, status: 400 }
      end
    end
  end
end
