# Chapter 9: Money as Synchronized Bits

*If we can assign meaning to bits, why not assign them the meaning of money?*

---

You now understand that cryptography lets you create digital IDs from your home and prove your intent with signatures. You know that information is just bits, and humans assign meaning to those bits.

Here's the natural question: **Can we make bits mean "money"?**

The answer is yes. But first, let's understand what "money" actually needs to be.

## What Makes Something Money?

Throughout history, humans have used all sorts of things as money: salt (so valuable the word "salary" comes from it), shells (used across continents for millennia), gold and silver (heavy, but universally valued), paper bills (convenient, but only valuable because we agree, and taxes), and digital bank account numbers (just entries in a database).

**What do all these have in common?** They share certain properties that make them useful as money.

### Property 1: Scarcity (You Can't Create It Easily)

If I have 10 units of money, I can't suddenly have 11 without earning it, finding it with effort, or someone giving it to me.

**Examples:**
- Gold: Hard to mine, can't just create more.
- Dollar bills: Government controls printing (can't photocopy and use it).
- Salt (historically): Required effort to extract from sea water.

**Counter-example:**
- Leaves: Too abundant, everyone would be "rich".
- If anyone could create money freely, it would be worthless.

There are more philosophical and sociological reasons to justify that for something to be valuable it needs to be scarce. This book is not that much about social coordination but rather the explanation of how new technologies can be used for it. Therefore here I leave a simple intuition and argument explaining why value must have some degree of scarcity:

For something to be valuable it needs to be difficult to create and scarce. Money is the abstraction of value so we can coordinate trade. If someone could just gather 100 leaves and say "I now have power over what you have to do for me," the system breaks down. We would just gather leaves non-stop. In order to reward work that actually creates value, we cannot just give value to anything that exists in accessible abundance.

**For bits to be money:** We need rules preventing uncontrolled creation. The system must enforce hard-to-control scarcity.

### Property 2: Verifiability (You Can Prove What You Have)

If I claim to have 10 units, I need to be able to prove it to you, and you need to be able to verify it's real.

**Examples:**
- Gold: You can weigh it, test its purity.
- Dollar bills: Security features (watermarks, special paper).
- Bank account: You can check your balance, show a statement.

**Counter-example:**
- If I just say "I have 10 units of value," but can't prove it, you won't accept it.

**For bits to be money:** We need a way to check balances. Some shared record everyone can verify, look up, and preferably, instantly.

### Property 3: No Double-Spending (Can't Spend the Same Money Twice)

If I have 10 units and give them to you, I no longer have them. I can't also give those same 10 units to someone else.

**Examples:**
- Physical cash: Hand you a $10 bill, and I don't have it anymore.
- Gold: Give you the gold coin, and it's physically with you now.
- Bank transfer: Bank deducts from my account, adds to yours.

**Counter-example:**
- If I could spend the same $10 with you AND with Bob, money breaks.
- This is the tricky part with digital files (can copy infinitely).

**For bits to be money:** When I transfer them to you, those specific bits must no longer be "mine." The system must track ownership clearly.

### Property 4: Transferability (You Can Send It)

Money is useless if you can't give it to others in exchange for goods, services, or other money.

**Examples:**
- Cash: Hand it over, immediate transfer.
- Bank transfer: Send it electronically, through the internet we now understand.
- Gold: Can transport it (though heavy).

**For bits to be money:** We need a mechanism to change ownership. A way to say "these bits were mine, now they're yours."

### Property 5: Ownership (You Actually Control It)

You need to truly possess your money. Not just "have permission to use it" from someone else.

**Examples:**
- Cash in your pocket: YOU control it physically.
- Gold you're holding: YOU possess it.
- Bank account: Well... the bank actually controls it (you just have permission).

**The bank account problem:** You don't hold the money; the bank does. You trust them to give it back when you ask. They can freeze your account, deny access, or even go bankrupt. Your "money" is just their promise to you.

**For bits to be money:** Ideally, YOU control them directly. Like cash in your pocket, but digital.

### Property 6: Fungibility (Each Unit is Equivalent)

One unit of money should be the same as any other unit. They're interchangeable.

**Examples:**
- Dollar bills: Any $10 bill = any other $10 bill.
- Gold: An ounce of pure gold = any other ounce of pure gold (by weight and purity).

**Counter-example:**
- Unique collectibles: Each is different, not interchangeable.

**For bits to be money:** 1 unit of bit = 1 unit of bit. Doesn't matter which specific bits you have.

### Property 7: Divisibility (Can Break Into Smaller Parts)

Sometimes you need to pay less than 1 full unit. Money should be divisible.

**Examples:**
- Dollar: Can be divided into cents ($0.01).
- Gold: Can be cut or melted into smaller amounts.
- Bitcoin: Divisible to 8 decimal places (0.00000001 BTC, called a "satoshi").

**For bits to be money:** Should support fractions. Not just whole numbers.

### Property 8: Durability (Doesn't Disappear or Decay)

Money should last. If it degrades quickly, it's not useful for storing value.

**Examples:**
- Gold: Doesn't rust or decay (lasts forever).
- Coins: Metal endures for decades.
- Paper bills: Get worn out, but last a few years.

**Counter-example:**
- Food: Rots, can't be used as money.

**For bits to be money:** Digital information doesn't decay (can copy perfectly), but you need to make sure it doesn't get lost. If you lose access (lose your password/keys), it's gone.

## The Realization: Bits Can Have These Properties

Look at what we've learned so far:

**From Chapter 2 (Logos):** Humans assign meaning to bit patterns. We've assigned meaning to bits as letters (ASCII), bits as images (JPEG), and bits as music (MP3). Why not bits as money?

**From Chapter 7 (Asymmetric Cryptography):** We can create digital IDs (public/private keys) and prove ownership with signatures. This solves:
- **Ownership:** Your private key = your control (like cash in your pocket, digitally).
- **Transferability:** Sign a message saying "I send X to Bob" and it proves intent.

**What's missing?** The coordination part.

## The Database Problem

Think about it simply: if bits represent money, where do you store them?

Bits are information, and information needs storage. Information is stored in databases, which are ultimately those physical devices called transistors that have 2 possible states, each one representing a bit, like a door. But as we said, doors are very slow and clunky transistors. It is better to just use computers.

So we need a database—just a computer storing information in bits—that tracks who has how much money (balances) and who sent money to whom (transactions).

**Simple example:**
```
Database:
- Alice: 50 coins
- Bob: 30 coins
- Carol: 20 coins

Transaction:
- Alice sends 10 coins to Bob

New data (state) of the database:
- Alice: 40 coins
- Bob: 40 coins
- Carol: 20 coins
```

Easy, right?

## The Traditional Solution: One Database, One Controller

This is how banks work:

**The bank's database:**
- Stores everyone's balance.
- The bank controls the database.
- When you "send money," you ask the bank to update the database.
- Bank checks: Does Alice have 10 coins? Yes? Okay, update:
  - Subtract 10 from Alice.
  - Add 10 to Bob.
  - Done!

**This works.** One central point to look at, to interact with, centra-lized. But notice the problem:

**You don't control the money. The bank does.**

The bank can freeze your account, deny your transaction, or go bankrupt (your money disappears). You must trust the bank to maintain accurate records and give you access when you need it.

Remember **Property 5 (Ownership)**? You don't truly own your money. You have a balance in someone else's database.

## The Insight: Distribute the Database

Here's the idea: **What if we gave EVERYONE a copy of the database?**

Instead of one bank holding the records, Alice has a copy of the database, Bob has a copy, Carol has a copy, and thousands of other people have copies too.

**Now:**
- No single person controls it (de-centralized).
- Alice can verify Bob's balance herself (just check her copy).
- No one can secretly change the records (everyone would notice).

**This solves some problems:**
- **Verifiability:** Anyone can check anyone's balance.
- **Ownership:** No single entity controls access, just you and your private keys.
- **Transparency:** All transactions are visible.

**But this still has problems...** For example, it doesn't solve the double spending problem by itself. It does not have property 3 yet.

## The Consensus Problem

Here's where it gets tricky.

If everyone has a copy of the database, how do we ensure all copies stay synchronized as the data changes over time? Since the bits in our database are being interpreted as money, we can rephrase this: how do we ensure all copies stay synchronized as money is being transferred between people?

**Problem 1: Conflicting updates**
```
Alice sends 10 coins to Bob (signed transaction)
Bob receives it, updates his database: Alice: 10, Bob: 40

At the same time, Carol receives a different transaction:
Alice sends 10 coins to Carol (also signed by Alice)

Bob's database: Alice: 0, Bob: 40, Carol: 20
Carol's database: Alice: 0, Bob: 30, Carol: 30

Which is correct? They both have valid signatures, and in both Alice had 10 coins to spend when the transaction was received.
```

How do we prevent this? Who decides which transaction is valid? Both cannot be valid, because Alice would be double spending her 10 coins.

You can say, send it first to Bob and then to Carol, but what if the messages arrive at the same time? Remember we are on the internet—it is like the digital wild west, with no central authority to decide who gets to write first or receive the message first.

Well then let's create a consensus of always sending the messages in that order and we will not have problems? It might work for 3 people who trust each other, but for thousands of people who should not need to trust each other, how do we ensure everyone agrees on the same order of transactions?

```
1000 computers all have the database
Alice signs: "I send 10 to Bob"
Who gets to add this to the database?
Do all 1000 computers add it at the exact same time?
What if someone adds fake transactions? What if Alice tries to confuse the network holding the database so some get conflicting versions and she gets more money?
```

**Problem 2: Latency (Distance Delays)**

Even if everyone is honest, physical distance creates synchronization problems.

Imagine Alice lives 1km away from Bob, and Carol lives 10,000km away from both. Carol will pay Alice 5 coins, and Alice wants to buy something from Bob for 10 coins. Alice only has 8 coins, so she cannot buy it yet. But then Carol sends her 5 coins, giving Alice enough to buy from Bob.

```
                        Carol
                          *
                         /|
                        / | 
                       /  |  
                      /   |   
                     /    |    
                    /     |     
                   /      |      
                  /       |
                 /        |         
                /         |          
               /          |           
              /           |           
   ~10,000km /           /  ~10,000km     
            /           /                
           /           /                  
          /           /                    
         /           /                      
        /           /                       
       /           /                          
      /           /                            
     /           /                             
    /           /                                
   /  1km      /                                   
  *-----------*
Alice      Bob
```

Alice tries to transact with Bob, but information—even if traveling at the speed of electricity—takes time to cross the entire world, and there might be delays. Bob might reject Alice's transaction because in his database Alice only has 8 coins. But in Alice's database, because she has a better internet connection, Carol's transaction already arrived and she thinks she already has 8+5=13 coins.

Who is right? Both are honest, both are following the rules, but their databases are temporarily out of sync due to latency.

As you can see, whether it's out of malice and trying to double spend, or just the very nature of physically coordinating information across distances, distributing a shared database is a very difficult problem.

These are the fundamental questions:

## The Questions We Need to Answer

1. **How do you make sure ALL computers save the same balances?**
   - If everyone has a copy, they all need to agree.
   - How do we synchronize thousands of databases?

2. **How do you make sure no one transfers or creates money without permission?**
   - We have signatures (good), but how do you enforce network participants check them?
   - What if someone tries to spend money they don't have?
   - What if someone tries to spend the same money twice?

3. **How do you reach consensus on how and with what limits to write in this shared database?**
   - Who gets to add new transactions?
   - How often do we carry updates?
   - What rules must everyone follow?
   - How do we enforce those rules without a central authority?

**This is the consensus problem.**

And solving this problem—enabling thousands of strangers to maintain an identical database without trusting any single authority—is what makes Bitcoin and other cryptocurrencies possible. It is, as you can see, a very hard problem.

## Historically Speaking

For thousands of years, humans used physical objects as money. Salt was valuable because it preserved food (essential for survival). Shells were rare, beautiful, and hard to counterfeit. Gold was scarce, didn't decay, had universally agreed value, and was divisible. Paper was convenient but required trusting the issuer (government and bank). Each era found something that worked for the technology and trust models of the time.

**Physical money** had built-in scarcity (hard to create) and ownership (possession = ownership).

**Digital money** with banks worked by trusting a central authority to maintain the accounting and to maintain money's value stable.

**But consensual synchronized bits**—distributed across thousands of computers, with no central authority, where YOU control your money with cryptographic keys—this is new.

It's only possible because we (Satoshi, whoever he, she is or they are) solved the consensus problem. [FACT CHECK: "Satoshi solved the consensus problem" - While Satoshi's Bitcoin whitepaper presented a novel solution to the Byzantine Generals Problem for digital currency, the framing of "solved the consensus problem" may be overly broad, as consensus mechanisms and their trade-offs are still actively researched]

---

**Key Insight:** Money is just information we agree has value. Bits can represent money if they have the right properties: scarcity, verifiability, no double-spending, transferability, ownership, fungibility, divisibility, and durability. We can store this information in a database and distribute copies to thousands of computers. But to make it work, we need to solve a hard problem: How do thousands of strangers agree on the same database state (data) without trusting any central authority? That's the consensus problem—and that's what we'll explore next.

By the way, when I say state it means the same as the current data in a database, the current information the database holds.

Next, we'll see how **consensus mechanisms** solve these problems. We'll understand Proof-of-Work, mining, and why the blockchain structure makes history tamper-evident. The pieces are coming together.
