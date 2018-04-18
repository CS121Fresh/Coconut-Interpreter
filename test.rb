require "selenium-webdriver"
require "rspec"
# from selenium.webdriver.common.keys import Keys

# System.setProperty("webdriver.chrome.driver", "~:/home/yun/Downloads/chromedriver");
# WebDriver driver = new ChromeDriver();
# if driver.find_element(:tag_name => "body").text.include?("This article is about the chemical element.")
#     print 'Test passed'
# else
#     print 'Test failed'
# end

def print_test()
    # @driver.action.send_keys("\n").perform
    run = @driver.find_element(id: "runbutton")
    # run.click
    
    script_input = @driver.find_element(class: "ace_text-input")
    # script_input.send_keys('print("hello world!")')
    script_input.send_keys('print("1234567890")')
    @driver.action.send_keys("\n").perform
    run.click

    # #confirm
    outcome = @driver.find_element(:xpath => "//pre[@id='editor2']/div[@class='ace_scroller']/div[@class='ace_content']/div[@class='ace_layer ace_text-layer']/div[@class='ace_line']")
    #:xpath => "//pre[@id='editor2']/div[@class='ace_scroller']/div[@class='ace_content']/div[@class='ace_layer ace_text-layer']/div[@class='ace_line']/span[@class='ace_identifier']") #export PATH=$PATH:~/Downloads/id not sure
    # outcome = driver.find_element(id: "output") 
    outcome_printed1 = outcome.text
    expect(outcome_printed1).to eq(">>> Welcome to Coconut online Interpreter! ")

    script_input.send_keys('"hello world" |>print')
    @driver.action.send_keys("\n").perform
    run.click

    outcome2 = @driver.find_element(:xpath => "//pre[@id='editor2']/div[@class='ace_scroller']/div[@class='ace_content']/div[@class='ace_layer ace_text-layer']/div[@class='ace_line']/span[@class='ace_constant ace_numeric']") 
    outcome_printed2 = outcome2.text
    expect(outcome_printed2).to eq("hello world")


    # script_input = @driver.find_element(class: "ace_text-input",:visible => true)
    # # script_input.send_keys('print("hello world!")')
    # script_input.send_keys('"1234567890-=qwertyuiop[]asdfghjkl;" |> print')
    # @driver.action.send_keys("\n").perform
    
    # run.click

    # #confirm
    # outcome = @driver.find_element(id: "editor2") #id not sure
    # # outcome = driver.find_element(id: "output") 
    # outcome_printed1 = outcome.text
    # expect(outcome_printed1).to eq("1234567890-=qwertyuiop[]asdfghjkl;")
end

def math_test(sqrt_num)
    script_input = @driver.find_element(class: "ace_text-input",:visible => true)
    script_input.send_keys("import math")
    @driver.action.send_keys("\n").perform
    script_input.send_keys("a = math.sqrt(")
    script_input.send_keys(sqrt_num)
    script_input.send_keys(")")
    @driver.action.send_keys("\n").perform

    script_input.send_keys("a = math.sqrt(")
    run = @driver.find_element(id: "runbutton")

    run.click

    #confirm
    outcome = @driver.find_element(id: "editor2") #id not sure
    # outcome = driver.find_element(id: "output") 
    outcome_printed1 = outcome.text
    outcome_num = Math.sqrt(sqrt_num)

    expect(outcome_printed1).to eq(outcome_num )

    script_input.send_keys("1+1")
    @driver.action.send_keys("\n").perform
    run.click
     #confirm
    outcome = @driver.find_element(id: "editor2") #id not sure
    outcome_printed1 = outcome.text
    expect(outcome_printed1).to eq("2")

    script_input.send_keys("2*2")
    @driver.action.send_keys("\n").perform
    run.click
     #confirm
    outcome = @driver.find_element(id: "editor2") #id not sure
    outcome_printed1 = outcome.text
    expect(outcome_printed1).to eq("4")

    script_input.send_keys("5/2")
    @driver.action.send_keys("\n").perform
    run.click
     #confirm
    outcome = @driver.find_element(id: "editor2") #id not sure
    outcome_printed1 = outcome.text
    expect(outcome_printed1).to eq("2.50")

    script_input.send_keys("5//2")
    @driver.action.send_keys("\n").perform
    run.click
     #confirm
    outcome = @driver.find_element(id: "editor2") #id not sure
    outcome_printed1 = outcome.text
    expect(outcome_printed1).to eq("2")
end

# def lambda()
#     script_input = @driver.find_element(class: "ace_text-input",:visible => true)
#     script_input.send_keys('dubsums = map((x, y) -> 2*(x+y), range(0, 2)), range(10, 12)')
#     script_input.send_keys('dubsums |> list |> print')
#     @driver.action.send_keys("\n").perform
#     outcome = @driver.find_element(id: "editor2") #id not sure
#     # outcome = driver.find_element(id: "output") 
#     outcome_printed1 = outcome.text
#     expect(outcome_printed1).to eq("[20,22,22,24]")
# end

describe "Coconut interpreter" do

    describe "print from script" do
        it "confirm print from script" do

            # options = Selenium::WebDriver::Chrome::Options.new
            # options.add_argument('--ignore-certificate-errors')
            # options.add_argument('--disable-popup-blocking')
            # options.add_argument('--disable-translate')
            # Selenium::WebDriver::Chrome::Service.executable_path = '~/Downloads/'
            # @driver = Selenium::WebDriver.for :chrome

            @driver = Selenium::WebDriver.for :firefox
            
            @driver.navigate.to "http://coconutpl.s3-website.us-east-2.amazonaws.com/"
            # driver.navigate.to "http://mathcs.holycross.edu/~kwalsh/python/"
            script_input = @driver.find_element(class: "ace_text-input")
            # script_input = driver.find_element(id: "code")
            # run = @driver.find_element(id: "runbutton")
            # run =  driver.find_element_by_css_selector('button.content')
            # screen = driver.find_element(id: editor)

            # script_input.clear()
            print_test()

            # math_test(2)
            


            @driver.quit
        end
    end

    # describe "addition from console" do
    #     it "confirm add from console" do
    #         driver = Selenium::WebDriver.for :firefox
    #         driver.navigate.to "http://coconutpl.s3-website.us-east-2.amazonaws.com/"

    #         console_input = driver.find_element(class: "ace_text-input")
    #         run = driver.find_element(id: "runbutton")

    #         console_input.send_keys("1+1")
    #         run.click

    #         outcome = driver.find_element(id: "editor2") #id not sure
    #         outcome_printed2 = outcome.text #2?
    #         expect(outcome_printed2).to eq("2")

    #         console_input.send_keys("import math")
    #         console_input.send_keys('print "math.sqrt(2)" ')
    #         run.click

    #         outcome = driver.find_element(id: "editor2") #id not sure
    #         outcome_printed2 = outcome.text #2?
    #         expect(outcome_printed2).to eq("1.4142135623730951")

    #         driver.quit
    #     end
    # end

    
end
