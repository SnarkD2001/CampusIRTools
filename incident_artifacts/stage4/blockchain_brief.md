# Blockchain Basics — Briefing for New Responders

## Wallet Address

A wallet address is a publicly shareable identifier, similar to an email address or bank account number. It is derived from (but cannot be reversed into) the private key.

- Anyone can look up a wallet address on a block explorer.
- Anyone can send cryptocurrency to a wallet address.
- You cannot move funds *from* an address with only the address.

## Private Key / Seed Phrase

The private key (or its human-readable form, a seed/mnemonic phrase) is the *sole* credential controlling the assets at a wallet address.

- If you lose it, you lose access permanently. There is no "forgot password" or central support.
- If someone else obtains it, they control your assets.
- **Never share your private key.** A wallet address is for receiving; a private key is for sending.

## Where Are the Coins?

Coins are not stored "in" a wallet application or on your device. They exist on the blockchain ledger. Your wallet holds the *keys that prove ownership* of those coins.

- The blockchain maintains the balance for every address.
- A wallet app reads balances from the chain and constructs transactions.
- Losing your device does not lose your coins — as long as you have your private key or seed phrase, you can restore access anywhere.

## USDT and Networks

USDT (Tether) exists on multiple blockchains: Ethereum (ERC-20), TRON (TRC-20), BNB Chain (BEP-20), Solana, and others. The same USDT token on different networks is treated as different assets.

- Sending USDT on the wrong network can result in permanent loss.
- Always specify the network when providing a receiving address.
- The EVM address `0x71C7656EC7ab88b098defB751B7401B5f6d8976F` is an Ethereum-format address, commonly used on Ethereum, BNB Chain, Polygon, and other EVM-compatible chains.

## Key Takeaway

| Concept | Can be shared? | Purpose |
|---------|---------------|---------|
| Wallet Address | Yes | Receiving funds, lookup |
| Private Key | **Never** | Sending funds, control |
| Seed Phrase | **Never** | Wallet recovery |
