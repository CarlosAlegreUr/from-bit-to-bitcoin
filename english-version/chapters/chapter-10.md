# Chapter 10: Proof-of-Work - Earning the Right to Write

*What if we borrowed hierarchy temporarily, but earned leadership through effort?*

---

We've established the problem: distributing a database across thousands of computers creates synchronization chaos. Conflicting updates, latency delays, and malicious actors can all threaten to break the system.

Here's a natural thought: **What if we temporarily gave someone the power to decide?**

## Borrowing Hierarchy (Just for a Moment)

Think about it: many of the problems we identified in Chapter 9 get easier if one person has authority:

**Problem 1 (Conflicting updates):** If Alice sends 10 coins to Bob AND to Carol at the same time, who decides which transaction is valid? Easy—the person in charge decides. They pick one, reject the other. Done.

**Problem 2 (Latency delays):** If databases are temporarily out of sync because information takes time to travel, who decides what the "correct" state is? The person in charge waits a second or two and declares: "This is the official version." Everyone updates to match.

**Problem 3 (Security):** If Dave tries to flood the network with fake transactions or send conflicting data to different people, who stops him? The person in charge validates transactions and only includes the legitimate ones.

Centralization makes coordination way simpler—this is why banks work so efficiently. One authority, one database, one source of truth.

**But we don't want permanent centralization.** That brings us back to the bank problem—lack of ownership, frozen accounts, control by a single entity.

**The insight:** What if we give someone temporary authority to write to the database, but:
- Only for a short period (not forever like banks).
- They must follow rules (like "no double-spending").
- We rotate who gets this power (not the same person every time).

**This is the elegant compromise:** Borrow hierarchy temporarily, but distribute it over time.

## Who Gets the Right to Write?

Okay, so we'll give someone temporary power to add transactions, to write new information to the database. But who?

**We can't just vote.** IDs here are created from home—Dave could run 500 fake identities and outvote everyone. One computer, one vote doesn't work when anyone can pretend to be 500 computers. Furthermore, we do not know each other, and we do not need to. How are you going to vote for anyone worthy of trust if you do not know them?

**We can't just pick randomly.** Same problem—if Dave runs 500 computers in a 700-computer network, he has a 500/700 chance of being chosen compared to 200 honest participants. He wins most of the time. What if he is evil? The evil wins most of the time? That is, by definition, not good.

**We need a different selection mechanism.**

## How Humans Choose Leaders

Throughout history, humans have chosen leaders based on **feats**:
- The brave hero who defended the village (courage demonstrated through action).
- The super-intelligent doctor who invented a cure (expertise demonstrated through achievement).
- The skilled craftsperson who built the best tools (competence demonstrated through work).

**Feats require:**
1. **Skill** - You need to know how to do something.
2. **Effort** - You need to actually do the work.
3. **Proof** - Others can verify you accomplished it.

You can't fake a feat easily. You can't claim to be a hero without fighting. You can't claim to have invented a cure without showing the working medicine. The feat itself is proof.

**What if we used this same natural principle for choosing who gets to write to the database?**

Require a feat—something that requires effort, can be verified, but can't be easily faked.

## The First Digital Feat: Proof-of-Work

In the physical world, feats involve courage, intelligence, or craftsmanship. In the digital world, what's the equivalent?

**Computation, run by electricity, energy.**

Computers do work by computing—running calculations, processing data, solving math problems. Some computations are easy (adding 2+2), while others are very hard (finding a specific pattern in billions of random numbers).

**Here's the idea:** To earn the right to write the next batch of transactions to the database, you must solve a difficult computational puzzle.

Not a puzzle that requires cleverness (that would favor smart people unfairly, and it is very hard to design). A puzzle that requires **brute force** would do better—trying billions of guesses until you find the right answer. This consumes real electricity, electricity that you could have used for something else, like warming your home or running your business. So, if you really want to use that electricity to earn the right to write to the database, you have to make a sacrifice. Will people agree that this sacrifice is worth it? Turns out they did, and still do.

But if they did not, even if you were following the rules and solving the agreed puzzle, all your effort and electricity would have been wasted. You, the worker and potential future leader, and the others have a mutual dependency on each other. I do the work, and I trust that you guys will value it. And vice-versa, you have proven to do the work, and I reward you by letting you write to the database and me using it. But remember, tomorrow it might be someone else, an evil one even, so you better follow the rules and keep working.

Not only do the database users depend on the miners, but the miners depend on the users finding the database useful too. Brilliant game theory dynamics at play here.

Miners are just a special name put on the computers on the network who are trying to solve these puzzles to earn the right of writing the next transactions to the database.

**Bitcoin's algorithm that showcases their interpretation of effort is called: Proof-of-Work.**

## The Puzzle

Let me explain the puzzle Bitcoin uses (simplified):

**The goal:** Find a number that, when combined with the transaction data and put through a hash function, produces an output starting with a certain number of zeros.

**What's a hash function?** Remember one-way functions from Chapter 7? A hash function is similar—it takes any input and produces a fixed-size output that looks random. Change the input even slightly, and the output changes completely.

**Example (simplified):**
```
hash("Hello")  = d3a1f2
hash("Hello!") = 9f4e7b  (completely different, and... unique too! if long enough)
```

The hash function is a one-way function that is also deterministic (same input always gives same output), but unpredictable (you can't predict the output without computing it).

Because hash functions are unpredictable and produce outputs of sufficient length, you can use them to generate IDs—the likelihood of two different inputs producing the same output is astronomically low. Designing a good hash function is not trivial, but for our purposes, we will assume Bitcoin's hash function (SHA-256) is good enough.

**The puzzle:**
```
Input: [Transactions + Previous Block + Random Number You Chose]
Output: Hash that starts with, say, 5 zeros (00000...)

Try:
hash([Transactions + Previous Block + 0]) = 3f2a8c... (nope, doesn't start with 00000)
hash([Transactions + Previous Block + 1]) = 7d1b5e... (nope)
hash([Transactions + Previous Block + 2]) = 5c8f2a... (nope)
...
hash([Transactions + Previous Block + 8,347,291]) = 00000f8a2c... (YES! Found it!)
```

The only algorithm to solve this is... brute force. Your only option is to try billions or trillions of random numbers until you find one that produces a hash starting with the required number of zeros.

**This is the feat.** It requires:
- **Effort:** Trying billions of guesses requires massive computational work (electricity, time, hardware).
- **Proof:** Once you find the answer, anyone can verify it instantly (just run the hash function once with your number).
- **Can't be faked:** You can't pretend you did the work without actually doing it, because the hash function is one-way. You cannot just have a value with 5 leading 0s and try to guess the input that created it.

## Why This Works

Let's see how Proof-of-Work solves our problems:

**1. Who gets to write?** Whoever solves the puzzle first. They earned the right through effort.

**2. Can Dave cheat with 500 fake identities?** No. Running 500 computers doesn't matter—what matters is computational power. If Dave has 30% of total computing power, he wins approximately 30% of puzzles, while honest participants with 70% of computing power win approximately 70% of the time. It's proportional to effort, not number of identities.

**3. How do we know they followed the rules?** When someone publishes their bunch of transactions (called a "block"), everyone else verifies:
   - Did they solve the puzzle? (Check the hash validity.)
   - Are all transactions valid? (Check signatures, check balances.)
   - No double-spending? (Check against the database.)

If anything is invalid, everyone rejects the block, all the new transactions, and does not update (synchronize) their database. The cheater wasted all that computational effort for nothing.

**4. How often does this happen?** Bitcoin adjusts a **target hash value** so a new block is found approximately every 10 minutes. On screen, this often looks like requiring hashes with **more leading zeros**. If more people join and computing power increases, the target gets lower (harder to meet). If people leave and computing power decreases, the target gets higher (easier to meet).

The reason you can "fix" the time it takes to mine (create) a block is because you can do some statistics to compute the expected time to find a solution based on the total computational power of the network. By adjusting the difficulty of the puzzle every 2016 blocks (approximately two weeks), Bitcoin ensures that, on average, a new block is found every 10 minutes. If you are interested in the math behind it, I encourage you to research online and dive deep on your own.

For now, let's demystify some terminology:
- **Mining:** The process of trying to solve the puzzle (running computations). A proof of effort to earn the right to write the next bunch of data on the distributed database you all share in the network.
- **Miner:** A participant who runs computers to mine (solve puzzles).
- **Block:** A batch of transactions plus the solution to the puzzle. Which, generally speaking, are a set of instructions on what to write next in the database.
- **Node:** A participant who maintains a copy of the database and verifies blocks (not necessarily mining). They can accept or reject blocks based on the rules that have been agreed upon. If the miner shares invalid blocks, nodes will reject them, and everyone will just have the same database state. Valid? Everyone updates the database adding the transactions in the order set by the temporary leader and thus all end up with the same state on the database.

## The Incentive: Mining Rewards

Wait—why would anyone spend electricity and money on expensive computers to solve these "useless" puzzles?

**Because there's a reward.**

Whoever solves the puzzle gets to:
1. **Create new coins** - Currently 3.125 Bitcoin per block (this halves every 4 years, eventually reaching zero around the year 2140, if the consensus does not change).
2. **Collect transaction fees** - Users can attach small fees to their transactions. The miner who includes them in a block collects all those fees.

**This is called mining.** Like gold miners expending effort to extract gold from the ground, Bitcoin miners expend computational effort to earn Bitcoin. And, as Bitcoin shares a good bunch of properties gold has, I guess that is why Satoshi Nakamoto called it "mining". But this is just the author's speculation.

**The incentive aligns perfectly:**
- Miners want rewards, so they follow rules (invalid blocks get rejected, wasting their effort).
- Miners compete, so they invest in more computing power (securing the network).
- As Bitcoin's value increases, more miners join, which means more security.

**Game theory in action:** It's more profitable to play honestly and keep the network running than to cheat.

## The Miracle of Bitcoin, the Wet Dreams of Nerds, Maybe

But wait... they get paid... in what? In bits? Indeed. In bitcoins! But no one cared about these bits initially. Indeed, here is where "the miracle" happened.

A group of people, likely computer science and anarchist "nerds" (said with love by the author, who is a nerd himself), decided to just spend their electricity and computing power on this "crazy experiment" of a decentralized digital currency. They believed in the idea, or they were just nerds having fun, and they were willing to invest resources into it.

Some people speculate it was the CIA or any other United States government agency trying to create programmable money to control the population. But as said, Satoshi Nakamoto disappeared from public view—his **last public forum post was in December 2010**, and his **last known private email was in April 2011**—and no concrete evidence has ever been found to support any theory about his/her/their identity or affiliation.

The author leans towards the nerds playing around—maybe CIA nerds on their weekends? Who knows. The thing is that the party went out of control, and slowly but surely, more people agreed on this digital coordination and consensus and started actually trading these bits with fiat money. And... boom! A new asset class was born.

It is quite poetic that the thing which is valuable precisely because people can use it without even knowing each other was created by someone who no one knows—in practice then, by no one. Therefore, poetically, we can dare to say that it was created by no one, and by all of us, at the same time.

But wait! As per all we've explained, we can still cheat the network. Notice that we did not say the word "blockchain" at all...

## Temporary Leadership

Notice what we've achieved:

- **Every 10 minutes,** someone earns the right to write the next batch of transactions to the database.
- **They have temporary authority** - But only for that one block. Then the race starts again.
- **Leadership rotates** - Whoever solves the next puzzle becomes the next temporary leader.
- **No permanent power** - No single entity controls the database forever... or does it? If someone has 51% of all the computational power, they will just be more likely to write more blocks, but they still have to follow the rules or everyone else will reject their blocks.

We've borrowed hierarchy temporarily, distributed it over time, and used effort as the selection mechanism.

**This is radically different from banks:**
- Banks: One entity has permanent control.
- Bitcoin: Temporary control, earned through computational work, rotating among thousands of participants.

## What We've Solved (Have We?) and What We Haven't

**What Proof-of-Work solves:**
- Who can write: Whoever solves the puzzle first.
- Sybil attacks: You need computational power, not fake identities.
- Ordering transactions: The winner decides the order in their block.
- Incentives: Miners are rewarded for honest work. Sybil attacks do not make sense for agents inside the network anymore.

**What we still need to address:**
- How are we explaining blockchain without the very blockchain structure itself? Why do we need it? (Next chapter.)
- What happens if two miners solve the puzzle at the same time? What happens if this happens often?
- How does this make history tamper-evident?
- What if a miner controls more than 50% of the computational power? Do they gain too many chances of having the right to write on the database?

## The Bigger Picture

Proof-of-Work is Bitcoin's way of selecting temporary leaders based on effort. It's not the only consensus mechanism, or consensus algorithm if you prefer. Ethereum, another "crypto," now uses Proof-of-Stake, which we'll explore later. But Bitcoin was the first to successfully solve the distributed synchronized database network problem without trusted middlemen, using consensus instead.

**The breakthrough:** Using energy (computational work) as a relatable and scarce resource between strangers to prevent Sybil attacks and align incentives.

**The trade-off:** Bitcoin uses a lot of electricity. This is controversial. But it's the cost of securing a monetary system without relying on governments or banks. Whether that trade-off is worth it is for society to decide.

For now, understand the mechanism: Proof-of-Work turns computation into authority. Temporary, rotating, earned authority.

And maybe you can start to see the general pattern: you need some "resource" to prove effort and earn others' respect, then you need some rules so you cannot really do whatever you want with the earned temporal power, and finally you need incentives so people want to play by these rules.

Doesn't this sound familiar? Doesn't this sound similar to a democracy? Or at least to a voting system? How can this be democratic if not everyone has access to great computational resources or cheap electricity? We will dive deeper into the implications of all this later in the book.

## What is a Blockchain, Really?

You can already actually know what all these fancy names are: Bitcoin, Ethereum, Solana, Cardano, etc.

For now I want to state that blockchain networks, cryptocurrency, or crypto are all horrible names. They hide the real nature of the technology.

But it is the name which has stuck.

These are better names for talking about this technology:
- **Consensus-based database networks.**

When someone says "blockchain," you can now understand that they are talking about a "consensus-based database network" where participants agree on the state of a shared database in a network.

In Bitcoin, the consensus mechanism is Proof-of-Work, but in practice, it can be ANYTHING—even a centralized consensus. An authoritarian consensus, an oligarchic consensus based on plutocracy where only the rich can write the next blocks. Etc.

Bitcoin users value the ability to compute hash computations really quickly as a difficult resource to get, which makes their rules impossible to break.

Ethereum started this way too and then changed their consensus for reasons we will explore later.

Finally, as humans we can just agree on distributed database states, and some of us think that is a good way to represent money.

Can we even write the laws on this database in such a way that no corrupted government can change them? Can we create a perfect voting mechanism that actually represents every citizen without tampered elections? How should we define the "effort" in the consensus for that? Should we even give so much power to the people if this is possible? Are we better in the hands of technocrats?

I would like the reader to feel empowered. Having the ability to coordinate with anyone about what constitutes valid data, valid information, eventually if you like, valid truth, is an incredibly complex and useful technological progress so we can better coordinate as a species.

And as uncle Ben said to Peter Parker: "With great power comes great responsibility." We must study, we must understand, we must be careful. Slowly but surely build things that matter and are useful for all of us.

For example, you can understand a casino as a coordination and as a consensus. People play consensual games in a casino and bet money. You can make your database represent a casino, set some rules, and allow anyone in the world to "gamble fairly" through the internet.

These casino-like applications are being the main thing that normal people find attractive and disgusting about "crypto".

Please, do not get blinded by the fancy names, do not get blinded by the people who use these beautiful database structures to scam others or enhance their gambling addictions.

There is a lot of potential for good and species' growth here. Like the one Bitcoin has, which I will explain later.

For now realize this: databases save data, you interpret the data, you and your neighbors give it meaning. Go ahead, coordinate with them, agree on truths without giving anyone excessive access to define the rules.

We will talk deeper about the implications of all this later in the book. But for now, it is essential to really understand what you are gaining and what actually all this technological progress is about.

## A Note on Satoshi's Thinking

I don't know if Satoshi Nakamoto (whoever he or she is or they are) thought of it this way while designing Bitcoin. Maybe he did, maybe he approached it differently.

But this is how the author of this book makes intuitive sense of the natural progression: We need coordination, so let's borrow centralization temporarily. We need fairness, so let's rotate leadership. We need Sybil-resistance, so let's require proof of effort. We need incentives, so let's reward the workers.

The pieces fit together elegantly.

---

**Key Insight:** To solve the distributed database problem, Bitcoin borrows centralization temporarily—giving one person at a time the right to write and order everyone's next transactions. But instead of picking leaders through voting (vulnerable to Sybil attacks) or random selection (also vulnerable), Bitcoin requires proof of computational effort. Whoever solves a difficult puzzle first earns the right to write the next block and receives a reward. This creates a rotating, temporary leadership where authority is earned through work, not granted by trust. Proof-of-Work aligns incentives: it's more profitable to play honestly than to cheat.

Next, we'll explore how these blocks are chained together over time, creating the blockchain structure that makes history tamper-evident, and we will keep diving deeper into important details and implications of this design.
