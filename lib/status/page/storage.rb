require "csv"
require "pry"
require "status/page/config"
require "fileutils"

module Status
  module Page
    class Storage
      def initialize
        @file_path = "./data/#{SETTING['storage_file']}"
        @csv = CSV.open(@file_path, "ab+")
      end

      def save(data)
        data.each { |row| @csv << row }
      end

      def read_all
        @csv.read(@file)
      end

      def backup(backup_path)
         FileUtils.cp(@file_path, "#{backup_path}/#{SETTING['storage_file']}.backup")
      end

      def restore(backuped_file)
        if File.file? backuped_file
          # TODO: Ask to append or replace
          FileUtils.cp("#{backuped_file}", @file_path, preserve: true)
        end
      end
    end
  end
end
