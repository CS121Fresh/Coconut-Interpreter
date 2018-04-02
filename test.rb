require "selenium-webdriver"
require "rspec"

decribe "Coconut interpreter" do

    describe "print from script" do
        it "confirm print from script" do
            driver = Selenium::WebDriver.for :firefox
            driver.navigate.to "http://18.191.3.155:3001/"

            script_input = driver.find_element(id: "editor")
            run = driver.find_element(class: "button")

            script_input.send_keys("print("hello world!")")
            run.click

                #confirm
            outcome = driver.find_element(id: "console_output") #id not sure
            outcome_printed1 = outcome.text
            expect(outcome_printed1).to eq("hello world!")

            driver.quit
        end
    end

    describe "addition from console" do
        it "confirm add from console" do
            driver = Selenium::WebDriver.for :firefox
            driver.navigate.to "http://18.191.3.155:3001/"

            console_input = driver.find_element(id: "editor2")
            run = driver.find_element(class: "button")

            console_input.send_keys("1+1")
            run.click

            outcome = driver.find_element(id: "console_output") #id not sure
            outcome_printed2 = outcome.text #2?
            expect(outcome_printed2).to eq("2")

            driver.quit
        end
    end

    
end
