class RcableChannel < ApplicationCable::Channel
  def subscribed
    stream_for rcable
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def rcable
    Rcable.find(params[:rcable_id])
  end
end
