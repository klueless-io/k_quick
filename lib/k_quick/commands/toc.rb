# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

require 'tty-config'
require 'tty-prompt'

module KQuick
  module Commands
    # Table of contents command
    class Toc < KQuick::Command
      def initialize(options)
        @options = options
      end

      # Execute  command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @command
          when :cmdlet_run
            require_relative 'cmdlet_run'
            cmd = KQuick::Commands::CmdletRun.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :exit
            break
          else
            @command = gui
          end
          
        end
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          { value: 'cmdlet_run', name: 'Cmdlet Run' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          command = prompt.select('Select your command?', choices, per_page: 15, filter: true, cycle: true)

          command.to_sym
        rescue KQuick::ExitApp
          puts
          puts
          prompt.warn 'exiting....'
          puts
          :exit
        end

      end
    end
  end
end
