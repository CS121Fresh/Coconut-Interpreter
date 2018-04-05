require "selenium-webdriver"
require "rspec"

describe "Coconut interpreter" do

    describe "print from script" do
        it "confirm print from script" do
            driver = Selenium::WebDriver.for :firefox
            driver.navigate.to "http://coconutpl.s3-website.us-east-2.amazonaws.com/"
            # driver.navigate.to "http://mathcs.holycross.edu/~kwalsh/python/"
            script_input = driver.find_element(class: "ace_text-input")
            # script_input = driver.find_element(id: "code")
            run = driver.find_element(id: "runbutton")
            # run =  driver.find_element_by_css_selector('button.content')

            script_input.send_keys('print("hello world!")')
            run.click

                #confirm
            outcome = driver.find_element(id: "editor2") #id not sure
            # outcome = driver.find_element(id: "output") 
            outcome_printed1 = outcome.text
            expect(outcome_printed1).to eq("hello world!")

            driver.quit
        end
    end

    # describe "addition from console" do
    #     it "confirm add from console" do
    #         driver = Selenium::WebDriver.for :firefox
    #         driver.navigate.to "http://18.191.3.155:3001/"

    #         console_input = driver.find_element(id: "editor2")
    #         run = driver.find_element(class: "button")

    #         console_input.send_keys("1+1")
    #         run.click

    #         outcome = driver.find_element(id: "console_output") #id not sure
    #         outcome_printed2 = outcome.text #2?
    #         expect(outcome_printed2).to eq("2")

    #         driver.quit
    #     end
    # end

    
end
