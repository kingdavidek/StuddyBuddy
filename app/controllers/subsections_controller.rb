class SubsectionsController < ApplicationController
	include SubsectionsHelper

	def index
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
	end

	def show
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:id])
		@connection = Connection.new
		@connection.connectable_id = @subsection.id
	end

	def new
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = Subsection.new
		@subsection.section_id = @section.id 
	end

	def create
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.new(subsection_params)
		@subsection.save
		redirect_to piece_section_subsection_path(@piece, @section, @subsection)
		flash.notice = "Subsection '#{@subsection.name}' Created!"
	end

	def destroy
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:id])
		@subsection.destroy
		redirect_to piece_section_path(@piece, @section)
		flash.notice = "Subsection '#{@subsection.name}' from '#{@section.name}' deleted!"
	end

	def edit
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:id])
	end

	def update
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:id])
		@subsection.update(subsection_params)

		flash.notice = "Subsection '#{@subsection.name}' Updated!"

		redirect_to piece_section_subsection_path(@piece, @section, @subsection)
	end


end
