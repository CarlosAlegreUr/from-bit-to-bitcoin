# Chapter 8: Quantum Computing - The Future Threat?

*Will quantum computers break everything we just learned?*

---

Now that you understand asymmetric cryptography—the mathematical foundation of cryptocurrency wallets and secure internet communication—there's an important question we need to address:

**"Won't quantum computers break all of this?"**

This is one of the most common concerns about cryptocurrencies. Let's tackle it head-on.

## The Concern

Asymmetric cryptography relies on one-way functions—mathematical operations that are easy to compute forward but extremely hard to reverse. For example, multiplying two large prime numbers is easy, but figuring out which two primes were multiplied is extremely hard (it would take classical computers billions of years). Here's the concern: **quantum computers might be able to reverse these "one-way" functions much faster.**

## What is Quantum Computing?

Remember from Chapter 1: a classical bit is either 0 or 1—a switch that's either off or on.

A **quantum bit** (or **qubit**) is different. Due to bizarre physical phenomena at the atomic level and extreme low temperatures, a qubit can exist as **0 and 1 at the same time**. This is called **superposition**.

```
Classical bit:
[0]  or  [1]  (one state at a time)

Quantum bit (qubit):
[0 AND 1 simultaneously]  (superposition of states)
```

When you have multiple qubits in superposition, they can represent many possible combinations at once, allowing quantum computers to explore many solutions simultaneously and making certain types of calculations exponentially faster.

**Important:** Quantum computing is not magic. It doesn't make everything faster—it's very good at specific types of problems (like factoring large numbers) but not universally better at all computing tasks.

## What Breaks and What Doesn't

**What quantum computers could break:**
- RSA (relies on factoring large numbers)
- Elliptic Curve Cryptography / ECDSA (used by Bitcoin and Ethereum)
- Timeline: Experts typically estimate that quantum computers capable of breaking today's public-key cryptography are **10–20 years away**, with some putting the risk around the **2030s**, though uncertainty and disagreement remain about exact timelines.

**What stays secure:**
- Symmetric encryption like AES (just use larger keys)
- Hash functions (relatively resistant)
- Post-quantum cryptography algorithms (already exist and were standardized by NIST in **August 2024** with the release of FIPS 203, 204, and 205, covering algorithms like Kyber, Dilithium, and SPHINCS+)

## Why Cryptocurrencies Can Adapt

**Cryptocurrencies are software. Software can be updated.**

Bitcoin uses ECDSA for signatures, but there's nothing preventing a switch to quantum-resistant algorithms. The core protocol—blocks, transactions, consensus—remains the same; only the signature algorithm changes.

**Example migration:**
```
Current: Private Key → (ECDSA) → Public Key → Bitcoin Address

Future:  Private Key → (Post-quantum algorithm) → Public Key → New Bitcoin Address
```

Users would generate new quantum-resistant wallets and transfer their funds. The blockchain continues, just with new signature algorithms.

## Everyone Has This Problem

**If quantum computers break cryptocurrency encryption, they break EVERYTHING:**
- Online banking → broken
- Military communications → broken
- Government secrets → broken
- Every HTTPS website → broken

**Cryptocurrencies are not uniquely vulnerable.** They face the same quantum threat as everyone else—and they're actually MORE adaptable because crypto protocols can update via consensus, while traditional systems are notoriously slow to change.

The entire world has incentive to develop quantum-resistant cryptography BEFORE powerful quantum computers exist. And that work is already well underway.

## The Treasure Hunt: Satoshi's Bitcoin

Here's a fascinating consequence:

**Satoshi Nakamoto**, the pseudonymous creator of Bitcoin, mined between **750,000 and 1.1 million Bitcoin** in the early days (most analyses estimate around **1 million BTC**)—today worth tens of billions of dollars.

**When you spend Bitcoin, you reveal your public key on the blockchain.** Satoshi made some transactions, revealing some public keys.

If someone builds a quantum computer powerful enough to break ECDSA, they could derive private keys from those revealed public keys and steal the Bitcoin. This creates two possible outcomes:

1. Whoever breaks ECDSA first finds the "treasure" (billions of dollars in early Bitcoin)
2. The network agrees to move all those funds to a new quantum-resistant address controlled by no one

This isn't just theoretical—it creates real incentive to solve quantum threats before they arrive. With billions of dollars at stake, people take the threat seriously and will migrate in time.

---

**Key Insight:** Quantum computers pose a future threat to some cryptographic algorithms, including those used by cryptocurrencies. However, quantum-resistant algorithms already exist, and migration is possible. The entire internet faces this same challenge, creating strong incentives for timely solutions. This is a manageable transition, not a catastrophe.

Now that you understand the cryptographic tools—how to create digital IDs, prove ownership, and sign transactions—let's explore what comes next: **Can we make bits mean "money"?** In the next chapter, we'll see how bits can have the properties of money, why we need a distributed database to store them, and the fundamental challenge that makes cryptocurrencies possible: the consensus problem.
