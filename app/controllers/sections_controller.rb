class SectionsController < ApplicationController
	include SectionsHelper

	def index
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
	end

	def show
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:id])
	end

	def new
		@piece = Piece.find(params[:piece_id])
		@section = Section.new
		@section.piece_id = @piece.id 
	end

	def create
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.new(section_params)
		@section.save
		redirect_to piece_section_path(@piece, @section)
		flash.notice = "Section '#{@section.name}' Created!"
	end

	def destroy
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:id])
		@section.destroy
		redirect_to piece_path(@piece)
		flash.notice = "Section '#{@section.name}' from '#{@piece.name}' deleted!"
	end


end
