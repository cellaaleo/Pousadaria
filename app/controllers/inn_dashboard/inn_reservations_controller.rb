class InnDashboard::InnReservationsController < InnDashboard::InnDashboardController
  def new
    @inn_reservation = InnReservation.new
  end

  def create
    @inn_reservation = InnReservation.new(reservation_params)

    if @inn_reservation.save
      redirect_to @inn_reservation, notice: 'Reserva cadastrada com sucesso!'
    end
  end
  

  private
  def reservation_params
    params.require(:inn_reservation).permit(:name, :starting_date, :ending_date)
  end
end