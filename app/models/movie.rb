class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  mount_uploader :poster_image_url, PosterImageUrlUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  def self.title_or_director_filter(term)
    where("title LIKE :term OR director LIKE :term", term: "%#{term}%")
  end

  def self.duration_filter(duration)
    if duration == '1'
      where("runtime_in_minutes < 90")
    elsif duration == '2'
      where("runtime_in_minutes BETWEEN 90 AND 120")
    else
      where("runtime_in_minutes > 120")
    end
  end

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end