class AgeValidator < ActiveModel::Validator
	def validate(rec)
		if(rec.age < 19 or rec.age > 51)
			rec.errors[:base] << "Age out of range"
		end
	end
end
class User< ActiveRecord::Base
	before_validation :ensure_age_has_value
	before_save :capital
	validates :card_number, :presence => true, :if => :paid_with_card? 
    	validates_with AgeValidator, :fields => [:age]
	validates_uniqueness_of :email_id, :allow_blank => false
        validates :email_id, :confirmation => true
        validates :email_id_confirmation, :presence => true
	validate :phone_number
	validates_format_of :email_id, :with => /[a-zA-Z]+\w*\@{1}[a-zA-Z]+\.{1}[a-zA-Z]{2,3}/ 
	#validates :conditions, :acceptance => true
        validates :domain, :exclusion => { :in => %w(www) }
	validates :sex, :inclusion => { :in => %w(male female) }
	validates :email_id, :uniqueness => true
	validates :phone_no, :numericality => { :only_integer => true }
	
	validate :name_length
	validate :name, :length => { :maximum => 30, :too_long => "more than allowed characters", :minimum => 4, :too_short => "less than allowed characters" }
	validates :name, :presence => true
	validate :gender_valid
	def name_length
		validates_presence_of :name
		errors.add(:name, "length out of range") if(name.length>20 or name.length<5)
	end
	def gender_valid
		errors.add(:sex, "error in value enter male or female") if(sex!='male' and sex!='female')		
	end
	def phone_number		
		errors.add(:phone_no, "Enter only digits") if(!phone_no.match(/[0-9]/))
	end
	def paid_with_card?
    		payment_type == "card"
 	 end
	def ensure_age_has_value
		if age.nil?
			self.age=22 
		end
	end
	def capital
		self.name= name.upcase
	end
	def round_save
		puts 'in aound save'
	end
	
	
end

