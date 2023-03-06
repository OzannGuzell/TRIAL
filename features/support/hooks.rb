Before do
  Global.reset_global
  driver.start_driver
end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, "").gsub(/\s+/, "_")

  if scenario.failed?
    p "FAILED ==> #{scenario.name} => #{scenario_name}"
    p scenario.exception
    p scenario.exception.message
    PageHelper.take_screenshot(scenario.name)
  else
    p "PASSED ==> #{scenario.name} => #{scenario_name}"

  end
  driver.driver_quit
end