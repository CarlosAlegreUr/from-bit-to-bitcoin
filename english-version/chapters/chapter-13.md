# Chapter 13: Ethereum - The Consensual Computing Machine

*What if the database could run programs?*

---

We've spent the last few chapters understanding Bitcoin: a distributed database that lets strangers agree on who owns how much without trusting any central authority.

But Bitcoin transactions are simple. Alice sends 10 BTC to Bob, Bob sends 5 BTC to Carol, and that's it—just value transfer. Subtract a number here, add it there. There's a bit more complexity under the hood, but at its core, Bitcoin is just executing additions and subtractions.

That on itself is a program, a very simple one that adds and subtracts balances. Simple and... boring.

What if the database could do more than just track balances? What if it could **run complex programs**?

That is the idea that sparked **Ethereum**—a distributed database that not only tracks balances but also stores programs. These programs are called **smart contracts**.

## Bitcoin Recap: Simple Transactions

Bitcoin transactions are straightforward instructions:
```
Transaction:
- From: Alice's address
- To: Bob's address
- Amount: 10 BTC
- Signature: [Alice's signature proving she authorized this]
```

The network verifies: Does Alice have 10 BTC? Yes. Is the signature valid? Yes. Then update the database—subtract 10 from Alice, add 10 to Bob.

**Simple. Clean. Works perfectly for money, or just value in the sense of gold.** Some people argue with very good reasons that Bitcoin is not money in the sense of cash but value in the sense of gold, but that is another debate.

For now just notice what Bitcoin's simple scripting can't easily do. It can't easily say "send money to Bob, but only if some complex condition X happens." It can't hold money until a certain date and then release it to multiple parties if certain complex conditions are met. It can't program complex logic like loans or voting systems.

Bitcoin moves value from A to B. That's what it was designed for.

**Ethereum asked: What if we could program anything?**

## The Insight: Programmable Transactions

Vitalik Buterin (Ethereum's creator—this guy, unlike Satoshi, is known and alive) realized: **What if we could program complex logic on the database?**

What if we could program a loan? Or a will? Or even a voting system?

Not just "send X to Y," but:
- **IF** goods are delivered **THEN** pay seller **ELSE** refund buyer.
- **IF** I'm inactive for 1 year **THEN** send my funds to my heirs.
- **IF** it's the 1st of the month **THEN** deduct subscription fee.
- **IF** I am a valid voter **THEN** allow me to store my vote for this election.
- **IF** citizen misbehaves, **THEN** freeze its funds.
- **IF** my political party is losing, **THEN** add fake votes to it.

**This is a smart contract.** Not a legal contract (no lawyers involved), and no smartness either, but a program that runs on a CDN and enforces rules automatically.

The smart part depends on who writes it. And the "contract" word might come from the fact that you need cryptographic signatures to interact with it—in the "real world" you sign contracts and they enforce things, and here you sign data with cryptography which allows someone to run code on a database, so it is kinda like a contract.

The name is a bit weird, but the idea is powerful. What if we could program anything on this database?

Let me show you what this means with real examples.

## Smart Contracts: Consensual Logic On Code

### Example 1: Loans with Collateral

You want to take a loan. With a smart contract, you can program it: at date X, if money not returned, the collateral goes to the lender. That's it.

No banks, no paperwork, no credit checks. Just code enforcing the agreement.

But wait **the program can only read data from the database**, therefore, how does the program know what the real-world data is, like the price of your collateral which might be, let's say, a Netflix stock?

Great question. Programs on the database need information from the outside world (like prices, time, delivery confirmations). Who gives this data to the database so the program can read it? Isn't that a centralized trusted party?

Well, it might be, but that is a topic for another time. For now, imagine it is possible to reliably put real data into the program in a verifiable and trust-minimized way with economic incentives and game theory as we have been doing.

If you are curious, research deeper what we call in the industry **oracles**—the most famous is Chainlink. The main idea of these oracle protocols is that they put data into the CDN from the real world, like price feeds, weather data, sports results, etc., in a verifiable and trust-minimized way.

### Example 2: Will (Inheriting Bits)

You want your Ethereum assets to go to your children if something happens to you.

**Traditional solution:** Write a legal will, give your passwords to a lawyer (risky), hope everything works out.

**Smart contract solution:**
```
Contract: Digital Will
- IF I don't interact with this contract for 2 years
  THEN send 50% of my ETH to Child A's address
  AND send 50% of my ETH to Child B's address.
- ELSE IF I do interact (prove that I'm alive)
  THEN reset the 2-year timer.
```

This is basically unstoppable. Even if you lose your private keys, even if you die, the contract executes automatically after the time period. No lawyers, no court, no one can block it.

### Example 3: Subscription (Automatic Recurring Payments)

You subscribe to a service for $10/month.

**Traditional solution:** Give them your credit card. Trust they won't overcharge. Hope you remember to cancel.

**Smart contract solution:**
```
Contract: Subscription Service
- User deposits $120 (for 1 year).
- Every 30 days, contract sends $10 to service provider.
- User can cancel anytime, contract refunds remaining balance.
```

**You control when to cancel. The service provider can't take more than agreed. The rules are transparent and automatic.**

And there are no fees to all these middlemen that make credit cards work on the internet—just the fees of running the program on the CDN (Consensus Database Network like Ethereum), which can be less. Traditional credit card processing fees range from **2–3% per transaction** for merchants, while transaction fees on decentralized datasync technologies depend on network congestion—ranging from fractions of a cent to a few dollars, often significantly cheaper than credit card fees for many use cases.

## The Ethereum Virtual Machine (EVM): Everyone Runs the Same Programs

Here's the magic: **Every node in the Ethereum network runs these smart contracts.** Look, the previous phrase is full of weird words you would have not understood before reading this book. I hope you can see the progress you are making and the actual complexity on all these new decentralized datasync technologies.

Remember from Bitcoin: Every node has a copy of the database, and when a transaction happens, every node verifies it and updates their copy.

**Ethereum adds:** Every node also stores programs on the database. When someone interacts with a program, every node **runs the program** and computes the result.

**This is the Ethereum Virtual Machine (EVM):** A virtual computer that exists across thousands of real computers.

### Addresses: Still Based on Asymmetric Keys

One quick note before we continue: Ethereum addresses work the same way as Bitcoin addresses. They're still based on asymmetric cryptography (public/private keys) with the same properties we learned in Chapter 7.

They look a bit different because of different hashing and encoding schemes, but the mechanism is the same:
- Your private key → Your public key → Your address.

**Examples:**
- Bitcoin address: `1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa`
- Ethereum address: `0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb`

Different formats, same underlying cryptographic principles.

The addresses shown were made up for illustration.

### How It Works:

1. You write a smart contract (in a programming language like Solidity).
2. You deploy it to Ethereum (it gets stored in the database).
3. Anyone can interact with it (send it transactions).
4. Every node runs the contract's code with your transaction as input.
5. Every node computes the same result (deterministic).
6. The database updates based on the result.

**Key property: Deterministic computation.**

Same input leads to same output. Always. On every computer.

If Alice sends the loan contract a "pay back loan" transaction, every node runs the contract code, sees the condition is met, and updates the database to return her collateral.

**Everyone agrees on the computation, just like they agree on the balances.**

You can't just not run a program, because it is stored in the database. If you try to censor a program, or run it differently, the next iteration of the database you produce (the next block) will be rejected by everyone else because your results (the data in the database) will not match theirs.

Hence, altering the code to censor programs would require altering the code that creates the consensus, so if you do so, you are basically creating a completely new network—one where you will be alone, and useless.

## Why This Is Revolutionary Innovation: Unstoppable Programs

Think about normal programs. Facebook can delete your account. PayPal can freeze your funds. Amazon can change their terms of service.

**Why?** Because they control the servers running the code. They can modify it, turn it off, or block you anytime.

**Smart contracts are different, by default:**
- No single company can control them.
- Once deployed, they run forever.
- No one can shut them down, not even the creator.
- No one can change the rules without everyone seeing.

**This is consensus on computation, not just on balances.**

Note my wording, by default. Programs are flexible, so you can program a smart contract that is controlled by some company, or that can be changed by some authority. But that is a choice you make when you write the code and when you interact with the code.

The same way someone can write code that is controlled by a company, someone can just write that very same code but controlled by no one. The power to decide which program to use is in your hands.

Both programs will be running forever on the CDN, but you get to choose which one to interact with.

**So here's the crucial part:** Anyone can deploy their own program, and you choose which program to execute. You are not forced to use program X if you think it is abusing your data, charging you too much, etc.

A bank is lending money with too much interest rate? Anyone can create a new bank program with a lower interest rate so clients can lend at more favorable terms.

This enables competition at the code level. Transparent and auditable.

This enables so much possibilities...

## What Could This Enable? Let Your Imagination Run

A man once said, if you can dream it, you can code it.

Think about the possibilities:

**What if you had a decentralized social media** where people could pay you directly to access your content instead of giving total control to a social media company and their opaque servers and algorithms?

**What if anyone could see the algorithm** of this social media? No hidden manipulation, no secret ranking systems. Transparent code that everyone can verify.

**What if you could create a decentralized organization** where every decision is voted on by members, and the votes automatically execute changes? No CEO that can override the will of the community.

**What if artists could program royalties** into their digital art, so every time it's resold, they automatically get a percentage—forever?

**The possibilities are vast.** Banks, insurance, voting systems, supply chains, identity management—anything that involves rules, agreements, and trust can potentially be programmed on a CDN.

**Ethereum is a consensual computing machine.** Thousands of people agreeing on what programs to run on their precious information, which can represent and mean anything, because we interpret it.

**But there are catches.**

## The Downsides:

### 1. You Have to Pay for It

The execution cost of the program, at the end of the day, is electricity, remember. Every node runs the program, consuming computational power.

Some companies might allow you to use their centralized computers for free because they sell your data and "private" information—but in a decentralized computer, everyone has to pay their fair share of the electricity cost so the model is sustainable.

Furthermore, when you deploy a program, that literally occupies some transistors and they also run on electricity all around the world, so that has a cost too. If you want to put your bank code in the database so anyone can execute it, you will have to pay for the space it uses.

Is this expensive? Can anyone afford it? We will answer these questions later.

For now, just understand: **computation on CDNs costs money.** This is by design. These costs are usually called **gas** costs. Why gas? I do not know. Maybe because gas powers cars and computation powers computers? I don't care, this industry already has so many weird names, forgive me if I do not question this one.

By the way, there is an extra reason to pay the more you consume. Imagine you tell the network to run a program that never ends—voila, you hacked the network, now nothing else can execute because everyone is busy running your infinite loop. Well, that now becomes economically impossible. The more computation you use the more you pay, so to compute forever you would need to pay forever... infinite money? Impossible.

### 2. You can build anything! Wait... anything?

With all these decentralized datasync technologies, you can build:
- **Decentralized exchanges (DEXs):** Trade currencies with people around the world without a bank in between. It's like a stock exchange, but run by code instead of a corporation.
- **Decentralized banking:** Borrow and lend money without a traditional bank. Just smart contracts enforcing the terms for everyone, everywhere.
- **DAOs (Decentralized Autonomous Organizations):** Organizations run by code and votes and not needing always a board of directors approval. Think of it like a company where shareholders automatically control stuff like budget through transparent voting.
- **Identity systems:** Own your online identity across platforms, not controlled by Google or Facebook.
- **Global gambling:** Program your unstoppable global casino to promote gambling worldwide without any government able to shut it down.

And many more new possibilities, these are just a few.

Some of these are useful. Some are hype. Some are experiments. Some are of devious ethics. But the **capability** is now real.

### 3. Code Can Have Bugs (bugs means errors in the code)

The code can get hacked if you do not code it properly. You leave your loan with a bug that can accidentally multiply by 10 what you owe? You are in trouble.

Even if the CDN works perfectly, the code you write on top of it can have bugs. So be careful which programs you run.

Some errors in the code (bugs) might remain dormant for a long time, until someone discovers them and exploits them. This has happened multiple times already, with millions of dollars lost—notably, The DAO hack in June 2016 resulted in the loss of about 3.6 million ETH (roughly $60M at 2016 prices). Total crypto hacks in recent years have reached into the billions per year.

Fortunately, the security of the codes being used is improving year after year, but this risk is still present. The chances of it affecting you get reduced, but they will never be zero.

Personally, the author works precisely in this part of the industry: cybersecurity of CDNs and smart contracts. So I can tell you: this is a real risk, but it is being taken seriously by lots of professionals.

Slowly but surely, the chances of you losing your money because of these reasons will go to 0 in practice, and if it happens, insurance protocols will cover your losses, which are not really your fault.

It will feel like hiring a life insurance being 25 years old just in case a lightning hits you. It is very unlikely, but if it happens you want to be covered.

As of today when I'm writing this, December 16th, 2024, it is very risky, the author would not put all his savings/investments into any single cryptocurrency due to potential security issues.

### 4. The Devil Is In The Details I'm Hiding For Simplicity.

Some of the uses I've provoked your mind with are very complicated to integrate technically. Not impossible, but indeed way more complicated.

At least, with the knowledge you will get from this book, you will be better equipped to keep understanding them on your own, making your own critical, logical and informed questions about them while learning how they work.

## Welcome to the Dark Side

As you might have noticed, I've described some use cases that are a bit... morally gray. Gambling, unregulated loans, corrupted elections, etc.

As with any new technology, there are both good and bad uses. Some people will use CDNs for innovation and liberty. Others might use it for scams, fraud, to evade legitimate regulations or to create illegitimate ones.

This is why you must understand the technology. To make sure you use it for "the betterment of the world" and not let someone else use it to abuse you.

This is like guns, cars, or the internet itself. Powerful tools that can be used for good or evil. We have the duty to care, to understand them at least at a certain level of detail, so we can make informed choices. This book is a clear effort in that direction.

## Sum Up: Bitcoin Coordinates Value, Ethereum Coordinates Value And Computation

Let's zoom out and see what we've unlocked:

**Bitcoin:**
- Distributed database.
- Tracks balances (who has what money).
- Consensus on simple rules (everyone agrees on ownership and simple transfers).
- Simple transactions: "Send X to Y."

**Ethereum:**
- Distributed database + distributed computer.
- Tracks balances AND runs programs.
- Consensus on complex computation (everyone agrees on program outputs).
- Complex logic: "IF condition THEN action."

**Both are coordination technologies.** They let strangers agree on something without trusting a central authority.

Bitcoin: "We all agree Alice has 10 BTC."

Ethereum: "We all agree this program should send funds to Bob because the condition was met."

## Story Time...

## But Ethereum Started with Proof-of-Work. Then Something Changed...

When Ethereum launched on **July 30, 2015**, it used the same consensus mechanism as Bitcoin: **Proof-of-Work.** Miners solved computational puzzles, burned electricity, earned rewards.

But on **September 15, 2022**, Ethereum did something unprecedented: **It switched consensus mechanisms.** That event was called:

**The Merge:** Ethereum transitioned from Proof-of-Work to **Proof-of-Stake.**

No more mining. No more burning electricity. A completely different way to achieve consensus.

**Why?** One major reason: Proof-of-Stake consumes way less electricity (about 99.95% less).

**Here's the key insight:** This is consensus. If people (nodes) want a different algorithm, they can just agree and change it.

The community agreed this change was worth it. They voted with their participation. The switch happened. The network kept running.

They just said on an internet forum something like: At block number X, we will run a completely different code, okay?

And when that block came, they all did. Notice a very important detail: they ran different code, but the database state remained the same. All balances, all programs, everything stayed intact. Just the way consensus was achieved changed.

**Consensus is social, remember?** Technology enables it, but humans decide the rules.

If you're curious about the technical details of how Proof-of-Stake works, you can research it deeper. But for our purposes, just understand: it's another consensus mechanism, another way to coordinate, with another unique set of trade-offs.

For example, if you want to censor Bitcoin you have to control 51% of the computing power of the network. In Ethereum, computing power now matters nothing. What matters is... its very same native currency, Ether.

**The important take on all this?** The networks can evolve. Consensus can change. As long as all the participants agree.

But, thanks to that beautiful data structure, the blockchain, all the history is preserved. The past is immutable, but the future can be shaped by consensus. You can literally see all the changes that happened over time, who proposed them, when, and how the community agreed to execute them. No one can censor how the past happened, no one can rewrite history, but the future is open to collective human choice.

Now, what happens if not everyone agrees? What if the community splits? This has already happened multiple times in multiple CDNs. Let's explore that in the next chapter.

---

**Key Insight:** Bitcoin coordinates value, Ethereum coordinates value and computation. Smart contracts are programs that anyone can deploy (deploy on = save in) on the database, executed by every node with deterministic logic. You choose which programs to interact with—creating transparent competition at the code level. This enables loans, wills, subscriptions, voting, and countless applications without middlemen. But there are trade-offs: computation costs money (gas), code can have bugs, and powerful tools can serve both good and evil purposes. Programs are unstoppable by default, but developers can choose to make them controllable. When the Ethereum community decided to switch from Proof-of-Work to Proof-of-Stake, they did—because consensus is ultimately social. Networks can evolve when participants agree. But what happens when they don't agree?

Next, we'll explore what happens when consensus splits—when the community disagrees so fundamentally that the network splits into two separate realities. This will deepen our understanding of what consensus really means and why it's ultimately a human choice, not just a technical mechanism.
