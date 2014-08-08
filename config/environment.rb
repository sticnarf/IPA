# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if instance.error_message.kind_of?(Array)
    %(<div class="form-field error">#{html_tag}<small class="error">&nbsp;
      #{instance.error_message.join(',')}</small></div).html_safe
  else
    %(<div class="form-field error">#{html_tag}<small class="error">&nbsp;
      #{instance.error_message}</small></div).html_safe
  end
end