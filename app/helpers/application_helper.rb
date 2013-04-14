module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :alert then "alert-warning"
    when :error then "alert-error"
    end
  end

end
