# A class that holds useful debug information from a Scenario or Scenario
# Outline
class ScenarioContext
  # A generic interface to a Scenario or ExampleRow
  ScenarioProxy = Struct.new(:scenario) do
    # @return [String] the file name colon line number representation of the
    #   scenario
    def file_colon_line
      if outline?
        scenario.file_colon_line
      else
        scenario.scenario_outline.file_colon_line
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
      return unless defined?(Cucumber::Ast::OutlineTable::ExampleRow)

      scenario.is_a?(Cucumber::Ast::OutlineTable::ExampleRow)
    end

    # @return [String] the title of the scenario or a pretty scenario "title"
    # if @scenario is an outline
    def title
      if outline?
        scenario_name = scenario.name.match(/\| (.*) \|/)[1]
        "#{outline.title}: #{scenario_name}"
      else
        scenario.title
      end
    end
  end
end
