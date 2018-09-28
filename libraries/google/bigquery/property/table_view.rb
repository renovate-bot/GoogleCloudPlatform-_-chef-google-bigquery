# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

module Google
  module Bigquery
    module Data
      # A class to manage data for View for table.
      class TableView
        include Comparable

        attr_reader :use_legacy_sql
        attr_reader :user_defined_function_resources

        def to_json(_arg = nil)
          {
            'useLegacySql' => use_legacy_sql,
            'userDefinedFunctionResources' => user_defined_function_resources
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            use_legacy_sql: use_legacy_sql.to_s,
            user_defined_function_resources: ['[',
                                              user_defined_function_resources.map(&:to_json).join(', '),
                                              ']'].join(' ')
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? TableView
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? TableView
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: use_legacy_sql, other: other.use_legacy_sql },
            { self: user_defined_function_resources, other: other.user_defined_function_resources }
          ]
        end
      end

      # Manages a TableView nested object
      # Data is coming from the GCP API
      class TableViewApi < TableView
        def initialize(args)
          @use_legacy_sql = Google::Bigquery::Property::Boolean.api_parse(args['useLegacySql'])
          @user_defined_function_resources =
            Google::Bigquery::Property::TableUserDefinedFunctionResourcesArray.api_parse(
              args['userDefinedFunctionResources']
            )
        end
      end

      # Manages a TableView nested object
      # Data is coming from the Chef catalog
      class TableViewCatalog < TableView
        def initialize(args)
          @use_legacy_sql = Google::Bigquery::Property::Boolean.catalog_parse(args[:use_legacy_sql])
          @user_defined_function_resources =
            Google::Bigquery::Property::TableUserDefinedFunctionResourcesArray.catalog_parse(
              args[:user_defined_function_resources]
            )
        end
      end
    end

    module Property
      # A class to manage input to View for table.
      class TableView
        def self.coerce
          ->(x) { ::Google::Bigquery::Property::TableView.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableView
          Data::TableViewCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::TableView
          Data::TableViewApi.new(value)
        end
      end
    end
  end
end
