class PiecesController < ApplicationController
	include PiecesHelper
	#this includes the ruby Module contained in pieces_helper.rb
	def index
		#any data we want available in the view template should be promoted to an instance variable by adding a @ to the beginning.
		@pieces = Piece.all
	end 

	def show
		@piece = Piece.find(params[:id])
		#'params' is a method which returns a hash of the request parameters'
	end

	def new
		@pieces = Piece.new
		#the 'from_for' method in _form.html will be referring to this variable for an object. Otherwise we send 'nil to the 'form_for' method.
	end

	def create
		@pieces = Piece.new(piece_params)
		@pieces.save
		redirect_to pieces_path(@pieces)
		flash.notice = "Piece '#{@pieces.name}' Created!"
	end

	def destroy
		@pieces = Piece.find(params[:id])
		@pieces.destroy
		redirect_to pieces_path(@pieces)
		flash.notice = "Piece '#{@pieces.name}' Deleted!"
	end

	def edit
		@pieces = Piece.find(params[:id])
	end

	def update
		@pieces = Piece.find(params[:id])
		@pieces.update(piece_params)

		flash.notice = "Piece '#{@pieces.name}' Updated!"

		redirect_to pieces_path(@pieces)
	end

end
