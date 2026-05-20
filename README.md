# CampusIRTools

Campus CSIRT-13 Incident Response Toolkit — signal extraction, frame analysis, and artifact upload utilities for campus network security exercises.

## Quick Start

```bash
git clone https://github.com/SnarkD2001/CampusIRTools.git
cd CampusIRTools
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m campusir.cli analyze sample_data.bin
```

## Usage

```
python -m campusir.cli analyze <input_file>
```

The `analyze` command reads binary signal data, extracts frames, and writes a hex dump to `dumps/frame_sample.hex`.

## Configuration

Copy `config/config_sample.yaml` to `config/config.yaml` and adjust settings:

```yaml
mode: "public"
upload_endpoint: "https://csirt-13.local/upload"
api_key: "your-api-key-here"
```

Supported modes:
- `public` — standard frame extraction and hex dump generation
- `internal` — additionally writes incident host reference files (responder use only)

## Project Structure

```
CampusIRTools/
├── campusir/         # Core Python package
├── config/           # Configuration templates
├── logs/             # Debug and audit logs
├── old/              # Legacy/deprecated tools
├── sample_data.bin   # Example signal data
└── requirements.txt
```

## License

Internal use — Campus CSIRT-13.

---

*For internal CSIRT-13 responders, incident host extraction references are available in internal mode only.*
