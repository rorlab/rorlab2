class MessagesController < ApplicationController
  before_action :set_rcable, only: :create

  # POST /messages
  # POST /messages.json
  def create
    @message = if @rcable
                 @rcable.messages.new(message_params)
               else
                 redirect_to(root_path, flash: { error: "Rcable ID was not assigned."}) and return
               end
    authorize @message
    @message.user = current_user

    @message.save
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rcable
      @rcable = Rcable.find(params[:rcable_id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :image)
    end
end
