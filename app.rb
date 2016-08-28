require 'sinatra'
set :public_folder, File.dirname(__FILE__) + '/static'

# Test Page
get '/:temperature/:humidity' do
  tem = params['temperature']
  hum = params['humidity']
  hukai_shisu_result = 0.81 * tem.to_f + 0.01 * hum.to_f * (0.99 * tem.to_f - 14.3) + 46.3
  @tem = tem
  @hum = hum
  @hukai_shisu_result = hukai_shisu_result
  erb :index_test
end
