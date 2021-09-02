FROM python:3.9-slim

#gccのインストール
RUN apt update && apt install -y gcc && apt clean && rm -rf /var/lib/apt/lists/*

#pillowとmitmdumpをインストール
RUN pip3 install pillow mitmdump && rm -rf /root/.cache/pip/*

#画像圧縮スクリプトのコピー
COPY flows.py /mitmcomp/

CMD /usr/local/bin/mitmdump --listen-port 8000 --ssl-insecure -s flows.py --set stream_large_bodies=10m --set block_global=false --set flow_detail=1 --set http2=false --showhost --rawtcp
