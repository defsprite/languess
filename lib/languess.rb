class Languess

  def guess_language_for(username)
    raise ArgumentError.new("Please specify a username ot guess the language for.") if username.nil? || username.empty?

    "JavaScript"
  end

end
