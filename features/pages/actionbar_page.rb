class ActionBar
  def initialize
    @tab_name = { xpath: '//android.widget.TextView[@text="%s"]' }
    @click_button = { xpath: '//android.widget.Button[@text="%s"]' }
  end

  def go_action_bar_tab
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:app]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:action_bar]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:action_bar_tabs]), wait: 3).click
  end

  def click_toggle_tab
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:toggle_tab_mode]), wait: 3).click
    PageHelper.verify_element_no_exist(PageHelper.locator_string_format(@tab_name,APP[:action_bar_tab_name]))
  end

  def click_add_new_tab
    3.times do
      PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:add_new_tab]), wait: 3).click
    end
    PageHelper.find(PageHelper.locator_string_format(@tab_name, APP[:tab0]), wait: 3).displayed?
    PageHelper.find(PageHelper.locator_string_format(@tab_name, APP[:tab1]), wait: 3).displayed?
    PageHelper.find(PageHelper.locator_string_format(@tab_name, APP[:tab2]), wait: 3).displayed?
  end

  def remove_last_tab
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:remove_last_tab]), wait: 3).click
    PageHelper.verify_element_no_exist(PageHelper.locator_string_format(@tab_name,APP[:tab2]))
  end

  def remove_all_tabs
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:remove_all_tabs]), wait: 3).click
    PageHelper.verify_element_no_exist(PageHelper.locator_string_format(@tab_name,APP[:tab0]))
  end


end