# Turbo doesn't work with devise by default.
# Keep tabs on https://github.com/heartcombo/devise/issues/5446 for a possible fix
# Fix from https://gorails.com/episodes/devise-hotwire-turbo
class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w(html turbo_stream */*).include? request_format.to_s
  end
end

Devise.setup do |config|
  config.parent_controller = 'TurboDeviseController'
  config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.warden do |manager|
    manager.failure_app = TurboFailureApp
  end
  config.sign_out_via = :get
end