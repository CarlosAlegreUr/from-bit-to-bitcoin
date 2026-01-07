# Chapter 14: When Consensus Splits - The Nature of Agreement

*What happens when not everyone agrees?*

---

We've learned that consensus is social. Ethereum switched from Proof-of-Work to Proof-of-Stake because the community agreed, and the network evolved accordingly.

But here's the question: **What happens when the community doesn't agree?**

What if half the participants want to go one direction, and the other half wants to go another?

**This has happened. Multiple times.**

## The Fundamental Question

Remember what we learned: CDNs work because everyone runs the same code and agrees on the same rules.

But code is just software. Anyone can copy it. Anyone can modify it. Anyone can run their own version.

When a significant portion of a community disagrees on which code to run, we get what we call a **fork**. Think of it as a bifurcation in the road—two cars driving towards that split can choose different paths, and from that point on, they're traveling on different roads, heading in different directions towards different worlds, poetically speaking.

At a technical level, nodes simply start rejecting blocks that don't follow their version of the rules. Miners start mining on the version they prefer. Users start transacting on the version they trust. The result? Different databases with different data for every group running different software.

A blockchain, as you know from chapter 12, can be visualized as a chain of blocks:

```
Block 1 -> Block 2 -> Block 3 -> Block 4 -> Block 5...
```

What happens when the next state of the database differs between groups? Well, our cute drawing of the blockchain has to be drawn with a split in two—it forks, bifurcates:

```
                                     -> Block 6a -> Block 7a (ETH chain)
                                   /
Block 1 -> Block 2 -> ... -> Block 5
                                   \
                                     -> Block 6b -> Block 7b (ETC chain)
```

This is what happens now:

**So what stops the network from splitting into multiple incompatible versions?**

The short answer: Nothing.

The long answer: Let me tell you two stories.

## Story 1: The Ethereum Fork - Code Is Law vs. Protect The Ecosystem

In 2016, something unprecedented happened on Ethereum.

### The DAO: A $150 Million Experiment

Someone created a smart contract (program) called "The DAO" (Decentralized Autonomous Organization). It was essentially a venture capital fund designed to gather money from investors, but run entirely by code.

People sent money (ETH) to this contract, and token holders voted on which projects to fund. No CEO, no board of directors—just code enforcing rules.

**It raised $150 million worth of ETH.** At the time, that was about 14% of all Ethereum in existence. [FACT CHECK: 14% of all ETH - verify this percentage against historical records]

Everyone was excited. This was the future! Decentralized organizations!

Then, someone found an error in the code—a bug.

### The Hack: $50 Million Stolen

On June 17th, 2016, an attacker exploited a vulnerability in The DAO's code. [FACT CHECK: June 17th, 2016 - verify exact date of DAO hack]

The bug allowed them to repeatedly withdraw funds without the contract properly updating the balance—like an ATM that gives you money but forgets to subtract it from your account.

**$50 million worth of ETH was drained.**

The attacker didn't "hack" Ethereum. They didn't change any consensus rules. They just found a flaw in the smart contract code and exploited it—perfectly legally according to the code itself.

If you write code that sends me money but forget to put a limit on how much it can spend, well, that's not technically my fault. The actual hack was more complex than this, but you get the idea of a code error:

```solidity
code IAmAliceAndHeIsNotPayingBack() {
    sendMoneyBackToAlice(100$);
    moneyIOweToAlice = -0$;
}
// This pseudo-code subtracts nothing from the debt, allowing infinite withdrawals to Alice. Oh no!
```

**In the DAO hack, the code did exactly what it was programmed to do.** The attacker just understood the code better than its creators and recognized an error in its programming.

Remember from the previous chapter: programs on the chain have their own rules, and if you want to override them, you can't do it without completely changing the state of the database—which leads to people having different states and rejecting each other's blocks.

### The Dilemma: Two Incompatible Philosophies

The Ethereum community faced a choice, and both options had strong, internally consistent arguments:

**Option 1: Code is law. Let it stand.**
- The attacker followed the code's rules (even if unintended).
- Reversing this sets a dangerous precedent: it signals that breaking base consensus is okay if someone messed up programming on top of it.
- Who decides what's a "legitimate" transaction vs. a "hack"? In this case it was clearly a hack, but what about future cases? These distinctions can get very tricky.
- If we can reverse this, we can reverse anything.

**Immutability matters more than the money because it signals we are honest to our consensus and therefore reliable.**

Imagine a country with a very unstable legal system where laws can be changed retroactively and quickly. No one would want to do business there. What if one afternoon, out of the blue, your bank account is emptied because of a new law that says "all money in banks from X type of companies now belongs to the state"?

**Option 2: This hurts the ecosystem. Fix it.**
- $50M represents real people's money.
- The attacker exploited a clear error in the code, not legitimate behavior.
- If we don't fix this, trust in Ethereum collapses. What will people think? Will they understand the nuances between smart contract bugs and network-level agreements? Ethereum was just one year old at the time, and people were still learning what it was.
- We can fork—rewrite history to undo the hack.
- **Pragmatism matters more than ideology.**

Both sides had valid points. Both were internally consistent. Both reflected real values.

**This wasn't a technical problem. It was a philosophical disagreement about what Ethereum should be.**

Should Ethereum be a platform where **code is absolutely law**, even when that leads to theft? Or should it be a platform that **protects its users**, even if that means breaking immutability?

### The Vote: 85% vs. 15%

The community held a vote (via a signaling mechanism—not binding, but indicative).

**85% voted to fork** — reverse the hack, give people their money back.

**15% voted against** — keep the chain as-is, honor "code is law."

The tension was palpable. Both sides felt they were fighting for the soul of Ethereum. Both sides believed they were right.

So Ethereum forked.

### The Split: Two Ethereums

At block `1,920,000`, the network split into two separate chains: [FACT CHECK: Block 1,920,000 - verify exact block number of ETH/ETC split]

**Ethereum (ETH):** The majority chain, the one still running as "the main one" today. It reversed the hack and returned the stolen funds. The community chose pragmatism under the promise of never doing it again—and so far they've kept that promise, even with hacks of 1.5 billion dollars recently. [FACT CHECK: $1.5 billion recent hack - verify this figure and which hack is referenced]

**Ethereum Classic (ETC):** The minority chain. It kept the original history, honored immutability, and chose ideology.

**Both are valid CDNs.** Both are still running. Both have value. Both have communities.

As of today:
- Ethereum (ETH): ~$200 billion market cap. [FACT CHECK: ETH market cap - verify current figure]
- Ethereum Classic (ETC): ~$3 billion market cap. [FACT CHECK: ETC market cap - verify current figure]

The market voted with its money. The majority won economically. But the minority still exists.

Now that you know a bit of the technical processes behind forks, let me explain what happened in practice:

At block `1,920,000`, some nodes chose to follow the ETH chain, accepting a new block with a special transaction returning the hacked funds. Others chose to follow the ETC chain, rejecting that block and continuing with the original rules.

Miners split. Developers split. Users split. Exchanges had to decide which chain to call "Ethereum" and which to call "Ethereum Classic."

The community was divided, but both could coexist.

### Be Careful, The Past Can Haunt You

Remember the blockchain data structure? Its power can clearly be seen here. This isn't just a story—**it's recorded history.**

Go look at block `1,920,000` on both chains. You'll see the fork. You can trace the stolen ETH. You can see where it went on each chain.

**On Ethereum (ETH):** The funds were returned.

**On Ethereum Classic (ETC):** The attacker kept them.

No one can hide this. No one can rewrite it. The current ETH blockchain preserves the disagreement forever. It will always display how the community broke consensus for one iteration, even if afterwards they resumed using the very same consensus rules.

As the newer generations would say:
**This is the anti-gaslight machine in action.**

For anyone reading this who doesn't know what gaslighting is: Gaslighting is a form of psychological manipulation in which a person or group makes someone question their own memory, perception, or sanity. For example, in a toxic relationship, one partner might repeatedly deny events that the other clearly remembers, making them doubt their own recollection and feel confused or crazy.

In this case, the blockchain prevents gaslighting by making the history of disagreements public and verifiable. No one can say "that never happened." The data is there, forever—until the last node turns off, anyway. There are some nuances to that, but you get the idea. I encourage you again to research if you're curious.

## Story 2: Bitcoin vs. Bitcoin Cash - The Block Size War

In 2017, Bitcoin faced its own split.

### The Problem: Bitcoin Is Slow

Bitcoin processes approximately 7 transactions per second. Visa processes around 24,000. [FACT CHECK: Bitcoin 7 TPS vs Visa 24,000 TPS - verify these figures]

As Bitcoin grew popular, transaction fees skyrocketed and wait times increased. It was getting expensive and slow.

**Why so slow?** Because every node processes every transaction, and Bitcoin's protocol limits block size to 1 MB (megabyte).

A megabyte (MB) is 1 million bytes. A byte is 8 bits. So 1 MB = 8 million bits.

Block size is like the maximum amount of data you can change in the database in each iteration. Each change of balances (a transaction) writes and deletes some data, so there's a limit to how many transactions can be processed at a time.

If you can only write 8 million bits per iteration, and each iteration takes 10 minutes (Bitcoin's target), you're limited in how many transactions you can fit.

### The Debate: Bigger Blocks vs. Keep It Small (size matters)

Once again, the community split into two camps with valid but incompatible visions:

**Team Big Blocks:**
- Just increase the block size.
- Allow 8 MB blocks instead of 1 MB.
- More transactions per block = faster, cheaper.
- We need to scale now to compete with Visa.
- Bitcoin should be usable for everyday payments.

**Team Small Blocks:**
- Bigger blocks = fewer people can run nodes (because they'd need more storage and bandwidth to handle the increase in data).
- Fewer people running nodes = more centralization.
- Centralization defeats the purpose of Bitcoin.
- Increase transaction capacity with Layer 2 solutions instead (like Lightning Network). Don't worry, we'll touch on what a Layer 2 solution is later in this book.
- Bitcoin should be a settlement layer, not a payment network.

Again, both sides had valid points. Both reflected different values about what Bitcoin should be.

One side prioritized **accessibility and low fees**. The other prioritized **decentralization and security**.

### The Fork: Bitcoin vs. Bitcoin Cash

The community couldn't agree.

So on August 1st, 2017, Bitcoin forked: [FACT CHECK: August 1st, 2017 - verify exact date of BCH fork]

**Bitcoin (BTC):** Kept 1 MB blocks. Focused on decentralization. Developed Layer 2 solutions.

**Bitcoin Cash (BCH):** Increased to 8 MB blocks (later 32 MB). Focused on transaction throughput.

Both still exist. Both have communities. Both have different visions for what "Bitcoin" means.

**Market values:**
- Bitcoin (B): ~$800 billion. [FACT CHECK: BTC market cap - verify current figure]
- Bitcoin Cash (BCH): ~$10 billion. [FACT CHECK: BCH market cap - verify current figure]

Again, a majority clearly won economically. But the minority chain survives.

## The Pattern: Technology Enables, Humans Decide

Notice what's happening in both stories:

### 1. Technology Enables The Fork

The code is open source. Anyone can copy it. Anyone can modify it. Anyone can run their own version.

**Forking is trivially easy from a technical standpoint.** Just change a few lines of code, announce it, and see who follows.

The blockchain data structure makes it easy to prove where the split happened. The open-source nature makes it easy to copy and modify.

### 2. Humans Decide The Outcome

But which fork has value? That's not a technical question—it's a social one.

**People vote with their participation on the network and with their money:**
- Which nodes do miners point their hardware at?
- Which chain do developers build on?
- Which coin do exchanges list?
- Which coin do users buy and hold?
- Which fork do people value?

The answer determines which fork "wins" economically (though both can survive).

In both Ethereum and Bitcoin's case, the majority chain won the economic battle decisively. But the minority chains didn't disappear—they found their own communities who valued their principles.

### 3. Blockchain Makes Disagreement Auditable

In traditional systems, disagreements can be hidden, censored, or rewritten.

**In CDNs, the disagreement is permanent.**

Thanks to the immutability property of the blockchain data structure, you can see exactly when the fork happened. You can trace which users went which direction. You can verify the history yourself.

No one can say "that never happened." The data is public.

This creates a permanent, auditable record of every major disagreement in the network's history.

## Forks Are Civil Wars, Kind Of

When communities disagree fundamentally, they can split.

At first, forks sound bad. "The network split! Isn't that a failure?"

Not really. **Forks are proof that coordination is voluntary.**

You might think: "Wouldn't it be better if everyone just agreed? Wouldn't that make us stronger? We're weaker divided—that seems bad."

That's a totally valid point of view. Here's where ethics comes into play, and we realize that ethics aren't objective.

**Are forks bad or good? It depends on your values and the context in which they happened.**

If you value unity and strength through scale, forks look like failures. The community is weaker divided.

If you value freedom and the ability to exit, forks look like successes. The minority has power.

If you value immutability above all, the ETH fork was a betrayal. If you value pragmatism and protecting users, it was a necessary intervention.

If you value accessibility, Bitcoin Cash's bigger blocks make sense. If you value decentralization, Bitcoin's small blocks make sense.

**There is no objectively correct answer.** This is philosophy, even politics if you will—not mathematics.

### You Can't Force Global Consensus

No one can make you run specific code. No one can force you to agree.

Well, if all the nodes are in one country, that country's military might be able to... but most CDNs are global and distributed across countries that don't necessarily like each other.

If 85% want to reverse a hack, the 15% can say "no" and keep the original chain alive.

If you disagree strongly enough, you can fork. And if enough others agree with you, your fork survives.

**This is a technology of collective freedom.** The freedom for any community to use the technology that better suits their interests.

#### How Many People Do You Need To Fork?

Just 2.

As long as you have a group—meaning at least 2 people—you can both run your own version of the code on the database and convince others to use it. As long as you have at least 2 people, you have consensus among yourselves and can run your own version of the code.

Is that economically sustainable? Do you two have enough money to run the computers even if no one is willing to pay to write data on your database? If yes, you can run your own version of the code and create your own "digital society," your own CDN. If not, well, you'd better find users willing to pay for your services.

Or threaten them, who knows? Never forget the dark sides of human nature. But don't be too paranoid either. In balance we find virtue, Aristotle would say.

But who am I to tell you what to do? No one—the same way I'm no one to tell you what consensus to run on your computer.

### History Of Disagreement Is Preserved

Governments rewrite history textbooks. Corporations delete embarrassing records. Centralized platforms ban dissenting voices.

**CDNs, because they use blockchains, can't do this.**

The Ethereum/Ethereum Classic split is visible forever. Anyone can study it. Anyone can learn from it.

Future generations will see:
- What was the disagreement about?
- Who voted which way?
- What were the arguments?
- How did the market react?

**No one can censor this.** The blockchain makes disagreement permanent and auditable.

## The Deeper Realization: From Two Societies To Many

If consensus can split into two societies (ETH/ETC, BTC/BCH), can it split into many?

**Yes.**

You could have:
- Ethereum (pragmatic, majority chain).
- Ethereum Classic (ideological, immutability-focused).
- Ethereum [New Fork] (experimenting with different features).
- And more...

Each fork is a mini-society with its own rules, its own community, its own values.

## Enough Division—Why Not Unite?

**Here's a provoking thought:** What if instead of splitting entirely, we created mini-societies that coordinate with a larger mega-society?

What if we had:
- A main chain (slow, secure, expensive, global consensus).
- Many side chains (fast, cheap, specialized, local consensus).
- All coordinating together when needed.

Like the United States:
- Federal government (slow, secure, final arbiter).
- 50 state governments (fast, local, specialized).
- Both working together.

Or something "slightly" different, like the European Union:
- EU (coordination layer, shared rules).
- 27 nations (sovereign, independent, specialized).
- Both respecting each other.

**This is Layer-2 scaling.** And it's the topic of our next chapter.

Very summed up and leaving details behind, for now:

Layer-2s are simply CDNs that communicate with another CDN, sharing data when needed but having their own rules and code to run on their own.

Instead of complete separation (like forks), Layer-2s maintain connection while allowing independence. Best of both worlds.

## What This Means For Anyone

Forks teach us something profound:

**Software consensus is not something you enforce. It's something you choose.**

You can't force people to agree. You can only:
- Make your case.
- Write your code.
- See who follows.

**The network is, ultimately, the people who chose it.**

Code is just a tool. People decide which tool to use.

If enough people disagree, the network splits. And that's not necessarily the end of the world, since both versions can coexist.

**This is what decentralization really means:** No single entity decides for everyone. Groups do, starting from the smallest one—2 people.

This is not individual freedom, but collective freedom. A technology that allows any collective to coordinate their information in the way they please.

## The Anti-Gaslight Machine, Upgraded

We've been calling blockchain "the anti-gaslight machine" because it prevents rewriting history.

But now we see something deeper:

**You can't prevent consensus from changing.** People will always disagree. Forks will happen.

**But you can prove when and how it changed.**

If a majority tries to rewrite history, the minority can fork and preserve the original.

If a government tries to censor a transaction, users can fork and keep it visible.

If developers try to impose new rules, users can reject them and stay on the old code.

**No one has absolute power. Everyone has the power to exit.**

This is a fundamentally new social structure that enables instant voluntary data coordination with permanent records of disagreement.

The blockchain doesn't prevent conflict—it makes conflict visible, auditable, and survivable.

---

**Key Insight:** Forks happen when communities disagree fundamentally about values and direction. Are they good or bad? It depends on your values and context. The Ethereum fork (DAO hack) split over pragmatism vs. immutability. The Bitcoin fork (block size) split over accessibility vs. decentralization. Both sides had valid arguments—this is philosophy, not math. Technology makes forking easy (copy code, run your version), but humans decide the outcome (which chain has value). The blockchain makes disagreement permanent and auditable—you can verify exactly when/how it happened. Forks prove coordination is voluntary: you can't force consensus, only choose it. With as few as 2 people, you can fork. The anti-gaslight machine upgraded: you can't prevent change, but you can prove when it changed and preserve alternatives. No one has absolute power—everyone has the power to exit. But what if instead of complete separation, we coordinated at multiple levels?

Next, we'll explore Layer 2 scaling solutions—mini-societies that coordinate with larger mega-societies. Like US states and federal government, or EU nations and the EU. Nested consensus, societies within societies, all working together. This is how CDNs scale without forcing everyone to split completely.
