module SubsubsectionsHelper

	def subsubsection_params

		params.require(:subsubsection).permit(:name, :broader_context, :summary, :key_questions_addressed, :thoughts)
		
	end
end
