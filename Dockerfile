FROM ubuntu:20.04

WORKDIR /mitmcomp

RUN apt update

#python3-pipのインストール
RUN apt install -y python3-pip

#pillowとmitmdumpをインストール
RUN pip3 install pillow mitmdump

#画像圧縮スクリプトのコピー
COPY flows.py .

CMD mitmdump --listen-port 8000 --ssl-insecure -s flows.py --set stream_large_bodies=10m --set block_global=false --set flow_detail=1 --set http2=false --showhost --rawtcp