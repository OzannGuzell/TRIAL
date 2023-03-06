class PageHelper

  def self.swipe_down_until_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = find(locator, wait: 2).attribute('displayed').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        swipe_down
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end

  def self.scroll_down_until_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = find(locator, wait: 2).attribute('displayed').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        scroll_down
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end

  def self.scroll_up_until_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = find(locator, wait: 2).attribute('displayed').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        scroll_up
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end


  def self.swipe_to_between_locators(locator_start, locator_end)
    el_start = find(locator_start)
    el_end = find(locator_end)
    Appium::TouchAction.new.swipe(start_x: el_start.location.x,
                                  start_y: el_start.location.y,
                                  offset_x: el_end.location.x,
                                  offset_y: el_end.location.y,
                                  duration: 5000).perform
  end

  def self.swipe_down
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.swipe(start_x: (window_width * 0.5).to_int,
                                  start_y: (window_height * 0.8).to_int,
                                  offset_x: (window_width * 0.5).to_int,
                                  offset_y: (window_height * 0.2).to_int,
                                  duration: 5000).release.perform
  end
  def self.scroll_down
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.press({x: (window_width * 0.05).to_int, y: (window_height * 0.65).to_int})
                       .wait(5000)
                       .move_to({x: (window_width * 0.05).to_int, y: (window_height * 0.1).to_int})
                       .release
                       .perform
  end

  def self.scroll_up
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.press({x: (window_width * 0.01).to_int, y: (window_height * 0.01).to_int})
                       .wait(5000)
                       .move_to({x: (window_width * 0.01).to_int, y: (window_height * 0.01).to_int})
                       .release
                       .perform
  end

  def self.swipe_up
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.swipe(start_x: (window_width * 0.5).to_int,
                                  start_y: (window_height * 0.1).to_int,
                                  offset_x: (window_width * 0.5).to_int,
                                  offset_y: (window_height * 0.8).to_int,
                                  duration: 5000).release.perform
  end

  def self.swipe_right
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.swipe(start_x: (window_width * 0.7).to_int,
                                  start_y: (window_height * 0.15).to_int,
                                  offset_x: (window_width * 0.2).to_int,
                                  offset_y: (window_height * 0.15).to_int,
                                  duration: 5000).perform
  end
  def self.swipe_left
    window_width = window_size.width
    window_height = window_size.height
    Appium::TouchAction.new.swipe(start_x: (window_width * 0.7).to_int,
                                  start_y: (window_height * 0.15).to_int,
                                  offset_x: (window_width * 0.2).to_int,
                                  offset_y: (window_height * 0.15),
                                  duration: 5000).perform
  end

  def self.find(locator, wait: BaseConfig.wait_time)
    wait_true(timeout: wait, message: "NoSuchElementError: #{locator}") do
      find_element(locator)
    end
  end

  def self.wait_until_visible(locator, wait: BaseConfig.wait_time)
    wait_true(timeout: wait) do
      find_element(locator).attribute('visible').eql?('true')
    end
  end

  def self.click_element(locator)
    find(locator).click
  end

  def self.verify_element(locator)
    find(locator).enabled?
  end

  def self.get_element_location(locator)
    find(locator).location
  end

  def self.get_element_size(locator)
    find(locator).size
  end

  def self.accept_alert(btn_label)
    driver.execute_script('mobile: alert', { 'action': 'accept', 'buttonLabel': btn_label })
  end

  def self.element_enabled(locator, wait: BaseConfig.wait_time)
    @is_element = true
    begin
      wait_true(timeout: wait, message: "NoSuchElementError: #{locator}") do
        find_element(locator).enabled?
      end
    rescue StandardError
      @is_element = false
    end
    @is_element
  end

  def self.verify_no_element(locator, wait: BaseConfig.wait_time)
    @has_element = false
    begin
      wait_true(timeout: wait, message: "NoSuchElementError: #{locator}") do
        find_element(locator).enabled?
      end
    rescue StandardError
      @has_element = true
    end
    @has_element
  end

  def self.verify_text(locator, expected_text)
    find(locator).text.should == expected_text
  end

  def self.tab_and_send_keys(locator, key, wait: BaseConfig.wait)
    mobile_element = find(locator)
    Appium::TouchAction.new.tap(element: mobile_element, count: 1).perform
    begin
      wait_true(timeout: wait) do
        find_element(predicate: 'type == "XCUIElementTypeKeyboard"').enabled?
      end
    rescue StandardError
      Appium::TouchAction.new.tap(element: mobile_element, count: 1).perform
    end
    mobile_element.send_keys(key.to_s)
  end




  def self.long_press(locator)
    mobile_element = find(locator)
    Appium::TouchAction.new.press(element: mobile_element, count: 1).perform
=begin
    begin
      wait_true(timeout: wait) do
        #find_element(predicate: 'type == "XCUIElementTypeKeyboard"').enabled?
      end
    rescue StandardError
      Appium::TouchAction.new.press(element: mobile_element, count: 10).perform
    end
=end
  end




  def self.locator_string_format(locator, message)
    temp = Hash.new
    locator.each do |key, value|
      temp[key] = value % message
    end
    temp
  end

  def self.log_info(log)
    Logger.new($stdout).info(log)
    Allure.add_attachment(name: 'Log', source: log, type: Allure::ContentType::TXT, test_case: false)
  end

  def self.take_screenshot(file_name)
    time = Time.new
    time_day = time.strftime('%Y-%m-%d')
    time_hours = time.strftime('%H-%M-%S')
    file_path = "output/screenshots-#{time_day}"
    FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
    screenshot_name = "#{file_path}/#{file_name}-#{time_hours}.png"
    screenshot(screenshot_name)
    Allure.add_attachment(name: 'Screenshot', source: screenshot(screenshot_name.to_s), type: Allure::ContentType::PNG,
                          test_case: true)
  end

  def self.tab_and_send_keys(locator, key)
    mobile_element = find(locator)
    Appium::TouchAction.new.tap(element: mobile_element, count: 1).perform
    mobile_element.send_keys(key)
  end

  def self.scroll_to_element(locator)
    mobile_element = find(locator)
    driver.execute_script('mobile: scroll', name: mobile_element.name)
  end

  def self.today_of_week
    today = Date.today.strftime("%A")
    today_of_week = DAYS[:days_of_week][today.to_sym]
  end

  def self.scroll_right_visible_until_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = PageHelper.find(locator, wait: 3).attribute('visible').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        PageHelper.swipe_right
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end

  def self.scroll_right_until_displayed_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = PageHelper.find(locator, wait: 3).attribute('displayed').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        PageHelper.swipe_right
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end

  def self.back_until_element(locator)
    count = 10
    visible = false
    while count.positive?
      begin
        visible = find(locator, wait: 5).attribute('visible').eql?('true') ? true : raise
        count = 0
      rescue StandardError
        back
        count -= 1
      end
    end
    raise "Element not found locator: #{locator} " if count.zero? && visible == false
  end

  def self.verify_element_no_exist(locator, wait: BaseConfig.short_wait_time)
    element_is_no_exist(locator, wait: wait).should == true
  end

  def self.element_is_no_exist(locator, wait: BaseConfig.short_wait_time)
    @has_element = false
    begin
      wait_true(timeout: wait, message: "NoSuchElementError: #{locator}") do
        find_element(locator).enabled?
      end
    rescue StandardError
      @has_element = true
    end
    @has_element
  end

end