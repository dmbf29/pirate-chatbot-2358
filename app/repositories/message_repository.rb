require 'csv'
require_relative '../models/message'

class MessageRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @messages = []
    load_csv
  end

  def create(message)
    @messages << message
    save_csv
  end

  def all
    @messages
  end

  private

  def load_csv
    return unless File.exist?(@csv_file_path)

    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      @messages << Message.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[role content]
      @messages.each do |message|
        csv << [message.role, message.content]
      end
    end
  end
end
