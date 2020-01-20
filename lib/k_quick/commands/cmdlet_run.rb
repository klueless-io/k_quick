# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module KQuick
  module Commands
    # Command Name goes here
    class CmdletRun < KQuick::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute CmdletRun command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :sample_cmdlet_patterns
            require_relative 'cmdlet_run_sample_cmdlet_patterns'
            subcmd = KQuick::Commands::CmdletRunSampleCmdletPatterns.new({})
          else
            break
          end
          @subcommand = subcmd&.execute(input: input, output: output)
        end
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          'sample_cmdlet_patterns',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = KQuick::Commands::CmdletRun.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
