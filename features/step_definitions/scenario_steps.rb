Given(/^I have a scenario context$/) do
  expect(@scenario_context).to_not be_nil
end

Given(/^I have no scenario context$/) do
  expect(@scenario_context).to be_nil
end

When(/^I access the scenario proxy$/) do
  @scenario = @scenario_context.scenario
end

When(/^I do something with my (?<table_item>.*)$/) do |table_item|
  pending
end

Then(/^I should have access to the following methods$/) do |table|
  method_names = table.hashes.map { |hash| hash['method name'].to_sym }
  expect(@scenario.methods).to include(*method_names)
end

Then(/^I should not have access to a scenario proxy$/) do
  proxy_defined = defined?(@scenario_context.scenario)
  expect(!!proxy_defined).to be(false)
end

Then(/^the scenario name should be "([^"]+)"$/) do |name|
  expect(@scenario.name).to eq(name)
end
