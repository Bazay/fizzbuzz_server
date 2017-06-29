module JsonApiFormatter
  def self.call message, backtrace, options, env
    { success: false, errors: message }.to_json
  end
end
