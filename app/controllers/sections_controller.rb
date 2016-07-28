class SectionsController < ApplicationController


	def index
		@pieces = Piece.find(params[:piece_id])
		@sections = @pieces.sections.all
		#@sections.piece_id = @pieces.id
	end
end
