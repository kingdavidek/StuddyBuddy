class PiecesController < ApplicationController
	def index
		#any data we want available in the view template should be promoted to an instance variable by adding a @ to the beginning.
		@pieces = Piece.all
	end

	def show
		@pieces = Piece.find(params[:id])
		#'params is a method which returns a hash of the request parameters'
	end
end
