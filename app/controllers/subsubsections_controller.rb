class SubsubsectionsController < ApplicationController
	include SubsubsectionsHelper

	def index
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
	end

	def show
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = @subsection.subsubsections.find(params[:id])
		@connection = Connection.new
		@connection.connectable_id = @subsection.id
	end

	def new
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = Subsubsection.new
		@subsubsection.subsection_id = @subsection.id 
	end

	def create
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = @subsection.subsubsections.new(subsubsection_params)
		@subsubsection.save
		redirect_to piece_section_subsection_subsubsection_path(@piece, @section, @subsection, @subsubsection)
		flash.notice = "Mini section '#{@subsubsection.name}' Created!"
	end

	def destroy
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = @subsection.subsubsections.find(params[:id])
		@subsubsection.destroy
		redirect_to piece_section_subsection_path(@piece, @section, @subsection)
		flash.notice = "Mini section '#{@subsubsection.name}' from '#{@subsection.name}' deleted!"
	end

	def edit
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = @subsection.subsubsections.find(params[:id])
	end

	def update
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
		@subsection = @section.subsections.find(params[:subsection_id])
		@subsubsection = @subsection.subsubsections.find(params[:id])
		@subsubsection.update(subsubsection_params)

		flash.notice = "Mini section '#{@subsubsection.name}' Updated!"

		redirect_to piece_section_subsection_subsubsection_path(@piece, @section, @subsection, @subsubsection)
	end


end
