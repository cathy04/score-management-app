class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches or /matches.json
  def index
    @matches = Match.all
    # @matches = Match.order(winner: :desc)
    winners_counts = @matches.group(:winner).count
    @matches = @matches.sort_by { |match| -winners_counts[match.winner].to_i }

  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  def create
    if match_params[:score_1].to_i > match_params[:score_2].to_i
      winner = match_params[:team_1]
      score_winner = match_params[:score_1].to_i
    else
      winner = match_params[:team_2]
      score_winner = match_params[:score_2].to_i
    end
    @match = Match.new(match_params)
    @match.winner = winner
    @match.score_winner = score_winner
    respond_to do |format|
      if @match.save
        @notification = Notification.new(message: "new")
        @notification.save
        ActionCable.server.broadcast 'notification', @match
        format.html { redirect_to classification_matches_url, notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def classification
    @matches = Match.all
    winners_counts = @matches.group(:winner).count
    @winners = winners_counts.sort_by { |_, count| -count }
    count = 0
    teams = ['alpha','gamma','beta','omega']
    if @winners.length < 4
      teams.each do |team|
        @winners.each do |winner|
          if team == winner[0]
            count +=1
          end
        end
        if count == 0
          @winners.push([team,0])
        end
        count = 0
      end
      
    end
  end

  def export_report
    @matches = Match.all
    classification()
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Report",
        template: "matches/export_report",
        formats: [:html],
        disposition: :inline,
        encoding: 'UTF-8',
        layout: 'pdf',
        page_size: 'A4'
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to match_url(@match), notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:team_1, :team_2, :score_1, :score_2, :winner, :score_winner, :details)
    end
end
