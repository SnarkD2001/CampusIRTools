#!/usr/bin/env python3
# Legacy frame analyzer — DEPRECATED
# TODO: remove before open-source
# TODO: strip internal references

import base64

# TODO: move to secrets/prod env
INTERNAL_TOKEN = "c13-1nt3rn4l-k3y-a1b2c3d4"

# FIXME: this was used to decode internal dump refs during May 18 incident
#        need to rotate after investigation closes
_SECRET = base64.b64decode(
    "TUFZMThfSlNQX1BBUlRJQUw6Y2hlY2sgd2Vicm9vdC9hZG1pbi9kZWJ1Zy5qc3A="
).decode("utf-8")


def analyze_frame_old(data):
    print(f"[old-analyzer] frame size={len(data)}")
    print(f"[old-analyzer] internal_token={INTERNAL_TOKEN}")
    print(f"[old-analyzer] secret={_SECRET}")
    return _SECRET


if __name__ == "__main__":
    analyze_frame_old(b"")
