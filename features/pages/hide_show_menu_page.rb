class HideAndShow
  def initialize
    @tab_name = { xpath: '//android.widget.TextView[@text="%s"]' }
    @click_button = { xpath: '//android.widget.Button[@text="%s"]' }
    @hide1_button = { id: 'com.hmh.api:id/frag1hide' }
    @hide2_button = { id: 'com.hmh.api:id/frag2hide' }
    @text1 = { id: 'com.hmh.api:id/fragment1' }
    @text2 = {id: 'com.hmh.api:id/fragment2'}
  end

  def go_hide_show_menu
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:app]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:fragment]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:hide_and_show]), wait: 3).click
    PageHelper.find(@hide1_button).displayed?
    PageHelper.find(@hide2_button).displayed?
    PageHelper.find(@text1).displayed?
    PageHelper.find(@text2).displayed?
  end

  def click_hide_button
    PageHelper.find(@hide2_button).click
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:show]), wait: 3).displayed?
  end

  def click_show_button
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:show]), wait: 3).click
    PageHelper.find(@text2).displayed?
  end


end