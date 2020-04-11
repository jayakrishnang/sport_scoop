class ApplicationController < ActionController::Base
	include Application::ResponseHandler
	include Application::ExceptionHandler

  respond_to :json
end
