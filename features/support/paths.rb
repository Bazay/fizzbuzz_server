module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to page_name, params = ''
    path = case page_name
    when /home/
      '/'

      # the following are examples using path_to_pickle
    when /^#{capture_model}(?:'s)? page$/                           # eg. the forum's page
      path_to_pickle $1
    when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/   # eg. the forum's post's page
      path_to_pickle $1, $2
    when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/  # eg. the forum's post's comments page
      path_to_pickle $1, $2, :extra => $3                           #  or the forum's post's edit page
    when /^#{capture_model}(?:'s)? (.+?) page$/                     # eg. the forum's posts page
      path_to_pickle $1, :extra => $2                               #  or the forum's edit page

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end

    # Add params
    add_params_to_path path, convert_string_to_hash(params)
  end

  def convert_string_to_hash string
    {}.tap { |hash| string.split(', ').each { |string_part| string_part.split(': ').tap { |k_v_pair| hash[k_v_pair[0]] = k_v_pair[1] } } }
  end

  def add_params_to_path path, params
    "#{path}?#{params.to_query}"
  end
end

World(NavigationHelpers)
