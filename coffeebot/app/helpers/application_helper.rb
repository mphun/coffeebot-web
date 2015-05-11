module ApplicationHelper
  def display_flash(msg = 'There were some errors with your submission:')
    if flash[:notice]
      display = flash[:notice]
      css     = 'notice'
    elsif flash[:warning]
      display = flash[:warning]
      css     = 'warning'
    elsif flash[:error]
      if flash[:error].instance_of? ActiveRecord::Errors
        #display = msg
        display = []
        display << activerecord_errors(flash[:error])
      else
        display = flash[:error]
      end
      css = 'error'
    else
      return
    end
    content_tag 'div', display, :class => "flash_#{css}"
  end

end
