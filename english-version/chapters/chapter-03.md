# Chapter 3: Algorithms - Following Rules

*Computers don't think. They follow recipes, very fast, very precisely.*

---

We've established that bits are just patterns, and we assign meaning to those patterns through agreed-upon mappings like ASCII. But how do computers actually *do* anything with this information?

The answer: **algorithms**. Fancy word, simple concept. An algorithm is just a set of instructions—a recipe for solving a problem or completing a task.

## The Recipe Analogy

Think about making a peanut butter and jelly sandwich. Here's the algorithm:

```
1. Get two slices of bread
2. Get peanut butter jar
3. Get jelly jar
4. Get a knife
5. Open peanut butter jar
6. Dip knife in peanut butter
7. Spread peanut butter on one slice of bread
8. Clean knife
9. Open jelly jar
10. Dip knife in jelly
11. Spread jelly on the other slice of bread
12. Put the two slices together
13. Done!
```

That's an algorithm—a sequence of steps that, if followed exactly, produces the desired result.

**The key property:** If you follow the same steps with the same ingredients, you get the same sandwich every time. This is called being **deterministic**: same input leads to the same output, always. Think of input as "initial information" or "initial symbols," and think of output as "final information" or "final symbols."

Computers work the same way. Give a computer an algorithm and some input data (from now on, if you read the word "data" you can also think of it as "information"), and it will execute the steps exactly as written, producing the same output every single time. And if not? Well, you've been hacked, or you should contact your computer's manufacturer—they messed up some transistor or cable or other physical component.

## A Simple Algorithm: Binary to Letters

Let's write an algorithm that takes binary data and converts it to text using the ASCII table we learned about in Chapter 2.

**Input:** A string of bits (e.g., `01001000 01001001`)

**Output:** Human-readable text (e.g., "HI")

**Algorithm:**

```
Step 1: Split the input into groups of 8 bits
        01001000 | 01001001

Step 2: Convert each group from binary to decimal
        01001000 = 72
        01001001 = 73

Step 3: Look up each decimal number in the ASCII table
        72 = H
        73 = I

Step 4: Put the letters together
        Output: "HI"
```

That's it. Four steps. Follow them precisely, and `01001000 01001001` becomes "HI" every time.

**Your computer does this billions of times per second.** When you open a text file, load a webpage, or read this sentence, your computer is running algorithms that convert bits into pixels, sounds, letters, and images.

## Computers Don't "Think"

Here's something crucial to understand: **Computers don't think. They don't understand. They just follow instructions.**

When your computer displays the letter 'H', it doesn't "know" what 'H' means. It doesn't understand the concept of letters or language. It simply followed this algorithm:

```
IF bits = 01001000
THEN display pixel pattern #72 from font file
```

That's all. No comprehension, no intelligence, no awareness. Just: see this pattern, do this action.

This might seem disappointing, but it's actually profound. By following simple rules very fast, computers can do things that *look* intelligent:

- Translate languages (following grammar rules + dictionary lookups)
- Play chess (following move-evaluation rules)
- Recognize faces (following pattern-matching rules)
- Route your emails (following network protocol rules)
- **Process digital money transactions (following validation rules)**

It's all algorithms. All instructions. All deterministic.

## The Power of Determinism

**Deterministic** means: given the same input, you always get the same output.

This property is critical for computers working together. Imagine if your computer and my computer could look at the same bits and get *different* results—communication would be impossible, and coordination would break down entirely.

Bitcoin relies on this property completely. Thousands of computers around the world run the same algorithms on the same data, and they all arrive at the same conclusions about what's valid and what's not.

**This is why Bitcoin works.** Not because of magic, but because deterministic algorithms guarantee that everyone following the same rules ends up with the same "truth"—predictable, verifiable information.

What is a miner? A block? A transaction? We will get there, don't worry. For now, just understand that all of these concepts are built on top of algorithms that computers follow precisely.

## Algorithms Can Be Simple or Complex

Some algorithms are trivial:

```
Algorithm: Add two numbers
Input: 5, 3
Step 1: Add the numbers together
Output: 8
```

Others are incredibly complex:

```
Algorithm: Render a 3D video game frame
Input: Player position, world data, lighting rules, physics...
Step 1: Calculate which objects are visible
Step 2: Apply lighting and shadows
Step 3: Apply textures to surfaces
Step 4: Calculate reflections
Step 5: Apply motion blur
Step 6: Convert 3D coordinates to 2D pixels
... (hundreds more steps)
Output: One frame of the game (1/60th of a second)
```

But both are the same fundamental idea: a sequence of instructions that transforms input into output.

Bitcoin uses both kinds—simple algorithms and complex ones. But all of it is deterministic. All of it is just following rules.

## Computers Follow Recipes Perfectly (and Stupidly)

Here's a classic example that shows both the power and limitation of algorithms.

Imagine you give a computer this algorithm:

```
Algorithm: Make a sandwich
Step 1: Put peanut butter on bread
```

A human would understand: get bread, open the peanut butter jar, spread it, etc.

But a computer would fail immediately. **"Put"? What does that mean? "Peanut butter"? Where is it? "On"? What's the position?**

Computers need *every single step* spelled out explicitly:

```
Step 1: Locate object labeled "bread" in coordinate system
Step 2: Locate object labeled "jar_peanut_butter"
Step 3: Rotate jar lid counterclockwise 720 degrees
Step 4: Insert knife into jar
Step 5: Move knife to coordinate X, Y, Z
... (hundreds of micro-steps)
```

This is why programming is hard—you must think like a computer: break everything down into the smallest possible steps, assume nothing, define everything.

**But once you do:** the computer executes those steps flawlessly, billions of times, without ever getting tired or making a mistake.

## Why This Matters for Bitcoin

Bitcoin is a collection of algorithms.

These algorithms define things like:
- How to verify that someone really owns the money they're trying to spend
- How to make sure the same money isn't spent twice
- How to agree on the order of transactions
- How to reward people who help secure the network

Computers all over the world run these same algorithms. They all follow the same rules. Given the same information, they all arrive at the same conclusion about what's valid.

No trust needed. Just math.

Well, not exactly "no trust." You still trust:
- The algorithms are correctly implemented
- The majority of participants are following the rules
- Your computer hardware isn't lying to you

But you don't need to trust any single person or institution. You can verify everything yourself by running the algorithms.

This is what people mean by "trustless" (though "trust-minimized" is more accurate). You're eventually trusting math and code running an agreed consensus, not bankers and governments, which might put the money where you told them... or not.

## The Transition to Protocols

Algorithms tell individual computers what to do. But what about computers talking to *each other*?

That requires **protocols**—agreed-upon rules for communication. And that's exactly what we'll explore in the next chapter.

Protocols, like... The Internet Protocol! Voila, that word we all use but little understand: Internet.

Because Bitcoin isn't just one computer running algorithms. It's thousands of computers coordinating across the internet, all running the same algorithms, all speaking the same protocol or standard, all converging on the same "truth" (ordered information interpreted with the same meaning).

And *that's* when it gets really interesting.

---

**Key Insight:** Algorithms are instruction sets that computers follow deterministically. Same input leads to the same output, always. This determinism is what allows thousands of computers to independently verify the same information and reach the same conclusions without trusting each other. Computers don't "understand" anything—they just follow rules perfectly, billions of times per second.

Next, we'll see how computers coordinate across networks. How does your computer talk to a server in another country? How do thousands of Bitcoin nodes stay synchronized? That's the power of **protocols**—and they're simpler than the word sounds.

Maybe you didn't expect to leave this book with an intuitive understanding of the famous Internet. I hope it is as fascinating for you as it was for me when I first learned this years ago.
