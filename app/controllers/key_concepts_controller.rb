class KeyConceptsController < ApplicationController
	include KeyConceptsHelper

	def whereami
		if params[:piece_id]
			@piece = Piece.find(params[:piece_id])
			@keyconcept = KeyConcept.new
			@keyconcept.conceptable_id = @piece.id

			@here = @piece
			@parameter = :piece_id
			@type = "Piece"
		elsif params[:section_id]
			@section = Section.find(params[:section_id])
			@piece = @section.piece_id
			@keyconcept = @section.key_concepts.find(params[:id])

			@here = @section
			@parameter = :section_id
			@type = "Section"
		elsif params[:subsection_id]
			@subsection = Subsection.find(params[:subsection_id])
			@section = @subsection.section_id
			@piece = Section.find(id=@section).piece_id

			@here = @subsection
			@parameter = :subsection_id
			@type = "Subsection"
		elsif params[:subsubsection_id]
			@subsubsection = Subsubsection.find(params[:subsubsection_id])
			@subsection = @subsubsection.subsection_id
			@section = Subsection.find(id=@subsection).section_id
			@piece = Section.find(id=@section).piece_id

			@here = @subsubsection 
			@parameter = :subsubsection_id
			@type = "Subsubsection"
		end
	end

	def redirect
		self.whereami
		if @type == "Piece"
	  		@redirect = redirect_to piece_path(@piece)
	  	elsif @type == "Section"
	  		@redirect = redirect_to piece_section_path(@piece, @section)
	  	elsif @type == "Subsection"
	  		@redirect = redirect_to piece_section_subsection_path(@piece, @section, @subsection)
	  	elsif @type == "Subsubsection"
	  		@redirect = redirect_to piece_section_subsection_subsubsection_path(@piece, @section, @subsection, @subsubsection)
	  	end
	end

	def index
		self.whereami
		@piece = Piece.find(params[:piece_id])
	end 

	def show
		#self.whereami
		@piece = Piece.find(params[:piece_id])
		@keyconcept = KeyConcept.new
		@keyconcept.conceptable_id = @piece.id
	end

	def new
		@keyconcept = KeyConcept.new
		@keyconcept.conceptable_id = here.id
	end

	def create
		self.whereami
			
	  @keyconcept = KeyConcept.new(keyconcept_params)

	  @keyconcept.conceptable_id = params[@parameter]
	  @keyconcept.conceptable_type = @type
	  @keyconcept.save
	  
	  self..call
	end

	def destroy
		@here.destroy
		self.redirect
		flash.notice = "#{type} '#{here.name}'  from '#{@piece.name}' deleted!"
	end

	def edit
		self.whereami
	end

	def update
		self.whereami

		@here.update(keyconcept_params)
		flash.notice = "#{type} '#{here.name}' Updated!"
		self.redirect
	end
	

end
