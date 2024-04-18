# docker-mitmcomp

mitmproxyを使ってhttps/http通信の画像圧縮をします  
## 使い方
1. `git clone https://github.com/minetaro12/docker-mitmcomp`  
2. `docker-compose up -d`  
3. FoxyProxy等のブラウザ拡張機能を使用してプロキシを設定する（Android端末の場合はKiwBrowserが拡張機能を使える）  
4. http://mitm.it にアクセスしCA証明書をインストールする  

ポートを変更する場合はdocker-compose.yml内の`ports: 8000:8000`を`ports: 9000:8000`等に書き換えてください  
https通信を覗けるので必ず自分専用に使用してください  
認証をかけていないので必ずVPN内などで使用し、外部からアクセス可能にしないでください

Thanks: https://qiita.com/tongari0/items/ffa3297630547c3bb712
