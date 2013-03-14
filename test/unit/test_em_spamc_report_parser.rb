require_relative '../helper'

class TestEmSpamcReportParser < Test::Unit::TestCase
  def test_parsing_spam
    eventmachine do
      report = example_report('spam-003-report')
      rules = EmSpamc::ReportParser.parse(report)
      assert rules
    end
  end

  def test_parsing_zero
    eventmachine do
      report = example_report('zero-001-report')
      rules = EmSpamc::ReportParser.parse(report)
      assert rules
      assert_equal rules, []
    end
  end
end