require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can see information about a house' do
    visit '/'

    select "Gryffindor", from: :house

    click_on 'Search For Members'

    @members = Member.all

    expect(current_path).to eq('/search')
    expect(@members.count).to eq(21)
    expect(page).to have_content("#{@members.count} members are in the Order of the Phoenix.")

    within('#member-Aberforth Dumbledore') do
      expect(page).to have_content("Aberforth Dumbledore")
      expect(page).to have_content("Owner, Hog's Head Inn")
      expect(page).to have_content("Gryffindor")
      expect(page).to have_content("goat")
    end
  end
end

