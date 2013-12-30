require 'spec_helper'

describe "User accessing the site", :type => :feature do 
  context "on the index page" do
    before :each do
      visit "/"
    end

    it "should have access to pairing badge" do
      expect(find_link("png")[:href]).to include('badge.png')
      expect(find_link("svg")[:href]).to include('badge.svg')
    end

    it "should be able enter email and generate badge code", :js => true do
      expect(page).to_not have_content('<a href="mailto:" title="Pair program with me!">')
      click_on "submit-email"
      expect(page).to have_content('<a href="mailto:" title="Pair program with me!">')
      fill_in("badge-email", :with => "pairenthusiast@example.com")
      click_on "submit-email"
      expect(page).to have_content('<a href="mailto:pairenthusiast@example.com"')
    end

  end
end
