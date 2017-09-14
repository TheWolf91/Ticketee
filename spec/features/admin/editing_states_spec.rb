require 'rails_helper'

RSpec.feature "Admins can edit states for tickets" do
  let!(:state) { FactoryGirl.create(:state) }
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit admin_states_path
  end

  scenario "with valid details" do
    click_link "Edit"
    fill_in "Name", with: "Fixed"
    click_button "Update State"

    expect(page).to have_content "State has been updated."
    expect(page).to have_content "Fixed"
    expect(page).to_not have_content "A state"
  end
end