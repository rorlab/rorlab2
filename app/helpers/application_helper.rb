module ApplicationHelper
  STYLES = {
    regular: 'r',
    solid: 's',
    brands: 'b',
    light: 'l',
    duotone: 'd'
  }.freeze

  def fa_icon(style, fontname, text='')
    capture do 
      concat content_tag(:i, '', class: "fa#{STYLES[style]} fa-#{fontname}")
      concat content_tag(:span, ' ' + text) if text.present?
    end
  end

  def flash_messages
    capture do
      flash.each do |key, value|
        concat tag.div(data: { controller: :flash, flash_key: key,
    flash_value: value })
      end
    end
   end  
  
  def user_profile(user, options={ width: '20px', class: 'rounded-circle'})
    user.email
    # user_profile_url = user.user_profile.nil? ? Gravatar.new(user.email).image_url : user.user_profile.avatar_url(:thumb)
    # image_tag(user_profile_url, width: options[:width], class: options[:class], style: 'background-color:#eaeaea;')
  end


end
