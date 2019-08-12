module ApplicationHelper
  def user_profile(user, options={ width: '20px', class: 'rounded-circle'})
    user.email
    # user_profile_url = user.user_profile.nil? ? Gravatar.new(user.email).image_url : user.user_profile.avatar_url(:thumb)
    # image_tag(user_profile_url, width: options[:width], class: options[:class], style: 'background-color:#eaeaea;')
  end
end
