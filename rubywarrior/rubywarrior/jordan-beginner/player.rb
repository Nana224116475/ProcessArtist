class Player
  def play_turn(warrior)
  	@warrior = warrior


  	if should_attack?
  		@warrior.attack!
   	elsif need_rest
  		@warrior.rest!
  	end
  end

  def should_walk?
  	space? && !need_rest? || being_attacked?
  end

  def should_rest?
  	space? && need_rest? || ! being_attacked?
  end

  def should_attack?
  	 !space? && being_attacked?
  end

    
  def rest_or_walk
  	if need_rest? 
  		@warrior.rest!
  	else
  		@warrior.walk!
  	end
  end

  def space?
  	@warrior.feel.empty?
  end

  def need_rest?
  	@warrior.health <=10
  end

  def being_attacked?
  	if @warrior.health < @last_turn_hps.to_i
  		being_attacked = true
  	else
  		being_attacked = false
  	end
  	@last_turn_hps = @warrior.health
  	return being_attacked
  
  end
end
