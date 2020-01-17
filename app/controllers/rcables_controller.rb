class RcablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rcable, only: [:show, :edit, :update, :destroy]

  # GET /rcables
  # GET /rcables.json
  def index
    @rcables = Rcable.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    authorize @rcables
  end

  # GET /rcables/1
  # GET /rcables/1.json
  def show
    authorize @rcable
    @message = @rcable.messages.new
  end

  # GET /rcables/new
  def new
    @rcable = Rcable.new
    authorize @rcable
  end

  # GET /rcables/1/edit
  def edit
    authorize @rcable
  end

  # POST /rcables
  # POST /rcables.json
  def create
    @rcable = Rcable.new(rcable_params)
    authorize @rcable
    @rcable.user = current_user

    respond_to do |format|
      if @rcable.save
        format.html { redirect_to @rcable, notice: 'Rcable was successfully created.' }
        format.json { render :show, status: :created, location: @rcable }
      else
        format.html { render :new }
        format.json { render json: @rcable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rcables/1
  # PATCH/PUT /rcables/1.json
  def update
    authorize @rcable
    respond_to do |format|
      if @rcable.update(rcable_params)
        format.html { redirect_to @rcable, notice: 'Rcable was successfully updated.' }
        format.json { render :show, status: :ok, location: @rcable }
      else
        format.html { render :edit }
        format.json { render json: @rcable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rcables/1
  # DELETE /rcables/1.json
  def destroy
    @rcable.destroy
    authorize @rcable
    respond_to do |format|
      format.html { redirect_to rcables_url, notice: 'Rcable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rcable
      @rcable = Rcable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rcable_params
      params.require(:rcable).permit(:name, :description, :user_id, :cover)
    end
end
