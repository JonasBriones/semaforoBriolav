module ApplicationHelper

  def flash_class(level)
      case level
        when "notice" then return "alert alert-info"
        when "success" then return "alert alert-success"
        when "error" then return "alert alert-warning"
        when "alert" then return "alert alert-danger"
      end
  end

end
