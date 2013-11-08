class Room < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :location, :title

  def complete_name
  	"#{title}, #{location}"
  end
  
end
