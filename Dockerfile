FROM mitmproxy/mitmproxy:latest

#依存関係のインストール
RUN pip3 install pillow && \
    rm -rf /root/.cache/pip/*

#画像圧縮スクリプトのコピー
# COPY flows.py /

ENTRYPOINT /usr/local/bin/mitmdump --listen-port 8000 --ssl-insecure -s /flows.py
