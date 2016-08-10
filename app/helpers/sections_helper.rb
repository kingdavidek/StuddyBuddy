module SectionsHelper

	def section_params
		params.require(:section).permit(:name, :broader_context, :summary, :key_questions_addressed, :thoughts)
		
	end
end
