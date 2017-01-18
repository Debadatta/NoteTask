require 'spec_helper'
describe NotesController, :type => :controller do
  describe "GET index" do
    it "assigns @notes" do      
      notes = Note.all
      get :index
      expect(assigns(:notes)).to eq(notes)      
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end


	describe "PUT update" do
	  	it "updates the requested note" do
	  		@note = Note.first
		    put :update, { :id => @note_update_attributes }
		    @note.reload                      
		    put :update, {  :id => @note_update_attributes}

		  end
	end

	describe "GET show" do		
		it "assigns the requested note as @note" do
			@note = Note.first
		  get :show, {  :id => @note.id }    
		  expect(assigns(:note)).to eq(@note)  
		end
	end
end