class PredictionsController < ApplicationController
  before_action :set_prediction, only: [:show, :edit, :update, :destroy]
  before_action :already_confirmed, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /predictions
  # GET /predictions.json
  def index
    #@predictions = Prediction.all

    # just make this some before_action or some shit
    redirect_to root_path
  end

  # GET /predictions/1
  # GET /predictions/1.json
  def show
  end

  # GET /predictions/new
  def new
    if !current_user.has_prediction?
      @prediction = Prediction.new
    else
      redirect_to predictions_path
    end
  end

  # GET /predictions/1/edit
  def edit
    redirect_to @prediction unless @prediction.equal?(current_user.prediction)
  end

  # POST /predictions
  # POST /predictions.json
  def create
    if current_user.has_prediction?
      redirect_to predictions_path, :error => "You already have a prediction"
    end
    @prediction = Prediction.new(prediction_params)
    @prediction.user = current_user
    
    respond_to do |format|
      if @prediction.save
        format.html { redirect_to @prediction, notice: 'Prediction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prediction }
      else
        format.html { render action: 'new' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /predictions/1
  # PATCH/PUT /predictions/1.json
  def update
    respond_to do |format|
      if @prediction.update(prediction_params)  
        format.html { redirect_to @prediction, notice: 'Prediction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /predictions/1
  # DELETE /predictions/1.json
  def destroy
    if !current_user.prediction.id.equal?(params[:id])
      redirect_to predictions_path, error: "What the hell?  Dick."
    end
    @prediction.destroy
    respond_to do |format|
      format.html { redirect_to predictions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prediction
      @prediction = current_user.is_admin? ? Prediction.find(params[:id]) : current_user.prediction
    end
  
  def already_confirmed
    if @prediction.confirmed
      redirect_to @prediction
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prediction_params
      params.require(:prediction).permit(:team, :wins, :losses, :tiebreaker, :confirmed)
    end
end
