class VersionsController < ApplicationController
	
	before_action :set_document_and_version, only: [:rollback]

    def rollback
	    # change the current document to the specified version
	    # reify gives you the object of this version
	    note = @version.reify	    
	    if note.blank?
	    	redirect_to notes_path
	    else
	    	note.save! 
	    	redirect_to edit_note_path(note)
	    end
	end

	private

	    def set_document_and_version
	      @note = Note.find(params[:note_id])
	      @version = @note.versions.find(params[:id])
	    end

end
