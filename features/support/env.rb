require 'cucumber'
require 'selenium-webdriver'
require 'pry'
require 'rspec'
require 'page-object'
require 'cukehub'

caps = Selenium::WebDriver::Remote::Capabilities.chrome(                       
    "chromeOptions" => {                                                         
      'binary' => '/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary',           
      'args' => %w{headless no-sandbox disable-gpu}                              
    }                                                                            
  )    
  
Before do
  # @browser = Selenium::WebDriver.for :chrome, desired_capabilities: caps
  @browser = Selenium::WebDriver.for :chrome
  @cukehub_api_key = "K21yzwMEjaZ2UKjrxhRBQQY2"
  @browser.manage.timeouts.implicit_wait = 5
  @domain = "http://www.theconnorsgroup.com/"
end

AfterStep do
  js_errors = @browser.manage.logs.get(:browser)
  if @browser.current_url == @domain
    js_errors.each do |error|
      puts error.level
      raise "JAVASCRIPT ERRORS => #{js_errors}" unless error.level != "SEVERE"
    end
  end
end

After do 
  @browser.quit
end
