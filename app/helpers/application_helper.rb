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
end
