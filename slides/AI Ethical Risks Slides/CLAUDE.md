# AI Ethical Risks Slides

This is a **speech-preparation project**, not a codebase. The deliverable is a
15-minute talk titled **"The Dark Sides of AI"** plus its supporting materials.

## The talk

- **Audience:** general employees, non-technical. They use AI daily (ChatGPT,
  Copilot) but don't know how models work. Avoid jargon; when a technical term
  is unavoidable (e.g. "context window"), explain it with an everyday analogy.
- **Language:** English.
- **Length:** 15 minutes, dark-sides-only scope — six AI risks with real-world
  incidents and practical guardrails, closing on the human role
  ("AI drafts, humans decide"). The run-of-show with per-section timing is at
  the top of the content file.
- **Tone:** accessible and story-driven. Every risk is anchored to a real,
  verifiable incident (e.g. Mata v. Avianca, Air Canada chatbot, Amazon hiring
  tool) — do not invent examples or cite incidents that can't be verified.

## Files

| File | Role |
|---|---|
| `Evil sides of AI and Role of Human.md` | Main content: warm-up survey, run-of-show, six risks with examples/guardrails/takeaways, plus a Module 2 stub (Human-AI Synergy) kept for a possible future talk |
| `AI-Governance.md` | Raw reference notes on AI governance sectors and ethical risk categories |
| `Slides/slides.html` | The presentation deck (markup) |
| `Slides/styles.css` | Deck styles — dark/edgy theme tokens live in `:root` |
| `Slides/script.js` | Deck navigation (keys, click zones, hash, fullscreen) |
| `Note.md` | Per-slide speaker notes — friendly, funny delivery script with timing/interaction cues |
| `CLAUDE.md` | This file |

## Conventions

- The deck is three files (`Slides/slides.html` + `styles.css` + `script.js`)
  with **no external dependencies**: vanilla JS, inline SVG, and local images
  from `Slides/images/` only. No CDN links, external fonts, or build step —
  it must open from disk and work offline on a presentation laptop. When a
  slide needs a real photo (not an illustration), drop it in `Slides/images/`
  and reference it with a relative path (see slide 11's `Bias_1.jpg`).
- Light visual theme with crimson/orange accent gradients and dark "terminal
  strip" accents; large type readable from the back of a room; keyboard
  (arrows/space) and click navigation. The warm-up Q2 slide is a word cloud
  revealed by an on-slide button.
- Slides are visual-first: risk slides (10–18) use two-column `duo` layouts,
  `vcards` icon cards, or a full-width `.roadmap` timeline (slide 13) — short
  lead text + mini-chips, inline SVG/photo illustrations. The spoken story
  (see `Note.md`) carries the detail, not the slide. Slide 17 ("the human
  toll": Brain Fry + Illusion of Expertise) is a deliberate "one more thing"
  surprise — it is NOT listed on the agenda slide.
- When editing content, keep the markdown structure (risk → what it is →
  example → guardrails → takeaway) so slides and script stay in sync.
