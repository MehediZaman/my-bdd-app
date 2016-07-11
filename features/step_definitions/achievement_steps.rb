Given(/^I am a guest user$/) do
		 $driver = Selenium::WebDriver.for(:firefox)
    	 $driver.manage().window().maximize() 
    	 navigate_to("http://google.com/ncr")
end
	
Given(/^there is a public achievement$/) do 
		#@achievement = FactoryGirl.create(:public_achievement, title: 'I did it')
		$element = $driver.find_element :name => "q"
		$element.send_keys "Cheese!"
		$element.submit

		puts "Page title is #{$driver.title}"
	end

When(/^I go to the achievement's page$/) do 
		#visit(achievement_path(@achievement.id))
		$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		$wait.until { $driver.title.downcase.start_with? "cheese!" }

		puts "Page title is #{$driver.title}"
		
	
end

Then(/^I must see achievement's content$/) do 
	#expect(page).to have_content('I did it')
	$driver.quit
end