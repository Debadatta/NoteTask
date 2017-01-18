require "rails_helper"

RSpec.feature "Note management", :type => :feature do
  scenario "User creates a new note" do
    visit "/notes/new"

    fill_in "note_description", :with => "My new idea"
    click_button "Save"

    expect(page).to have_text("Note was successfully created.")
  end

  scenario "User view show note page" do
    visit "/notes/:id"

    fill_in "note_description", :with => "My new idea"
    click_button "Save"

    expect(page).to have_text("Note was successfully created.")
  end
end