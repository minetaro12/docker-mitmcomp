#!/usr/bin/env python3

import io
from PIL import Image
import mitmproxy
import mitmproxy.http


def response(flow: mitmproxy.http.HTTPFlow):
    if "image/" in flow.response.headers["Content-Type"]:
        original = io.BytesIO(flow.response.content)
        originalSize = len(flow.response.content)
        out = io.BytesIO()

        img = Image.open(original)
        img.save(out, format="webp", params={"quality": 10})
        flow.response.content = out.getvalue()
        flow.response.headers["Content-Type"] = "image/webp"
        flow.response.headers["Content-Length"] = str(len(flow.response.content))
        print(f"{flow.request.url}: {originalSize} -> {len(flow.response.content)} bytes")
