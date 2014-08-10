require 'scenario_context/scenario_proxy'

# A class that holds useful debug information from a Scenario or Scenario
# Outline
class ScenarioContext
  # @!attribute [r] scenario
  #   @return [Scenario,ExampleRow]
  attr_reader :scenario

  def initialize(scenario)
    @scenario = ScenarioProxy.new(scenario)
  end

  # Sets @scenario as the scenario/outline wrapped in a proxy object
  #
  # @param [Scenario,ExampleRow,ScenarioProxy] scenario the scenario to
  #   set @scenario to
  # @return [ScenarioProxy] a scenario proxy object that holds the scenario or
  #   scenario outline
  def scenario=(scenario)
    @scenario =
      if scenario.is_a?(ScenarioProxy)
        scenario
      else
        ScenarioProxy.new(scenario)
      end
  end

  # @return [Boolean] true if the method is available or whether @scenario
  #   responds to the method
  def respond_to_missing?(method_name, include_private = false)
    super || scenario.respond_to?(method_name, include_private)
  end

  private

  # @raise [NoMethodError] if @scenario could not respond to the missing
  #   method
  # @return the return value of the method after sending it to @scenario
  def method_missing(method_name, *args, &block)
    if scenario.respond_to?(method_name)
      scenario.send(method_name, *args, &block)
    elsif original_scenario
      original_scenario.send(method_name, *args, &block)
    else
      super
    end
  end

  # @return the native ExampleRow or Scenario object
  def original_scenario
    scenario.scenario
  end
end
