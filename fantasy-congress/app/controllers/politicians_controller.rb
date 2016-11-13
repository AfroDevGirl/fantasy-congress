class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show]

  # GET /politicians
  # GET /politicians.json
  def index
    @politicians = Politician.all
  end

  # GET /politicians/1
  # GET /politicians/1.json
  def show
    @politician 
    @bills = @politician.bills 
    @stats = @politician.votes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      params.fetch(:politician, {})
    end
end
