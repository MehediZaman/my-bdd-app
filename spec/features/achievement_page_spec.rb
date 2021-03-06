require 'spec_helper'


feature 'achievement page' do 
	scenario 'achievement public page' do
		achievement = FactoryGirl.create(:achievement, title: 'Just did it')
		#achievement = Achievement.create(title: 'Just did it')
		visit("/achievements/#{achievement.id}" )


		expect(page).to have_content('Just did it')

		achievements = FactoryGirl.create_list(:achievement, 3)
		p achievements
		end		

	scenario 'render markdown description' do
		achievement = FactoryGirl.create(:achievement, description: 'That *was* hard')
		visit("/achievements/#{achievement.id}" )
		expect(page).to have_css('em', text: 'was')
	end
	
end