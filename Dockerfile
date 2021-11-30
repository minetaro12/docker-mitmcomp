FROM python:3.9-alpine

#gccのインストール
RUN apk add --no-cache -t build-deps gcc g++ python3-dev musl-dev libffi-dev && \
    apk add --no-cache jpeg-dev zlib-dev libjpeg

#pillowとmitmdumpをインストール
RUN pip3 install pillow mitmdump && \
    rm -rf /root/.cache/pip/* && \
    apk del build-deps

#画像圧縮スクリプトのコピー
COPY flows.py /mitmcomp/

CMD /usr/local/bin/mitmdump --listen-port 8000 --ssl-insecure -s flows.py --set stream_large_bodies=10m --set block_global=false --set flow_detail=1 --set http2=false --showhost --rawtcp
