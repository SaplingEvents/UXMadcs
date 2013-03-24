module ApplicationHelper
  def get_datetime dt_object
    dt_object.strftime '%Y-%m-%dT%H:%M'
  end

  def get_hours dt_object
    dt_object.strftime '%I'
  end

  def get_minutes dt_object
    dt_object.strftime '%M'
  end
end
