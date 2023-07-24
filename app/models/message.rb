class Message < ApplicationRecord

  validates :content, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end

  belongs_to :room
  belongs_to :user
  has_one_attached :image

  private

  def message_parfams
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
