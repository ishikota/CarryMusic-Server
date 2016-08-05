class Video < ActiveRecord::Base
  validates :video_id, presence: true
  validates :title, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :file_size, numericality: { greater_than: 0 }
  validate :upload_date, :valid_date?

  def valid_date?
    date = upload_date_before_type_cast
    unless date.size != 8
      errors.add(:upload_date, "passed date is not 8 chars")
    end
    begin
      Date.parse(date)
    rescue
      errors.add(:upload_date, "invalid date is passed")
    end
  end
end