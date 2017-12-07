module ApplicationHelper
  def page_name
    original_page_name = "#{params[:controller]}-page".gsub('/', '-')
    dashed_page_name = original_page_name.gsub('_', '-')

    [original_page_name, dashed_page_name, params[:action]].join(' ')
  end


  def ctime_ago_in_words(time_str)
    time = time_str.to_time + (-Time.zone_offset(Time.now.zone))
    "happened #{time_ago_in_words(time)} ago"
  end

  def background_img_tag(url_key, options = {})
    tag_options = options
    if options[:class].present?
      tag_options[:class] = "background-img-tag #{options[:class]}"
    else
      tag_options[:class] = 'background-img-tag'
    end

    url = nil
    if url_key.present?
      url = cdn_img(url_key, options[:size] || options[:width])
    elsif options[:placeholder_img].present?
      url = asset_path(options[:placeholder_img])
      tag_options[:class] = "#{tag_options[:class]} placeholder-img"
    else
      tag_options[:class] = "#{tag_options[:class]} placeholder"
    end
    styles = {}
    styles['background-image'] = "url(#{url})" if url.present?
    if options[:size].present?
      styles['width'] = "#{options[:size]}px"
      styles['height'] = "#{options[:size]}px"
    end

    if options[:width].present? && options[:height].present?
      styles['width'] = "#{options[:width]}px"
      styles['height'] = "#{options[:height]}px"
    end

    tag_options = tag_options.merge({style: styles.map { |k, v| "#{k}:#{v}" }.join(';')}) unless styles.empty?
    content_tag(:span, '', tag_options)
  end

  def cdn_img(key, size = 100)
    image_size_config = case size
                          when 0..100
                            APP_CONFIG['qiniu']['preview_size']
                          when 101..200
                            APP_CONFIG['qiniu']['preview_md_size']
                          when 201..600
                            APP_CONFIG['qiniu']['preview_lg_size']
                          else
                            ''
                        end
    "#{APP_CONFIG['qiniu']['base_url']}#{key}#{image_size_config}"
  end
end
