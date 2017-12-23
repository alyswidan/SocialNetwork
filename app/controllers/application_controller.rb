class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def fading_flash_message(text, seconds = 3)
    text
=begin
      <<-EOJS
      <script type='text/javascript'>
        $(function() {
          setTimeout(() => {
            $('.alert').fadeOut("slow",)
          },#{seconds*1000})
        });
      </script>
    EOJS
=end

  end
end
