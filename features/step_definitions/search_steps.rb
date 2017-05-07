Given(/^I am on the home page$/) do
  @browser.get(@domain + '/')
end

Given /I search for "(.*)"/i do |value|
  @browser.first(name: 'filter').send_keys(value)
  @browser.first(class: 'homesearch-submit').click
end


Given /I should (NOT )?see "(.*)"/i do |visibility, text|
  sleep 1
  text = text.to_s.strip
  if (visibility.to_s.strip == 'NOT') then
    @browser.find_element(tag_name: 'body').text.should_not include("#{text}")
  else
    @browser.find_element(tag_name: 'body').text.should include("#{text}")
  end
end