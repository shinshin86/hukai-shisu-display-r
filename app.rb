require 'sinatra'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/static'

get'/' do
  tem_list = []
  hum_list = []
  hukai_shisu_result = []
  json_data = ""
  list_data = ""

  # Get weather data & Read a "json"
  json = File.open("Wheather data of json file is here") do |file|
    json_data = JSON.load(file)
  end
  
  $i = 0
  $num = 5
  begin
    list_data = json_data['list'][$i]
    tem_list.push(list_data['main']['temp'] - 273.15)
    hum_list.push(list_data['main']['humidity'])
    $i += 1
    hukai_shisu_result.push( 0.81 * tem_list[tem_list.count - 1].to_f + 0.01 *  tem_list[tem_list.count - 1].to_f * (0.99 * tem_list[tem_list.count - 1].to_f - 14.3) + 46.3
)
  end while $i < $num

  # push to template(erb)
  @tem_0 = tem_list[0].floor
  @hum_0 = hum_list[0].floor
  @hukai_0 = hukai_shisu_result[0].floor
  @tem_1 = tem_list[1].floor
  @hum_1 = hum_list[1].floor
  @hukai_1 = hukai_shisu_result[1].floor
  @tem_2 = tem_list[2].floor
  @hum_2 = hum_list[2].floor
  @hukai_2 = hukai_shisu_result[2].floor
  @tem_3 = tem_list[3].floor
  @hum_3 = hum_list[3].floor
  @hukai_3 = hukai_shisu_result[3].floor
  @tem_4 = tem_list[4].floor
  @hum_4 = hum_list[4].floor
  @hukai_4 = hukai_shisu_result[4].floor
  erb :index
end

get '/:temperature/:humidity' do
  tem = params['temperature']
  hum = params['humidity']
  hukai_shisu_result = 0.81 * tem.to_f + 0.01 * hum.to_f * (0.99 * tem.to_f - 14.3) + 46.3
  @tem = tem
  @hum = hum
  @hukai_shisu_result = hukai_shisu_result
  erb :index_test
end

