class Homepage
  def initialize
    @homepage_name = { xpath: '//android.widget.TextView[@text="%s"]' }
  end

  def verify_homepage
    PageHelper.find(PageHelper.locator_string_format(@homepage_name, APP[:homepage_name]), wait: 3).displayed?
    PageHelper.log_info "Open the app!"
  end

end

