# The Dark Sides of AI — Speech Content

On one hand, AI is a powerful tool that can significantly accelerate work and enhance productivity — when used with the right mindset and in a responsible manner.

On the other hand, AI also carries potential risks if used without proper control — ranging from misinformation to the erosion of critical thinking and decision-making capabilities.

This talk covers the dark sides: six ways AI can quietly harm your work, with real incidents and practical guardrails for each.

## Run of Show (15 minutes + warm-up)

| Time | Section |
|---|---|
| −3:00–0:00 | Warm-up survey: 4 ice-breaker questions (before the 15-minute clock) |
| 0:00–1:30 | Hook + framing: AI is powerful AND flawed |
| 1:30–3:45 | Risk 1 — Hallucination |
| 3:45–5:45 | Risk 2 — Bias / unfair outcomes |
| 5:45–7:15 | Risk 3 — Knowledge cut-off |
| 7:15–8:30 | Risk 4 — Context loss |
| 8:30–10:00 | Risk 5 — Manipulation |
| 10:00–11:30 | Risk 6 — Loss of human accountability |
| 11:30–13:15 | "One more thing" — The Human Toll: Brain Fry & the Illusion of Expertise |
| 13:15–15:00 | Close: zero-trust mindset — "AI drafts, humans decide" |

## Warm-up Survey (~3 min, before the clock starts)

Ice-breaker — get hands up and voices in the room before the talk begins. Keep it light; the answers also tell you who's in the audience.

1. **How often do you use AI?** — Every day / A few times a week / Once in a while / "What's ChatGPT?" *(show of hands)*
2. **Name some AI models — which one is your favorite?** — ChatGPT, Claude, Gemini, Copilot, DeepSeek, Grok, Llama, Perplexity… *(shout out; note which names come up — you can call back to them later)*
3. **How much would you spend on AI per month?** — $0 / up to $20 / $20–100 / "whatever my company pays" *(show of hands)*
4. **What's your AI level?** — Beginner (chatbot: ask, copy, done) / Intermediate (Claude Code, GPT Pro, skills) / Pro (MCP, multi-agent workflows) / AI Expert (local LLMs, build your own RAG…)

**Bridge to the talk:** "Whatever your level — the stories I'm about to tell you apply to everyone in this room."

## Opening Hook (1.5 min)

Ask the room: *"Who used AI at work this week?"* (Most hands go up.)
Then: *"Who verified what it told you?"* (Most hands go down.)

That gap — between how much we **use** AI and how much we **check** it — is where every story in this talk lives. AI is like a brilliant new colleague: fast, confident, tireless... and occasionally, confidently wrong. The problem is that it sounds exactly as confident when it's wrong as when it's right.

## Module 1: The Evil Sides of AI

### 1.1 Hallucination

**What it is (plain English):** AI models generate text by predicting the next most likely word based on patterns, not by understanding facts. When data is missing or ambiguous, the AI confidently invents false information, fake citations, or nonexistent events. It never says "I don't know" unless forced to — it fills the gap with something plausible-sounding. This poses severe risks when users rely on AI for medical, legal, or financial research without verifying the output.

**Real-world examples:**
- **Mata v. Avianca (New York, 2023):** A lawyer used ChatGPT to research a court filing. It supplied six case citations — complete with names, docket numbers, and quotes. All six cases **did not exist**. When the judge asked ChatGPT-style follow-ups, the lawyer even asked ChatGPT "are these cases real?" and it said yes. The lawyers were sanctioned and fined; the story made global headlines.
- **Air Canada chatbot (2024):** The airline's website chatbot invented a bereavement-fare refund policy that didn't exist. A customer relied on it, was refused the refund, and took Air Canada to a tribunal. Air Canada argued the chatbot was "a separate legal entity responsible for its own actions." The tribunal disagreed — the airline was ordered to honor what its chatbot promised.

**Speaking point:** The AI didn't "lie" — it did exactly what it's built to do: produce the most plausible-sounding answer. Plausible is not the same as true.

**Guardrails:**
- **Zero-trust by default:** always ask the AI for its sources, then check that those sources actually exist and actually say what the AI claims.
- **Ground it:** where possible, give the AI the document/data and ask it to answer *from that material only* ("based only on the attached policy...").
- **Raise the bar with stakes:** for medical, legal, financial, or customer-facing output, treat AI as a first draft that a qualified human must verify — never the final word.
- Organizational level: grounding to approved knowledge bases, citation requirements, confidence thresholds, escalation paths.

**Takeaway:** *Confidence is not accuracy. Verify before you rely.*

### 1.2 Bias / Unfair Outcomes

**What it is:** AI systems learn from massive datasets scraped from the internet, which inherit human prejudices, stereotypes, and historical inequities. When deployed in automated hiring, loan approvals, or policing, the AI codifies and automates these biases at scale — systematically discriminating against groups of people, but with a veneer of machine objectivity that makes it harder to challenge.

**Real-world examples:**
- **Live demo / photo (`Slides/images/Bias_1.jpg`):** Ask an image generator for "a picture of one doctor and one nurse." It will very likely produce a **male doctor** standing next to a **female nurse** — because that's the statistical pattern in its training images, not because that's reality. (The slide shows a real, reproducible AI-generated output of this prompt.)
- **The pattern at scale:** AI-generated videos depict roughly **70%+ of high-paying roles** (CEOs, software engineers, financial analysts) **as male**, and over **60% of lower-paying roles** (nurses, teachers, caregivers) **as female**.
- **Amazon's hiring AI (revealed 2018):** Amazon built an internal tool to screen resumes, trained on ten years of past hires — mostly men. The model learned to **penalize resumes containing the word "women's"** (as in "women's chess club captain") and downgraded graduates of women's colleges. Amazon tried to patch it, couldn't guarantee it wouldn't find other ways to discriminate, and scrapped the project.

**Speaking point:** The AI wasn't malicious. It faithfully learned from biased history — and then automated that bias at the speed and scale of software. "The data made me do it" is how discrimination gets industrialized.

**Guardrails:**
- **A/B your prompts:** change one attribute (name, gender, age, nationality) and see if the AI's answer changes when it shouldn't. If it does, you've found bias.
- **Keep a human decision-maker:** AI can shortlist or summarize, but consequential decisions about people (hiring, credit, discipline) need human judgment and the ability to appeal.
- **Feedback loop:** make it easy to report unfair outputs, and actually review them.

**Takeaway:** *AI doesn't remove human bias — it can mass-produce it.*

### 1.3 Knowledge Cut-off

**What it is:** Large language models do not have real-time access to the world; their knowledge is frozen at the moment their training data was collected — often many months or years ago. The dangerous part: the model doesn't feel outdated. Ask it about current events, prices, laws, or product versions, and it answers in the same confident tone — with stale information.

**Be specific — a roadmap, not just a table (slide shows this as a horizontal timeline from GPT's first appearance to today):**

| Milestone | Date | Knowledge cutoff |
|---|---|---|
| GPT-1 → GPT-3 | 2018–2020 | pre-chatbot era |
| ChatGPT (GPT-3.5) | November 2022 | September 2021 |
| GPT-4 | March 2023 | September 2021 |
| GPT-4o | May 2024 | October 2023 |
| GPT-5.5 / GPT-5.4 | 2025 | August–December 2025 |
| **NOW** | today | *the gap is still open* |

The point of the roadmap: across 7+ years and five model generations, the gap between *when a model finished training* and *when you're actually using it* has **never closed** — it's a structural feature of how these models are built, not a bug that gets patched away. GPT-4's world ends in September 2021, and it has never heard of anything that happened since. (Tip: you can simply ask a model "what is your knowledge cutoff date?")

**Everyday examples:**
- Asking AI about **current tax rules or regulations** and getting last year's rates, stated as fact.
- Asking for the "latest" version of a tool, a current exchange rate, or this year's public holidays — and receiving confidently outdated answers with no warning label.
- News events after the cut-off simply don't exist for the model — and rather than say so, it may hallucinate around the gap (Risk 1 and Risk 3 compound each other).

**Speaking point:** Imagine a colleague who fell asleep a year ago, woke up today, and answers every question about "current" affairs without mentioning the nap. That's a knowledge cut-off.

**Guardrails:**
- **Ask the model its cut-off date** — and assume anything time-sensitive after it is unknown to the model.
- **For anything time-sensitive** (rules, prices, versions, people in roles), verify against a live, authoritative source.
- Organizational level: connect AI to approved, up-to-date knowledge (RAG — the AI retrieves from your current documents before answering), citation requirements, escalation paths.

**Takeaway:** *AI is a snapshot of the past, presented in the present tense.*

### 1.4 Context Loss

**What it is:** AI models operate within a strict limit called the **context window** — how much of the conversation they can hold in mind at once. Once a chat extends past this limit, the earliest parts fall away: the AI forgets earlier instructions, user preferences, or critical constraints, and starts producing erratic, contradictory responses — while still sounding perfectly assured.

**The technical terms (worth teaching the audience):**
- **Context window limit:** measured in *tokens* (a token ≈ ¾ of a word). Typical windows range from ~128K tokens (GPT-4o) to 200K–1M tokens (Claude, Gemini) — sounds huge, but a long working session with pasted documents eats it fast. When it's full, the oldest content silently falls out.
- **Short-term memory:** the context window IS the model's short-term (working) memory — it only "knows" what's currently inside it.
- **Long-term memory:** by default, an LLM has **none**. Close the chat and everything is gone. Product features like "memory" in ChatGPT/Claude, or company RAG systems, bolt long-term memory on from the outside — the model itself never truly remembers you.

**Everyday examples:**
- You tell the AI at the start: "keep everything under 200 words and never mention competitor names." Forty messages later, it happily writes 800 words naming three competitors — the instruction has scrolled out of its memory.
- In a long document-editing session, the AI reintroduces an error you fixed an hour earlier, or contradicts a decision made at the beginning of the chat.

**Speaking point:** It's like dictating to an assistant who can only keep the last few pages of notes — everything older quietly slides off the desk, and they never tell you.

**Guardrails:**
- **Start fresh for new tasks** — long, meandering chats degrade; a new conversation with a clean summary of requirements beats message #150 of an old one.
- **Re-state critical constraints** periodically, and keep them in the document/prompt you're working from rather than only in early chat history.
- **Watch for drift:** if the AI contradicts something agreed earlier, that's context loss — re-anchor it with a recap, don't argue with it.

**Takeaway:** *Long conversation ≠ long memory. Re-anchor or restart.*

### 1.5 Manipulation

**What it is:** The same personalization that makes AI helpful can cross the line into nudging people **against their own interests**. AI systems optimized for engagement, conversion, or time-on-app learn what makes each individual click, worry, or buy — including their vulnerable moments — and can exploit that at scale. The line between "relevant recommendation" and "engineered impulse" is invisible to the person being nudged.

**Examples:**
- Recommendation feeds that learn outrage and anxiety keep you scrolling — and serve you more of them.
- Dynamic offers timed to detected vulnerability: late-night browsing, repeated views of the same product, signals of financial stress.
- Dark patterns with an AI engine: personalized countdown timers, "only 1 left" nudges, friction added exactly where you try to cancel.
- AI-generated content at scale: persuasive fake reviews, astroturfed comments, tailored misinformation — persuasion tooling that used to need a team now needs a prompt.

**Speaking point:** Ask one question of any personalized experience: *is this optimized for my benefit, or for someone else's metric?*

**Guardrails:**
- **Consent + opt-out:** people should know when they're being personalized to, and be able to turn it off.
- **Marketing-specific fairness review:** review campaigns for manipulation the way you review them for legal compliance.
- **No use of vulnerability signals:** distress, addiction patterns, or financial hardship must never be targeting inputs.
- **Audit trail:** log what was shown to whom and why, so nudging can be inspected after the fact.

**Takeaway:** *Personalization serves you only as long as someone checks who it really serves.*

### 1.6 Loss of Human Accountability

**What it is:** As AI outputs get more fluent, humans slide from *using* the tool to *deferring* to it — a pattern researchers call **automation bias**. Decisions get made because "the AI recommended it," reviews become rubber stamps, and when something goes wrong, nobody feels responsible: the human points at the machine, and the machine can't be held to account.

**Real-world anchor:** Recall Air Canada's defense — that its own chatbot was "a separate legal entity responsible for its own actions." The tribunal rejected it flatly: **you deploy it, you own it.** Courts, regulators, and customers will not accept "the AI said so."

**Everyday examples:**
- A manager approves an AI-drafted analysis without reading it — then, when a number is wrong, says "the AI generated that part."
- Teams stop questioning AI-ranked shortlists or scores because questioning feels slower than accepting.

**Guardrails:**
- **Named human owner** for every AI-assisted decision — a person whose name is on it, not a tool.
- **"Show your reasoning" rule:** if you can't explain a recommendation you're approving, you haven't reviewed it.
- **Keep the human in the loop where stakes are high** — and make the review real: sampling, spot-checks, the authority to overrule.

**Takeaway:** *You can delegate the work to AI. You can never delegate the responsibility.*

### 1.7 "One More Thing" — The Human Toll

The first six dark sides live in the AI's output. The last one lives in **you**. Present this as the surprise seventh item — it's the most personal and lands hardest.

**Brain Fry**

Working intensively with AI is strangely exhausting. You'd expect the opposite — it's doing the work! But the human role shifts from *creating* to *constantly verifying*: reading confident output that might be wrong, tweaking prompts, judging, correcting, re-checking. That's sustained vigilance — the same thing that tires air-traffic controllers. Symptoms: feeling drained, stressed, and oddly unsatisfied after a long "easy" AI-assisted day.

Early research backs it up: an MIT Media Lab study ("Your Brain on ChatGPT," 2025) found that people writing essays with ChatGPT showed measurably lower brain engagement and could barely remember what "they" had written minutes later — the researchers called it *cognitive debt*.

*Guardrails:* batch your AI work with real breaks; keep some thinking tasks AI-free on purpose; treat verification effort as real work when planning your day.

**Illusion of Expertise (Ảo tưởng chuyên gia)**

AI gives you fluent, structured, confident-sounding material on any topic — and fluency feels like understanding. You can *present* the content, but you can't *defend* it: the first follow-up question in the meeting exposes that the knowledge was borrowed, not owned. It's a Dunning-Kruger accelerator: the less you know, the more impressive the AI's answer feels.

*The test:* before you rely on AI-generated content, try to **explain it out loud without looking at it**. If you can't, you don't know it — the AI does.

*Guardrails:* use AI to *learn* (ask "why?", ask for the counter-argument), not just to *produce*; the explain-it-back test before any presentation; be honest in meetings about which parts you own.

**Takeaway:** *AI can do the work — it can't do the knowing.*

## Closing (2 min): The Zero-Trust Mindset

Six dark sides in the output, one in your own head — and one common thread: every failure happened when a human **trusted without verifying**.

The fix is not to avoid AI — it's to change your default posture:

1. **Treat every AI output as a draft**, not an answer.
2. **Verify in proportion to the stakes** — a brainstorm needs a glance; a customer email needs a read; a legal filing needs an expert.
3. **Keep your name on your work.** AI is the tool; you are the author.

> **AI drafts. Humans decide.**

Thank you. Questions?

---

## Module 2: Human-AI Synergy *(kept for a future session)*

Impact of using AI on humans. **Brain Fry** and the **Illusion of Expertise** are now covered in the main talk (section 1.7); remaining topics for a future deep-dive:

### Decision Fatigue

### Trust and Ownership
