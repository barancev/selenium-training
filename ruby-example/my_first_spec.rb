require 'rspec'
require 'selenium-webdriver'
require 'pp'

describe 'Google search' do
  before(:each) do
    Selenium::WebDriver::Firefox::Binary.path = "c:\\Program Files (x86)\\Nightly\\firefox.exe"
    @driver = Selenium::WebDriver.for(:firefox)
    puts PP.pp(@driver.capabilities)
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  it 'should find webdriver' do
    @driver.navigate.to 'http://google.com'
    @driver.find_element(:name, 'q').send_keys 'webdriver'
    @driver.find_element(:name, 'btnG').click
    @wait.until { @driver.title == 'webdriver - Поиск в Google'}
  end

  after(:each) do
    @driver.quit
  end
end
