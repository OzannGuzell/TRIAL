custom_title = CustomTitle.new

And(/^go to custom title menu$/) do
  custom_title.go_custom_title
end

When(/^changing textBox fields$/) do
  custom_title.edit_textbox
end

Then(/^user should see change textbox$/) do
  custom_title.verify_textbox
end

