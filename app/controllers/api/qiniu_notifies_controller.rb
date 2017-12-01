class Api::QiniuNotifiesController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    raw_data = request.body.read
    results = handle_notify_data raw_data
    render plain: results[:response_body], status: results[:status]
  end
end

def handle_notify_data data
  status = 400
  response_body = ''

  begin
    event = JSON.parse(data)
    # 根据你的逻辑处理 event
    if event['code'].present? && event['inputKey'].present?

      if event['code'] == 0
        key = event['items'][0]['key']
        Video.where(original_key: event['inputKey']).update(target_key: key)
        VideoInfoJob.perform_later key
      end
      status = 200
    else
      response_body = '无效的数据'
    end

  rescue JSON::ParserError
    response_body = 'JSON 解析失败'
  end
  {response_body: response_body, status: status}
end

