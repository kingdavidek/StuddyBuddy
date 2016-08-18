module ConnectionsHelper
	def connection_params
	
		params.require(:connection).permit(:author_name, :url, :basis)
	 
	end
end
