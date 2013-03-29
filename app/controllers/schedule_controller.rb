class ScheduleController < ApplicationController
  def index
    @friday_sessions = Session.where("start <= '2013-07-12'").order(:start)
    @saturday_sessions = Session.where("start >= '2013-07-12'").order(:start)
  end
end
