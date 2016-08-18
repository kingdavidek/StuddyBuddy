class ConnectionsController < ApplicationController
	include ConnectionsHelper

	def create
		@section = Section.find(params[:section_id])
	  @piece = @section.piece_id
	  @connection = Connection.new(connection_params)

	  @connection.connectable_id = params[:section_id]
	  @connection.connectable_type = "Section"
	  @connection.save
	  redirect_to piece_section_path(@piece, @section)
	end
end
