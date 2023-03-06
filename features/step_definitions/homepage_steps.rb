home_page = Homepage.new

Given(/^open the homepage$/) do
  home_page.verify_homepage
end
