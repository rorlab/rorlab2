module ApplicationHelper
  STYLES = {
    regular: 'r',
    solid: 's',
    brands: 'b',
    light: 'l',
    duotone: 'd'
  }.freeze

  def fa_icon(style, fontname, opts = {} )
    opts.reverse_merge(size: '1x', text: '')
    capture do
      concat content_tag(:i, '', class: "fa#{STYLES[style]} fa-#{fontname} fa-#{opts[:size]}")
      concat content_tag(:span, ' ' + opts[:text]) if opts[:text].present?
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

  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}", opts
  end

  def markdown(text)
    Kramdown::Document.new(text, {
      input: 'GFM',
      syntax_highlighter_opts: {
        line_numbers: true
      }
    }).to_html
  end

end
