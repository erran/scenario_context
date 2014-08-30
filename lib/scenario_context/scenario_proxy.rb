# A class that holds useful debug information from a Scenario or Scenario
# Outline
class ScenarioContext
  # A generic interface to a Scenario or ScenarioOutlineExample
  class ScenarioProxy
    attr_reader :scenario

    def initialize(scenario)
      @scenario = scenario
    end

    # @return [String] the file name colon line number representation of the
    #   scenario
    def file_colon_line
      if outline?
        scenario.file_colon_line
      else
        scenario.scenario_outline.file_colon_line
      end
    end

    # @return [String] the name of the scenario or outline
    def name
      if outline?
        scenario.name
      else
        scenario.name
      end
    end

    # @raise [NotImplementedError] unless the scenario is an outline
    # @return [Boolean] scenario.scenario_outline if the scenario is an outline
    def outline
      unless outline?
        fail(
          NotImplementedError,
          'ScenarioContext#outline is only available for scenario outlines.'
        )
      end

      scenario.scenario_outline
    end

    # @return [Boolean] whether @scenario is an outline (ExampleRow) or a not
    def outline?
      return unless defined?(Cucumber::Mappings::ScenarioOutlineExample)

      scenario.is_a?(Cucumber::Mappings::ScenarioOutlineExample)
    end
  end
end
