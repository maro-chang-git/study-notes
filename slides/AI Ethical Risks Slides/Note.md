# Speaker Notes — The Dark Sides of AI

One note per slide, two parts each:
- **Context** — what's on the slide + the facts behind it (so you never get caught by a Q&A question)
- **Delivery** — suggested lines and stage directions, friendly & funny

Don't read the slides out loud — they already do that job. You bring the stories.

---

## Slide 01 — Title

**Context:** Title slide: "The Dark Sides of AI" — a 15-minute talk for a non-technical audience. The promise: six ways AI quietly goes wrong (plus one surprise about their own brains), each with a real incident and a practical guardrail.

**Delivery:** Deep breath. Smile. You're about to tell people their favorite new toy sometimes lies to them — better to open warm.

> "Good [morning/afternoon] everyone! Quick disclaimer: I use AI every single day, I love it, and in the next 15 minutes I'm going to tell you why you should trust it a little less. Yes, both things are true."

## Slide 02 — Warm-up

**Context:** Divider slide announcing 4 ice-breaker questions. Purpose: melt the ice AND profile the room — the answers tell you how technical to pitch the rest.

**Delivery:** Energy up!

> "But first — I want to know who's in the room. Four quick questions. There are no wrong answers... okay, there's ONE wrong answer, you'll see it in a second."

## Slide 03 — Q1: How often do you use AI?

**Context:** Options: A) Every day, B) Few times a week, C) Once in a while, D) "What's ChatGPT?". Show of hands. The "every day" count is ammunition for later slides ("you said you use this EVERY DAY...").

**Delivery:** Hands per option. Milk option D:

> "Anyone brave enough for D? ... No one? Last year I'd have gotten five hands. That's how fast this happened."

## Slide 04 — Q2: Favorite models (word cloud)

**Context:** The cloud is HIDDEN until you press the "Reveal the models_" button. Names in the cloud: GPT-3.5, Claude Sonnet, Gemini, Claude Fable, Haiku, DeepSeek, Claude Opus, Qwen, Gemma, Llama, Grok, Mistral, GPT-4o. Handy one-liners if someone asks: DeepSeek/Qwen/Gemma/Llama/Mistral are open or open-weight models; Claude Fable/Opus/Sonnet/Haiku are Anthropic's family; Gemini is Google's.

**Delivery:** **Don't click reveal yet!** Let them shout names first — react like a game-show host ("Ooh, a DeepSeek user, spicy!"). Then: "Let's see if you missed any —" **[CLICK REVEAL]**.

> "If your favorite isn't up here, don't worry — there'll be a new one released by the time I finish this sentence."

## Slide 05 — Q3: Monthly spend

**Context:** Options: $0 / up to $20 (one subscription — ChatGPT Plus and Claude Pro are both ~$20/mo) / $20–100 (power user with multiple tools or API credits) / whatever my company pays. Interesting stat if asked: most people are on free tiers; heavy professional users easily pass $100/mo with API usage.

**Delivery:** Hands again. On D:

> "'Whatever my company pays' — congratulations, that is objectively the correct answer. You may all copy this person."

## Slide 06 — Q4: Your AI level

**Context:** Four tiers, each with a progress meter: **Beginner** — uses a chatbot: ask, copy, done. **Intermediate** — uses power tools: Claude Code, GPT Pro, builds reusable skills/prompts. **Pro** — wires tools together: MCP (Model Context Protocol — the standard for connecting AI to your apps and data), multi-agent workflows. **AI Expert** — runs local LLMs on their own hardware, builds RAG systems (Retrieval-Augmented Generation — search your documents first, answer second).

**Delivery:** Walk the tiers with rising drama:

> "Beginner — you ask, you copy, no shame. Intermediate — Claude Code, GPT Pro, you're building little skills. Pro — MCP, multi-agent workflows, your colleagues fear you. AI Expert — you run local LLMs and build your own RAG... you don't have hobbies anymore."

Bridge (say it): "Whatever your level — the stories coming up apply to *everyone* in this room. Including me."

## Slide 07 — Hook: the brilliant colleague

**Context:** The thesis. AI as a new hire: fast, confident, tireless — and occasionally confidently wrong, with zero change in tone. Root cause (you'll reuse it on slide 09): LLMs predict the next plausible word; they don't have a "truth" module, so wrongness doesn't feel different to them — or sound different to you.

**Delivery:** Slow down.

> "One problem: occasionally it's completely wrong — and here's the scary part — *it sounds exactly the same when it's wrong as when it's right.* No sweating. No 'umm'. Same confident voice."

Pause two seconds. Let it land.

## Slide 08 — Agenda

**Context:** The six dark sides: 1 Hallucination, 2 Bias, 3 Knowledge cut-off, 4 Context loss, 5 Manipulation, 6 Loss of accountability. (The 7th — the human toll — is deliberately NOT on this slide. It's your "one more thing" surprise at slide 17.)

**Delivery:** Fast, don't camp:

> "Six dark sides. Some will make you laugh, some will make you check your last chat history. Let's go."

## Slide 09 — Hallucination

**Context — the facts:**
- **Mata v. Avianca (S.D.N.Y., 2023):** lawyer Steven Schwartz used ChatGPT for legal research in a personal-injury suit against Avianca Airlines. It produced six fully-formatted, entirely fictitious case citations. He asked ChatGPT to confirm they were real; it said yes. Judge sanctioned the lawyers ($5,000 fine) — global news.
- **Moffatt v. Air Canada (2024):** Air Canada's website chatbot told Jake Moffatt he could book a full-price bereavement flight and claim the discount retroactively — a policy that didn't exist. The tribunal ordered Air Canada to compensate him (~C$812).
- **Why it happens:** LLMs generate the statistically plausible next word. No data → they fill the gap with something plausible. Plausible ≠ true.

**Delivery:** Tell it like gossip:

> "Real lawyer, real court, six citations from ChatGPT. Judge looks them up... NONE exist. And my favorite detail — he asked ChatGPT 'are these real?' and it said yes. He asked the liar if it was lying!"

## Slide 10 — Hallucination guardrails

**Context:** Three cards: **Ask for sources** (then click them — it invents URLs too); **Ground it** (paste your document, say "answer only from this" — grounding dramatically cuts hallucination because the model quotes instead of recalls); **Match the stakes** (brainstorm → glance; customer email → read; legal/medical/financial → qualified human review).

**Delivery:**

> "Ask for sources — then actually click them. Give it YOUR document and say 'only from this.' And match effort to stakes: a brainstorm needs a glance; a legal document needs a lawyer. A human one."

## Slide 11 — Bias

**Context — the facts:**
- **The photo on the slide (`images/Bias_1.jpg`):** an actual AI-generated image for the prompt "one doctor and one nurse" — male doctor, female nurse. This is a real, reproducible output, not a mockup; try the same prompt live if you want to double the impact.
- **Amazon (Reuters, 2018):** internal resume-screening AI, trained on ~10 years of mostly-male tech hires, learned to penalize resumes containing "women's" (e.g., "women's chess club captain") and downgraded graduates of two all-women's colleges. Engineers patched those signals, couldn't guarantee it wasn't discriminating other ways — project scrapped.
- **The stats to cite:** AI-generated videos depict roughly 70%+ of high-paying roles (CEOs, software engineers, financial analysts) as male, and over 60% of lower-paying roles (nurses, teachers, caregivers) as female.
- **The mechanism:** AI learns patterns from history. Biased history in → biased predictions out, automated at scale, wearing a mask of machine objectivity.

**Delivery:** Point at the photo on screen — it's real, not illustrated:

> "This is an actual image an AI generated for the prompt 'one doctor and one nurse.' Male doctor, female nurse. Every. Single. Time."

> "And it's not just this prompt — AI-generated videos depict roughly 70%+ of high-paying roles, like CEOs, software engineers, and financial analysts, as male. Over 60% of lower-paying roles — nurses, teachers, caregivers — are shown as female."

## Slide 12 — Bias guardrails

**Context:** The A/B diagram: two identical CVs, one detail swapped (David, 30 ↔ Maria, 55) → same AI → the score should be identical. If it isn't, you've measured bias directly. Chips: consequential decisions about humans (hiring, credit, discipline) stay with humans; make unfair outputs easy to report and actually review the reports.

**Delivery:**

> "Beautifully simple test: same CV, change one thing. If the score changes, you've caught it red-handed. And rule one: AI can shortlist and summarize — decisions about *people* stay with people."

## Slide 13 — Knowledge cut-off (roadmap)

**Context — the slide is now a full-width horizontal roadmap** (no illustration, just the timeline), six stops from GPT's first appearance to today:

| Stop | Date | Cutoff |
|---|---|---|
| GPT-1 &rarr; GPT-3 | 2018–2020 | pre-chatbot era, no public cutoff to speak of |
| ChatGPT (GPT-3.5) | Nov 2022 | Sep 2021 |
| GPT-4 | Mar 2023 | Sep 2021 |
| GPT-4o | May 2024 | Oct 2023 |
| GPT-5.5 / GPT-5.4 | 2025 | Aug–Dec 2025 |
| **NOW** (highlighted, accent color) | today | "the gap is still open" |

The point of the roadmap: across 7+ years and 5 model generations, the gap between *when a model was trained* and *when you're using it* has **never closed** — it's a structural feature of how these models are built, not a bug that gets patched away. GPT-4 — still embedded in plenty of corporate tools — has never heard of anything after Sep 2021. Bonus audience tip: you can literally ask your model "what is your knowledge cutoff date?" Cut-off also compounds with hallucination (slide 09): ask about events after the cutoff and it may invent around the gap instead of admitting it doesn't know.

**Delivery:** Perform the nap first, then walk the timeline left to right:

> "Imagine a colleague who fell asleep — could be a year ago, could be four — woke up this morning, and confidently answers questions about current events. Without ever mentioning the nap. THAT is your AI."

> "Let's walk the timeline. GPT-1 in 2018 — nobody's chatting with it yet. ChatGPT launches in late 2022 — and its brain stopped learning in September 2021, over a year before launch. GPT-4o, 2024 model, cutoff October 2023. Even the newest generation, 2025 models — still months behind. And here's us, today — the gap never actually closes. It's not a bug. It's how these things are built."

Practical close: "Ask yours: 'what's your cutoff date?' It'll tell you — it just never volunteers it."

## Slide 14 — Context loss

**Context — the technical terms on the slide:**
- **Context window** = the model's **short-term memory**: everything it can "see" right now. Measured in **tokens** (1 token ≈ ¾ of a word). Typical: ~128K tokens (GPT-4o) up to 200K–1M (Claude, Gemini). Sounds huge — but pasted documents and long sessions eat it fast.
- When the window is full, the **oldest content silently falls out** — your instructions from message 1 included. No warning.
- **Long-term memory: none by default.** Close the chat, everything's gone. "Memory" features and company RAG systems bolt it on from outside — the model itself never truly remembers you.

**Delivery:**

> "Message 1: 'under 200 words, never mention competitors.' Message 40: eight hundred words, three competitors, beautifully formatted. It didn't rebel — it *forgot*. Its short-term memory — the context window — filled up, and your rules quietly slid off the desk. It's a goldfish with a keyboard."

Practical: "New task, new chat. And if it contradicts what you agreed — don't argue. You cannot win an argument with a goldfish."

## Slide 15 — Manipulation

**Context:** The marionette. The core question: optimized for your benefit, or for someone else's metric (engagement, conversion, time-on-app)? Mechanisms on the slide: feeds that learn outrage keeps you scrolling; offers timed to vulnerable moments (late night, financial stress signals); dark patterns at AI scale — personalized fake scarcity, countdowns, cancel-flow friction. Guardrails: consent + opt-out, fairness review for marketing, never target vulnerability signals, keep an audit trail of who was shown what.

**Delivery:** Tone shift — a notch more serious:

> "One question for every personalized feed, offer, recommendation: is this optimized for MY benefit — or for someone else's dashboard? The outrage in your feed, the 'only 1 left!' at midnight, the cancel button that takes seven clicks — none of that is an accident."

## Slide 16 — Accountability

**Context — the facts:** In Moffatt v. Air Canada (2024), Air Canada literally argued its chatbot was "a separate legal entity responsible for its own actions." The tribunal rejected it: the company owns what its tools say. Broader concept: **automation bias** — humans defer to machine output and stop reviewing. Chips: every AI-assisted decision has a named human owner; if you can't explain what you approved, you didn't review it; real review means spot-checks and authority to overrule.

**Delivery:** Quote it straight — the comedy is built in:

> "Air Canada argued — in an actual legal proceeding — that its own chatbot was 'a separate legal entity responsible for its own actions.' They tried to blame. the bot. Tribunal's answer, translated from legalese: nice try. You deploy it, you own it."

Bring it home: "'The AI wrote that part' has never saved anyone in a meeting, and it never will."

## Slide 17 — One more thing: The Human Toll

**Context — this is the surprise 7th item (not on the agenda slide, ghost number is "+1"):**
- **Brain Fry:** AI-heavy work is oddly exhausting because your role flips from creating to *continuously verifying* confident-but-possibly-wrong output — sustained vigilance, the same load that tires air-traffic controllers. Research anchor: MIT Media Lab, "Your Brain on ChatGPT" (2025) — essay writers using ChatGPT showed lower brain engagement (EEG) and could barely quote their own text minutes later; the authors called it **"cognitive debt."**
- **Illusion of Expertise** (Vietnamese: *Ảo tưởng chuyên gia*): fluent AI answers feel like understanding. You can present the content but can't defend it — the first follow-up question exposes borrowed knowledge. The antidote is on the slide: **explain it out loud without the AI.**

**Delivery:** Pause before this slide, drop your voice:

> "The first six dark sides live in the AI's output. The last one... lives in you. Anyone else feel weirdly *exhausted* after a day of AI work? That's real — you've been doing quality control on a confident liar for eight hours. MIT measured it; they call it cognitive debt."

Then: "And the sneakier one — the AI's answer is so fluent that you feel like an expert. Quick test before your next presentation: close the chat and explain it out loud. If you can't... it's not your knowledge yet. AI can do the work — it can't do the knowing."

## Slide 18 — Closing

**Context:** The synthesis. Common thread across all seven: a human trusted without verifying. Three rules: every output is a draft; verify in proportion to stakes; your name stays on your work. Final line: **AI drafts. Humans decide.**

**Delivery:** Slow. Quiet. This is what they carry out of the room:

> "Seven dark sides, one thread: every failure happened when a human trusted without verifying. So: every output is a draft. Verify by the stakes. Keep your name on your work — because it IS your work."

Point at the big line, say it once, stop talking:

> "AI drafts. Humans decide."

## Slide 19 — Thank you

**Context:** Q&A. Likely questions and quick answers: *"Which AI should I use?"* → any major one; the guardrails matter more than the brand. *"Will AI take our jobs?"* → it changes the job: less producing, more directing and verifying — which is exactly why the verifying skills from this talk matter. *"Is the doctor/nurse thing still true?"* → try it live; newer models are better but the pattern persists.

**Delivery:**

> "Thank you! Questions? And yes — I did use AI to prepare this talk. And yes — I checked everything it gave me. That's the whole point."

(That callback is your mic-drop. Land it, grin, take questions.)
