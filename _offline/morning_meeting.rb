class MorningMeeting < ApplicationRecord

  has_paper_trail  class_name: 'PapertrailTable'

  # default_scope { order(id: :asc) }
  
  # this is an example of a calculated field stored to the db
  # https://stackoverflow.com/questions/13261762/populating-rails-fields-based-on-calculation
  # to the top of your model and then define
  # before_save :calc_name
  #
  # def calc_name_eg
      # unless self.exit_price.blank? || self.entry_price.blank?
          # self.percent_result = ((self.exit_price - self.entry_price)/self.entry_price) * 100
          # self.dollar_result = self.exit_price - self.entry_price 
      # end
  # end
    # def calc_name
        # unless self.machine_id.blank? 
            # self.name_off = self.machine_id[0...11]
        # end
    # end
  # end this is an example of a calculated field stored to the db

  # calc dept from machine_id
  #
  # https://stackoverflow.com/questions/9661478/how-to-return-the-substring-of-a-string-between-two-strings-in-ruby
  before_save :calc_dept
  def calc_dept
    unless self.machine_id.blank? 
        stmark = "Dpt:"
        endmark = ", Col"
        self.dept = self.machine_id[/#{stmark}(.*?)#{endmark}/m, 1]
    end
  end
  


  #validates_presence_of :is_closed
  validates_presence_of :machine_id, :running
  #validates_presence_of  :name

  
  # scopes..
  
  # https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
  #   http://pmdsdata:3001/morning_meetings?closeditems=false
  # works scope :closeditems, -> (param1) { where("is_closed like ?", "#{param1}%")}
  # works, but always id sorted...    scope :closeditemsnot, -> (param1) { where.not("is_closed like ?", "#{param1}").order(id: :asc) } 
  # with sort.. scope :closeditemsnot, -> (param1) { where.not("is_closed like ?", "#{param1}").order(dept: :asc, id: :asc ) } 

  scope :priorityorder, -> (param1) { where.not("is_closed like ?", "#{param1}").order( priority: :asc, running: :asc, created_at: :desc , id: :desc ) } 

  scope :closeditemsnot, -> (param1) { where.not("is_closed like ?", "#{param1}").order( dept: :asc, created_at: :asc, id: :asc ) } 

 
  
  # works scope to show open items not yet reviewed.
  # https://stackoverflow.com/questions/11317662/rails-using-greater-than-less-than-with-a-where-statement
  #   http://pmdsdata:3001/morning_meetings?notreviewed=true
  scope :notreviewed, -> (param1) { where.not("is_closed like ?", "#{param1}").where("reviewed_mark = ?", 0 ).order(dept: :asc, created_at: :asc, id: :asc )}

  
  # Scope showing unreviewed items and priority = param1 on url.
  
  scope :notreviewedpriority, -> (param1) { where.not("is_closed like ?", "true").where("reviewed_mark = ?", 0 ).where("priority = ?", "#{param1}").order(dept: :asc, created_at: :asc, id: :asc )}

  
  
  # not used..
  # idea for date updated before today. rails scope updated_at before today
  # Model.where("created_at >= ?", Date.today)
  
  # Other notes ..
  # scope :status_open, -> (status_open) { where status: status }
  # http://aspiringwebdev.com/use-activerecord-scopes-not-class-methods-in-rails-to-avoid-errors/
  # scope where(:is_closed => 'false')
  # https://stackoverflow.com/questions/11320945/rails-scope-where-does-not-equal
  #   http://pmdsdata:3001/morning_meetings?openitems
  #   The scope body needs to be callable.  ---  scope :openitems,   where( :is_closed => "false" ) 
  # scope :openitems, where("is_closed IS ?", "false")

  
   
  # reset all reviewedmark to 0 on button press
  def self.reset_reviewed_sql
    ActiveRecord::Base.connection.execute <<-SQLQ
    update morning_meetings set reviewed_mark=0
    SQLQ
  end   
   
  def mm_nameref   
    "id##{id}; mc:#{machine_id[0...19]}"
  end
  

end
