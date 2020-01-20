# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

require 'tty-config'
require 'tty-prompt'

module KQuick
  module Commands
    # Command Name goes here
    class CmdletRun < KQuick::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym
        super(options)
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
          { value: 'sample_cmdlet_patterns', name: 'Sample Cmdlet Patterns' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          subcommand = prompt.select('Select your subcommand (ESC to Exit)?', choices, per_page: 15, filter: true, cycle: true)

          command = KQuick::Commands::CmdletRun.new(subcommand, {})
          command.execute(input: @input, output: @output)
        rescue KQuick::ExitApp
          puts
          prompt.warn 'go up one menu....'
          @subcommand = nil
        end
      end
    end
  end
end
