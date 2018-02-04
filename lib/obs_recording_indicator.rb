require "obs_recording_indicator/version"

require 'pry'
require 'file-tail'

module ObsRecordingIndicator
  def self.monitor

    puts "trying"

    # binding.pry

    log_path = 'C:\\Users\\john\\AppData\\Roaming\\obs-studio\\logs\\'
    file_name = '2018-02-04 14-09-28.txt'

    file_path = "#{log_path}#{file_name}"
    puts "READING..."

    File.open(file_path) do |log|
      log.extend(File::Tail)
      log.interval # 10
      log.backward(10)

      log.tail do |line|
        puts line
      end

    end

  end
end
