class Commands::AwardPoints < Commands::Base
  def response
    error_message || point_award
  end

  def error_message
    return unauthorized unless admin?
    return invalid_token unless token_valid?
    return invalid_amount unless amount_valid?
    return invalid_posse unless posse
    nil
  end

  def posse
    @posse ||= Posse.find_by(name: posse_name)
  end

  def posse_name
    (text.to_s.match(/to (.*$)/) || [])[1]
  end

  def amount
    text.split[1].to_i
  end

  def amount_valid?
    amount != 0
  end

  def invalid_amount
    {"json" => {
                "text" => "Sorry, that amount isn't valid. Please use format '#PC 30 points to Staff'"
               },
     "status" => 200
    }
  end

  def invalid_posse
    if posse_name.nil?
      {"json" => {"text" => "No posse name provided, please use format '30 points to Staff'."}, "status" => 200}
    else
      {"json" => {"text" => "Sorry, posse #{posse_name} could not be found"}, "status" => 200}
    end
  end

  def unauthorized
    { "json" => {"error" => "User not authorized."}, "status" => 401 }
  end

  def invalid_token
    { "json" => {"error" => "Invalid Token."}, "status" => 401 }
  end

  def point_award
    pa = posse.point_awards.new(amount: amount)
    if pa.save
      {"json" => {"status" => "success", "current_score" => posse.current_score, "text" => success_message},
          "status" => 200}
    else
      {"json" => {"status" => "failure", "errors" => pa.errors.full_messages},
          "status" => 200}
    end
  end

  def success_message
    "#{amount} points awarded to #{posse.name} posse! Current score: #{posse.current_score}."
  end
end