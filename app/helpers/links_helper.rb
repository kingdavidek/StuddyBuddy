module LinksHelper

	def link_params
	
		params.require(:link).permit(:author_name, :url, :basis)
	 
	end
end
