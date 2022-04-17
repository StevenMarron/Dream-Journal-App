class DreamsController < ApplicationController
  before_action :set_dream, only: %i[ show edit update destroy ]

  # GET /dreams or /dreams.json
  def index
    @dreams = Dream.all
  end

  # GET /dreams/1 or /dreams/1.json
  def show
  end

  # GET /dreams/new
  def new
    @dream = Dream.new
  end

  # GET /dreams/1/edit
  def edit
  end

  # POST /dreams or /dreams.json
  def create
    @dream = Dream.new(dream_params)

    respond_to do |format|
      if @dream.save
        format.html { redirect_to dream_url(@dream), notice: "Dream was successfully created." }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dreams/1 or /dreams/1.json
  def update
    respond_to do |format|
      if @dream.update(dream_params)
        format.html { redirect_to dream_url(@dream), notice: "Dream was successfully updated." }
        format.json { render :show, status: :ok, location: @dream }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1 or /dreams/1.json
  def destroy
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url, notice: "Dream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dream_params
      params.require(:dream).permit(:title, :nightmare, :notes, :user_id)
    end
end
