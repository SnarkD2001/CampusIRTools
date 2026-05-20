from pathlib import Path


def load_signal(path):
    data = Path(path).read_bytes()
    frames = []
    offset = 0
    while offset < len(data):
        if offset + 4 > len(data):
            break
        frame_len = int.from_bytes(data[offset : offset + 4], "big")
        offset += 4
        if frame_len == 0:
            break
        if offset + frame_len > len(data):
            break
        frames.append(data[offset : offset + frame_len])
        offset += frame_len
    return frames
