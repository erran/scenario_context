require 'scenario_context'

Before('@with_context') do |scenario|
  @scenario_context = ScenarioContext.new(scenario)
end

After('@with_context') do |scenario|
  remove_instance_variable(:@scenario_context) if defined?(@scenario_context)
end
