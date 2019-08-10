require "time"

module Status
  module Page
    module Providers
      class Statuspage

        def status(url)
          status = []
          url = url + 'status.json'
          response = get_json(url)
          status << response["page"]["name"]

          if response["status"]["indicator"] == "none"
            status << "Up"
          else
            status << "Down"
          end

          status << date_format(response["page"]["updated_at"])
          status << response["status"]["description"]
          return status
        end

        private

        def get_json(url)
          uri = URI(url)
          response = Net::HTTP.get(uri)
          JSON.parse(response)
        end

        def date_format(date)
          Time.parse(date).strftime("%d-%m-%Y %T")
        end
      end
    end
  end
end
