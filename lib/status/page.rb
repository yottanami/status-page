require "status/page/version"
require "thor"

module Status
  module Page
    class Error < StandardError; end
    class CLI < Thor

      desc "Pull status of URLs and save into the data store"
      def pull
        puts ""
      end

      desc "Query the URLs and output the status periodically on the console and save it to the data store."
      def live
      end

      desc "Backup from data store"
      def backup(path)
      end

      desc "Restore backup file to datas store"
      def restore(path)
      end

      desc "Show history of gathered data"
      def history
      end

    end
  end
end
