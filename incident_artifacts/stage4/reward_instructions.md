# Stage 4 — Reward Instructions

Congratulations on completing the CampusIRTools ARG investigation chain.

You have traced:

1. **Stage 1** — Repository forensics: discovered internal configuration and dump references via git history.
2. **Stage 2** — JSP webshell audit: identified admin/debug.jsp as a Godzilla-style encrypted payload loader.
3. **Stage 3** — Cryptojacking investigation: traced the webshell to a Monero miner with a wallet address embedded in `miner_config.json`.

## To Claim a Reward

Submit a complete attack chain summary to **csirt13-arg@campus.local** (simulated — see below for the real process) with the following:

### Required Answers

1. **Attack Chain Summary** — Describe the full flow from initial JSP upload to miner execution. Include file paths, IP addresses, and commands used.

2. **Webshell Classification** — Which JSP file is the real webshell? What type is it (Chopper/AntSword/Godzilla)? What specific code patterns support your conclusion?

3. **Wallet Information**
   - What is the attacker's wallet address?
   - What is the worker name?
   - What mining pool was used?

4. **Blockchain Knowledge**
   - Which blockchain network does the wallet address belong to?
   - Why is it safe to publish a wallet address but not a private key?
   - If you wanted to receive USDT at an EVM address, what additional information must you provide?

## Reward

The first participant to submit a complete and correct attack chain summary will receive **1 USDT** (on the network of their choice, ERC-20 or equivalent).

Submit your answers by opening an issue on this repository with the title "ARG Submission — [your handle]". The repository maintainer will verify and respond.

> **Note:** This is a teaching exercise. The wallet address in miner_config.json is not a real attacker wallet with funds at risk. The reward is a symbolic educational prize, not a blockchain treasure hunt.
