class ContextMenu
  def initialize
    @tab_name = { xpath: '//android.widget.TextView[@text="%s"]' }
    @click_button = { xpath: '//android.widget.Button[@text="%s"]' }
    @long_press_button = { id: 'com.hmh.api:id/long_press' }
  end

  def go_list_context_menu
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:app]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:fragment]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:context_menu]), wait: 3).click
  end

  def click_long_press_button
    PageHelper.long_press(@long_press_button)
  end

  def verify_menu
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:menu_a])).displayed?
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:menu_b])).displayed?
  end

end