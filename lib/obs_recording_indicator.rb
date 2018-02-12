require "obs_recording_indicator/version"

require 'net/http'
require 'pry'
require 'file-tail'

module ObsRecordingIndicator

  def self.get_current_obs_log_file
    log_path_finder = "C:/Users/john/AppData/Roaming/obs-studio/logs/*.txt"
    # file_name = '2018-02-04 15-37-46.txt'
    current_log_file = Dir.glob(log_path_finder).sort.last
  end

  def self.signal_start
    Net::HTTP.get(@alert_host, "/lcd?m0=RECORDING&b=10")
    puts "IT STARTED"
  end

  def self.signal_stop
    Net::HTTP.get(@alert_host, "/lcd?m0=OFF&b=100")
    puts "IT STOPPED"
  end

  def self.monitor
    @alert_host = "192.168.1.200"
    file_path = ObsRecordingIndicator.get_current_obs_log_file

    puts "READING #{file_path.inspect}..."

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
