import yaml
from pathlib import Path


def load_config(config_path="config/config.yaml"):
    path = Path(config_path)
    if not path.exists():
        alt = Path("config/config_sample.yaml")
        if alt.exists():
            path = alt
        else:
            return {"mode": "public", "dumps_dir": "./dumps"}
    with open(path) as f:
        return yaml.safe_load(f)
