list_dialog = ListDialog.new

And(/^go to list dialog menu$/) do
  list_dialog.go_list_dialog_menu
end

When(/^select random command$/) do
  list_dialog.select_random_command
end

Then(/^verify select command$/) do
  list_dialog.verify_select_command
end

