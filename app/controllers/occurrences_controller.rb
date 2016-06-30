class OccurrencesController < ApplicationController
  before_action :set_occurrence, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin_user, only: [:edit, :update, :destroy]

  # GET /occurrences
  # GET /occurrences.json
  def index
    @holiday = Holiday.find(params[:holiday_id])
    @occurrences = @holiday.occurrences
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
  end

  # GET /occurrences/new
  def new
    @holiday = Holiday.find(params[:holiday_id])
    @occurrence = @holiday.occurrences.build
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    @holiday = Holiday.find(params[:holiday_id])
    @occurrence = Occurrence.new(occurrence_params)

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to :back, notice: 'Occurrence was successfully created.' }
        format.json { render :show, status: :created, location: @occurrence }
      else
        format.html { render :new }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @occurrence.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Occurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrence_params
      params.require(:occurrence).permit(:holiday_id, :calendar_date_id)
    end
end
