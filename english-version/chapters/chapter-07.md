# Chapter 7: Asymmetric Encryption - The Magic Trick and How They Create Crypto-Wallets

*Two keys instead of one: a public key everyone can see and a private key only you know.*

---

We've established the problem with symmetric encryption: Alice and Bob need to share a password before they can communicate securely, but sharing that password requires... a secure channel. Which requires a password. Infinite loop.

**For centuries, this seemed impossible to solve.**

Then, in the 1970s, mathematicians discovered something remarkable—a type of mathematical function with very special properties that seemed almost magical: **easy to compute in one direction, but extremely hard to reverse.**

This breakthrough is called **asymmetric encryption**, and it changed everything.

## The One-Way Function

Let's start with the core concept: a **one-way function**.

Remember from Chapter 6, we talked about functions:

```
f(x) = x + 2

If x = 3, then f(3) = 3 + 2 = 5
```

This is an easy function. If you know the output (5) and the function used to compute it, you can easily figure out the input (3). Just subtract 2, one single operation, adding 2, which has a simple inverse operation, subtracting 2.

```
Challenge:

Bob used f(x) = x + 2 to cipher a message.
The result of ciphering the message was 5.
What was the original message?

We know then that:
x + 2 = 5

Which with simple math we can solve:
x = 5 - 2
x = 3

Answer:
Output = 5
Input/Message sent = 3
```

**Reversing this function is very easy. For humans and for computers.**

But what if we had a function that was easy to compute forward (input to output) yet extremely hard to reverse (output to input)? And we don't just mean "hard" like "takes a few seconds"—we mean "hard" like **"would take all the computers on Earth billions of years to reverse."**

Does such a function exist?

**Yes**. Many of them, actually. They're the foundation of modern cryptography.

## An Example For The Curious: Multiplication of Prime Numbers

Here's an intuitive example. If you feel confused, don't worry too much:

**Easy direction: Multiply two prime numbers**

```
Take two prime numbers: 89 and 97
Multiply them: 89 × 97 = 8,633

This is easy. A computer does this instantly.
```

**Hard direction: Figure out the original prime numbers**

```
Given: 8,633
Question: Which two prime numbers multiply to give 8,633?

This is much harder. You'd have to try dividing by every prime number
until you find the original numbers.
```

Now imagine using **really, really big prime numbers**:

```
p = 32,416,190,071 (11-digit prime)
q = 32,416,187,567 (11-digit prime)

p × q = 1,050,807,929,418,200,854,057

Good luck reversing that without knowing p and q!
Even computers take long to guess and check all possible combinations.
```

**With very large primes** (for example, 617-digit primes used in 2048-bit RSA keys commonly used in many traditional systems), **figuring out the original numbers becomes essentially impossible with current technology.** Even the fastest supercomputers would take longer than the age of the universe to find such numbers.

**Important note:** Bitcoin doesn't actually use RSA or large prime factorization. Bitcoin uses **elliptic-curve cryptography (specifically secp256k1)**, which relies on 256-bit numbers (about 77 decimal digits)—a different type of one-way function based on elliptic curve mathematics rather than prime factorization. Both RSA and elliptic curve cryptography provide strong security through different mathematical problems that are easy in one direction but hard to reverse.

This asymmetry—easy to compute, hard to reverse—is the foundation of all asymmetric encryption, whether based on prime factorization (RSA) or elliptic curves (Bitcoin).

**Why prime numbers?** Because these numbers can only be divided by themselves and 1, leaving 0 as a remainder. This property is what makes the multiplication easy but the reverse operation hard. Don't worry too much about the mathematical details—if you're feeling confused about the prime number thing, take your time if you want, but this is not essential. You can just accept that there are some mathematical functions that are easy to compute one way but hard to reverse.

## The Two Keys: Public and Private

Here's where it gets brilliant.

**Step 1: Creating the keys (done locally on your computer)**

Anyone can generate a public/private key pair using widely available algorithms (like RSA, ECC, etc). The algorithms are public knowledge in the same way anyone can describe and compute the function `f(x) = x + 2`—you just need a computer to compute them quickly.

You run the computation on your computer:
```
generate_keys_computation() => (private_key, public_key)
```

The computation has that easy-only-one-way property we discussed: computing a public key from a private key (`f(Private key) -> Public key`) is the easy direction that anyone can compute, while the reverse (`f(Public key) -> Private key`) is the hard direction—mathematically incomputable with current technology.

So, you can compute a public key that is mathematically and uniquely associated with your private key, but no one can figure out your private key from your public key even if they know the algorithm (mathemtaical function) you used to calculate/compute it.

**Step 2: Sharing the public key**

Now you share your public key with everyone. Post it online, send it in emails, publish it in a database. It doesn't matter who sees it.

**The setup:**

Instead of one shared key (like symmetric encryption), asymmetric encryption uses **two different keys**:

1. **Public key** - You share this with everyone. Post it on the internet. Shout it from the rooftops. It doesn't matter who sees it. (The same thing you do with a crypto address)

2. **Private key** - You keep this secret. Never share it with anyone. Ever. (The same thing you do with a crypto wallet's private key, that 12 or 24 words sequence you might have heard of)

**The magic:** These two keys are mathematically related through a one-way function.

- You can **derive** the public key from the private key (easy direction)
- You **cannot** derive the private key from the public key (hard direction, which can create anonymity, security, and even identification properties if engineered for those purposes)

## How It Works

Here's how communication works in the digital realm:

```
Standard language         Encrypted personal language
  |                           |
  | --- Encrypt message ----> |
  |     (using public key)    |
  |                           |
  | <--- Decrypt message ---- |
  |     (using private key)   |
  |                           |
```

If anyone wants to talk to Bob and only to Bob, they encrypt their message with Bob's public key. Once encrypted, only Bob can decrypt it with his private key. Even if someone intercepts the message, they can't read it without Bob's private key.

And if Bob wants to communicate with anyone else, he can look up that person's public key and use it to encrypt his message. Only that person can decrypt it with their private key.

Just as a small reminder, you can think of encryption as translating from one language to another, like from English to a secret made up yet consistent language.

Imagine there is a public database with everyone's public keys. In practice it's not exactly like this, but imagine it—you can just look it up and send a private message to anyone without having to meet them or share a secret beforehand.

**Example: Alice and Bob falling in love**

Alice wants to say "I LOVE YOU, ALICE" to Bob, so she looks up Bob's public key and computes:

```
f("I LOVE YOU, ALICE", Bob's public key) = Encrypted message
```

Bob receives the encrypted message:

```
f_reverse(Encrypted message, Bob's private key) = "I LOVE YOU, ALICE"
```

Now Bob wants to say "I LOVE YOU TOO, BOB". He looks up Alice's public key and computes:

```
f("I LOVE YOU TOO, BOB", Alice's public key) = Encrypted message
```

Alice receives the encrypted message:

```
f_reverse(Encrypted message, Alice's private key) = "I LOVE YOU TOO, BOB"
```

**If Carol intercepts the encrypted messages:**
- She sees the encrypted gibberish
- She might even know Bob's public key
- But she **cannot** decrypt the message without Bob's private key
- And Bob's private key is mathematically impossible to derive from his public key

**This solves the password-sharing problem.**

Alice and Bob never had to meet. They never had to share a secret. Bob just published his public key, and Alice used it to send him a secure message—all over a public network where Carol is watching everything.

## The Real Magic: RSA Encryption

The most famous asymmetric encryption algorithm is **RSA** (named after its inventors: Rivest, Shamir, and Adleman), which was invented in **1977** and published in **1978**.

For the curious ones who want to dig deeper into how RSA actually works mathematically, there are many resources online. But for our purposes, just know that it's a widely used algorithm that implements the one-way function property we've been discussing.

And for the curious ones who want to know how exactly you publish your public key in practice, it's usually done through **Public Key Infrastructure (PKI)** or **digital certificates** (like SSL/TLS certificates for websites). For Bitcoin specifically, your public key is related unequivocally to your Bitcoin address and revealed to the whole network when you make your first transaction.

## Why This Matters for Bitcoin

Bitcoin doesn't encrypt transactions (they're public on the blockchain). What this means is that everyone can see that Bob wants to send X bitcoin to Alice, for example.

But Bitcoin uses asymmetric cryptography for something even more important—proving that Bob is the one who wants to send the transaction and proving that only Alice will receive them: **Proving ownership without revealing secrets.**

Remember from Chapter 6, your Bitcoin wallet is essentially a private key. But now let's understand the full picture:

**The hierarchy:**

```
Private Key (secret number you generate)
    | (one-way function)
    v
Public Key (derived from private key, can be shared)
    | (another one-way function)
    v
Bitcoin Address (where people send you Bitcoin)
```

Let's break this down:

- Your **Bitcoin wallet** is a **private key** (a very large secret number)

- Your **public key** is derived from your private key using a specific one-way function, like RSA.

- Your **Bitcoin address** (that long string of letters and numbers that represent your wallet and which people send money to) is calculated from your **public key** using another one-way function. This one is usually a function called a hash function.

**Why this layered approach?**

The wallet address is not the public key itself, but is derived from it. This creates cool properties like:

- It reveals less information about your public key, which, even though nothing bad can happen if someone figures it out, it is a cybersecurity best practice to just reveal as little information as needed. Details on this are unnecessary techincal and beyond the scope of this book. As always, if you are curious, research.

- The resulting address is shorter and easier to share than the whole public key.

Example:

```
Public key: 04b0bd634234abdc04b0bd634234abdc04b0bd634234abdc... and more
Bitcoin address: 1A1zP1eP5QGefi2DMPT (smaller and also unique)

[these numbers were made up, it is just a visual representation]
```

If this represents a number, why do I see letters? Because this is written in hexadecimal format.

We humans use the decimal format, based on 10 digits (0-9). Computers often use binary format (based on 2 digits: 0 and 1). Hexadecimal format is based on 16 digits. But we only have 10 digit symbols (0-9), so we start using letters when we run out:

```
UNIQUE SYMBOLS
Decimal:     0 1 2 3 4 5 6 7 8 9
Binary:      0 1
Hexadecimal: 0 1 2 3 4 5 6 7 8 9 A B C D E F
```

If you don't really understand this, don't worry. Just think that those letters, somehow, also represent numbers.

When you spend Bitcoin, you create a **digital signature** using your private key to signal that you authorize the transaction. The only "digital" part of it is that it's done on a computer, but a more accurate term would be a "mathematical signature."

**The signature proves:**
1. You own the Bitcoin (you possess the private key)
2. You authorized the transaction, only if point number 1 is true and you are the only one who has the private key, this is where personal responsibility comes in.
3. The transaction hasn't been tampered with. This does not depend on you, this is a mathematical property.

**The magic:**
- Anyone can verify your signature using your public key
- But only you can create the signature (requires your private key)
- And no one can figure out your private key from your public key

```
The World                         Bob's computer
  |                                     |
  |                                     | sign("I send 5 BTC to Alice")
  |                                     | [using private key]
  |                                     |
  |     (      Message sent        )    |
  | <---( "I send 5 BTC to Alice", )--- |
  |     (    output from signing   )    |
  |                                     |
  |                                     |
```

As per the image above, now The World has 2 things:
1. The message: "I send 5 BTC to Alice"
2. The output from signing (the signature) that message with Bob's private key

If they want to make sure that only Bob could have created that message, they can use Bob's public key to verify the signature.

If Bob created the message, then using the "reverse math" to the sign should give the message. This means:

```
f_reverse(output from signing, Bob's public key) = "I send 5 BTC to Alice"
```

So the world can just do the reverse math, and if the message matches, it can only mean one thing: this message was produced by someone who has Bob's private key, which is only Bob.

The process has been slightly simplified, the verification process of the signature is a bit more complex but this mental model works for the intents and purposes of this book. In reality the function looks more like this:

```
f_verify(signature, public key, original message) = True/False
```

This is **asymmetric cryptography in reverse**: instead of encrypting messages, you're signing messages and sending the signature with them. Instead of "only Bob can decrypt," it's "only Alice could have signed this, and everyone can verify it, because the math is public—everyone knows RSA for example."

We'll explore digital signatures in depth in the next chapter. Understanding the difference between crypto-signatures and crypto-transactions is crucial for operating with cryptocurrencies safely.

## Cool Properties

Let's summarize what we've learned:

- Anyone can generate a public/private key pair using widely available algorithms (like RSA, ECC, etc)
- The algorithms are public knowledge; you just need a computer/phone to compute them
- You can share your public key with anyone, and your crypto wallet address too. It is better if you only share the wallet address, but sharing the public key is also safe—no one will steal money from you just with that
- The world can use your public key to send you encrypted messages or verify your digital signatures
- But only you can decrypt those messages or create signatures, because only you have the private key

## What We've Solved

Let's review what asymmetric encryption enables us: the generation of unique and globally valid passwords, secure communication over public channels, and proving identity without revealing secrets.

These properties enabled stuff like:
- Secure online banking
- E-commerce
- Distance agnostic encrypted messaging
- **And cryptocurrency wallets**

All because we have figured out a way to create homemade IDs. A large unique number impossible to guess associated with another one you can share, and which anyone can verify that only you created that shared number, associating its creator with it. Or in other words, identifying its anonymous creator with it. All assured thanks to math with that uses the easy-to-compute-only-one-way property.

## Summary

If even with this level of simplification this is still hard to grasp, do not worry, it is normal. I'm trying to explain things so you feel safer because you understand the dynamics to some extent. If this still feels too complex, just remember one simple thing:

- IN GENERAL, NEVER SHARE YOUR PRIVATE KEY WITH ANYONE.
- NOT YOUR PRIVATE KEY, NOT YOUR COINS.
- IF SHARING, YOU ARE GRANTING ACCESS TO THEM. MAKE SURE IT IS ONLY TO PEOPLE YOU TRUST 101%.

---

**Key Insight:** Asymmetric encryption uses two keys instead of one. A public key (shared with everyone) and a private key (kept secret). Messages encrypted with the public key can only be decrypted with the private key. The keys are mathematically related through one-way functions—easy to compute forward, essentially impossible to reverse. This solves the key-sharing problem: strangers can communicate securely without ever meeting or pre-sharing secrets.

Now that you understand asymmetric cryptography—the mathematical foundation of cryptocurrency wallets and secure internet communication—there's an important question we need to address: **"Won't quantum computers break all of this?"** This is one of the most common concerns about cryptocurrencies. In the next chapter, we'll briefly explore what quantum computing actually is, what it can and can't break, and why this isn't an apocalyptic scenario for crypto as some imagine.
