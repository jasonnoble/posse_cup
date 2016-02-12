module Auth
  def self.admins
    {"U09KLV99Q" => "Tim", "U03GQCTPX" => "Jason", "U03GR2VRX" => "Wendy", "U03H0F6MQ" => "Anthony"}
  end

  def self.mentors
    {
      "U03H0JF1U" => "Bill LeBorgne",
      "U0543KB8B" => "Kaitlin Barrer",
      "U0543K2QF" => "Paul Stone",
      "U04CYRK0Z" => "Peter Ko",
      "U03H0KKLQ" => "Piper Niehaus",
      "U03H0M9KW" => "Ryan Spittler",
      "U04TJL3MM" => "Andy Lampert",
      "U09HDK8TY" => "John Williams",
      "U0AS65ZSP" => "Aaron Glasenapp",
      "U04TJHSHZ" => "Rebecca Jackson"
    }
  end

  def self.admin_uid?(uid)
    admins.keys.include?(uid)
  end

  def self.mentor_uid?(uid)
    mentors.keys.include?(uid)
  end
end
