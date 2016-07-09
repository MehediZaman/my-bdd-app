require 'spec_helper'


feature 'create new achievement' do 
	scenario 'create new achievement with valid data' do
		visit ('/')
		click_link('New Achievement')

		fill_in('Title', with: 'Read a book')
		fill_in('Description', with: 'Excellent Read')
		select('Public', from: 'Privacy')
		check('Featured achievement')
		attach_file('Cover image', "#{Rails.root}/spec/fixtures/cover_image.png")
		click_on('Create Achievement')

		expect(page).to have_content('Achievement has been created')
		expect(Achievement.last.title).to eq('Read a book')
	end	
	scenario 'Cannot create new achievement with invalid data' do
		visit ('/')
		click_link('New Achievement')
		click_on('Create Achievement')
		expect(page).to have_content("can't be blank")
		
	end
end