module ApplicationHelper
  def flash_message(message)
    flash[:notice] = message
  end
end
