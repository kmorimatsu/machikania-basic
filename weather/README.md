# weather
今日の日付と天気予報を音声で案内するプログラムです。Raspberry Pi Pico W と MachiKania type P (ver 1.2.3.7 以降) を使っています。  
WGET, JSONの2つのクラスライブラリーが必要です。

# Basic files
以下のBASICプログラムが含まれています。  
ENGLISH.BAS: 今日の日付と東京の天気予報と気温予報を英語で案内します。  
TOKYO.BAS: 今日の日付と東京の天気予報と気温予報を日本語で案内します。  
OSAKA.BAS: 今日の日付と大阪の天気予報と気温予報を英語で案内します。  

## Weather forecast
このソフトウェアは、accuweather.comのサービスの、5日間の天気予報を使用しています。次の2つのwebページは、accuweather.comから得たデーターをキャッシュしたものです。  
http://www.recfor.net/projects/weather/tokyo.php  
http://www.recfor.net/projects/weather/osaka.php  
そのほかの都市の天気予報を使いたい場合、別途accuweather.comのアカウントを作成して、以下の例の様なURLを用いてください。ただし、「xxxxx」は都市番号、「yyyyy」はユーザー別のトークン文字列です。  
https://dataservice.accuweather.com/forecasts/v1/daily/5day/xxxxx?apikey=yyyyy

## Licenses
.BASファイルのライセンスは、パブリックドメインです。.wavファイルのライセンスは、格納ディレクトリーの記述を参考にしてください。  
