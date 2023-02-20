require 'json'
require 'net/https'
require 'httpclient'

class ShopsController < ApplicationController
  def search
    #APIを使って検索するためのURLを作った
    api_url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['HOTPEPPER_API_KEY']}&keyword=params([:keyword])"
    #api_url = api_url + '&keyword=' + params([:keyword]) 作ったURL＋ユーザーが入力したキーワードで検索する

    #HTTPSでAPIの情報を取ってくる
    #response＝APIから取ってきた情報が入ってる
    client = HTTPClient.new
    response = client.get(api_url)
    # 戻り値をjson形式で読み出し、['results']['shop']を抽出
    result = JSON.loads(responce.text)['results']['shop']

  # ループ処理,ここで「全面禁煙」を省く
  # for shop in response
  #   #shopモデルに必要項目を設定する
  #   shop.XXX = i.xxxx
  # end
  end
end
