# docker-mitmcop

mitmproxyを使ってhttps/http通信の画像圧縮をします  
## 使い方
1.`git clone https://github.com/minetaro12/docker-mitmcomp`  
2. `docker-compose build`  
3. `docker-compose up -d`  
4. FoxyProxy等のブラウザ拡張機能を使用してプロキシを設定する（Android端末の場合はKiwBrowserが拡張機能を使える）　　

ポートを変更する場合はdocker-compose.yml内の`ports: 8000:8000`を`ports: 9000:8000`等に書き換えてください  
認証をかけていないので必ずVPN内などで使用してください

Thanks: https://qiita.com/tongari0/items/ffa3297630547c3bb712
