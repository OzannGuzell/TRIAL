class CustomTitle

  def initialize
    @tab_name = { xpath: '//android.widget.TextView[@text="%s"]' }
    @change_left_text = { xpath: '//android.widget.LinearLayout[1]/android.widget.EditText' }
    @change_right_text = { xpath: '//android.widget.LinearLayout[2]/android.widget.EditText' }
    @change_left_button = { id: 'com.hmh.api:id/left_text_button' }
    @change_right_button = { id: 'com.hmh.api:id/right_text_button' }
    @verify_left_text = { xpath: '//android.widget.TextView[1]' }
    @verify_right_text = { xpath: '//android.widget.TextView[2]'}
  end

  def go_custom_title
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:app]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:activity]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:custom_title]), wait: 3).click
  end

  def edit_textbox
    PageHelper.tab_and_send_keys(@change_left_text, 'aa')
    PageHelper.find(@change_left_button).click
    PageHelper.tab_and_send_keys(@change_right_text, 'bb')
    PageHelper.find(@change_right_button).click
  end

  def verify_textbox
    PageHelper.find(@change_left_text).text.equal? PageHelper.find(@verify_left_text).text
    PageHelper.find(@change_right_text).text.equal? PageHelper.find(@verify_right_text).text
  end

end