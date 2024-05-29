class Api::V1::InnRoomsController < ActionController::API
  def show
    room = InnRoom.find(params[:id])

    render status: 200, json: room.as_json(except: [:inn_id, :created_at, :updated_at])
  end
end