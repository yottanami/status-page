require 'net/http'
require 'json'
require 'status/page/providers/statuspage'
require 'rufus-scheduler'

module Status
  module Page
    class Service
      def initialize
        @services = SETTING['services']
        @statuspage_provider = Status::Page::Providers::Statuspage.new
      end

      def pull
        statuses = []

        @services.each do |service|
          if service["provider"] == 'statuspage'
            statuses << @statuspage_provider.status(service["url"])

          else
            # Note: Different providers should add here
            raise "Unknown Server provider form #{service["name"]}"
          end
        end

        statuses
      end

    end
  end
end
