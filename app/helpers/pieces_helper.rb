module PiecesHelper

	def piece_params
	
		params.require(:piece).permit(:name, :author, :subject, :summary, :thoughts)
	 
	end
end
