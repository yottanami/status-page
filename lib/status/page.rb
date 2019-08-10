require "status/page/version"
require "status/page/storage"
require "thor"

module Status
  module Page
    class Error < StandardError; end
    class CLI < Thor

      desc "pull","Pull status of URLs and save into the data store"
      def pull
        x = Storage.new
      end

      desc "live","Query the URLs and output the status periodically on the console and save it to the data store."
      def live
      end

      desc "backup", "Backup from data store"
      def backup(path)
      end

      desc "restore", "Restore backup file to datas store"
      def restore(path)
      end

      desc "history", "Show history of gathered data"
      def history
      end

    end
  end
end
