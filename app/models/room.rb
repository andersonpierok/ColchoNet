class Room < ActiveRecord::Base
  attr_accessible :description, :location, :title

  def complete_name
  	"#{title}, #{location}"
  end
end
