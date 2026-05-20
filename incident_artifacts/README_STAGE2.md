# Stage 2 — Web Application Investigation Brief

**Incident Ref:** MAY18_JSP_PARTIAL
**Host:** lab-b12-app02
**Service:** Apache Tomcat / JSP
**Date:** 2026-05-18

## Overview

On 2026-05-18, CSIRT-13 detected anomalous JSP file modifications on a campus Tomcat application server (lab-b12-app02). A partial webroot dump and associated service logs have been collected for analysis.

## Provided Artifacts

- **webroot_dump/** — Partial dump of the Tomcat web application directory
  - JSP pages (login, upload, error handlers, admin console)
  - Java servlet classes
- **logs/** — Service and access logs
  - Tomcat access log (2026-05-18)
  - Catalina output snippet
  - Process tree capture
  - File modification timeline

## Tasks

1. **Identify suspicious files** — Which JSP or Java files show signs of unauthorized modification or contain suspicious code patterns?
2. **Assess command execution capability** — Does any file allow remote command execution, dynamic class loading, or encrypted payload delivery?
3. **Classify the shell type** — If a webshell is present, does its communication pattern more closely resemble:
   - **Chinese Kitchen Knife (菜刀/Chopper)** — Simple parameter-based command execution
   - **AntSword (蚁剑)** — Base64-encoded parameters with custom protocol
   - **Godzilla (哥斯拉)** — AES-encrypted payloads with dynamic class loading
4. **Identify next-stage indicators** — What IPs, paths, or keywords should be used for host-level forensic follow-up?

## Notes

- Do not interact with the suspected attacker infrastructure from non-isolated environments.
- All artifacts are partial — treat as leads, not definitive evidence.
- Document all findings with file paths and line numbers.
