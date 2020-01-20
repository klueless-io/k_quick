# frozen_string_literal: true

require 'k_quick/commands/cmdlet_run'

RSpec.describe KQuick::Commands::CmdletRun do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { KQuick::Commands::CmdletRun.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `cmdlet_run` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
