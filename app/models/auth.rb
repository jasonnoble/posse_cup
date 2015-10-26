module Auth
  def self.admins
    {"U04TJHSHZ" => "Rebecca", "U03GQCTPX" => "Jason", "U03GR2VRX" => "Wendy"}
  end

  def self.admin_uid?(uid)
    admins.keys.include?(uid)
  end
end
