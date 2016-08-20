module KeyConceptsHelper

	def key_concept_params
	
		params.require(:key_concept).permit(:author_name, :definition, :basis, :people_attributed, :thoughts)
	 
	end
end
