class RcableChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rcable_#{params[:rcable_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def talk(data)
    console.log(data)
  end
end
