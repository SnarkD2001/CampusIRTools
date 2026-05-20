# Internal Notes — Do Not Commit

## May 18 Incident — lab-b12-app02

- Tomcat server at lab-b12-app02 showed unusual JSP modification timestamps
- webroot dump taken: see dump_ref MAY18_JSP_PARTIAL
- Key files of interest:
  - /webroot/admin/debug.jsp (created/modified around 2026-05-18 03:12 UTC)
  - /webroot/assets/error.jsp (known pattern, possible decoy)
- Internal config pushed to config_internal.yaml — REMOVE BEFORE PUBLIC RELEASE
- Upload endpoint uses internal PKI, not the public API gateway

## Creds (rotate after incident)

- Internal API key: c13-1nt3rn4l-k3y-a1b2c3d4
- Session token example: c13-sess-9a8b7c6d5e

## Extraction ref

Extraction command used:
```
python -m campusir.cli analyze sample_data.bin --config config/config_internal.yaml
```
