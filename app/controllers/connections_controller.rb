class ConnectionsController < ApplicationController
	include ConnectionsHelper
 
	def create
		if params[:section_id]
			@section = Section.find(params[:section_id])
			@piece = @section.piece_id
			parameter = :section_id
			type = "Section"
		elsif params[:subsection_id]
			@subsection = Subsection.find(params[:subsection_id])
			@section = @subsection.section_id

			@piece = Section.find(id=@section).piece_id
			parameter = :subsection_id
			type = "Subsection"
		elsif params[:subsubsection_id]
			@subsubsection = Subsubsection.find(params[:subsubsection_id])
			@subsection = @subsubsection.subsection_id
			@section = Subsection.find(id=@subsection).section_id
			@piece = Section.find(id=@section).piece_id

			parameter = :subsubsection_id
			type = "Subsubsection"
		end
			
	  @connection = Connection.new(connection_params)

	  @connection.connectable_id = params[parameter]
	  @connection.connectable_type = type
	  @connection.save
	  	if type == "Section"
	  		redirect_to piece_section_path(@piece, @section)
	  	elsif type == "Subsection"
	  		redirect_to piece_section_subsection_path(@piece, @section, @subsection)
	  	elsif type == "Subsubsection"
	  		redirect_to piece_section_subsection_subsubsection_path(@piece, @section, @subsection, @subsubsection)
	  	end
	  			
	end
end
