require 'json'
class EndpointsController < ApplicationController
  before_action :set_endpoint, only: [:show, :update, :destroy]

  # GET /endpoints
  def index
    @endpoints = Endpoint.all

    render json:getAllEndpints(@endpoints)
  end

  # GET /endpoints/1
  def show
    render json: mapEndpointResponse(@endpoint)
  end

  # POST /endpoints
  def create
    @endpoint = Endpoint.new(object_parser(endpoint_params))
    begin 
      if @endpoint.save
        render json: mapEndpointResponse(@endpoint), status: :created 
      else
        render json: @endpoint.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique
      render json: { errors: [{code: "dublicate record", detail: "The endpoint try to create already exist"}]},  status: 422  
    end
  end

  # PATCH/PUT /endpoints/1
  def update
    if @endpoint.update(object_parser(endpoint_params))
      render json: mapEndpointResponse(@endpoint)
    else
      render json: @endpoint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /endpoints/1
  def destroy
    @endpoint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endpoint
      begin
        @endpoint = Endpoint.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: [{code: "not_found", detail: "Requested Endpoint with ID `#{params[:id]}` does not exist"}]},  status: 404 
      end
    end

    # Only allow a trusted parameter "white list" through.
    def endpoint_params
      params.require(:data).permit(:type, attributes: [:verb, :path, response: [:code, :body, headers: {}]])
    end

    def object_parser (data)
      {infoType: data[:type], path: data[:attributes][:path],  verb: data[:attributes][:verb].to_s.downcase.gsub(/\s+/, ''), code: data[:attributes][:response][:code], headers: data[:attributes][:response][:headers], body: data[:attributes][:response][:body] }
    end

    def mapEndpointResponse (data)
      {type: data.infoType, id: data.id, attributes:{verb: data.verb.upcase, path: data.path, response:{ code: data.code, headers: data.headers, body: data.body}} }
    end

    def getAllEndpints(endpoints)
      data = []
      endpoints.each do |endpoint|
        data << mapEndpointResponse(endpoint)
      end
      {data: data}
    end
end
