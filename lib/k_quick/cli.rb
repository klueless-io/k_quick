# frozen_string_literal: true

require 'thor'

module KQuick
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'k_quick version'
    def version
      require_relative 'version'
      puts 'v' + KQuick::VERSION
    end
    map %w[--version -v] => :version

    desc 'toc', 'Table of contents'
    def toc
      require_relative 'commands/toc'
      KQuick::Commands::Toc.new({}).execute
    end
    map %w[--toc] => :toc

    #
    # cmdlet_run
    #
    desc 'cmdlet_run SUBCOMMAND', 'Cmdlet Run - This is the main entry point to executing all the different cmdlet applications'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def cmdlet_run(subcommand = :gui)
      if options[:help]
        invoke :help, ['cmdlet_run']
      else
        require_relative 'commands/cmdlet_run'
        KQuick::Commands::CmdletRun.new(subcommand, options).execute
      end
    end
  end
end
