require "obs_recording_indicator/version"

require 'pry'
require 'file-tail'

module ObsRecordingIndicator

  def self.get_current_obs_log_file
    log_path = 'C:\\Users\\john\\AppData\\Roaming\\obs-studio\\logs\\'
    file_name = '2018-02-04 15-37-46.txt'
    "#{log_path}#{file_name}"
  end

  def self.signal_start
    puts "IT STARTED"
  end

  def self.signal_stop
    puts "IT STOPPED"
  end

  def self.monitor
    file_path = ObsRecordingIndicator.get_current_obs_log_file

    puts "READING..."

    File.open(file_path) do |log|
      log.extend(File::Tail)
      log.max_interval = 1
      log.interval # 10
      log.backward(0)

      log.tail do |line|
        time_stamp_sig = '\d{2}:\d{2}:\d{2}\.\d{3}: ' # a signature
        start_sig = '==== Recording Start =+'
        stop_sig = '==== Recording Stop =+'

        if line =~ /#{time_stamp_sig}#{start_sig}/
          signal_start
        elsif line =~ /#{time_stamp_sig}#{stop_sig}/
          signal_stop
        end
      end
    end

  end
end
