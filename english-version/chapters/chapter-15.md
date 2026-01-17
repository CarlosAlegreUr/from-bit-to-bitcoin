# Chapter 15: A Society For You! A Society For Me! A Society For Everyone!

*Can we have the best of all worlds?*

---

In Chapter 14, we learned that when communities disagree, they can fork. Complete separation. Different chains, different communities, different values.

But what if we didn't have to choose between unity and independence?

What if we could have **many coordinating societies** instead of one global society or many completely separate ones?

This is the idea behind Layer 2s. I guess they are called this because they are usually drawn alongside the other blockchain, looking like they are forming layers:

```
Layer 2 Chain: ->->->[]->->->[]->->->[]->->->[]->->->[]->->->[]->-> Block, Block

Layer 1 Chain: ->->->[]->->->[]->->->[]->->->[]->->->[]->->->[]->-> Block
```

But before understanding Layer 2s better, it will help to understand a fundamental problem.

## The Blockchain Trilemma (like a dilemma but with three options)

There's a famous problem in CDN design called **the blockchain trilemma.**

It states that you can only optimize for **2 out of 3** properties:

1. **Decentralization:** Anyone can participate (run a node, verify transactions...).
2. **Security:** The network can't be easily attacked or compromised.
3. **Scalability:** The network can handle lots of transactions quickly and cheaply.

**You can pick any 2 and be very good at them, but not all 3.**

Let's intuitively explain why.

### Decentralization + Security = Slow (Bitcoin, Ethereum)

This is what Bitcoin and Ethereum chose.

**Decentralization:**
- Anyone with a computer can run a node.
- Blocks are small enough (1-2 MB) so many people can store and verify them.
- Thousands of independent nodes operate worldwide.

**Security:**
- To attack the network, you need a large amount of a difficult-to-obtain resource.
- Extremely expensive and difficult.

**Yet, this comes at a speed cost:**
- **Every node processes every transaction.**
- Every node stores every block.
- Every node must reach consensus with every other node.

There's a physical limit to how fast this can happen. If blocks come too quickly, some nodes won't be able to keep up with their smaller machines. If blocks are too large, only people with expensive hardware can participate, which leads to centralization and loses the security guarantees that decentralization provides.

The block time (how often new blocks are created) is chosen in the consensus rules. Bitcoin chose 10 minutes, Ethereum chose ~12 seconds. But you can't make it too fast without risking that only powerful computers can keep up.

Result: **~7 transactions/second (Bitcoin), ~15 transactions/second (Ethereum).**

Compare to other centralized payment systems like Visa: **~24,000 transactions/second.**

### Scalability + Security = Centralized

What if we wanted to handle 24,000 transactions per second?

**Option:** Make blocks huge (like 1 GB instead of 1 MB).

**Result:**
- Can fit way more transactions per block.
- Much faster, much cheaper.

**But the problem:**
- 1 GB blocks every 10 minutes = 144 GB per day = 52 TB per year.
- Most people can't store that much data.
- Most people can't download 1 GB blocks every 10 minutes.
- **Only large corporations and data centers can run nodes.**

Result: **Centralization.** You've almost recreated a traditional database with extra steps.

Congratulations, instead of a traditional data dictatorship now you have a small oligarchy. I mean, technically it is actually more decentralized.

### Decentralization + Scalability = Chaos (Insecure)

What if we wanted lots of people to participate (decentralization) AND process tons of transactions quickly (scalability)?

**Option:** Keep the network open to everyone, but make blocks huge and come very fast.

**What happens:**
- Lots of transactions fit in each block (scalability check).
- Anyone can still join (decentralization check).
- But you have to process things very, very quickly.

**The problem:**

Not everyone has the hardware to keep up. Imagine you're processing block 10 while someone in Japan is already on block 12, another node in Brazil is still on block 11, and the rich guy with the fastest computer is on block 20.

**The database becomes completely messed up and out of sync.**

Furthermore, physical distances matter. Even at the speed of electricity, if blocks come too quickly, a node in Iceland and a node in Senegal can't stay coordinated. By the time Block 100 reaches Senegal, Iceland is already on Block 105. The network fragments geographically.

It's like a Michelin-star restaurant's kitchen where everyone literally runs around trying to coordinate at impossible speeds. Chefs would clash into each other, start shouting, get confused. Chaos.

Result: **Insecurity.** The network can't maintain consensus. Nodes disagree on the current state. The whole system breaks down.

## Why Decentralized CDNs Are Inherently Slow

At least with modern algorithms, cryptography, and hardware availability: **Global consensus takes time.**

Remember how CDNs work:
1. People send transactions.
2. **Every node** receives and verifies it.
3. Another node (miner/validator) proposes a block with that transaction.
4. **Every node** verifies the entire block.
5. **Every node** updates their local copy of the database.

**This is coordination at a global scale.**

The more nodes you have (and therefore more decentralization), the more work that needs to happen. Every node must compute several things for every transaction.

If you want it secure—that is, working as expected—you can't rush it. If you want it decentralized, you can't limit who participates. But if you want it fast too... you have to sacrifice one of those.

## Do We Need Slow Global Consensus For Everything Though?

**What if we don't need global consensus for every single transaction?**

What if we can run CDNs that sacrifice a certain degree of decentralization in exchange for speed, but only for certain use cases?

Think about real life:

- You don't need the federal government to approve every purchase you make at a local store.
- You don't need the UN to validate every contract between two people in the same city.
- You don't need every human on Earth to agree on what you and your friend do together.

**Most coordination can be local.** Only some coordination actually needs to be global.

So what if we applied this to CDNs?

## Layer 2 Solutions: Mini-Societies Within A Mega-Society

**The idea:** Create smaller networks (Layer 2s) that sit "on top of or alongside" a main chain (Layer 1).

**Layer 1 (The Base Layer):**
- The "federal government" or "EU level."
- Slow, expensive, maximally secure, global consensus.
- Final arbiter when disputes arise.
- Everyone trusts it, but you don't use it for every little thing.

**Layer 2 (Scaling Layers):**
- The "state governments" or "member nations."
- Fast, cheap, specialized, local consensus.
- Handles day-to-day transactions.
- Periodically "settles" with Layer 1 for security.

**Both working together.**

Instead of processing every transaction on the main chain, we process most transactions on Layer 2s and only use Layer 1 when we need to create a checkpoint, settle, or resolve disputes.

Like running a tab at a bar. You don't usually pay after every drink—you settle up at the end of the night.

### Examples of Layer 2s

**Bitcoin has Layer 2s like:**
- Lightning Network (for fast, cheap payments)

**Ethereum has Layer 2s like:**
- Arbitrum
- Optimism
- Polygon
- Base
- And many more...

Each one is essentially its own CDN that periodically syncs with the main chain for security.

This is exactly how human societies already work.

### The United States

**Federal Government (Layer 1):**
- Makes big decisions (constitutional amendments, war, trade deals).
- Slow (Congress takes forever).
- Expensive (huge bureaucracy).
- Final arbiter (Supreme Court).

**State Governments (Layer 2):**
- Make local decisions (traffic laws, local taxes, education).
- Fast (state legislatures move quicker).
- Cheap (smaller bureaucracy).
- Defer to federal for disputes (federal law overrides state law).

**Both work together.** States handle day-to-day governance. Federal government handles major coordination.

I will not repeat myself with the EU example, it's similar.

But CDNs have new features never seen in history. Imagine every week each State updates their data to the federal CDN, and so, as that one is decentralized, it remains there forever.

### A Corruption Example

Imagine inside a State, because it is a more centralized CDN and easier to corrupt, there is a case of corruption where money is stolen or misused. Then you could use last week's data as a fresh starting point, a consensual moment where everyone agrees on the state of things, and from there you can start investigating backwards to see how deep and for how long the corruption actually happened.

In normal traditional cases, the files that prove suspicious movements through weeks and weeks might be "lost" or destroyed by those in power who got corrupted. But with blockchain checkpoints, you only have one week to cover your tracks. You have to hurry, and in a serious legal system, if you try big crimes quickly, chances are you get caught.

### Another Example

You loan money to Bob, but Bob is friends with Alice, a very rich person who also happens to be a politician and is well connected to the people who run this quick but centralized CDN. Let's say Bob cannot pay you back. He's in trouble, but calls Alice: "Hey, can we just 'lose' the records of this loan and pretend it never happened? Can we abuse the consensus algorithm to even re-write history a bit?" A bit, notice the pun.

Alice agrees and uses her influence to get the centralized CDN to "lose" the records of this loan. You are out of luck.

**But, in a system with periodic updates to L1**, we can see that Bob actually took a loan from you 2 weeks ago and now it has vanished. Investigation time for the federal authorities.

The decentralized Layer 1 acts as an immutable checkpoint. Even if Layer 2 is compromised, Layer 1 preserves the truth.

### Another Another Example

Imagine you borrowed from someone, and that lender knew you could not pay the loan back but still gave you the loan anyway—something similar to the 2008 bubble. Well, imagine that happening at a State level in the US, and again, the centralized system tries to excuse itself with, "well... we did not know, how would we have known?" Well... the data is public. And look at the Federal CDN: it is clearly visible that you were taking very risky, clearly irrational decisions that led lots of investors and people to bankruptcy.

Oh wait, everything is public... Is that good? Some people care about privacy.

## The Temporary Bad News: Trade-Offs

Layer 2s aren't perfect. They introduce complexity.

### Technical Complexity Is Real

Technically, L2s can use very diverse algorithms to run, and we still need to find a general way to easily connect them to one another. People are working on this, but for now, technical complexity is a real thing making the scenarios described challenging to execute.

These systems do exist, but because they are complex, it is hard for normal people to understand them and therefore use them for anything meaningful.

This creates a barrier to adoption. The technology works, but the user experience is still being figured out.

Imagine that to connect to the internet you had to do it completely differently for each brand of computer you use. That would certainly slow things down.

### Cognitive Load: Too Many Choices

Beyond technical complexity, there's also the cognitive load it creates.

Users have to choose which Layer 2 to use. Do I use Arbitrum? Optimism? Polygon? Base? It's like choosing which state to live in—not everyone understands the exact differences and it takes time to do so.

Each Layer 2 has different trust assumptions (some are more centralized than others), different speeds and costs, different security models, and different applications built on them. **How is a normal person supposed to choose wisely?**

Right now, most people don't. They stick to Layer 1 or use whatever their favorite app recommends. This defeats some of the purpose.

If you want to independently move your money around all these CDNs, you have to really know what you are doing. What is the chainID? Is this node provider reliable? Do I need to create a new wallet for this chain? Is the token or coin I want to use available in this chain? Is the code in this chain as secure and reviewed by security experts as in this other chain? Where can I find a simple user interface to move funds between the chains with one or two clicks? Is this website I found secure? Who runs it? Nice, I found another chain—let's gather all this information again...

It's like moving residency—possible, but not instant or free.

No one has time for this, just nerds like the author. As said, technical advancements like creating new consensus rules are going to simplify the process in the future, and users will not have to know that much about all the details at all. But that's just under construction.

### Different Trust Assumptions And Software Accessibility

Some Layer 2s are more centralized than Layer 1. You're trusting the Layer 2 operator to some or to a full degree.

It's a trade-off: more speed and lower cost, but a slightly or completely different security model.

What if the operator just disappears and you did not have time to move your money back to the safe CDN? What if the developer who made the website disappears and now, even if it is technically possible, you don't know how to move your funds back?

Not everyone in this world is a software engineer, and even fewer people understand and can quickly interact with CDNs. And it is not realistic to expect everyone to become one for the sake of a more effective financial system.

What is the solution then? As said, technicians are working on it—on websites anyone can run on their machines even without internet, on apps that are open-source with code that is public and everyone can verify, that they can download and use forever on their phone to move funds around safely even if their favorite website is down.

There have even been invented cryptographic mechanisms where, even if the L2 breaks, people can just move their funds to the main CDN without having to interact with the broken one.

It is unrealistic to expect everyone to become a software engineer, but it is not unrealistic to create open-source software usable and accessible by anyone at global scales. Linux, a free operating system that works perfectly, is free and for everyone, anywhere. And so on and so forth—there is lots of software capable of this.

It is true that these softwares require a small effort; they are not just available in the Play Store where you install them in one click. But this extra thing or two you have to learn is minimal and anyone can do it in one or two afternoons, especially the new generations who were born around digital tools. And it is likely that someone creates a way to even delete this small barrier to entry in the future.

Therefore, give us time and we will give you collective freedom. Or put a small effort in understanding how to download code from places like GitHub. Modern AIs can explain how to do this pretty well.

If you are a software engineer reading this, I encourage you to use your knowledge and build for the CDN niche. Thanks so much, you are very welcome, we will never have enough people working—it just creates more decentralization and better systems. And please, do not forget the purpose, do not forget that decentralization is what keeps the party going.

### Industry Age Context

This industry is just about **16 years old** as of **2025** if you count since Bitcoin was created—very young—and lots of code is still to be written, and to write it securely slows down the process. Mess something up in this industry and you get some irrecoverable hacks, as we have explained in earlier chapters.

### Fragmentation

If everyone uses different Layer 2s, the network effect is split.

It's like how the EU benefits from all nations coordinating, but each nation speaking a different language creates friction.

If your money is on Arbitrum and your friend's money is on Optimism, transacting between you two is harder than if you were both on the same network.

It is like sending a package to another State instead of sending it to someone in the closest city.

## Summing up

**Local -> Regional -> National -> Global coordination.**

- You coordinate with your family (very fast, very local).
- Your city coordinates internally (fast, local).
- Your state coordinates with other states (slower, regional).
- Your nation coordinates with other nations (slow, global).

**Layer 2s are the same pattern applied to CDNs.**

We're not, at social relationship levels, inventing something new—we're recognizing that coordination naturally happens at multiple scales.

Most of your daily life doesn't need global coordination. Only some things do.

## Security Is Shared Globally

Imagine that in traditional systems, every time you had a dispute, the best judge, lawyers, and detectives in the world helped you. That is impossible.

In a way, not anymore. As we saw, we can periodically update the data to the secure system, creating unerasable history, evidence—readable and analyzable at the speed of electricity, anywhere in the world.

**Societies within societies, all working together and for each other.**

Ethereum doesn't need to process every transaction. It just needs to be the final arbiter when disputes arise or when checkpoints are needed.

Bitcoin doesn't need to record every coffee purchase. It just needs to settle final balances when Layer 2 channels close.

**This is how coordination scales.**

Not through forcing everyone to agree on everything, but through allowing local groups to coordinate quickly while maintaining a global layer for truth and security.

This creates the idea of Ethereum as the global trust machine. Why do you live relaxed even if literally anyone can hurt you when you go outside? Because we have designed our system to have "automated" mechanisms, like police and judges, to help you when that happens. These traditional systems are also trust machines that build trust. And when you trust you can relax, and then the better the sex—same applies in finance and data coordination. Furthermore, these systems can also be influenced and improved by you in case they get something wrong, via voting for new laws, etc.

In an inverse phrasing, they also generate the lack of needing to trust, because you know if someone misbehaves, they will be punished. This is what the industry calls "trustless."

By the way, the trustless manifesto and d/acc philosophy from Vitalik Buterin reflect very well how the main forces guiding Ethereum have these intentions I've been describing. I encourage you to read them.

As you can see, CDNs are very similar: valid consensual agreements on what is the official information, in which everyone can participate and even propose changes if things seem not to work. And unlike traditional systems, these systems can be global and actually automated.

This is the current state of thought of the industry and a glimpse into the possibilities it opens. I encourage you to keep learning about it—as you can see, it is technological advancement that grants us new capabilities we just did not have before.

But now, wait, have you noticed? We all are naked.

## The Last Downside, Privacy

Houston, there's still a problem: **All these transactions and data are still public.**

Everyone can see your balance. Everyone can see who you transact with. Everyone can trace your financial history.

Criminals can see how much money you have and decide whether to target you.

Corrupted governments can too. I mean, they are a subset of the criminals example above.

Even your neighbors can see your spending habits, can envy you, and create social pressure.

Insurance companies can see your data and decide to charge you more or less for no real reason related to the actual insurance policy.

Employers can see what you spend on before hiring you, discriminating based on your personal life.

Authoritarian regimes can track dissidents' donations to opposition groups.

Stalkers and abusive ex-partners can monitor your financial movements and location patterns.

Companies can track your purchases and build invasive advertising profiles without your consent.

Good for auditability and responsibility generation. Bad for privacy and protection.

**Is there a way to have both privacy and verification?**

Can you prove you have enough money to make a purchase without revealing how much you have?

Can you prove you're old enough to enter a bar without showing your exact birthdate?

Can you prove you voted without revealing who you voted for?

This seemed mathematically impossible for a long time. If you want to prove something is correct, don't you have to show it?

Turns out, no. And that's the topic of our next chapter.

---

**Key Insight:** The blockchain trilemma: you can only have 2 of 3 (decentralization, security, scalability). Bitcoin and Ethereum chose decentralization + security, sacrificing speed (~7-15 tx/sec vs Visa's ~24,000). But we don't need global consensus for everything—most coordination can be local. Layer 2s are smaller CDNs on top of Layer 1: Layer 1 is slow, secure, global (federal government), while Layer 2s are fast, cheap, local (state governments). Examples: Lightning Network (Bitcoin), Arbitrum/Optimism/Polygon/Base (Ethereum). They periodically checkpoint to Layer 1, creating an immutable record that prevents corruption from being hidden. Trade-offs: technical complexity (hard to connect L2s), cognitive load (too many choices), different trust assumptions, coordination overhead, fragmentation. This mirrors human society: local -> regional -> national -> global. Consensus can be nested—societies within societies. Most daily life doesn't need global consensus, only checkpoints for truth and security. But all transactions are still public—can we have privacy AND verification?

Next, we'll explore Zero-Knowledge proofs—proving you know something without revealing what you know. This seemed impossible until the 1980s, and impractical until the 2010s, but it's now the missing piece for private, verifiable coordination.
