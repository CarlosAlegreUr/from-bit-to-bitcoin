# Chapter 11: The Blockchain - Chaining History Together

*What happens when two miners solve the puzzle at the same time?*

---

At the end of Chapter 10, we left a critical question unanswered.

We've established who gets to write to the database (miners who solve puzzles), when they write (every 10 minutes), and why they follow rules (incentives align). But we haven't addressed a fundamental edge case: **what happens when two miners solve the puzzle at the exact same time?**

## The Simultaneous Solution Problem

Imagine we all have synchronized databases showing the same balances at Block 100. (Remember, Block 100 just means we've agreed 100 times on the next state of the database—in Bitcoin's case, each state transition involves subtracting some balances and adding others based on transactions.)

```
Current state (Block 100):
- Alice: 50 coins
- Bob: 30 coins
- Carol: 20 coins
```

Now picture two miners, Miner A and Miner B, both solving the Proof-of-Work puzzle at nearly the same time. They both found valid solutions, they both did the work, and they both deserve the reward.

**Miner A shares with the network Block 101a:**
```
Block 101a:
- Transaction: Miner A receives a reward as per incentive rules, let's say 10 coins
- New balances: Alice: 50, Bob: 30, Carol: 20, Miner A: 10
```

**Miner B shares with the network Block 101b:**
```
Block 101b:
- Transaction: Miner B receives a reward as per incentive rules, let's say 10 coins
- New balances: Alice: 50, Bob: 30, Carol: 20, Miner B: 10
```

Both blocks are valid—both miners followed the rules, and both completed the Proof-of-Work.

**Now the nodes have to decide: which block should they accept?**

Some nodes receive Block 101a first and update their databases accordingly, while other nodes receive Block 101b first and update to that version instead. **The databases are now de-synchronized.** Half the network thinks one miner received the reward, and the other half thinks a different miner did.

## The Impossible Choice

Here's the dilemma we face:

**If we choose Block 101a:**
- We reject Miner B's work, even though he was honest and did the work.
- We break the consensus rule that says "whoever solves the puzzle gets to write."
- Why would anyone participate if their honest work can be rejected arbitrarily?

**If we choose Block 101b:**
- We reject Miner A's work, even though he was also honest.
- Same problem—we're breaking the rules.

**If we accept both:**
- The database state becomes inconsistent.
- Half the network has different balances than the other half.
- The entire point of consensus—everyone agreeing on the same state—is lost.

**If we let the database desynchronize:**
- The system becomes useless because different people see different truths, different data. Never forget: all is just data, and what matters is how we interpret it.
- If we're interpreting that data as money, it becomes worthless if we can't agree on who has what.

**If we break the rules:**
- The consensus is broken.
- The very rules that make people choose the system and find it valuable are violated.
- The system becomes valueless.

**This is a real problem**—not just because of the potential for a malicious actor to rewrite history (we'll get to that), but also because honest participants creating valid blocks simultaneously can cause the network to diverge and lose synchronization.

## The Elegant Solution: Let Them Compete

Both miners proved they did the work, and we can't choose one without being unfair.

So here's Bitcoin's answer: **Don't choose yet. Let them compete for one more round. Let's see who can sustain their effort.**

**The rule:** When two valid blocks appear at the same time, don't reject either immediately. Instead, see which one gets extended first.

**How it works:**

1. Some nodes accept Block 101a, others accept Block 101b.
2. Miners start working on the next puzzle (Block 102).
3. Some miners build on top of Block 101a, others build on top of Block 101b. Remember that the puzzle depends on the previous block's data, so they must choose one to build on.
4. Whichever block gets extended first (has another block built on top of it) wins.

**Example:**
```
           +- Block 101a (Miner A) <- Miner C starts building here
Block 100 -+
           +- Block 101b (Miner B) <- Miner D starts building here
```

A few minutes later, Miner C solves Block 102a (building on Block 101a):

```
           +- Block 101a -> Block 102a  (this "chain" is now longer)
Block 100 -+
           +- Block 101b  (this chain is shorter)
```

**Now the decision is clear:** the chain with Block 101a is longer, which simply means more effort has been put into solving puzzles to create it. Following our consensus of effort, we should pick that one.

All nodes switch to the longer chain, and Block 101b is abandoned. Miner B's work is discarded, but that's okay—the decision was made by playing by the very same consensus of effort. In Bitcoin's case, that's the consensus that quick hash computations represent a valid feat of effort.

The transactions from Block 101b that weren't included in Block 101a go back to the "mempool" (like a waiting room for transactions) and will be included in future blocks if they're still valid.

Okay cool, we solved it! We can now move on and keep synchronizing the database even when there are ties.

But what if they tie again, and again, and again? In general terms, what if the consensus consistently gives us two valid winners worthy of the right to write to the database? If we want to create a robust system, we can't just hope for the best and assume this will never happen. So...

## For How Long Do We Keep Doing This?

The answer isn't a general one—it's specific to the consensus mechanism you use in your consensus-based database network.

Remember, I think "blockchain networks" is a really bad name, so from now on in this book, I'll call them consensus-based database networks, or just consensus database networks, or even just CDN (Consensus Database Network).

**The answer for Bitcoin's consensus:**

The chain that accumulates the most Proof-of-Work wins. Since the puzzle miners are solving is truly random, eventually one chain will get ahead—and that can only be caused by the fact that those miners have put greater amounts of effort into it. The longest chain represents the most computational effort, and that's the one everyone accepts.

**This is called the "longest chain rule."**

The explanation of why one chain eventually gets ahead has been simplified here. If you're curious, Satoshi Nakamoto's original whitepaper has a more formal explanation of why this works.

When there are multiple competing versions of the database, nodes follow this simple rule: **Accept the longest valid chain (consensus-iteration).**

Since we now have a new rule to account for, we have to describe it with new data. Now we need to store in our database not only people's balances but also how many steps of effort have been put into the database.

A naive approach would be to simply store a counter—a small number of bits that counts how many iterations of effort (blocks) have been added. But this is easily hacked.

How do you track iterations in a way that can never be faked? You can't simply assume the next valid block will be Block 101, because what if someone comes along and says, "Hey, I found a valid database where no one has double spent, all transactions are valid, and it says Block 102"? It might be that someone actually put more effort into the database and found 2 more blocks while you weren't paying attention.

But it could also be that 2 miners found a valid solution at the same time, and one was honest saying "the next block is 101," while the other was cheating saying "the next block is 102." If people see 102, they'll think more effort was put in there, and they'll all accept it.

The second miner has just bypassed the system and tricked everyone into thinking more effort was invested when it really wasn't.

Why was he able to achieve this? Because there's no link between each step we take in the database—anyone can just claim whatever they want about the next number.

We need a more clever way of representing which iteration we're on, a way that can't be cheated. A way in which no one can reinvent either the future or the past data of our database. A way in which no one can say, "We're suddenly in the future, guys" (higher iterations).

And here is where we finally introduce the blockchain data structure—a data structure that makes it impossible to fake time.

But before giving you this last core piece of the puzzle, let me clarify something important: Finality.

## Understanding Finality

Finality is a technical term we use to define how much time has to pass before an iteration of our database is considered final—meaning it can never be changed again by anyone, ever.

The time to finality depends on the consensus you're using in your consensus-based database network. In Bitcoin, finality is probabilistic: the more blocks built on top of a given block, the more secure that block becomes.

After 6 blocks (about 1 hour), the probability of rewriting that block becomes astronomically low, so for practical purposes, we consider it final. [FACT CHECK: 6 blocks = ~1 hour for Bitcoin finality - verify this is still the standard recommendation]

In other CDNs, like Ethereum, finality is achieved through different mechanisms. In Ethereum's case, it takes about 12-15 minutes to consider a block final. [FACT CHECK: Ethereum finality time of 12-15 minutes - verify post-merge finality timing]

This means that in a CDN, once finality is reached, no one will ever be able to change that data—even if they have 51% of the computational power in Bitcoin's case.

The property of finality is also enabled by the blockchain data structure, and different CDNs have different finality times.

## Now, What Is a Blockchain, Actually?

It's simply a very clever way of storing which iteration of this never-ending tale of writing to our common database we're on—in a way that guarantees no one can cheat about it.

As you can see, the blockchain is actually just another piece of the entire system we're building up. It's a piece of engineering that fits into our machine.

Imagine calling automobiles "combustion engine transportation machines." The engine is just a piece of the entire transportation system. What matters is its usage, which is why we use the word "automobile" (auto: by itself, mobile: moving) rather than "combustion engine transportation machine"—that would be too technical and not very useful.

The term "blockchain network" has a similar problem: it's too technical and not very descriptive. The industry has been using "blockchain network" for too long. At the very least, I prefer to say: A blockchain network is a consensus-based database network that uses the blockchain data structure to prove its history.

Being honest with myself, "consensus-based database network" is also too technical for most people. But at least it describes what these systems actually do, which is more important.

Normal people understand the word "data" pretty well—after reading this book, you understand it even better. People also understand "synchronization." So here I propose calling this entire class of technology **Datasync Technology** instead of Blockchain Technology.

To be honest, you won't learn any new functionality from here on in this chapter.

The blockchain data structure is just a way of storing the counter—and also the transitions of data in our database's history—in a tamper-evident way. This ensures everyone knows which iteration we're on, which one comes next, which one came before, and that no one can cheat about any of it.

During the rest of the chapter I'll explain intuitively how this works, but this is more of a computer science topic than an "understand the usage of new technologies" one—which is what this book tries to focus on mainly.

I'm trying to explain as few technical details as possible while still giving you a true understanding of how these systems work.

---

## Optional: For the Curious (You Can Skip This)

**If you're more interested in the societal and practical implications of consensus-based database networks than in the computer science behind them, feel free to skip to the next chapter.**

The rest of this chapter dives into the technical details of how the blockchain data structure works—it's fascinating, but not essential for understanding the bigger picture of what these systems enable.

If you stay, we'll explore data structures, memory, pointers, linked lists, and finally put it all together to see exactly how a blockchain prevents cheating.

**-> Continue reading if you're curious about the technical details, or skip to Chapter 13 for the next big topic.**

---

**Key Insight:** When two miners solve puzzles simultaneously, we can't choose one without breaking consensus rules. The solution: let both chains compete, and accept whichever gets extended first (the longest chain rule). To prevent cheating about which iteration we're on, we use the blockchain data structure—a tamper-evident way of storing history. This enables a system where the past cannot be silently rewritten, and everyone can verify they're on the same database iteration. We call this entire class of technology **Datasync Technology**—systems that synchronize data across thousands of computers without central control.

Next, we'll explore what these systems enable at a societal level—how they change power dynamics, enable new forms of coordination, and why this matters for the future. The foundation is complete. Now we understand the implications.
