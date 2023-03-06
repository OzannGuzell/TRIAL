context_menu = ContextMenu.new

And(/^go to context menu$/) do
  context_menu.go_list_context_menu
end

When(/^click long press me button$/) do
  context_menu.click_long_press_button
end

Then(/^user should see Menu A and Menu B$/) do
  context_menu.verify_menu
end

