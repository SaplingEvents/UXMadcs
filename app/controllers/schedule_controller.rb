class ScheduleController < ApplicationController
  def index
    @sessions = Session.all order: :start
  end
end
