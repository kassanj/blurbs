class VoterSimulation

	def initialize
		@voters = Hash.new
		@politicians = Hash.new
	end

	def menu
		loop do 
			puts "What would you like to do? Create, List, Update, or Vote?"
			answer = gets.chomp.downcase
			case answer
			when "create"
				create() 
			when "list"
				list() 
			when "update"
				update() 
			when "vote"
				vote()
				break
			end
		end
	end


	def create
		puts "What would you like to create? Politician or Person"
		answer = gets.chomp.downcase

		puts "Please enter your name:"
		name = gets.chomp
		case answer
		when "politician"
			puts "Party? Democrat or Republican"
			party = gets.chomp.downcase

			pol = Politician.new
			pol.name = name
			pol.party = party
			@politicians[name] = pol

		when "person"
			puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral"
		    politics = gets.chomp.downcase

		    per = Voter.new
		    per.name = name
		    per.politics = politics
		    @voters[name] = per
		end	
	end

   
    def list
    	puts @politicians.values
    	puts @voters.values
	end



	def update
		puts "Name?"
		name = gets.chomp.downcase
		puts "Change name? Change party? Change Politics?"
		result = gets.chomp.downcase
		if result == "name"
		change_name(name)
		elsif result == "party"
		change_party(name)
		elsif result == "politics"
		change_politics(name)
		else
		puts "Invalid entry"
		update
		end
	end

	def change_name old_name
    puts "Please enter new name"
    new_name = gets.chomp.downcase
      
    Politician.all.each do |pol|
      if old_name == pol.name.downcase
        pol.name = new_name
      end
    end

    Voter.all.each do |per|
      if old_name == per.name.downcase
        per.name = new_name
      end
    end
end


	def change_party old_name
	puts "Please enter new party"
	new_party = gets.chomp.downcase
	Politician.all.each do |pol|
	  	if old_name == pol.name.downcase
	    pol.party = new_party
	  	end
	end
end

	def change_politics old_name
	puts "Please enter new politics"
	new_politics = gets.chomp.downcase
	Voter.all.each do |per|
	  	if old_name == per.name.downcase
	    per.party = new_politics
	  	end
	end
end


	def vote 

#@rep_pol from @politicians
	#visit every voter for speech

# 90% Tea Party
# 75% Conservative 
# 50% Neutral 
# 25% Liberal 
# 10%  Socialist 

#@demo_pol from @ politicians
	#visit every voter for speech

# 90% Socialist
# 75% Liberal 
# 50% Neutral 
# 25% Conservative 
# 10% Tea Party 

	end

end


class Politician 
	attr_accessor :name, :party
	def to_s
		"politician, #{name}, #{party}"
	end
end

class Voter
	attr_accessor :name, :politics
	def to_s
		"voter, #{name}, #{politics}"
	end
end

vs = VoterSimulation.new
vs.menu




# After every stump speech
# - puts a comment from the Voter indicating whether or not he has changed his mind
# - if the Voter is also Politician, puts a comment condemning what was said in the speech


# The campaign is complete when every voter has listened to at least one stump speech.
# When the campaign is over, tally up the votes and determine the winner.
# Politicians are also Voters, but they will always vote for themselves.






