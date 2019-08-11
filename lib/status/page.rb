require "status/page/version"
require "status/page/storage"
require "status/page/service"
require "thor"
require "byebug"

module Status
  module Page
    class Error < StandardError; end
    class CLI < Thor

      desc "pull","Pull status of URLs and save into the data store"
      def pull
        service_handler = Service.new
        statuses = service_handler.pull
        storage = Storage.new
        storage.save(statuses)
      end

      desc "live","Query the URLs and output the status periodically on the console and save it to the data store."
      def live
        service_handler = Service.new
        statuses = service_handler.pull
        storage = Storage.new

        # It could work without any gem, but I think
        # using refuse-scheduler make it more reliable.
        scheduler = Rufus::Scheduler.new
        scheduler.every SETTING["update_interval"] do
          statuses = []
          statuses = service_handler.pull
          storage.save(statuses)
        end

        scheduler.join
      end

      desc "backup", "Backup from data store"
      def backup(backup_path)
        storage_engine = Storage.new
        storage_engine.backup(backup_path)
      end

      desc "restore", "Restore backup file to datas store"
      def restore(backuped_file)
        storage_engine = Storage.new
        storage_engine.restore(backuped_file)
      end

      desc "history", "Show history of gathered data"
      def history
      end

    end
  end
end
