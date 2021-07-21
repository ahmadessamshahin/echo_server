class EchoController < ApplicationController
  before_action :verify_request_type
  before_action :get_endpoint, only: [:handler]

  def handler
    if @endpoint
      render json: @endpoint.body, status: @endpoint.code, headers: @endpoint.headers  
    else
      render json: { errors: [{code: "not_found", detail: "Requested page `#{request.path}` does not exist"}]}, status: 404
    end
  end

  private

  def verify_request_type
    unless allowed_methods.include?(request.method_symbol)
      head :method_not_allowed
    end
  end

  def allowed_methods
    %i(get post patch options)
  end

  def get_endpoint
    @endpoint = Endpoint.find_by path:request.path, verb: request.method_symbol
  end
end
