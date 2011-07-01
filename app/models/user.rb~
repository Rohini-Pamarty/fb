class User< ActiveRecord::Base
	validate :name_length
	validate :gender_valid
	validates_uniqueness_of :email_id, :allow_blank => false
	validate :phone_number
	validates_format_of :email_id, :with => /[a-zA-Z]+\w*\@{1}[a-zA-Z]+\.{1}[a-zA-Z]{2,3}/
	validate :date_of_birth
	def date_of_birth
		validates_format_of :birthday, :with => /[\d]+[\/]*[\.]*/
	end
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
	
	
	
	
end
