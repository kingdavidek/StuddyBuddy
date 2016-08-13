class LinksController < ApplicationController
	include LinksHelper

	def create
		@link = Link.new(link_params)
		@link.piece_id = params[:piece_id]
		@link.save

		redirect_to piece_path(@link.piece)
	end
end
