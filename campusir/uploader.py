import json
import urllib.request
import urllib.error


def upload_artifact(endpoint, api_key, artifact_path):
    headers = {"X-API-Key": api_key, "Content-Type": "application/octet-stream"}
    with open(artifact_path, "rb") as f:
        data = f.read()
    req = urllib.request.Request(endpoint, data=data, headers=headers, method="POST")
    try:
        resp = urllib.request.urlopen(req)
        return resp.status, resp.read()
    except urllib.error.HTTPError as e:
        return e.code, e.read()
