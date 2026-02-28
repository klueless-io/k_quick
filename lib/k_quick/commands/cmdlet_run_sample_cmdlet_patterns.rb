# frozen_string_literal: true

require_relative '../command'
# require 'sample_cmdlet_patterns'
# require 'sample_cmdlet_patterns/commands/toc'

require 'tty-config'
require 'tty-prompt'

module KQuick
  module Commands
    # Sample Cmdlet Patterns is a command line tool for accessing various input and out patterns that are available.
    class CmdletRunSampleCmdletPatterns < KQuick::Command
      def initialize(options)
        @options = options
      end

      # Execute CmdletRunSampleCmdletPatterns subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        SampleCmdletPatterns::Commands::Toc.new({}).execute
        :gui
      end
    end
  end
end
