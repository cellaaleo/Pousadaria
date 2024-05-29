class InnDashboard::InnReservationsController < InnDashboard::InnDashboardController
  def new
    @inn_reservation = InnReservation.new
  end
end