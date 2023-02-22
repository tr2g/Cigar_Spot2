require 'json'
require 'httpclient'

class ShopsController < ApplicationController
  def search
    #APIを使って検索するためのURLを作った
    api_url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['HOTPEPPER_API_KEY']}&keyword=#{params[:keyword]}&large_service_area=&format=json"
    #api_url = api_url + '&keyword=' + params([:keyword]) #作ったURL＋ユーザーが入力したキーワードで検索する

    #HTTPSでAPIの情報を取ってくる
    #res＝APIから取ってきた情報が入ってる
    client = HTTPClient.new
    res = client.get(api_url)
    # 戻り値をjson形式でbodyを読み出し、文字列をシンボルに変換する
    result = JSON.parse(res.body, symbolize_names: true)
    #シンボルになってるところはAPIのクエリ.select{non_smokingフィールドが全面禁煙でない:shopをハッシュで取り出す}
    @results = result[:results][:shop].select{|hash| hash[:non_smoking] != "全面禁煙" }
    @user = User.find(current_user.id)

  end

  def show
    
  end

end
