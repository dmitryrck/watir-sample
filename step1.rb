require "watir"

browser = Watir::Browser.new :chrome, headless: true
browser = Watir::Browser.new :firefox
browser.goto "http://devexpress.github.io/testcafe/example"
puts browser.title
browser.close
