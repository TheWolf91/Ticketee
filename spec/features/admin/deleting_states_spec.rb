require "rails_helper"

RSpec.feature "Admins can delete states for tickets" do
  let!(:state) { FactoryGirl.create(:state) }

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit admin_states_path
  end

  scenario "successfully" do
    click_link "Delete"

    expect(page).to have_content "State has been deleted."
    expect(page).to_not have_content "A state"
  end
end