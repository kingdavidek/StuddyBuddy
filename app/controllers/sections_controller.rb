class SectionsController < ApplicationController

	def index
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:section_id])
	end

	def show
		@piece = Piece.find(params[:piece_id])
		@section = @piece.sections.find(params[:id])
		#@sections = Piece.sections.find(params[:id])
		#@sections = @piece.sections.all
		#@sections.piece_id = @pieces.id
	end
end
