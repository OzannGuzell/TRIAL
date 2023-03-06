class ListDialog

  def initialize
    $random = rand(1..3)
    @tab_name = { xpath: '//android.widget.TextView[@text="%s"]' }
    @select_command = { xpath: "//android.widget.ListView/android.widget.TextView[#{$random}]" }
    @click_button = { xpath: '//android.widget.Button[@text="%s"]' }
    @verify_dialog = { xpath: "//android.widget.TextView[@text='You selected:' #{$random - 1} , '%s']" }
  end

  def go_list_dialog_menu
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:app]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@tab_name, TABS[:tabs_name][:alert_dialog]), wait: 3).click
    PageHelper.find(PageHelper.locator_string_format(@click_button, BUTTONS[:button_name][:list_dialog]), wait: 3).click
  end

  def select_random_command
    $SELECT_COMMAND = PageHelper.find(@select_command).text
    PageHelper.find(@select_command).click

  end

  def verify_select_command
    PageHelper.log_info "You selected #{$random - 1},#{$SELECT_COMMAND}"
    PageHelper.find(PageHelper.locator_string_format(@verify_dialog,$SELECT_COMMAND),wait: 3)
    PageHelper.find(@verify_dialog).displayed?
  end

end