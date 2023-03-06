action_bar = ActionBar.new

And(/^go to action bar tab$/) do
  action_bar.go_action_bar_tab
end

And(/^clicks toggle tab mode$/) do
  action_bar.click_toggle_tab
end

And(/^click add new tab$/) do
  action_bar.click_add_new_tab
end

When(/^remove last tab$/) do
  action_bar.remove_last_tab
end

Then(/^remove all tabs$/) do
  action_bar.remove_all_tabs
end



