class DreamsController < ApplicationController
  before_action :set_dream, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  # GET /dreams or /dreams.json
  def index
    # attempt to filter dreams where nightmare=true
    # @nightmares = Dream.where(user_id: current_user.id).where(nightmare: true).page(params[:page])
    if current_user.admin
      @dreams = Dream.all
    else
      @dreams = Dream.where(user_id: current_user.id).page(params[:page])
    end
    @dreams = @dreams.order('created_at DESC').page(params[:page])
  end

  # GET /dreams/1 or /dreams/1.json
  def show
    if current_user.admin
    elsif @dream.user_id != current_user.id
      redirect_to dreams_url
      return
    end
  end

  # GET /dreams/new
  def new
    @dream = Dream.new
    @dream.user_id = current_user.id
  end

  # GET /dreams/1/edit
  def edit
    if current_user.admin
    elsif @dream.user_id != current_user.id
      redirect_to dreams_url
      return
    end
  end

  # POST /dreams or /dreams.json
  def create
    @dream = Dream.new(dream_params)
    if @dream.user_id != current_user.id
      redirect_to dreams_url
      return
    end

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
  if current_user.admin
  elsif @dream.user_id != current_user.id
      redirect_to dreams_url
      return
    end
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
    if current_user.admin
    elsif @dream.user_id != current_user.id
      redirect_to dreams_url
      return
    end
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
