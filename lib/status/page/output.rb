require 'tabulate'

module Status
  module Page

    class Output
      # Create a report table for command line
      def table(source)
        labels = ['Service', 'Status', 'Time']
        source = source.transpose[0..2].transpose  if source.count > 2
        puts tabulate(labels, source, :indent => 4, :style => 'legacy')
      end

      def detail_table(source)
        labels = ['Service', 'Status', 'Update Time', 'Request Time', 'Status Details']
        puts tabulate(labels, source, :indent => 4, :style => 'legacy')
      end
    end
  end
end
