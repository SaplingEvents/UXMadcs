class ScheduleController < ApplicationController
  def index
    @friday_sessions = Session.where("start <= '2014-07-12'").order(:start)
    @saturday_sessions = Session.where("start >= '2014-07-12'").order(:start)
  end
end
