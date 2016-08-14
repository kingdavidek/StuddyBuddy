module SubsectionsHelper

	def subsection_params

		params.require(:subsection).permit(:name, :broader_context, :summary, :key_questions_addressed, :thoughts)
		
	end
end 
