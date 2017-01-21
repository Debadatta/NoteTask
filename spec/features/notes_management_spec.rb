require "rails_helper"

RSpec.feature "Note management", :type => :feature do
  scenario "User creates a new note" do
    visit "/notes/new"

    fill_in "note_description", :with => "My new idea"
    click_button "Save"

    expect(page).to have_text("Note was successfully created.")
  end

  scenario "User edits a new note" do
  	@note = Note.last
  	visit "/notes/#{@note.id}/edit"

  	expect(page).to have_content 'Editing Note'

    fill_in "note_description", :with => "My new edit idea"
    click_button "Save"

    expect(page).to have_text("Note was successfully updated.")
  end

  scenario "User edits a new note" do
  	@note = Note.last
  	visit "/notes/#{@note.id}/edit"

  	expect(page).to have_content 'Editing Note'

    fill_in "note_description", :with => "My new edit idea"
    click_button "Save"

    expect(page).to have_text("Note was successfully updated.")
  end

  feature 'User deletes note' do
  	given!(:note) { Note.create!( description: 'This is a description.') }
 
	  scenario do
	    visit notes_path
	    first('.remove').click
	    expect(page).to have_content 'The note was deleted successfully'
	    expect(page).to_not have_content note.description
	  end
  end

  feature 'User see Previous versions' do
    given!(:note) { @note = Note.create!( description: 'This is a first description.') }
    
    scenario "The user can see Previous Versions" do
	   note.description = 'This is a second description.'
     note.save!
     note.description = 'This is a third description.'
     note.save!
	   

     visit note_path(note)
	   expect(page).to have_content("Rollback", count: 3)
	end
  end
end