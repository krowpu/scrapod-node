# frozen_string_literal: true

module Scrapod
  module Monit
    module Status
      class Base
        CLASS_PREFIX = name.split('::')[0..-2].join('::').freeze
        CLASS_NAME_RE = /\A#{CLASS_PREFIX}::(?<type>[^:]+)\z/

        MONIT_EXE = 'monit'

        HEADER = 'The Monit daemon'
        HEADER_RE = /\A#{HEADER}/

        attr_reader :name, :type, :response

        def initialize(name)
          self.name = name
          set_type
          set_response
          check_response_header
          check_response_service_title
        end

        def metric(name)
          name = name.strip + ' '
          metric = metrics.find do |s|
            s.start_with? name
          end
          return if metric.nil?
          metric[name.length..-1].strip
        end

        def header
          @header ||= lines.first
        end

        def metrics
          @metrics ||= lines[(service_title_line + 1)..-1].map(&:strip).freeze
        end

        def service_title_line
          @service_title_line ||= lines.index { |line| line =~ expected_service_title_re }
        end

        def lines
          @lines ||= response.lines.freeze
        end

        def expected_service_title_re
          @expected_service_title_re ||= /\A#{expected_service_title}\Z/
        end

        def expected_service_title
          @expected_service_title ||= "#{type} '#{name}'"
        end

      private

        def name=(value)
          @name = value.to_s.dup.freeze
        end

        def set_type
          m = CLASS_NAME_RE.match self.class.name
          raise "Class #{self.class.name} is not under namespace #{CLASS_PREFIX}" if m.nil?
          @type = m[:type].freeze
        end

        def set_response
          @response = `#{MONIT_EXE} status #{name}`.strip.freeze
          raise "Exit status: #{$?.exitstatus}#{", response:\n#@response" unless @response&.empty?}" unless $?.success?
        end

        def check_response_header
          return if header =~ HEADER_RE
          raise %(Is executable #{MONIT_EXE} a Monit? Expected first line to have "#{HEADER}", got #{header.inspect})
        end

        def check_response_service_title
          raise %(Can not find "#{expected_service_title}" in response) if service_title_line.nil?
        end
      end
    end
  end
end
