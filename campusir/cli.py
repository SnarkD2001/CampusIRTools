import click
from pathlib import Path
from .config import load_config


@click.group()
def main():
    pass


@main.command()
@click.argument("input_file", type=click.Path(exists=True))
@click.option("--config", "-c", default="config/config.yaml", help="Config file path")
def analyze(input_file, config):
    """Analyze signal data from INPUT_FILE."""
    cfg = load_config(config)
    mode = cfg.get("mode", "public")
    dumps_dir = Path(cfg.get("dumps_dir", "./dumps"))
    dumps_dir.mkdir(parents=True, exist_ok=True)

    data = Path(input_file).read_bytes()

    frame_hex = data.hex()
    frame_path = dumps_dir / "frame_sample.hex"
    frame_path.write_text(frame_hex)
    click.echo(f"[+] Frame hex dump written to {frame_path}")

    if mode == "internal":
        secrets_dir = Path(cfg.get("secrets_dir", "./secrets"))
        secrets_dir.mkdir(parents=True, exist_ok=True)
        ref_path = secrets_dir / "incident_host_ref.txt"
        ref_path.write_text(
            "host: lab-b12-app02\n"
            "svc: tomcat\n"
            "dump_ref: MAY18_JSP_PARTIAL\n"
            "note: check modified webroot files\n"
        )
        click.echo(f"[+] Internal incident host ref written to {ref_path}")


if __name__ == "__main__":
    main()
