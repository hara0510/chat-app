class Message < ApplicationRecord

  validates :content, presence: true

  belongs_to :room
  belongs_to :user
  has_one_attached :image

  private

  def message_parfams
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
