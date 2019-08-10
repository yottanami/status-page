require "csv"
require "pry"
require "status/page/config"

module Status
  module Page
    class Storage
      def initialize
#        file = Config::config[:file]
        pry
        #@csv = CSV.open("#{file}", "wb")
      end

      def save
      end

      def read
      end

      def backup
      end

      def restore
      end
    end
  end
end
