import struct


def parse_frame_header(data):
    if len(data) < 8:
        return None
    magic = data[:4]
    payload_len = struct.unpack(">I", data[4:8])[0]
    payload = data[8 : 8 + payload_len] if payload_len > 0 else b""
    return {"magic": magic, "payload_len": payload_len, "payload": payload}
