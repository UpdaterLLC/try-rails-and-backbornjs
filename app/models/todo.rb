class Todo < ActiveRecord::Base
  validates_presence_of :what
  validates_presence_of :urgency
  validates_numericality_of :urgency
  validates_presence_of :priority
  validates_numericality_of :priority
end
