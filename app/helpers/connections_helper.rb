module ConnectionsHelper
	def connection_params #piece_key_concept_path(@piece, @keyconcept), class: 'section_name'
	
		params.require(:connection).permit(:author_name, :url, :basis)
	 
	end
end
