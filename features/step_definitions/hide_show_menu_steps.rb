hide_show = HideAndShow.new

And(/^go to hide and show menu$/) do
  hide_show.go_hide_show_menu
end

When(/^second click hide button$/) do
  hide_show.click_hide_button
end

Then(/^second click show button$/) do
  hide_show.click_show_button
end


