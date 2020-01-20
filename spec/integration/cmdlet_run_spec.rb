# frozen_string_literal: true

RSpec.describe '`k_quick cmdlet_run` command', type: :cli do
  it 'executes `k_quick help cmdlet_run` command successfully' do
    output = `k_quick help cmdlet_run`

=begin
Usage:
  k_quick cmdlet_run SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Cmdlet Run - This is the main entry point to executing all the different cmdlet applications
=end

    expect(output).to include('k_quick cmdlet_run ')
    expect(output).to include('--help')
  end
end
