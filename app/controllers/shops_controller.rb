require 'json'
require 'httpclient'

class ShopsController < ApplicationController
  def search
    #APIを使って検索するためのURLを作った
    api_url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['HOTPEPPER_API_KEY']}&keyword=#{params[:keyword]}&format=json"
    #api_url = api_url + '&keyword=' + params([:keyword]) #作ったURL＋ユーザーが入力したキーワードで検索する

    #HTTPSでAPIの情報を取ってくる
    #response＝APIから取ってきた情報が入ってる
    client = HTTPClient.new
    res = client.get(api_url)
    # 戻り値をjson形式で読み出し、['results']['shop']を抽出
    result = JSON.parse(res.body, symbolize_names: true)
    @results = result[:results][:shop].select{|hash| hash[:non_smoking] != "全面禁煙" }
    @user = User.find(current_user.id)

  end
end
