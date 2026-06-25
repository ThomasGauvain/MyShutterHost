# [Platform] — Full Implementation Plan v3

> **Note on name**: Originally "MyShutterHost" — a photography hosting platform. The vision has expanded significantly. See the Platform Naming Strategy section. This plan now describes a full **creative professional social network + business platform** serving 16+ creator types.

---

## 🏗️ Three Distinct Products — Platform Architecture

> [!IMPORTANT]
> The platform is THREE interconnected products sharing one codebase (monorepo) and one backend.

```
┌─────────────────────────────────────────────────────────────────┐
│  PRODUCT 1: [Platform].com — Marketing & Company Site           │
│                                                                 │
│  • Public landing page + pricing + creator type showcase        │
│  • Creator signup & subscription purchase                       │
│  • Tech support, bug reports, changelog, status page            │
│  • Platform blog, tutorials, community resources                │
│  URL: [platform].com/about, /pricing, /blog, /support           │
└─────────────────────────────────────────────────────────────────┘
                              ↓ Subscribes / Joins
┌─────────────────────────────────────────────────────────────────┐
│  PRODUCT 2: The Creator Social Network (Main Platform)          │
│                                                                 │
│  • Global discovery feed (public, no login required)            │
│  • Creator social profiles  →  [platform].com/@username         │
│  • Event calendar, Looking For board, Creator discovery map     │
│  • Groups, chat, community spaces                               │
│  • Collaborative revenue sharing                                │
│  • ALL creator types: Photographers, Models, Actors,            │
│    Cosplayers, MUAs, Videographers, Fashion Designers, etc.     │
│                                                                 │
│  FREE: Supporters get social profiles (no website, no tools)    │
│  PAID: Creators get social profile + dedicated website (below)  │
└─────────────────────────────────────────────────────────────────┘
                              ↓ Included in paid Creator plans
┌─────────────────────────────────────────────────────────────────┐
│  PRODUCT 3: Creator Dedicated Websites (Hosted for ALL types)   │
│                                                                 │
│  Every paid Creator gets their own professional website         │
│  POWERED BY THE SAME BACKEND as their social profile.           │
│  Same galleries, same bookings, same store, same posts.         │
│  The website is a professional-first view of the same data.     │
│                                                                 │
│  URL options (all plans):                                       │
│    username.[platform].com          (subdomain, all plans)      │
│    www.theircustomdomain.com        (custom domain, Pro+)       │
│    [platform].com/meet/username     (event card, all plans)     │
│                                                                 │
│  Available to ALL creator types (not just photographers):       │
│    📸 Photographer  → gallery, print shop, client delivery      │
│    🎬 Videographer  → showreel, video delivery, booking         │
│    👤 Model         → comp card, tearsheets, casting page       │
│    🎭 Actor         → résumé, headshots, demo reel              │
│    🦸 Cosplayer     → character portfolio, con schedule, shop   │
│    💄 MUA           → service menu, before/after, booking       │
│    👗 Fashion Dsgn  → lookbooks, collections, pattern shop      │
│    📸 Studio        → team portfolio, studio rental, booking    │
│    💇 Hair Stylist  → style portfolio, service menu, booking    │
│    🎨 Stylist       → look portfolios, brand collabs            │
│    🎬 Talent Agency → talent roster, booking requests           │
│    + all other creator types                                    │
└─────────────────────────────────────────────────────────────────┘

KEY INSIGHT: The social profile and the dedicated website
are TWO VIEWS OF THE SAME DATA. One backend serves both.

Creator posts on social network → appears on their website feed
Fan books on their website → appears in their CRM dashboard
Fan buys a print from website → same Stripe flow as social platform
Collaborative shoot revenue → splits to all contributors everywhere
```

### URL Structure
```
[platform].com                      → Main social network (discovery feed)
[platform].com/explore              → Browse all creators
[platform].com/events               → Public event calendar + map
[platform].com/board                → Looking For casting board
[platform].com/@username            → Creator social profile
[platform].com/meet/username        → Event Presence Card (QR/NFC)

username.[platform].com             → Creator's dedicated website
username.[platform].com/            → Homepage (portfolio/hero)
username.[platform].com/work        → Portfolio / gallery
username.[platform].com/services    → Services + pricing
username.[platform].com/store       → Print shop + digital products
username.[platform].com/booking     → Appointment / session booking
username.[platform].com/events      → Their upcoming events
username.[platform].com/feed        → Their social posts embedded
username.[platform].com/contact     → Contact form

www.customdomain.com                → Custom domain (Pro+) → same website
```

### Monorepo App Structure
```
[Platform]/ (Turborepo + pnpm)
├── apps/
│   ├── marketing/     ← [Platform].com company/marketing site (Product 1)
│   ├── social/        ← Main creator social network (Product 2)
│   ├── dashboard/     ← Creator backend admin panel (all creator types)
│   ├── website/       ← Creator dedicated websites — all types (Product 3)
│   └── mobile/        ← React Native + Expo app (Phase 4)
└── packages/
    ├── ui/            ← Shared design system & components
    ├── db/            ← Prisma schema & database client (single DB)
    ├── types/         ← Shared TypeScript types
    └── config/        ← ESLint, Tailwind, TypeScript configs

NOTE: apps/social and apps/website share the same packages/db —
one database, two front doors, same data.
```

---

## Technology Stack (Confirmed)

| Layer | Choice |
|-------|--------|
| **Framework** | Next.js 16 (App Router, TypeScript) |
| **Styling** | Tailwind CSS + shadcn/ui |
| **Monorepo** | Turborepo + pnpm (4 apps: marketing, dashboard, portfolio, mobile) |
| **Database** | PostgreSQL — self-hosted Docker container on Coolify (same Vultr server, migrate to dedicated later) |
| **ORM** | Prisma |
| **Auth** | Auth.js v5 |
| **Photo/Video Storage** | Cloudflare R2 (zero egress fees) |
| **CDN / DNS / DDoS** | Cloudflare |
| **VPS** | Vultr |
| **PaaS / Deploy** | Coolify (Docker, self-hosted) |
| **CI/CD** | GitHub → Coolify webhook |
| **Reverse Proxy** | Traefik (bundled in Coolify) |
| **Payments** | Stripe (subscriptions + store + tips + pay-to-download) |
| **Email** | Resend |
| **AI Chatbox** | Vercel AI SDK v6 (npm package, runs on Vultr — no Vercel hosting required) |
| **Image Processing** | Sharp (server-side) + Cloudflare Images |
| **Video Processing** | FFmpeg + Cloudflare Stream |
| **Music/Audio** | Howler.js (client-side audio player) |
| **Scroll Animations** | **GSAP + ScrollTrigger** (Ken Burns, parallax, scrubbing, reveal) |
| **Smooth Scrolling** | **Lenis** (buttery smooth scroll experience) |
| **Slideshows** | **Swiper.js** (all transition types, touch support) |
| **Gallery Lightbox** | **PhotoSwipe** (fullscreen viewer, touch/swipe/zoom) |
| **Page Transitions** | **Framer Motion** (React component + route transitions) |
| **WYSIWYG Editor** | **Puck** (open-source React drag-and-drop page builder) |
| **Rich Text Editing** | **TipTap** (rich text blocks within WYSIWYG) |
| **Search** | PostgreSQL Full-Text Search → Algolia (at scale) |
| **Cache** | Redis — self-hosted Docker container on Coolify (same Vultr server) |
| **Analytics Events DB** | **ClickHouse** — self-hosted Docker on Coolify (billions of view events, sub-second queries) |
| **Product Analytics** | **PostHog** (self-hosted) — funnels, session analysis, feature flags, GDPR-compliant |
| **Geolocation** | **MaxMind GeoIP2** — IP → city/region/country, self-hosted database, no API fees |
| **Plugin SDK** | Custom REST + OAuth2 (for Lightroom/Photoshop plugins) |
| **Real-time Chat** | **Socket.io** (self-hosted on Vultr via Coolify — WebSocket DMs + group rooms + live view counters) |

---

## Platform Modules & Full Feature List

### 📸 Module 1 — Photo & Video Galleries

**Gallery Layout Options (photographer picks per gallery):**
- [x] **Masonry** — Pinterest-style, variable heights, natural stacking
- [x] **Justified Grid** — all same height, variable widths (Google Photos style)
- [x] **Square Grid** — equal size squares, clean and minimal
- [x] **Mosaic** — mixed large/small tiles, editorial magazine feel
- [x] **Honeycomb** — hexagonal cells, very artistic
- [x] **Filmstrip** — horizontal scrolling strip
- [x] **Spotlight** — one hero image + surrounding thumbnails
- [x] **Magazine** — feature image + text columns + supporting photos
- [x] **Fullscreen** — one photo at a time, full viewport
- [x] **Panoramic** — wide horizontal scroll for landscape shots

**Slideshow Effects:**
- [x] **Ken Burns** — slow cinematic pan + zoom on still photos
- [x] **Fade** — classic crossfade between photos
- [x] **Slide** — photos push in from left/right
- [x] **Zoom Burst** — photo zooms into the next one
- [x] **3D Flip** — card flip transition
- [x] **Morph / Dissolve** — photos blend into each other
- [x] **Parallax Slide** — background + foreground move at different speeds
- [x] Music playback synced to slideshow (Howler.js)
- [x] Autoplay speed control
- [x] Captions overlay per photo

**Other Gallery Features:**
- [x] Video gallery (upload, stream via Cloudflare Stream)
- [x] Drag-and-drop bulk upload
- [x] Individual photo/video detail pages
- [x] Watermarking (auto-applied on download/share)
- [x] EXIF data display (camera, lens, settings)
- [x] Add music/audio to photo albums (background slideshow music)
- [x] Photo culling tool (swipe-to-keep / swipe-to-reject for editing selection)
- [x] RAW file upload + storage support
- [x] Batch tagging and organizing
- [x] Face detection / smart tagging (AI-assisted)
- [x] Slideshow creator with transitions + music
- [x] QR code generator for sharing galleries
- [x] Geographic tagging (map view of where photos were taken)

---

### 💰 Module 2 — Point of Sale & Monetization

> **Architecture**: Custom build on top of Stripe. No separate e-commerce platform. Everything lives in our Next.js + PostgreSQL monorepo. Stripe handles payments, taxes, fraud, and photographer payouts. We build the product catalog, cart, order routing, and download delivery.

---

**🏗️ POS Technical Architecture**

```
Customer Flow:
Views gallery → clicks Buy/Download
      ↓
Cart (Redis session — fast, no DB hit)
      ↓
Stripe Checkout Session created (Stripe hosts the payment page)
      ↓
Stripe webhook: payment_intent.succeeded
      ↓
  IF digital download → signed Cloudflare R2 URL (expires 48hrs)
                     → email download link (Resend)
  IF print order     → route to Printful / WHCC / self-fulfill
                     → lab ships directly, tracking auto-emailed
      ↓
Order in customer profile + photographer dashboard
```

**What Stripe Handles (we don't build these):**
- Payment UI + card processing (PCI compliant automatically)
- Automatic tax calculation — US sales tax + EU VAT (Stripe Tax)
- Fraud detection (Stripe Radar ML)
- Refund processing
- Photographer payouts (Stripe Connect — auto-splits revenue)
- Discount codes + promotion codes (Stripe Coupons)
- Invoice PDF generation (Stripe Invoices)
- Subscription billing for platform tiers

**What We Build (custom in our stack):**

*Product Catalog:*
- [x] Product types: `DIGITAL_DOWNLOAD | PRINT | GIFT_CARD | ALBUM | USB`
- [x] Products linked to specific photos OR entire galleries
- [x] Print products with size/material options (8x10, canvas, metal, fine art)
- [x] Digital download products with resolution tiers (standard / high-res)
- [x] Self-fulfillment products (photographer ships themselves)
- [x] Preset / action / plugin products (from marketplace)

*Cart & Checkout:*
- [x] Cart stored in Redis (fast session-based, no login required)
- [x] Cart persists to PostgreSQL on checkout start
- [x] Guest checkout — buy without creating an account
- [x] Stripe Checkout Session — Stripe's hosted payment page (no card data touches our servers)
- [x] Apple Pay / Google Pay / Buy Now Pay Later via Stripe

*Digital Download Delivery:*
- [x] After payment: generate time-limited signed Cloudflare R2 URL (expires 48hrs)
- [x] Download limit enforcement (e.g. max 3 downloads per purchase)
- [x] Secure delivery — URL is unique per order, can't be shared/scraped
- [x] Re-download from order history (generates new signed URL on demand)
- [x] Bulk download (buy full gallery → download as ZIP)

*Print Order Routing:*
- [x] **Printful** — automated API routing for consumer-grade prints, ships worldwide
- [x] **WHCC** — professional lab routing for high-end print orders
- [x] **Bay Photo / Miller's Lab** — additional pro lab options
- [x] **Self-fulfillment** — photographer prints themselves, marks as shipped manually
- [x] Per-product lab assignment — photographer sets which lab per print product
- [x] Lab fallback — if primary lab is down, route to backup lab

*Shipping (via EasyPost):*
- [x] **USPS** — First Class, Priority, Priority Express, Media Mail
- [x] **UPS** — Ground, 2-Day Air, Next Day Air, Worldwide
- [x] **FedEx** — Ground, Express, International Priority
- [x] **DHL** — international shipping
- [x] Real-time rate comparison across all carriers at checkout
- [x] Shipping label generation + purchase from dashboard
- [x] Auto-send tracking number to customer via email
- [x] Package size presets ("8x10 mailer = 6oz, 10x13 envelope")
- [x] Free shipping threshold rules (free shipping over $75)
- [x] Shipping zones — restrict or adjust rates by region/country
- [x] International customs forms auto-filled
- [x] Address validation before order placed
- [x] Return label generation
- [x] Batch label printing for multiple orders

*Pricing & Promotions:*
- [x] Discount codes & coupons (Stripe Promotion Codes + our UI)
- [x] Gift cards (Stripe + our balance tracking in DB)
- [x] Rush delivery upsell at checkout
- [x] Tax calculation — Stripe Tax (automatic, all US states + EU VAT)
- [x] **Stripe Connect** — photographers receive payouts directly (85% photographer / 15% platform)
- [x] Revenue dashboard (sales, tips, stars earned, payouts, shipping costs, lab fees)

*Order Management:*
- [x] Order status: `PENDING → PAID → IN_PRODUCTION → SHIPPED → DELIVERED → REFUNDED`
- [x] Photographer order dashboard with filter by status
- [x] Customer order history in their profile with re-download links
- [x] Refund processing via Stripe (dashboard button → Stripe handles it)

**Hearts & Stars Micropayment System:**
- [x] Platform-fixed tier system ($0.10 / $0.50 / $1.00 / $5.00 / $10.00)
- [x] Each tier = a different animated icon (spark, star, heart, gem, crown)
- [x] Visitors buy a bundle of credits via Stripe → spend on any photographer
- [x] Platform takes 10% of all micropayments, rest goes to photographer
- [x] Tips (freeform amount) — platform takes 5%
- [x] All micropayments + tips visible in photographer revenue dashboard

---

### 🔗 Module 3 — Social & Sharing

**Standard Sharing:**
- [x] Like & favorite individual photos and galleries
- [x] Share to social media platforms (Facebook, Instagram, Pinterest, X/Twitter, TikTok)
- [x] Send gallery/photo links to friends via social media
- [x] Embedded social media feeds on photographer's site (Instagram feed, TikTok feed, etc.)
- [x] Public gallery comments
- [x] Shareable gallery link (optionally password-protected)
- [x] QR code for any gallery or photo
- [x] Embeddable gallery widget (embed your gallery on external websites)

**📲 Tap & Scan Event Presence Card**

A digital smart business card the photographer shows at events — guests scan or tap to instantly connect, find photos, and tip:

- [x] **Photographer "Meet" page** — a beautiful mobile-optimized landing page. URL depends on subscription tier:

  | Tier | Meet Page URL |
  |------|--------------|
  | **Free** | `username.myshutterhost.com/meet` |
  | **Pro / Studio** | `www.theircustomdomain.com/meet` |
  | **Platform fallback** (always works) | `myshutterhost.com/meet/username` → redirects to their primary URL |

  - QR code and NFC always use the photographer's **primary URL** (custom domain if they have one, subdomain if not)
  - The `myshutterhost.com/meet/username` fallback always redirects to the right place — useful for printed materials that outlive a domain change
  - Profile photo, name, specialty, location tagline

  - "Visit my website" button
  - "See today's event photos" — links to the photographer's **Active Event Gallery** (photographer sets which gallery is "active" before the event)
  - Social media links (Instagram, Facebook, TikTok, Pinterest, X — photographer picks which to show)
  - ⭐ **Tip / Send Stars button** — guest can tip instantly with no account required (Stripe guest checkout)
  - "Save my contact" — downloads a `.vcf` vCard with name, phone, email, website, social links
  - "Follow me on MyShutterHost" button
- [x] **Dynamic QR code** — always points to their meet page; regenerates automatically if username changes
- [x] **Full-screen QR display in mobile app** — photographer opens the app → taps "Event Card" → phone displays a bright full-screen QR code guests can scan instantly (high contrast, no fumbling with links)
- [x] **NFC tap-to-share** — photographer taps their phone to a guest's phone → guest's phone opens the meet page instantly (Android + iPhone 13+ with background NFC tag reading)
- [x] **Printable QR card** — download a print-ready PNG/PDF of the QR code for:
  - Table tent cards at events
  - Badge lanyards at conventions
  - Foam board signs at outdoor shoots
  - Studio wall display
- [x] **Active Event toggle** — in the dashboard or app, photographer taps one button to set which gallery is "active" — it appears on the meet page as the featured event link
- [x] **QR on photographer's website profile page** — their public website profile section shows their QR code so returning visitors can save it or scan it again
- [x] **Tip tracking** — all tips received via the meet page appear in the revenue dashboard, tagged as "Event Tip"
- [x] **Meet page analytics** — see how many people scanned the code, tipped, clicked social links, or saved the contact at each event



---

### 📅 Module 4 — Booking, Contracts & Client Management

> **Architecture**: Fully custom, built into the photographer dashboard. No third-party CRM service. Replaces standalone tools like HoneyBook, Dubsado, and Studio Ninja — all included in our subscription.

---

**📋 CRM — Lead Pipeline (Kanban Board)**

Visual pipeline — drag clients through stages:
```
NEW INQUIRY → CONSULTATION → PROPOSAL SENT → BOOKED → SHOT → EDITING → DELIVERED → ARCHIVED
```
- [x] Kanban board view — drag cards between stages
- [x] List view — sortable table of all clients
- [x] Filter by stage, tag, session type, date range, revenue
- [x] Search clients by name, email, phone
- [x] Client tags — [VIP] [Wedding] [Portrait] [Cosplay] [Referral] (custom tags)
- [x] Quick stats — total leads this month, conversion rate, avg booking value

**👤 Client Detail Page — Everything in One Place**
- [x] Contact info (name, email, phone, location, social links)
- [x] Full session timeline (every touchpoint from first inquiry to delivery)
- [x] Private photographer notes (client never sees these)
- [x] All documents in one place — contracts, invoices, questionnaires
- [x] Gallery activity pulled from client profile (photos liked, downloaded, purchased)
- [x] Purchase history — all orders, total spent
- [x] Past + upcoming sessions with this client
- [x] One-click rebooking with same package
- [x] Stars & tips sent history

**📬 Communication Log**
- [x] Send emails to clients directly from the dashboard (powered by Resend)
- [x] Every email sent is automatically logged to the client's timeline
- [x] AI email drafting — AI writes the email based on context (uses Module 8 AI)
- [x] Log calls and texts manually (add a note: "Called Sarah, confirmed date")
- [x] Inbound email replies visible in the communication log
- [x] Email delivery status tracking (delivered / opened / bounced via Resend webhooks)
- [x] Email templates — save commonly used emails ("Gallery ready", "Booking confirmed", "Follow-up")

**🔔 Reminders & Follow-Ups**
- [x] Set reminders on any client ("Follow up on Jun 28")
- [x] Auto-reminders — system creates these automatically:
  - 3 weeks before session: "Send shot list to [Client]"
  - 1 week before session: "Confirm session details with [Client]"
  - 7 days after session: "Gallery due — start editing [Client]"
  - 3 days after gallery delivery: "Check in — did [Client] view their gallery?"
- [x] Reminder dashboard — all upcoming reminders in one view
- [x] Daily digest email (optional opt-in) — today's reminders

**📅 Booking Calendar**
- [x] Photographer sets availability (open/blocked dates)
- [x] Clients self-book from the photographer's website
- [x] Session packages — bundle hours + deliverables + pricing
- [x] Deposit collection at booking (Stripe — set % or fixed amount)
- [x] Balance due reminder before session
- [x] iCal feed export (subscribe in Google Calendar, Apple Calendar, Outlook)
- [x] Google Calendar two-way sync (changes in either direction sync both ways)
- [x] Mini sessions — fixed time slots, limited availability, displayed on public site
- [x] Booking confirmation email (automated, Resend)
- [x] Session reminder emails (automated — 1 week + 1 day before)

**📄 Digital Contracts & E-Signatures**
- [x] Photographer creates contract templates (wedding, portrait, TFP, model release)
- [x] Client signs online — legally binding e-signature
- [x] Signed contract PDF stored and linked to client's session
- [x] Contract status visible in pipeline (signed / unsigned / expired)
- [x] Auto-send contract after booking (with deposit payment link)
- [x] AI contract clause helper — AI explains legal terms or suggests additions

**🧾 Invoicing & Payments**
- [x] Create and send invoices from the dashboard (Stripe Invoices)
- [x] Stripe payment link embedded in invoice email
- [x] Partial payments / installment schedules
- [x] Invoice status — draft / sent / partially paid / paid / overdue
- [x] Automatic overdue reminders
- [x] PDF invoice download (client + photographer copies)
- [x] Invoice history per client

**📋 Questionnaires & Intake Forms**
- [x] Build custom intake questionnaires per session type
- [x] Auto-send questionnaire after booking confirmation
- [x] Client fills out form in their profile — photographer sees responses
- [x] Question types: short text, long text, multiple choice, date picker, file upload
- [x] AI questionnaire generator — *"Generate a wedding intake questionnaire"*
- [x] Questionnaire responses linked to client's session in the CRM

**🎨 Mood Board Builder**
- [x] Client shares style inspiration images (upload or link from Pinterest)
- [x] Photographer adds their own reference images
- [x] Collaborative board — both sides can add/comment
- [x] AI style analysis — AI describes the mood/style of the board to help align expectations

**💒 Wedding Planner**
- [x] Multi-event timeline (engagement, rehearsal dinner, ceremony, reception)
- [x] Shot list builder with drag-and-drop sections (getting ready, first look, ceremony, etc.)
- [x] Vendor contact book (DJ, florist, venue, caterer — with name/phone/email)
- [x] Day-of timeline (hour-by-hour schedule)
- [x] AI shot list generator — *"Generate a shot list for a 6-hour Indian fusion wedding"*

---

### 🖼️ Module 5 — Client Galleries, Proofing & Social Tagging

**Download Tier System (photographer sets per gallery):**
- [x] **Free tier** — low-res download (800px, 72 DPI), always watermarked, always available to everyone
- [x] **Standard paid tier** — medium-res (2000px), no watermark, photographer sets price
- [x] **High-res paid tier** — full print-ready resolution, no watermark, photographer sets price
- [x] **Free high-res override** — photographer can unlock full-res for free on any gallery (e.g. for clients who already paid for a session)
- [x] Per-photo overrides — set different download tiers on individual photos within a gallery
- [x] Download limits — cap how many photos a client can download (e.g. 20 free downloads included)
- [x] Guest checkout — visitors buy/download without creating an account
- [x] Watermark auto-applied to free downloads, stripped on paid

**Social People Tagging (Viral Event Gallery System):**
- [x] **Tag people in photos** — click a face in a photo, type a name or email to tag them
- [x] **AI face detection** — automatically detects faces in photos and draws tag boxes, photographer approves suggested tags
- [x] **"Find My Photos" selfie search** — visitor uploads a selfie → AI searches the entire gallery and highlights every photo they appear in (huge for large events — weddings, concerts, sports, school events)
- [x] **Event QR code** — photographer displays a QR code sign at the event → guests scan it → instantly taken to the gallery to find their photos
- [x] **Tag notification emails** — "You were tagged in 12 photos at [Event Name]! Click to view & download" → drives people back to the gallery
- [x] **"My Photos" filtered view** — once tagged/found, the gallery highlights only that person's photos so they don't have to scroll through hundreds of images
- [x] **Privacy & untag** — anyone can request to be untagged from a photo (GDPR/privacy compliance)
- [x] **Tag friends** — visitors can tag their friends in photos, triggering a notification to that friend
- [x] **Bulk share my tagged photos** — share all photos you appear in to Facebook, Instagram, etc. in one click

**Viral Monetization Loop (per event gallery):**
- [x] Visitors who find their photos can:
  - Download free (low-res, watermarked) and share to social media
  - Pay to download high-res
  - Buy a print of any photo they're in
  - Leave a tip to the photographer
  - Send hearts / stars to support the photographer
- [x] Every social share includes a link back to the gallery (organic traffic engine)
- [x] Shareable Open Graph preview — when gallery link is posted to Facebook/X, it shows a beautiful preview image + gallery title

**Client Proofing:**
- [x] Password-protected private client galleries
- [x] Client proofing (clients mark favorites / request edits)
- [x] Pay-to-unlock gallery (client pays before viewing full gallery)
- [x] Print proofing (client approves prints before order is placed)
- [x] Gallery expiry dates
- [x] Client notification when gallery is ready

**Tech Required for Tagging & Face Search:**
- [x] **AWS Rekognition** or **Azure Face API** — face detection, face matching for selfie search
- [x] Face index per gallery — store face embeddings so selfie search is fast even with 1000+ photos
- [x] Tag data stored in PostgreSQL — linked to photo ID + person (name, email, or registered user)


---

### 🎨 Module 6 — Creator Website Builder (All Creator Types)

> **Expanded**: Previously photographer-only. Now every paid Creator account — regardless of type — gets a fully hosted professional website. Same WYSIWYG builder, same backend, creator-type-specific templates and sections.

---

**🌐 Dual-Surface Architecture (Social Profile + Website)**

```
Every paid Creator gets TWO presences — powered by one backend:

1. Social Profile   → [platform].com/@username
   Social-first. Feed, followers, activity, discovery.
   Fans find you here via the global network.

2. Dedicated Website → username.[platform].com
   Professional-first. Portfolio, booking, store, events.
   Clients and industry contacts go here for business.

Both surfaces show the same galleries, posts, bookings, and store.
Changes in one reflect immediately in the other.
Custom domain (Pro+) points to the dedicated website.
```

---

**🗂️ Template Packs — Organized by Creator Type**

*Photography Templates:*
- [x] Minimal — white space, elegant, fine art
- [x] Bold — dark background, high contrast, dramatic
- [x] Editorial — magazine-style layouts, typography-driven
- [x] Wedding — soft tones, romantic, serif fonts
- [x] Portrait — face-forward, warm tones
- [x] Commercial — clean, corporate, product-feel
- [x] Adventure — full-bleed landscapes, rugged
- [x] Dark Room — ultra-dark, moody, cinematic

*Videography Templates:*
- [x] Reel Focus — hero video autoplay, project tiles below
- [x] Cinema — fullscreen video background, film-inspired
- [x] Production House — clean and corporate for commercial work

*Model Templates:*
- [x] Comp Card First — stats and comp card front and center
- [x] Editorial Model — full-bleed fashion imagery, minimal text
- [x] Commercial Model — clean, bright, casting-ready

*Actor Templates:*
- [x] Résumé Forward — credits and training prominent, headshots alongside
- [x] Headshot Hero — large headshot gallery, reel prominently featured
- [x] Stage & Screen — theatrical feel, serif fonts, dramatic

*Cosplay Templates:*
- [x] Character Showcase — franchise-organized, colorful, fan-forward
- [x] Convention Star — schedule front and center, merch store prominent
- [x] Build Journal — blog/WIP style, process-focused

*MUA / Hair / Stylist Templates:*
- [x] Before & After — split-panel portfolio, service menu below
- [x] Beauty Editorial — high-fashion inspired, bold imagery
- [x] Clean & Booking — service menu + booking calendar as hero

*Fashion Designer Templates:*
- [x] Lookbook — collection galleries as hero, editorial imagery
- [x] Runway — fashion show video + collection tiles
- [x] Shop First — digital/pattern store as primary CTA

*Photography Studio Templates:*
- [x] Team + Portfolio — photographer roster + shared portfolio
- [x] Space First — studio rental with calendar + equipment list

---

**🔧 Shared Sections (Available to ALL creator types)**

Every creator type can add any of these sections to their website:
- [x] Hero / Banner — full-width intro with photo, video, or animation
- [x] About — bio, photo, background story
- [x] Portfolio / Gallery — pulls from their uploaded galleries
- [x] Social Feed — live embed of their posts from the social network
- [x] Services & Pricing — service cards with descriptions and rates
- [x] Store — print shop, digital downloads, commissions
- [x] Booking Calendar — appointment scheduler with package options
- [x] Events — upcoming appearances, workshops, mini sessions
- [x] Testimonials — client reviews and quotes
- [x] Press / Features — media mentions, brand collabs, publications
- [x] Blog / Journal — posts and updates
- [x] Contact Form — with lead capture and inquiry routing to CRM
- [x] FAQ — expandable questions and answers
- [x] Map — embedded location map (for studios, on-site businesses)
- [x] Social Links — Instagram, TikTok, YouTube, etc.
- [x] Custom HTML block — for advanced users

**🔧 Creator-Type-Specific Sections**
- [x] **Photographer**: Client Gallery Delivery button, Print Shop, Lightroom/PS plugin promo
- [x] **Videographer**: Showreel embed, Project delivery links, Production credits
- [x] **Model**: Digital Comp Card (stats + measurements), Tearsheet gallery, Rate Card
- [x] **Actor**: Digital Résumé (credits, training, unions), Demo Reel, Headshot gallery, IMDB link
- [x] **Cosplayer**: Character portfolio (by franchise), Convention Schedule, Commission Store, Build Journal
- [x] **MUA / Hair / Stylist**: Before/After gallery, Service Menu, Kit/Product list, Certifications
- [x] **Fashion Designer**: Collection Lookbooks (by season), Pattern/Digital Shop, Wholesale Inquiry form
- [x] **Photography Studio**: Team roster, Studio Rental calendar, Equipment list
- [x] **Talent Agency**: Talent roster with links to each creator's profile

---

**🖱️ WYSIWYG Visual Editor (Puck-based drag & drop)**
- [x] Live preview — see changes in real time as you edit
- [x] Drag & drop sections — add, reorder, resize, delete visually
- [x] Click any text to edit inline (no pop-ups)
- [x] Per-section settings — colors, fonts, spacing, layout
- [x] Creator-type section library — filtered to show relevant sections first
- [x] Add/remove pages (About, Gallery, Store, Booking, Blog, etc.)
- [x] Navigation builder (drag to reorder, add dropdowns)
- [x] Mobile / tablet preview mode
- [x] Undo / redo history (50 steps)
- [x] Save as draft or publish instantly
- [x] Per-section animation picker
- [x] AI section writer — "Write an About page for a wedding photographer in Austin"

**✨ Scroll Animation System (GSAP + ScrollTrigger + Lenis)**
- [x] Ken Burns on sections — background photos slowly pan/zoom as you scroll
- [x] Parallax layers — foreground/background at different speeds
- [x] Reveal on scroll — text and photos fade/slide in on viewport entry
- [x] Sticky sections — section pins while content animates over it
- [x] Horizontal scroll sections — cinematic sideways scroll
- [x] Scale on scroll — photos grow/shrink as you scroll past
- [x] Blur to sharp — photos come into focus as they appear
- [x] Counter animations — numbers count up on scroll
- [x] Text split animations — words/letters animate in one by one
- [x] Smooth scrolling — Lenis for silky feel across all browsers
- [x] Animation intensity picker (subtle / medium / dramatic)
- [x] Disable all animations option (accessibility)

**⚙️ Website Settings & Publishing**
- [x] Custom subdomain — `username.[platform].com` (all paid plans)
- [x] Custom domain — bring your own domain (Pro+ plans)
- [x] SEO tools — meta titles, descriptions, image alt text, XML sitemap
- [x] Open Graph tags — controls how links look when shared on social media
- [x] Google Analytics / Meta Pixel integration
- [x] Dark / light mode toggle per site
- [x] Password-protect entire website (for private portfolios)
- [x] Coming soon / maintenance mode page
- [x] Website analytics — page views, visitor locations, top pages (Module 9)
- [x] Social feed integration — posts from [platform] social profile appear on website automatically

---

### 🔌 Module 7 — Lightroom & Photoshop Integration

> **Plugin Tech**: Lightroom Classic plugin (Lua + LR SDK). Photoshop plugin (UXP — JavaScript/React, Adobe's modern plugin system). Both use the same MyShutterHost OAuth2 account. Same trained style profile shared between both apps.

---

**Three Workflow Modes — Photographer Chooses in Dashboard:**

| Mode | Best For | Flow |
|------|----------|------|
| **🟡 Lightroom Only** | Event/wedding volume work | Import → AI Cull → AI Style in LR → Export |
| **🔵 Photoshop Only** | Beauty, boudoir, high fashion | Open in PS → AI Retouch → Export |
| **🟢 LR → PS Hybrid** | Professional mixed workflow | LR batch edits all → select hero shots → PS deep retouch → back to LR |

---

**🟡 Lightroom Plugin — Full Feature Set**

*Phase 1 — Gallery Integration:*
- [x] Upload photos directly from Lightroom to MyShutterHost galleries
- [x] Create new gallery from Lightroom collection with one click
- [x] OAuth2 login — no passwords stored in the plugin
- [x] Import/export Lightroom presets (.lrtemplate / .xmp format)
- [x] Preset marketplace — browse, download, and publish presets from inside Lightroom

*Phase 3 — AI Style Trainer (Lightroom):*
- [x] **"Train from existing catalog"** — select any folders of already-edited photos; plugin reads every develop setting from edited photos and sends patterns to MyShutterHost (no full-res upload — thumbnails + metadata only)
- [x] Folder selector UI — photographer checks which folders to include/exclude (exclude old style, different genres, etc.)
- [x] Estimated accuracy preview before training starts
- [x] Per-shoot-type style learning — AI builds separate style profiles for weddings, portraits, cosplay, golden hour, studio, etc. and applies the right one automatically
- [x] **AI Auto-Cull** — AI sets pick/reject/unflag on every photo in a folder based on: sharpness, exposure quality, blink detection, duplicate grouping, expression scoring
- [x] **AI Apply My Style** — AI sends thumbnails + EXIF to API, receives predicted develop settings, applies them to all selected photos in Lightroom non-destructively
- [x] **AI Color Balance** — corrects white balance (Temp + Tint) per photo based on lighting conditions learned from photographer's style
- [x] **AI Skin Tone Recovery** — adjusts HSL Orange/Red channels to match the photographer's typical skin rendering
- [x] **AI Noise Reduction** — applies Luminance + Color noise reduction at the level the photographer uses per ISO range
- [x] **AI Eye Brightening** — face detection locates iris → local adjustment brush applied at photographer's typical settings (+exposure, +clarity)
- [x] **AI Under-Eye Correction** — face detection locates under-eye region → healing/adjustment brush applied at photographer's typical settings
- [x] **AI Spot Removal** — vision AI detects skin blemishes → Lightroom healing spots placed automatically
- [x] Continuous learning — corrections made after AI edits feed back as new training data automatically
- [x] **"Send to Photoshop"** button — sends selected hero shots to Photoshop plugin for deep retouching
- [x] Style accuracy dashboard — shows current model accuracy %, training photo count, last trained date

---

**🔵 Photoshop Plugin — Full Feature Set**

*Phase 1 — Gallery Integration:*
- [x] Export images from Photoshop directly to MyShutterHost galleries
- [x] Import/export Photoshop actions & presets
- [x] Skin smoothing, retouching presets library
- [x] OAuth2 login — same account as Lightroom plugin

*Phase 3 — AI Style Trainer (Photoshop):*
- [x] **Learn from existing PS work** — plugin reads the photographer's Action history, layer stack structure, brush settings relative to detected face landmarks
- [x] **AI Frequency Separation** — auto-creates the photographer's preferred frequency separation layer stack; heals blemishes on texture layer, smooths color/tone on base layer
- [x] **AI Dodge & Burn** — creates dodge/burn layer; applies learned brightness sculpting relative to face structure (cheekbones, jawline, brow)
- [x] **AI Eye Brightening (precise)** — face detection + iris segmentation → applies dodge to iris and whites at learned opacity/radius
- [x] **AI Under-Eye Healing** — face detection → healing brush on texture layer at photographer's typical settings
- [x] **AI Flyaway Hair Removal** — detects stray hairs at head boundary → content-aware fill removes them
- [x] **AI Blemish & Spot Removal** — vision AI detects blemishes → healing brush + clone stamp on correct layer
- [x] **AI Background Cleanup** — detects distracting elements → content-aware fill (photographer approves before applying)
- [x] **Neural Filters (Adobe AI)** — applies Adobe's Skin Smoothing and Smart Portrait Neural Filters at the strength the photographer prefers
- [x] **AI LUT Color Grading** — applies photographer's preferred LUT at their typical opacity as a layer
- [x] **AI Liquify (subtle)** — Face Tool micro-adjustments at the level the photographer typically uses (conservative by default, adjustable)
- [x] **High-Pass Sharpening** — creates high-pass sharpening layer at photographer's typical radius and opacity
- [x] **"Send back to Lightroom"** — saves and syncs the retouched file back to the Lightroom catalog automatically
- [x] All AI edits on separate named layers — photographer can turn any step on/off

---

**🟢 LR → PS Hybrid Workflow**
- [x] Photographer clicks "Send to Photoshop" on selected hero shots from inside the Lightroom plugin
- [x] Lightroom develop settings are preserved as a smart object in Photoshop
- [x] Photoshop AI runs the deep retouching routine automatically on arrival
- [x] "Return to Lightroom" button saves and syncs the retouched file back to the catalog
- [x] Lightroom shows a "PS Retouched" badge on photos that have been through Photoshop

---

**🏪 Plugin & Preset Marketplace**
- [x] Photographers can publish their own Lightroom presets for free or paid download
- [x] Photographers can publish their own Photoshop actions for free or paid download
- [x] Photographers can publish their own custom plugins (built on LR SDK or PS UXP) — free or paid
- [x] Open-source option — mark plugin/preset as open-source with GitHub link
- [x] Optional Adobe Exchange distribution alongside marketplace listing
- [x] Plugin submissions reviewed before listing (malware prevention)
- [x] Platform takes 20% cut of paid plugin/preset sales
- [x] Star ratings and reviews on all marketplace items

---


### 🤖 Module 8 — AI Features

> **Provider**: User-selectable in dashboard (OpenAI GPT-4o / Anthropic Claude / Google Gemini). Photographer brings their own API key. Vision-capable models enable photo analysis features.

---

**🧭 Level 1 — Platform Assistant (Q&A Chatbox)**

The AI knows every feature of MyShutterHost and guides photographers contextually based on which page they're on:
- [x] Platform help & navigation — *"How do I set up a private client gallery?"*
- [x] Context-aware suggestions — AI sees which page you're on and offers relevant help proactively
- [x] Conversation history — saved chat sessions so photographers can reference past advice
- [x] Prompt library — pre-built quick-start prompts (*"Write my bio"*, *"Caption this photo"*, *"Draft a client email"*)
- [x] Photography education — camera settings, composition, lighting, editing techniques
- [x] Lightroom & Photoshop guidance — workflow tips, adjustment advice, preset suggestions
- [x] Legal & contract help — explain model releases, copyright basics, flag risky contract language
- [x] Pricing & business advice — package structuring, how to handle difficult clients, market positioning
- [x] SEO coaching — review page titles, suggest keywords, explain best practices

---

**⚡ Level 2 — Agentic Actions (AI Does Things FOR You)**

The AI can execute real tasks inside the platform — photographer reviews and approves before anything publishes:
- [x] *"Create a new gallery called 'Sarah & Mike Wedding 2026'"* → creates gallery, sets to private, opens upload
- [x] *"Block my calendar next weekend"* → marks dates unavailable in booking calendar
- [x] *"Generate a client questionnaire for a newborn session"* → builds questionnaire, saves to their forms library
- [x] *"Draft a 'gallery is ready' email to my client Sarah"* → writes email, shows preview, photographer approves & sends
- [x] *"Create a TFP post for a Halloween cosplay shoot in Dallas, looking for a MUA"* → fills collaboration post form for review
- [x] *"Apply a 15% discount code called SPRING2026"* → creates the coupon in store settings
- [x] *"Write alt text for all photos in my Summer Gallery"* → analyzes each photo, populates alt text fields in bulk
- [x] *"Generate a shot list for a 6-hour wedding"* → creates comprehensive shot list, saves to event planner
- [x] *"Write my Instagram bio"* → generates bio based on their portfolio style and specialties
- [x] *"Set up a mini session — 30 mins, $150, 3 slots, Saturday April 5th"* → creates the event with booking slots

---

**✍️ Content Generation**
- [x] **Bio writer** — generates professional photographer bio from a few prompts
- [x] **Gallery descriptions** — SEO-optimized descriptions per gallery (*"Describe my Austin sunset engagement gallery"*)
- [x] **Blog post writer** — full blog posts (*"Write: 5 reasons to hire a professional photographer for your wedding"*)
- [x] **Social media captions** — platform-specific captions for Instagram, Facebook, Pinterest, X/Twitter
- [x] **Hashtag generator** — 30 targeted hashtags based on shoot type, style, and location
- [x] **Client email drafts** — inquiry responses, follow-ups, gallery delivery emails, thank-you notes
- [x] **Invoice & contract language** — help draft custom clauses, explain existing terms
- [x] **Event/mini session descriptions** — write compelling booking page copy
- [x] **Testimonial summarizer** — from multiple client reviews, generate one compelling summary quote
- [x] **Email marketing campaigns** — write full newsletter content for photographer's mailing list
- [x] **Website page copy** — help write About, Services, FAQ, Contact pages
- [x] **Gallery name suggestions** — suggest gallery names based on event details

---

**📸 Photo Intelligence (Vision AI)**
- [x] **AI photo culling** — rank photos by: sharpness, exposure, composition, facial expression quality (eyes open, genuine smile), subject placement
- [x] **Duplicate / near-duplicate detector** — in a burst of 10 similar shots, identify the best one and flag the rest for deletion
- [x] **Auto-tagging** — detect and tag: people, locations, scene types (indoor/outdoor/golden hour/night), events (wedding/portrait/cosplay/landscape)
- [x] **Expression detector** — in portrait sessions, identify which shots have the best facial expressions
- [x] **AI-generated alt text** — analyze actual photo content and write descriptive, SEO-friendly alt text
- [x] **Smart album builder** — group uploaded photos into suggested albums by scene, subject, or time
- [x] **Composition feedback** — analyze a photo's composition and provide constructive feedback
- [x] **Photo-to-caption** — upload any photo → AI writes a caption for it
- [x] **AI upscaling** — upscale low-res photos for print-quality output (Real-ESRGAN technology)
- [x] **Watermark position optimizer** — AI suggests optimal watermark placement that avoids covering key subjects
- [x] **Color palette extractor** — extract the dominant colors from a photographer's portfolio to suggest website brand colors
- [x] **Sky & scene classifier** — identify which photos have skies suitable for enhancement, scenes suitable for certain print products

---

**📊 Business Intelligence**
- [x] **Analytics insights in plain English** — *"Your Tuesday galleries get 3x more engagement than Friday ones. Consider posting new galleries on Tuesdays."*
- [x] **Revenue insights** — *"Your print sales spike in November — consider running a holiday promotion in October"*
- [x] **Pricing optimizer** — based on their market, niche, and experience, suggest competitive pricing for sessions and products
- [x] **Client retention alerts** — *"You haven't heard from 5 repeat clients in over a year. Want me to draft a re-engagement email?"*
- [x] **Gallery performance summary** — *"Your 'Golden Hour Portraits' gallery has 3x more saves than average. Consider promoting it."*
- [x] **SEO site audit** — scan the photographer's entire website, score each page, give specific improvement suggestions
- [x] **Booking conversion tips** — if inquiry-to-booking rate is low, AI suggests what to change in the booking flow

---

**💬 Client-Facing AI Widget (on Photographer's OWN website)**

Photographers can optionally add an AI chat widget to their public portfolio website. Their clients and visitors can ask it questions:
- [x] *"What packages do you offer?"* → AI answers based on the photographer's services/pricing page
- [x] *"Are you available on June 14th?"* → AI checks the booking calendar and answers
- [x] *"How long until I get my photos back?"* → AI answers based on the photographer's turnaround settings
- [x] *"How do I download my photos?"* → AI explains the download process
- [x] *"I'd like to book a session"* → AI collects client info and creates a lead in the photographer's CRM
- [x] Fully trained on the photographer's own website content, services, and FAQ
- [x] Photographer writes a short "About my business" prompt to personalize the AI's voice/tone
- [x] Toggle on/off per website in the dashboard
- [x] Uses photographer's own API key (no additional cost to MyShutterHost)

---

**🚀 Phase 3 — AI Style Trainer (Confirmed, Not Future)**
- [x] **Train from existing Lightroom catalog** — select folders of already-edited work; AI learns from thousands of before/after develop setting pairs instantly
- [x] **Train from existing Photoshop work** — reads Action history, layer structures, local adjustment patterns relative to face landmarks
- [x] Folder selector with accuracy estimate ("3,810 training photos → estimated 91% accuracy")
- [x] Per-shoot-type style profiles — separate learned styles for weddings, portraits, cosplay, golden hour, studio
- [x] Style date filtering — exclude older work that doesn't represent current style
- [x] Continuous background learning — every post-AI correction feeds back as training data
- [x] Style accuracy dashboard — current %, training count, improvement over time graph
- [x] Works in Lightroom only / Photoshop only / LR→PS hybrid mode

**🚀 Future AI Roadmap (Phase 4)**
- [ ] **AI shooting location finder** — based on desired mood/style, suggest nearby locations with GPS coordinates
- [ ] **AI mood board generator** — describe a shoot concept → AI generates a mood board with color palettes and style references
- [ ] **AI social media scheduler** — analyze engagement patterns and suggest/auto-schedule the optimal posting times
- [ ] **AI style trainer v2** — vision-model based (CLIP embeddings) for even deeper style understanding beyond slider patterns
- [ ] **AI equipment advisor** — based on what a photographer shoots, suggest gear upgrades with explanation of why
- [ ] **Multilingual AI** — AI responds in the user's language automatically (ties into i18n)

---

### 📊 Module 9 — Creator Analytics & Audience Intelligence

> **Architecture**: Two-database analytics stack. PostgreSQL handles business data (users, orders, bookings). **ClickHouse** handles the analytics event firehose (billions of view events, sub-second queries). **Redis** powers real-time counters. **PostHog** (self-hosted) handles product funnels and session analysis. **MaxMind GeoIP2** resolves IP → city/region/country with no API fees.

---

> [!IMPORTANT]
> **Privacy & Legal Compliance Built In**
> Age, gender, and behavioral analytics fall under GDPR Article 22 (profiling) and CCPA rules.
> - Users **consent** to demographic/behavioral analytics at signup (opt-in checkbox, not pre-ticked)
> - Creators see **aggregated anonymous data only** — never individual user identities
> - "Names" in stats are replaced with anonymous viewer IDs (hashed fingerprints)
> - Users can **opt out** in their account settings at any time
> - Under-13 users (COPPA) are excluded from all demographic tracking
> - "Personality traits" are implemented as **Audience Interest Segments** (inferred from content engagement, not personal data) — legally cleaner and more useful

---

**⚙️ Analytics Event Pipeline**

```
User views a photo / page / video / post
         ↓
Client fires an event (lightweight, <1KB):
{
  event:           "photo_view",
  contentId:       "photo_abc123",
  creatorId:       "creator_xyz",
  viewerToken:     "anon_hash_789a",   ← hashed, NOT real user ID
  sessionId:       "sess_xyz",
  duration:        4.2,                ← seconds on this photo
  scrollDepth:     0.73,               ← 73% of page scrolled
  referrer:        "instagram",        ← where they came from
  country:         "US",
  region:          "Texas",
  city:            "Austin",
  device:          "mobile",
  os:              "iOS",
  browser:         "Safari",
  hour:            14,                 ← 2:00 PM local time
  dayOfWeek:       3,                  ← Wednesday
  timestamp:       "2026-06-25T19:32Z"
}
         ↓
  ┌──────────────────┐    ┌──────────────────┐
  │  ClickHouse DB   │    │  Redis Counter   │
  │  (stored async,  │    │  (real-time      │
  │   milliseconds)  │    │   view ticker)   │
  └──────────────────┘    └────────┬─────────┘
                                   │
                              Socket.io
                                   │
                          Live counter pushed
                          to all viewers on
                          that post/gallery
```

---

**📈 Content Performance Analytics**

*Views & Engagement:*
- [x] Total views per photo / post / video / gallery / page (all-time, 7d, 30d, 90d, custom range)
- [x] Unique viewer count (distinct anonymous visitor fingerprints)
- [x] **View duration** — average time spent on each photo, video (seconds watched), page
- [x] **Scroll depth** — what % of visitors scrolled past each section of a page
- [x] **Video completion rate** — what % of viewers watched to 25%, 50%, 75%, 100%
- [x] **Engagement rate** — (likes + comments + shares + saves) ÷ views × 100
- [x] Like, comment, share, save counts per post with trend charts
- [x] Click-through rate — how many viewers clicked "Book Now", "Buy Print", "Follow", etc.
- [x] **Photo heatmap** — on a gallery page, which individual photos get the most attention (eye-catching vs. skipped)
- [x] **Gallery exit point** — which photo or page section causes visitors to leave

*Repeat Viewer Intelligence:*
- [x] **Return visitor rate** — what % of views are from the same anonymous viewer (days/weeks apart)
- [x] **"Top fans" frequency tracker** — see that anonymous viewer #A7F3 has visited your profile 47 times this month (name always hidden)
- [x] **Content affinity** — which specific photos/videos does the same anonymous viewer keep returning to
- [x] **Superfan detection** — flag anonymous viewers who have viewed, liked, and returned more than a configurable threshold
- [x] View streak detection — content that the same viewer returns to daily

*Real-Time Live Counters:*
- [x] **Live view ticker on posts** — "🔴 23 people viewing this right now" (updates every second via Socket.io)
- [x] **Live gallery counter** — real-time count of how many people are in a gallery right now
- [x] **Trending now indicator** — posts gaining views faster than usual get a "🔥 Trending" badge
- [x] **Real-time dashboard** — creator dashboard shows live activity as it happens (incoming views, tips, orders)
- [x] **Spike notifications** — push notification when a post hits unusual traffic (e.g., 10x normal rate in an hour)

---

**👥 Audience Demographics & Segments**

> All demographic data is aggregated (minimum group size of 100 to prevent de-anonymization) and shown as percentages only.

*Age Range Breakdown:*
- [x] Estimated age range of viewers (based on consented declared age at signup + behavioral signals)
- [x] Shown as buckets: 13-17 / 18-24 / 25-34 / 35-44 / 45-54 / 55-64 / 65+
- [x] Which age groups engage most (likes, saves, purchases)
- [x] Which age groups are most likely to book or buy

*Gender Breakdown:*
- [x] Self-declared gender distribution of viewers (from consented profile data)
- [x] Shown as: Woman / Man / Non-binary / Prefer not to say / Unknown
- [x] Which gender segments engage most with each content type

*Audience Interest Segments (behavioral, not personal data):*
- [x] Platform infers interest clusters from what content each anonymous viewer engages with:
  - 🎭 **Cosplay Enthusiast** — engages heavily with cosplay content
  - 👗 **Fashion Forward** — engages with fashion, styling, editorial
  - 📸 **Photography Hobbyist** — browses technique posts, gear discussions
  - 💒 **Wedding Prospect** — views wedding galleries, clicks "Book a Consultation"
  - 🎨 **Art Collector** — views and saves fine art, landscape, abstract work
  - 🏋️ **Fitness & Lifestyle** — engages with fitness model, active lifestyle content
  - 🎬 **Production Professional** — views videography, behind-the-scenes, crew content
  - 🦸 **Fan / Convention Goer** — follows cosplayers, visits convention event posts
  - 💼 **Commercial Buyer** — views commercial photography/video, clicks rate cards
  - 🎓 **Creative Student** — engages with tutorials, educational content
- [x] Creator sees their top 3 audience segments as a pie chart
- [x] Segment performance — which segments convert to buyers/bookers best

---

**🌍 Geographic Analytics**

- [x] **World heatmap** — interactive globe/map showing where all views originate, colored by density
- [x] **Top countries** — ranked list with view counts and % of total
- [x] **Top regions / states** — drill down from country into states/provinces
- [x] **Top cities** — most common cities viewers are in
- [x] **Local vs. out-of-market** — what % of viewers are within 50mi of creator's listed location vs. elsewhere
- [x] City-level filtering — see stats for "only viewers in Austin"
- [x] Geographic revenue breakdown — where are your buyers located?
- [x] International reach score — metric of how globally distributed your audience is

---

**⏰ Time & Pattern Analytics**

- [x] **Hourly heatmap** — 24-hour grid showing views by hour of day (across your audience's local times)
- [x] **Day of week heatmap** — Monday–Sunday breakdown, which days drive the most views
- [x] **Best time to post** — AI recommendation based on when your specific audience is most active
  - *"Your audience is most active Tuesday 7–9pm. Schedule your next post for then."*
- [x] **Seasonal trends** — 12-month view showing which months are your busiest
- [x] **Holiday traffic patterns** — detect spikes around Christmas, Valentine's Day, Comic Con seasons, etc.
- [x] **Post timing optimizer** — compare posts made at different times, show which performed better

---

**💰 Revenue & Conversion Analytics**

- [x] **Revenue per post** — which specific photos, galleries, or posts generated tip/star/sale revenue
- [x] **Revenue attribution** — which marketing channel (Instagram link, Google search, direct URL, email) led to the actual sale
- [x] **Conversion funnel** — Viewer → Follower → Buyer (drop-off rates at each stage)
- [x] **Average order value** over time
- [x] **Revenue per viewer** — how much each unique viewer generates on average
- [x] **Best-selling content** — which photos/videos have generated the most revenue (tips + prints + downloads)
- [x] **Booking conversion rate** — of people who visit your booking page, what % actually book
- [x] **Abandoned booking tracking** — visitors who started but didn't complete a booking (send re-engagement email)
- [x] Collaborative project revenue tracking — earnings from revenue-sharing contracts (Module 20)

---

**📈 Growth & Audience Analytics**

- [x] **Follower growth timeline** — chart of follows/unfollows over time with event markers (e.g., "this post caused +127 follows")
- [x] **Profile visitor → follower conversion rate** — what % of profile visitors follow you
- [x] **Follower source** — how did followers find you? (direct search, shared post, event page, looking for board)
- [x] **Audience retention** — are followers still engaging 30/60/90 days after following?
- [x] **Churn rate** — unfollows per week, with context ("you lost 12 followers the week you posted less frequently")
- [x] **Reach vs. impressions** — unique viewers (reach) vs. total views including repeats (impressions)
- [x] **Organic vs. cross-post reach** — views from within the platform vs. views driven by Instagram/Facebook/X cross-posts

---

**📱 Device & Technical Analytics**

- [x] Device breakdown — Mobile / Desktop / Tablet (% split with trend over time)
- [x] Operating system — iOS / Android / Windows / macOS / Other
- [x] Browser breakdown — Safari / Chrome / Firefox / Samsung Browser / Other
- [x] Screen resolution distribution (useful for optimizing photo display sizes)
- [x] Connection type — WiFi vs. cellular (important for video quality decisions)
- [x] Page load time — average load speed per page type (flag slow pages)

---

**🏆 Content Comparison & Benchmarking**

- [x] **Head-to-head comparison** — select any two posts and compare all metrics side by side
- [x] **Your best performers** — top 10 photos/posts/videos of all time, this month, this week
- [x] **Content type performance** — do your cosplay posts outperform your portrait posts? Color-coded breakdown
- [x] **Creator type benchmarking** (opt-in) — how does your engagement compare to similar creators in your category? (all anonymous, shown as percentile: "You're in the top 23% of photographers for engagement rate")
- [x] **A/B testing** — post two versions of similar content on different days, platform helps compare performance

---

**🔔 Alerts & Notifications**

- [x] **Trending alert** — push notification when a post hits 2x its normal view rate in under 1 hour
- [x] **Milestone alerts** — "🎉 Your gallery just hit 10,000 views!" / "You reached 500 followers!"
- [x] **Revenue alert** — "💰 You just earned $47 from tips and print sales today"
- [x] **Booking spike alert** — "📅 3 people viewed your booking page in the last 10 minutes"
- [x] **Superfan alert** — anonymous viewer has crossed your set threshold (e.g., 25+ profile visits)
- [x] All alerts configurable — set thresholds, turn any off

---

**📬 Reporting & Exports**

- [x] **Weekly email digest** — automated every Monday morning: top stats from the past week, highlights, tip of the week
- [x] **Monthly performance report** — PDF + email: month-over-month comparison, top content, audience growth, revenue
- [x] **Custom date range reports** — pull stats for any date range
- [x] **CSV export** — download raw event data for your own analysis / QuickBooks / Excel
- [x] **Goal tracking** — set goals (1,000 followers, $500/month revenue, 50 bookings this year) and track progress with visual progress bars
- [x] **AI insights summary** — plain English explanation of your stats: *"Your Tuesday posts get 3x more engagement than Friday ones. Your audience in Texas converts to buyers at 4x the rate of your California viewers."*
- [x] **Scheduled reports** — set reports to auto-send weekly, monthly, or quarterly to your email

---

**💾 Storage Management (same module)**
- [x] Storage usage dashboard (per creator, per plan tier) — GB used vs. plan limit
- [x] External storage connection — link your own S3, Backblaze B2, or Google Drive as overflow storage
- [x] Backup & version history — restore deleted photos up to 90 days
- [x] Bandwidth and download tracking — see how much CDN bandwidth your galleries consume
- [x] Storage optimizer — flag duplicate files, unused galleries, low-res duplicates of high-res originals

---



### 👤 Module 10 — Platform Admin & Accounts
- [x] Photographer account with subscription billing (Free / Pro / Studio tiers)
- [x] Multi-photographer studio accounts (one studio, multiple photographer sub-accounts)
- [x] Affiliate / referral program (refer a photographer, earn credits)
- [x] Email marketing integration (Mailchimp, ConvertKit — build mailing list from fans/followers)
- [x] Newsletter signup widget for photographer websites
- [x] Multi-language / internationalization support (i18n)
- [x] Mobile app (iOS + Android) for photographers to manage on the go *(Phase 4)*

---

### 👥 Module 11 — Client Accounts & Profiles

Clients (the people who visit photographer websites) get their own accounts on MyShutterHost that track everything they do across all photographer sites on the platform.

**Client Profile:**
- [x] Client signup via email, Google, Facebook, or Apple (social login for easy onboarding)
- [x] Profile photo upload
- [x] Name, bio, location, website
- [x] Public or private profile toggle
- [x] Profile visible to photographers whose galleries they've interacted with

**Activity Tracking (auto-tracked, visible to client):**
- [x] **Photos liked** — all photos they've hearted across any gallery
- [x] **Photos shared** — history of every share to social media
- [x] **Photos purchased** — all digital downloads bought, with re-download links
- [x] **Photos tagged in** — every photo they appear in or were tagged in
- [x] **Print orders** — full order history, status, tracking numbers
- [x] **Galleries visited** — history of galleries they've browsed
- [x] **Galleries saved/bookmarked** — galleries they want to revisit
- [x] **Wishlist** — photos saved to buy later

**Bookings & Appointments:**
- [x] Upcoming booked sessions with any photographer on the platform
- [x] Past session history
- [x] Session documents (contracts, invoices, questionnaires) in one place
- [x] One-click rebooking with the same photographer

**Stars & Tips Wallet:**
- [x] Stars balance dashboard (how many stars they currently hold)
- [x] Buy stars / credits directly from their profile (Stripe)
- [x] Full stars sent history — which photographers they supported, when, how much
- [x] Full tips sent history — tip amounts, dates, photographers
- [x] Earned stars (if referral program is active)
- [x] Stars expiry reminders (if stars expire after X months)

**Followed Photographers:**
- [x] Follow/unfollow photographers
- [x] Feed of new galleries posted by followed photographers
- [x] Notification when a photographer they follow posts a new gallery

**Notifications:**
- [x] In-app notification center (new tags, gallery ready, order shipped, etc.)
- [x] Email notification preferences (opt-in/out per type)
- [x] Push notifications (mobile app — Phase 4)

**Privacy & Security:**
- [x] Untag requests (remove themselves from tagged photos)
- [x] Delete account + all personal data (GDPR right to erasure)
- [x] Control who can tag them (anyone / only verified photographers / nobody)
- [x] Two-factor authentication (2FA)

**What to Use for Client Auth:**
> Auth.js v5 already handles this — supports email/password + Google + Facebook + Apple OAuth out of the box. Client accounts and photographer accounts are the same auth system, just different roles.

---

### 🖥️ Module 12 — Photographer Dashboard & Admin Panel

The photographer's private backend — everything they need to run their business.

**Gallery & Content Management:**
- [x] Upload, organize, and manage all galleries and photos
- [x] Set download tiers per gallery (free low-res / paid standard / paid high-res / free high-res)
- [x] Watermark settings (upload custom watermark, set position + opacity)
- [x] Gallery visibility (public / private / password-protected / client-only)
- [x] Schedule gallery publish date

**Face Recognition Settings (per photographer account):**
- [x] **Face search toggle** — enable or disable "Find My Photos" for their entire account
- [x] **API provider selector** — choose between:
  - AWS Rekognition (pay-per-use, ~$1/1,000 searches)
  - Azure Face API (similar pricing, different accuracy profile)
  - Disabled (no face search at all — for photographers who serve privacy-sensitive clients)
- [x] **Per-gallery face search toggle** — even if enabled globally, they can disable for specific galleries (e.g. disable for a private boudoir gallery)
- [x] Photographer enters their own AWS or Azure API key (they pay their own usage fees directly)
- [x] Usage stats — how many face searches have been run this month

**Store & Orders:**
- [x] Order management (pending / in production / shipped / delivered)
- [x] Shipping label generation (EasyPost — USPS, UPS, FedEx, DHL)
- [x] Revenue dashboard (sales, downloads, tips, stars, payouts)
- [x] Payout history (Stripe Connect)
- [x] Product catalog management (prints, products, pricing)

**Client Management:**
- [x] Client list with profile photos and full history
- [x] Per-client activity view (what they bought, tipped, shared, booked)
- [x] Send messages to clients
- [x] Client tags and notes (internal — clients don't see these)

**Booking & Business:**
- [x] Booking calendar (availability, session types, pricing)
- [x] Contract templates (create once, reuse per booking)
- [x] Invoice generator
- [x] Wedding planner per event
- [x] Lead management (inquiries → follow-up → booked)

**Website Management:**
- [x] WYSIWYG visual editor (Module 6)
- [x] Domain & subdomain settings
- [x] SEO settings per page
- [x] Analytics (page views, top photos, visitor map, conversion rates)
- [x] Social media feed connections (connect Instagram, TikTok for embedded feeds)

**Account & Billing:**
- [x] Subscription plan (upgrade/downgrade)
- [x] Storage usage meter
- [x] API key management (Lightroom/Photoshop plugin tokens)
- [x] Notification preferences
- [x] Two-factor authentication

---

### 🤝 Module 13 — TFP Collaboration Hub & Events

**What is TFP?** Time For Print (also Trade For Print) — a common photography arrangement where photographer, model, makeup artist, stylist, etc. all work for free and each receives the final images in exchange.

**Creative Discovery (find collaborators):**
- [x] Searchable directory of creatives on the platform (photographers, models, cosplayers, MUAs, hair stylists, wardrobe stylists, location scouts)
- [x] Creative profile cards (portfolio samples, specialties, location, availability, TFP-open badge)
- [x] Filter by: creative type, location/distance, style, availability, experience level
- [x] Star ratings & reviews between collaborators after shoots
- [x] "Open to TFP" toggle on each user's profile
- [x] Send collaboration request to any creative (triggers a notification + starts a chat room)

**Shoot Planning Workspace (per collaboration):**
- [x] Private group workspace per shoot (all team members invited)
- [x] Shoot concept board (mood board with reference images, color palettes)
- [x] Shot list builder (list of must-get shots, locations, outfits)
- [x] Call sheet generator (time, location, parking, roles, emergency contacts)
- [x] Availability polling ("what dates work for everyone?" — like Doodle but built-in)
- [x] Shoot date confirmed → auto-added to all members' calendars
- [x] Post-shoot: photographer marks who gets which images, delivers gallery link

**TFP Contracts & Media Releases:**
- [x] Pre-built TFP agreement template (no money exchanged, image usage rights defined)
- [x] Model/subject media release template (photographer can use images for portfolio, social, etc.)
- [x] Location release template
- [x] Cosplay-specific release (handles character IP considerations)
- [x] All parties sign digitally inside the platform before the shoot
- [x] Signed contracts stored in each user's document history
- [x] Custom contract fields (photographer can add custom clauses)

**Events & Mini Sessions Board (public-facing on photographer's website):**
- [x] Dedicated Events page on photographer's website (own nav menu item)
- [x] Event listings: title, date, location, description, cover photo, spots available
- [x] Event types: public shoot event, mini session, workshop, convention appearance, styled shoot
- [x] Mini session booking: limited time slots (e.g. "Saturday April 5th — 10am / 11am / 12pm — $150 for 30 min")
- [x] "Book a slot" button → goes straight to Stripe checkout
- [x] Countdown timer on upcoming events ("12 days away")
- [x] Spots remaining counter ("3 of 8 slots left")
- [x] RSVP for free events
- [x] Share event to Facebook, Instagram, X with one click
- [x] **Facebook Events sync** — publish event to Facebook Events automatically via Facebook Graph API
- [x] Event reminder emails to people who RSVP'd or booked
- [x] Past events archive (shows previous shoots, links to the gallery)
- [x] Embed events widget on external websites (share your mini session calendar anywhere)

**Social Linking for Events:**
- [x] Link any event to an existing Facebook Group or Facebook Event page
- [x] Link to Instagram post or story about the event
- [x] Share event QR code (for printing and posting at venues, conventions, etc.)
- [x] Auto-post new events to connected social media accounts

---

### 💬 Module 14 — Real-time Chat & Messaging

A **Facebook Messenger + Discord hybrid** built directly into the platform. Users never have to leave MyShutterHost to communicate.

**Tech: Socket.io** — runs self-hosted on your Vultr server as part of the Next.js app. Zero extra monthly cost, fully controlled, no third-party dependency.

**Direct Messages (Messenger-style):**
- [x] 1-on-1 private DMs between any two users (photographers, clients, models, collaborators)
- [x] Message history stored in PostgreSQL
- [x] Seen / delivered receipts
- [x] Typing indicator ("Jane is typing...")  
- [x] Emoji reactions on messages
- [x] Reply to a specific message (threaded reply)
- [x] Share photos/files directly in chat (stored on Cloudflare R2)
- [x] Share gallery links — renders a preview card in-chat
- [x] Send a booking request directly from chat ("Book a session" button)
- [x] Archive / delete conversations
- [x] Block / report users

**Group Shoot Rooms (Discord-style):**
- [x] Automatic group room created for every TFP collaboration or booked shoot team
- [x] Named channels within a room (e.g. #general, #shot-list, #mood-board, #logistics)
- [x] Pin important messages (pinned call sheet, shoot date, directions)
- [x] @mention team members
- [x] Role labels in group (Photographer, Model, MUA, Stylist, etc.)
- [x] Share mood board images directly in the room
- [x] File attachments (contracts, PDFs, reference images)
- [x] Room archived after shoot completes (history preserved for reference)

**Notifications:**
- [x] In-app notification badge (unread message count)
- [x] Email notification for new messages (if user is offline)
- [x] Push notifications (mobile app — Phase 4)
- [x] "Do not disturb" mode

**Platform Connections (link, don't replace):**
- [x] Link a Facebook Messenger conversation from chat (photographer can paste their Messenger link)
- [x] Link a Discord server from a group room
- [x] These are just shortcut links — core communication always happens inside MyShutterHost

---


| Your Feature | Status |
|---|---|
| Photo gallery | ✅ Module 1 |
| Video gallery | ✅ Module 1 |
| Point of sale (photos, prints, products) | ✅ Module 2 |
| Social media sharing | ✅ Module 3 |
| Like & share for galleries + individual pics | ✅ Module 3 |
| Send galleries/pics to friends on social media | ✅ Module 3 |
| Pay to download | ✅ Module 2 |
| Accept tips | ✅ Module 2 |
| Hearts & Stars micropayment system | ✅ Module 2 |
| Contracts | ✅ Module 4 |
| Booking calendar | ✅ Module 4 |
| Watermarks | ✅ Module 1 |
| External storage | ✅ Module 9 |
| Lightroom plugin | ✅ Module 7 |
| Photoshop plugin | ✅ Module 7 |
| Import/export presets | ✅ Module 7 |
| Photo culling | ✅ Module 1 + Module 8 |
| Wedding planner | ✅ Module 4 |
| Portfolios | ✅ Module 6 |
| Music for photo albums | ✅ Module 1 |
| Photographer profile page | ✅ Module 6 |
| AI chatbox | ✅ Module 8 |
| Embedded social media feeds | ✅ Module 3 |
| Subscriptions | ✅ Module 10 |
| Customizable UI & templates | ✅ Module 6 |
| Pre-made templates | ✅ Module 6 |

---

## 💡 Suggested Features You Didn't Mention (Worth Considering)

> [!NOTE]
> These are common features on top photography platforms that you may want to add.

| Suggested Feature | Why It Matters |
|---|---|
| **Print lab integrations** (WHCC, Printful, Bay Photo) | Without these, print orders have no fulfillment — you need a real lab to print and ship |
| **Client CRM** | Track leads → booked → shot → delivered workflow |
| **Digital contracts + e-signatures** | Legally protects photographers (model releases, session agreements) |
| **Invoicing & payment requests** | Photographers often invoice separately from store sales |
| **Mood board builder** | Clients share style inspiration before the shoot |
| **Intake questionnaires** | Photographers send forms to clients before sessions |
| **Preset marketplace** | Photographers can sell/share presets — a revenue stream for you |
| **Affiliate/referral program** | Viral growth — photographers refer others, earn credits |
| **Email marketing integration** | Build a mailing list from fans who love their work |
| **Multi-photographer studio accounts** | Studios with 5+ photographers need team management |
| **SEO tools built in** | Photographers need their sites to rank on Google |
| **Geographic/map gallery view** | "Photos taken in Paris" — great for travel photographers |
| **EXIF data display** | Photography enthusiasts love seeing camera settings |
| **Embeddable gallery widget** | Lets photographers embed galleries on external blogs/sites |
| **Gift cards** | Great for holiday print sales |
| **Coupon/discount codes** | Session promotions, holiday sales |
| **Mobile app** (Phase 4) | Manage galleries, approve bookings, check sales on the go |
| **QR code generator** | Print QR codes at events linking to gallery |
| **Multi-language (i18n)** | International photographers |

---

## Development Phases

### 🛠️ Module 15 — Support & Platform Transparency

> Lives inside the **super-admin panel** (your side) and the **user's profile** (their side). Not a separate website — fully integrated into the existing apps.

**Support Ticket Submission (user side — in their profile/dashboard):**
- [x] "Submit a Support Ticket" form in user's dashboard profile section
- [x] Fields: ticket type (Bug / Feature Request / General Help), title, description, severity, optional screenshot upload
- [x] After submitting, ticket appears in their **"My Support Tickets"** section in their profile
- [x] Ticket status visible in-profile: Submitted → Under Review → In Progress → Resolved → Closed
- [x] In-app notification when ticket status changes (default — no email required)
- [x] **Email notifications: opt-in only** — user can toggle "Email me when my ticket updates" in their notification settings
- [x] User can add follow-up comments to an open ticket
- [x] User can mark a resolved ticket as "Still Having This Issue" to reopen it

**Support Ticket Management (your side — super-admin panel):**
- [x] All tickets listed in a dedicated **Support** section of your super-admin panel
- [x] Filter by: status, severity, ticket type, date submitted, user
- [x] Click any ticket to see full details, user info, and screenshot
- [x] Update ticket status from the admin panel → triggers in-app notification to the user
- [x] Add internal admin notes (not visible to user)
- [x] Reply to user directly from the ticket (message appears in their ticket thread)
- [x] Mark duplicate tickets and link them together
- [x] Assign tickets to a release version / milestone

**Changelog & Update Notes (admin posts, users read):**
- [x] You write changelog entries in the super-admin panel using a rich text editor (TipTap)
- [x] Entries tagged by version (v1.4.0) and type: 🐛 Bug Fix / ✨ New Feature / 🔧 Improvement
- [x] Changelog page visible on MyShutterHost.com and inside the photographer dashboard
- [x] **"What's New"** bell icon in the dashboard shows unread changelog entries
- [x] Email digest: opt-in only — users can choose to receive changelog summaries

**Feature Roadmap & Suggestions (community-driven):**
- [x] Users submit feature suggestions from their profile or the roadmap page
- [x] Upvoting — users upvote suggestions they want most
- [x] You review suggestions in the admin panel and move them to the roadmap
- [x] Public roadmap shows: 💭 Considering → 📌 Planned → 🔧 In Progress → ✅ Shipped
- [x] In-app notification (opt-in email) when a suggestion the user voted for ships

**Planned Maintenance Notices:**
- [x] You post planned downtime notices in the admin panel
- [x] Banner auto-appears in the photographer dashboard and on MyShutterHost.com before the window
- [x] In-app notification sent to all users when a maintenance window is posted

**Tech for this module — nothing new needed:**
- PostgreSQL stores tickets, changelog entries, roadmap items, votes
- TipTap (already in stack) for rich text changelog entries
- Socket.io (already in stack) for real-time in-app ticket status notifications
- Resend (already in stack) for opt-in email notifications only

---


**Goal**: Get photographers live with a website, gallery, and ability to sell.
- Photographer signup, auth, onboarding
- Photo + video gallery upload
- 5 pre-built templates + basic customizer
- Custom subdomain
- Photographer profile page
- Pay-to-download + print store (Printful integration)
- Stripe billing (subscriptions + store payments)
- Watermarking
- Social sharing (Facebook, Pinterest, X)
- Basic SEO tools

### Phase 2 — Client & Business Tools
**Goal**: Turn MyShutterHost into a full business platform.
- Client proofing galleries (password-protected)
- Booking calendar + contracts + e-signatures
- Invoicing & payment requests
- Wedding planner
- Client CRM
- Intake questionnaires + mood boards
- Tips + Hearts & Stars micropayment system
- Advanced template customizer (drag-and-drop)
- Custom domain (BYOD)
- Blog/journal
- Embedded social media feeds
- Analytics dashboard

### Phase 3 — Power Tools & AI
**Goal**: Give photographers tools no competitor offers.
- Lightroom plugin (push to gallery)
- Photoshop plugin (export to gallery)
- Preset import/export + preset marketplace
- Photo culling tool (manual + AI-assisted)
- AI chatbox
- AI auto-tagging + gallery descriptions + alt-text
- Music for photo albums
- Slideshow creator
- Email marketing integration
- Affiliate/referral program
- Multi-photographer studio accounts
- External storage connections
- Geographic/map gallery view

### Phase 4 — Mobile & Scale
**Goal**: Mobile-first management + international growth.
- iOS + Android app for photographer management
- Multi-language support (i18n)
- Advanced print lab integrations (WHCC, Bay Photo, Miller's)
- AI skin retouching presets
- Gift cards + coupon codes
- Embeddable gallery widget (embed on external sites)

---

## Pricing Tiers (Updated)

### Vultr Server Setup

**Phase 1 (Launch) — Everything on one server:**
```
┌─────────────────────────────────────┐
│         Single Vultr VPS            │
│         (Coolify manages all)       │
│                                     │
│  ┌─────────┐  ┌──────┐  ┌───────┐  │
│  │ Next.js │  │  PG  │  │ Redis │  │
│  │  App    │  │  DB  │  │ Cache │  │
│  └─────────┘  └──────┘  └───────┘  │
│         (Docker containers)         │
└─────────────────────────────────────┘
             ↑
     Cloudflare CDN sits in front
```

**Phase 2 (Post-Launch) — Migrate DB to dedicated server:**
```
┌──────────────────┐     ┌─────────────────────┐
│  Vultr VPS #1    │     │   Vultr VPS #2       │
│  (App Server)    │────▶│   (Database Server)  │
│                  │     │                      │
│  ┌────────────┐  │     │  ┌──────┐  ┌───────┐ │
│  │ Next.js    │  │     │  │  PG  │  │ Redis │ │
│  │ App        │  │     │  │  DB  │  │ Cache │ │
│  └────────────┘  │     │  └──────┘  └───────┘ │
└──────────────────┘     └─────────────────────┘
```
> **Migration is easy** — just update the `DATABASE_URL` environment variable in Coolify to point to the new server. Prisma doesn't care where the DB lives.

> [!NOTE]
> When you're ready to split, use `pg_dump` to export the database and `pg_restore` to import it on the new server. Zero code changes required — just an env var update in Coolify.

| Tier | Price | Storage | Key Features |
|------|-------|---------|--------------|
| **Free** | $0/mo | 5 GB | 3 galleries, subdomain only, watermark |
| **Pro** | $29/mo | 200 GB | Unlimited galleries, custom domain, store, booking |
| **Studio** | $79/mo | 1 TB | Everything + Lightroom/PS plugins, multi-user, analytics |
| **Enterprise** | Custom | Unlimited | White-label, API access, dedicated support |

---

## ✅ All Decisions Resolved

### 1. Print Fulfillment
- **Printful** — easiest integration, wide product range, global fulfillment
- **WHCC** — professional lab quality, preferred by serious photographers
- **Self-fulfillment** — photographer prints their own, handles their own shipping; platform just manages the order, address, and payment
- Photographer chooses one or more in their dashboard. Can run all three simultaneously (e.g. self-fulfill local orders, use WHCC for pro prints, Printful for merchandise)

### 2. Hearts & Stars Micropayment Tiers
Platform sets fixed rates (not photographer-defined). Each icon = a different tier with a fixed dollar value:

| Icon | Name | Value | Use Case |
|------|------|-------|----------|
| 💙 | Heart | $0.10 | Quick appreciation |
| ⭐ | Star | $0.25 | Nice work! |
| 💫 | Shooting Star | $0.50 | Wow, great shot |
| 💎 | Diamond | $1.00 | Exceptional work |
| 👑 | Crown | $5.00 | True fan support |
| 🔥 | Fire | $10.00 | Top supporter |

Clients buy icon packs (e.g. 10 Hearts for $1.00). Platform takes a small % cut (e.g. 10%). Photographer gets the rest via Stripe Connect payout.

### 3. Plugin Distribution
- **Primary**: Direct download from MyShutterHost plugin marketplace
- **Photographer-created plugins**: Any photographer can build and list their own Lightroom/Photoshop plugin on the marketplace, either free or paid
- **Open-source option**: Photographers can mark plugins as open-source with a GitHub link
- **Adobe Exchange**: Optional secondary distribution — photographers can choose to also list on Adobe Exchange
- Platform takes a % cut of paid plugin sales (revenue stream for MyShutterHost)
- Plugin submissions go through a basic review process before listing (prevent malware)

### 4. Video Storage — Multi-Tier Options
Photographers choose their video storage method in their dashboard:

| Option | Cost | Best For |
|--------|------|----------|
| **Cloudflare Stream** (paid) | ~$5/1,000 min stored | Photographers who want zero infrastructure hassle |
| **Self-hosted via PeerTube** | Server cost only | Photographers who want full control + no per-minute fees |
| **BYO Cloudflare Stream account** | Their own CF billing | Photographers who already have a Cloudflare account |
| **BYO S3/R2 bucket** | Their own storage cost | Power users with existing storage setups |
| **Free tier (limited)** | Included in subscription | Short clips only, limited minutes per month |

### 5. AI Provider — User-Selectable in Dashboard
Photographers bring their own API key. The dashboard **AI Settings** section includes:
- Provider selector: OpenAI (GPT-4o) / Anthropic (Claude) / Google (Gemini)
- API key input field
- **"Get API Key"** button — opens the correct provider's API key page in a new tab
- Test connection button — verifies the key works before saving
- Usage display — shows approximate token usage this month
- Fallback: if no API key set, AI chatbox uses a limited MyShutterHost shared key (rate-limited)

### 6. White-Label & Branding by Subscription Tier

| Tier | Branding | Domain | Features |
|------|----------|--------|----------|
| **Free** | "Powered by MyShutterHost" badge visible | `name.myshutterhost.com` only | Limited galleries, limited storage, watermarked downloads |
| **Pro** | Badge can be hidden | Custom domain (BYOD) | Full store, booking, unlimited galleries |
| **Studio** | No badge, custom logo in dashboard | Custom domain | All features + plugins + multi-user |
| **Enterprise** | Full white-label (your brand, zero MyShutterHost mention) | Custom domain + custom email domain | Everything + API access + priority support |

### 7. Mobile App — React Native + Expo
- **Framework**: React Native with Expo (cross-platform — one codebase, iOS + Android)
- **Why Expo**: Expo Go for easy dev testing, EAS Build for production, OTA updates without app store resubmission
- Shares TypeScript types and API client code with the main Next.js app (monorepo benefit)
- Phase 4 delivery

### 8. Team Size — Solo Developer (You)
- Build order prioritizes **vertical slices** over horizontal (ship something real in Phase 1)
- Automated tests are critical — Vitest for unit tests, Playwright for E2E (prevents regressions as solo dev)
- Coolify makes deployment a one-person job (no DevOps team needed)
- Modular architecture (each module is independent) means you can hand off modules to future hires

---

## 💡 Additional Features to Add

### 🛡️ Platform Super-Admin Panel (for you, the owner)
- View all photographers on the platform
- Manage subscriptions, manually apply credits
- Content moderation dashboard (reported photos, flagged content)
- Revenue overview (platform-wide earnings, payout history)
- Plugin marketplace approvals
- Dispute resolution tools (print order issues, contract disputes)
- Platform-wide announcement system (notify all photographers of updates)

### 🛡️ Content Moderation
- Report button on any photo, gallery, profile, or chat message
- Auto-flag system (AI scans uploads for prohibited content)
- Manual review queue in super-admin panel
- DMCA takedown request form (photographers can report their stolen images)
- **Copyright protection tools**: reverse image search integration to find unauthorized use of photographer's images

### 🌍 GDPR & Privacy Compliance
- Cookie consent banner (configurable per photographer's site)
- Privacy policy generator for photographer sites
- Data export tool (client requests their data — GDPR right of access)
- Account deletion + full data erasure (GDPR right to erasure)
- Face search consent prompt (shown before any visitor uses "Find My Photos")

### 🔍 Photography-Specific SEO Schema
- Auto-generate `LocalBusiness` schema for photographer profile
- `Photograph` schema markup on individual photos
- `Person` schema for photographer bio
- `Event` schema for mini sessions and events
- These make Google show rich results (star ratings, event dates, etc.) in search

### 🛠️ Staging Environment
- Coolify supports multiple environments on the same server
- **Dev** → **Staging** → **Production** pipeline
- Push to `develop` branch → deploys to staging for testing
- Push to `main` branch → deploys to production
- Staging uses separate DB and separate Cloudflare R2 bucket

### 💰 Platform Monetization Model (how MyShutterHost earns)
| Revenue Stream | Rate | Notes |
|---|---|---|
| Subscription fees | $0 / $29 / $79 / Custom | Primary revenue |
| Hearts & Stars platform cut | 10% of all micropayments | Passive income |
| Tip platform cut | 5% of all tips | Passive income |
| Plugin marketplace cut | 20% of paid plugin sales | Revenue share |
| Preset marketplace cut | 20% of paid preset sales | Revenue share |
| Print commission (self-fulfill) | Optional % on orders | If photographer uses platform payment processing |
| Affiliate program | Credits (not cash) | Reduces churn, not direct revenue |

---

## Updated Tech Stack Additions
| Layer | Choice |
|-------|--------|
| **Mobile App** | React Native + Expo (iOS + Android, Phase 4) |
| **Self-hosted Video** | PeerTube (Docker container on Coolify) |
| **Error Monitoring** | Sentry (catches bugs in production automatically) |
| **Staging Pipeline** | Coolify multi-environment (dev → staging → prod) |

---

## ⚠️ Solo Developer Build Strategy

> [!IMPORTANT]
> Building this alone is very achievable but requires discipline. Here's the recommended approach:

1. **Build vertically, not horizontally** — Ship a complete working slice (auth + one gallery + one template + Stripe) before building the next feature
2. **Phase 1 is the business** — Get photographers paying before building Phase 3/4
3. **Use AI aggressively** — AI coding assistance (like this session) dramatically multiplies solo dev output
4. **Don't build what you can buy** — Use Stripe for billing, EasyPost for shipping, Auth.js for auth. Only build what's unique to MyShutterHost
5. **Automated tests from day one** — As sole developer, tests are your safety net
6. **Launch with 3 templates, not 8** — Polish 3 templates perfectly rather than 8 mediocrely
7. **Hire a designer** — Even a one-time contract designer for the template themes will be worth it

---

### 🔌 Module 16 — Public API & External Integrations

> **Purpose**: Let photographers connect MyShutterHost to their existing tools — QuickBooks, Google Calendar, Zapier, booking software, and custom workflows. Also enables third-party developers to build integrations. This is what separates a platform from just a website.

---

**🌐 Public REST API (v1)**

> **Architecture**: Custom REST API built into our Next.js app using Route Handlers. Authenticated via API key or OAuth 2.0 token. Versioned, rate-limited, fully documented.

```
Base URL:       api.myshutterhost.com/v1/
Auth:           Authorization: Bearer <api_key>
Format:         JSON
Rate limits:    60 req/min (Pro) / 200 req/min (Studio) / 500 req/min (Enterprise)
Versioning:     URL-based (/v1/, /v2/) — old versions supported 12 months post-deprecation
```

*Clients & CRM:*
- [x] `GET    /clients` — list all clients (paginated, filterable by stage/tag/date)
- [x] `POST   /clients` — create a new client or lead
- [x] `GET    /clients/:id` — full client detail
- [x] `PATCH  /clients/:id` — update client info, stage, tags, notes
- [x] `GET    /clients/:id/communications` — full communication log
- [x] `POST   /clients/:id/communications` — log a call, note, or email

*Bookings & Sessions:*
- [x] `GET    /bookings` — list all bookings
- [x] `POST   /bookings` — create a booking
- [x] `GET    /bookings/:id` — booking detail
- [x] `PATCH  /bookings/:id` — update booking (date, status, package, notes)
- [x] `DELETE /bookings/:id` — cancel booking
- [x] `GET    /availability` — available booking slots for a date range

*Galleries:*
- [x] `GET    /galleries` — list all galleries
- [x] `POST   /galleries` — create a gallery
- [x] `GET    /galleries/:id` — gallery detail + metadata
- [x] `PATCH  /galleries/:id` — update gallery settings
- [x] `GET    /galleries/:id/photos` — list photos in a gallery

*Orders & Invoices:*
- [x] `GET    /orders` — list all orders with status
- [x] `GET    /orders/:id` — order detail with line items + tracking
- [x] `GET    /invoices` — list all invoices
- [x] `POST   /invoices` — create and send an invoice
- [x] `GET    /invoices/:id` — invoice detail with payment status

*Events & Calendar:*
- [x] `GET    /events` — list upcoming events and mini sessions
- [x] `POST   /events` — create an event
- [x] `GET    /calendar/feed.ics` — iCal feed (subscribe in any calendar app)

---

**🔑 API Key Management**
- [x] Photographer generates named API keys in dashboard settings ("QuickBooks", "Zapier", "Custom App")
- [x] Per-key permission scopes — `read:clients` / `write:bookings` / `read:invoices` / `read:galleries` / `write:orders` etc.
- [x] Key revocation — disable a key instantly if compromised
- [x] API usage log — see every request made by each key (endpoint, timestamp, response code)
- [x] Rate limit usage shown per key in dashboard

---

**🔐 OAuth 2.0 Provider**

For third-party apps needing user-authorized access (not just static API keys):
- [x] Authorization code flow — user clicks "Connect to [App]", grants specific permissions
- [x] Granular scopes — `read:clients` / `write:bookings` / `read:invoices` / `read:galleries`
- [x] Token refresh — long-lived access without re-authentication prompts
- [x] App registration — developers register apps at `developers.myshutterhost.com`
- [x] Connected apps list in photographer dashboard settings — see + revoke any connected app
- [x] Token revocation — photographer disconnects an app with one click

---

**📡 Webhooks**

Push events to external systems the moment something happens:

| Event | When It Fires |
|-------|--------------|
| `booking.created` | New session booked |
| `booking.cancelled` | Booking cancelled |
| `invoice.sent` | Invoice emailed to client |
| `invoice.paid` | Payment received |
| `invoice.overdue` | Invoice past due date |
| `order.created` | New print or download order |
| `order.shipped` | Print order shipped (tracking number available) |
| `gallery.published` | Gallery made public |
| `gallery.delivered` | Client gallery notification sent |
| `client.created` | New lead or client added |
| `client.stage_changed` | Client moved in CRM pipeline |
| `contract.signed` | Client signs a contract |
| `tip.received` | Tip or Stars payment received |

- [x] Configure webhook endpoint URLs in dashboard (one or many endpoints)
- [x] Signed payloads — HMAC-SHA256 signature header for security (same pattern as Stripe)
- [x] Automatic retry — 3 attempts with exponential backoff on failure (5s, 30s, 5min)
- [x] Webhook delivery log — every event sent, HTTP status returned, response body
- [x] "Send test event" button — fire a sample payload to verify your endpoint works
- [x] Pause / resume webhooks per endpoint without deleting

---

**🔗 Pre-Built Connectors**

*📊 QuickBooks Online:*
- [x] Connect via OAuth in dashboard ("Connect to QuickBooks" one-click button)
- [x] Auto-sync clients → QuickBooks customers (new client created → QB customer created)
- [x] Auto-sync invoices → QuickBooks invoices (invoice sent from our dashboard → appears in QB)
- [x] Payment sync — invoice marked paid in Stripe → auto-mark paid in QuickBooks
- [x] Tax data sync — Stripe Tax amounts → correct QuickBooks tax categories
- [x] Revenue export — pull monthly/quarterly revenue report into QuickBooks
- [x] Two-way option — changes made in QuickBooks reflect in our CRM

*📅 Google Calendar:*
- [x] Connect via OAuth ("Connect Google Calendar" button in dashboard)
- [x] Two-way sync — bookings created in our system appear in Google Calendar automatically
- [x] Blocks in Google Calendar import as unavailable dates in our booking calendar
- [x] Session details (client name, location, package) sync as calendar event description
- [x] Date changes sync both ways — update in either app, both reflect the change

*📆 iCal Feed (Apple Calendar, Outlook, any app):*
- [x] Read-only iCal subscription URL generated per photographer
- [x] Paste URL into Apple Calendar, Outlook, Fantastical, or any calendar app
- [x] Auto-updates every hour — new bookings appear automatically
- [x] All bookings + events included in the feed
- [x] Secure token in URL — can be regenerated if shared accidentally

*⚡ Zapier Integration:*
- [x] Official MyShutterHost Zapier app (submitted to Zapier marketplace)
- [x] **Triggers** (MyShutterHost → Zapier → 6,000+ apps):
  - New booking created
  - New client/lead added
  - Invoice paid
  - Gallery published or delivered
  - New order placed
  - Contract signed
  - Tip received
- [x] **Actions** (6,000+ apps → Zapier → MyShutterHost):
  - Create a client
  - Create a booking
  - Log a communication note
  - Send an invoice
  - Update pipeline stage
- [x] Example Zaps: "When booking created → add to Google Sheet" / "When invoice paid → send Slack message" / "When client created → add to Mailchimp list"

*🔧 Make (Integromat) Integration:*
- [x] Same triggers and actions as Zapier, available in Make marketplace
- [x] Supports multi-step scenarios and data transformation

---

**📖 Developer Portal**
- [x] Public API docs at `developers.myshutterhost.com`
- [x] Interactive API explorer — try live API calls from the browser (like Stripe's API explorer)
- [x] Code examples in JavaScript, Python, PHP, Ruby, and curl
- [x] Webhook testing tool — send sample events without real data
- [x] OAuth app registration for third-party developers
- [x] API changelog — documented breaking changes and deprecation notices
- [x] Sandbox environment — full API access against dummy data, separate from real account

---

## 🏷️ Platform Naming Strategy

> [!IMPORTANT]
> The original name **"MyShutterHost"** was appropriate for a photography-only hosting platform. With the expansion to actors, models, cosplayers, fashion designers, and a full social network, the name no longer reflects the full vision. A rename should be considered before public launch.

**The platform is now two things in one:**
1. A **professional creative business platform** (portfolio, booking, CRM, contracts, payments, AI tools)
2. A **creative professional social network** (feed, stories, events, collaboration, revenue sharing)

**Naming approaches to evaluate:**
| Direction | Concept | Example Names |
|-----------|---------|--------------|
| Creator + Community | The place where creatives connect | CreatorForge, CollabHive, CreativeBase |
| Portfolio + Social | Show your work + build your network | ShowFrame, PortfolioHub, FrameWork |
| Professional focus | Business tools for creative pros | ProCreator, StudioLink, CreatorPro |
| Short & brandable | Clean, modern, memorable | Collabr, Foliohub, Creatify, Framr |

**Recommended path:** Keep **MyShutterHost LLC** as the company/infrastructure name. Launch the creator social network under a new brand. Many companies do this (Alphabet → Google, Meta → Instagram).

---

### 🎨 Module 17 — Multi-Creator Platform Expansion

> **Vision**: Expand from a photography-only platform to a full **creative professional ecosystem** serving all visual and performing arts. The core infrastructure (portfolio, booking, CRM, payments, galleries, social) is shared. Creator-type-specific features are layered on top via a `creatorType` field on the profile.

---

**🌐 Platform Identity Shift**

```
OLD: Photography SaaS hosting platform
NEW: Creative Professional Social Network + Business Platform

Serves: Photographers, Videographers, Models, Actors, Cosplayers,
        MUAs, Fashion Designers, Photography Studios, Stylists,
        Fire Spinners, Circus Performers, Aerialists, Dancers,
        Magicians, Musicians, DJs, Comedians, Buskers, Stunt
        Performers, Body Painters, Tattoo Artists, Performance
        Troupes, and more — all in one ecosystem.
```

---

**👥 Supported Creator Types**

*Visual Capture:*
- [x] **Photographer** — all existing features (core creator type)
- [x] **Videographer / Filmmaker** — video projects, showreels, production credits, client video delivery
- [x] **Cinematographer / DP** — gear list, production credits, reel hosting
- [x] **Photography Studio** — multi-photographer accounts, studio rental, equipment list

*Models & Talent:*
- [x] **Model** (fashion, commercial, fitness, glamour, plus-size, petite, etc.)
- [x] **Actor** — résumé, headshots, demo reel, credits, audition material
- [x] **Cosplayer** — character portfolio, convention schedule, build journal, commission store
- [x] **Voice Actor** — audio reel hosting, demo clips, casting page

*🔥 Fire & Flow Arts:*
- [x] **Fire Spinner / Fire Dancer** — poi, staff, fans, rope dart, dragon staff, buugeng
- [x] **Fire Breather / Fire Eater** — performance portfolio, safety certifications
- [x] **Poi Spinner** — non-fire: LED poi, glow poi, contact poi
- [x] **Hoop Artist** — hula hoop, LED hoop, multi-hoop, isolations
- [x] **Flow Artist** — general flow props (fans, orbs, contact ball, ribbons)
- [x] **Fire Juggler** — torch juggling, fire clubs, fire rings

*🎪 Circus Arts:*
- [x] **Juggler** — balls, clubs, rings, torches, diabolos, devil sticks, cigar boxes
- [x] **Acrobat / Gymnast** — tumbling, partner acrobatics, hand balancing
- [x] **Aerialist** — aerial silks, aerial hoop (lyra), trapeze (static/flying/dance), aerial straps, aerial rope
- [x] **Contortionist / Flexibilist** — flexibility performance, partner contortion
- [x] **Tightrope / Slackline Artist** — wire walking, slacklining
- [x] **Unicyclist** — standard, giraffe, ultimate wheel, trials
- [x] **Stilt Walker** — drywall stilts, peg stilts, spring stilts, character stilts
- [x] **Human Statue / Living Statue** — interactive street art
- [x] **Clown / Physical Comedian** — classic clown, new circus clown, bouffon
- [x] **Escape Artist** — Houdini-style escape performance
- [x] **Equilibrist / Balance Artist** — rola bola, spinning plates, peacock feather balancing
- [x] **Sideshow Performer** — sword swallowing, glass walking, human blockhead, strongman

*🎩 Magic & Illusion:*
- [x] **Stage Magician / Illusionist** — full stage illusions, grand illusions
- [x] **Close-up Magician** — sleight of hand, table magic, walkabout magic
- [x] **Mentalist** — mind reading, psychological illusion, prediction
- [x] **Cardician** — card magic specialist

*💃 Dance:*
- [x] **Ballet Dancer** — classical ballet, contemporary ballet
- [x] **Contemporary / Modern Dancer**
- [x] **Hip-hop / Street Dancer** — breaking, popping, locking, krump, waacking
- [x] **Ballroom / Latin Dancer** — salsa, tango, foxtrot, cha-cha, samba
- [x] **Pole Artist / Pole Fitness** — artistic pole, sport pole
- [x] **Belly Dancer** — tribal, fusion, cabaret
- [x] **Burlesque Performer** — neo-burlesque, classic burlesque
- [x] **Flamenco Dancer**
- [x] **Irish / Folk Dancer**
- [x] **Go-go / Event Dancer** — nightclub, corporate event, festival
- [x] **Exotic / Sensual Dancer** (age-verified adult content controls)

*🎭 Stage & Live Performance:*
- [x] **Stand-up Comedian** — set clips, upcoming shows, booking
- [x] **Improv / Sketch Performer** — troupe profiles, show schedule
- [x] **Spoken Word Artist / Slam Poet** — audio + video of performances
- [x] **Performance Artist** — conceptual / installation / live art
- [x] **Mime Artist**
- [x] **Puppeteer** — marionette, hand puppet, shadow puppet, ventriloquist
- [x] **Street Performer / Busker** — location schedule, pitch info
- [x] **Character Entertainer** — mascots, themed characters for events

*⚔️ Specialty Physical Arts:*
- [x] **Stage Combat / Sword Fighter** — choreography portfolio, safety training display
- [x] **Stunt Performer** — stunt reel, union affiliations, specialty skills
- [x] **Martial Artist** (demo/showcase performer) — discipline, dojo, competition record
- [x] **Pro Wrestler / Lucha Libre** — match clips, character persona, promotion affiliations
- [x] **Parkour / Freerunning Artist**

*🎵 Music Performance:*
- [x] **Musician / Solo Artist** — performance videos, discography, upcoming shows, booking
- [x] **Band / Music Group** — multi-member group profile, set list, rider
- [x] **DJ / Electronic Artist** — mix portfolio, setlists, event bookings
- [x] **Drummer / Percussionist** (especially visual performance / drum corps)

*🎨 Body Arts:*
- [x] **Body Painter** — portfolio by theme/event, live painting bookings
- [x] **Tattoo Artist** — portfolio by style, appointment booking (crosses into creative service)

*🎪 Performance Companies & Groups:*
- [x] **Circus Troupe / Fire Company** — group profile with individual performer sub-profiles, group bookings
- [x] **Dance Company** — company profile, roster, performance schedule
- [x] **Theater Company** — production portfolio, audition announcements, show schedule

*Business:*
- [x] **Talent Agency** — multi-talent roster, booking requests for represented talent
- [x] **Event Producer / Festival Organizer** — event portfolios, performer recruitment board
- [x] **Brand / Business** — sponsor profiles, collab opportunities, advertising

---

**🔧 Creator-Type-Specific Features**

*📸 Photography Studio:*
- [x] Studio profile (separate from individual photographer)
- [x] Multiple staff photographers under one studio account
- [x] Studio space rental calendar (photographers book the space)
- [x] Equipment rental list with availability
- [x] Shared portfolio (work shot at/by the studio)
- [x] Collective revenue dashboard

*🎬 Videographer:*
- [x] Showreel / demo reel hosting (Cloudflare Stream)
- [x] Video project galleries (private client delivery links)
- [x] Video download sales (4K, RAW footage packages)
- [x] Production credit list (directed / shot / edited / produced)
- [x] Behind-the-scenes photo galleries alongside video projects
- [x] Production package pricing (wedding film / commercial / music video / doc)
- [x] Client video approval workflow (client marks scenes approved)

*👤 Model:*
- [x] **Digital comp card** — industry-standard stats: height, measurements, eye/hair color, sizes, agency info
- [x] **Tearsheet portfolio** — published work organized by brand/publication
- [x] **Media kit** — downloadable PDF (comp card + portfolio highlights)
- [x] Casting availability calendar — open dates for bookings
- [x] Rate card — hourly/day/half-day rates by project type (editorial, commercial, fitness, etc.)
- [x] Agency + agent info display
- [x] "Book me" inquiry form on public profile

*🎭 Actor:*
- [x] **Digital résumé** — film/TV/theater/commercial credits, training, unions (SAG-AFTRA, AEA), special skills
- [x] **Headshot gallery** — organized by type (commercial, theatrical, casual, character)
- [x] **Demo reel hosting** — video reel with scene timestamps
- [x] Audition material storage — sides, monologues (private)
- [x] Credits list — IMDB-style filmography (role / project / year / director)
- [x] Agent / manager display
- [x] Commercial rate card
- [x] IMDB link integration

*🦸 Cosplayer:*
- [x] **Character portfolio** — organized by franchise / series / universe
- [x] **Convention schedule** — upcoming appearances with event links and booth/table info
- [x] **Build journal / WIP blog** — document costume creation with photos + notes
- [x] Commission store — sell prints, patterns, tutorial PDFs, prop replicas
- [x] Fan interaction tools — autograph session scheduling, meetup times at conventions
- [x] Costume stats — materials, build time, character origin
- [x] Convention QR event card — specialized version of the photographer event card for con floors
- [x] Heavy social integration — TikTok and Instagram as primary cross-post targets

*💄 MUA / Makeup Artist:*
- [x] Before/after portfolio — bridal, editorial, special FX, film/TV makeup
- [x] Service menu — with pricing per service type
- [x] Kit / product brand list
- [x] Training and certification display
- [x] On-location vs. studio booking toggle

*🔥 Performing Artists (Fire, Circus, Dance, Stage, Magic & more):*
- [x] **Performance showreel** — video portfolio is the primary asset (Cloudflare Stream hosted)
- [x] **Performance photo gallery** — high-quality stills from shows (fire photography, aerial shots, stage shots)
- [x] **Technical rider** — space requirements, power needs, fire safety equipment, music/sound needs, insurance requirements — downloadable PDF for venues
- [x] **Safety certifications display** — fire safety certs, rigging certifications, insurance info (critical for event/venue bookings)
- [x] **Insurance info display** — public liability insurance details (venues require this before booking)
- [x] **Performance packages** — priced by format and duration:
  - Walkabout (roaming entertainment, billed per hour)
  - Short set (5–10 min stage show)
  - Full show (20–45 min stage production)
  - Workshop / class (teach the art form, billed per student)
  - Private event (birthday / corporate / wedding entertainment)
  - Festival / outdoor event
- [x] **Venue type suitability tags** — Outdoor / Indoor / Stage / Walkabout / Corporate / Festival / Intimate / 18+ venue
- [x] **Troupe / company profile** — group of performers bookable as a unit, with individual performer sub-profiles linked
- [x] **Prop & equipment list** — what they bring, what the venue needs to provide
- [x] **Performance duration options** — selectable at booking time
- [x] **Skill discipline tags** — fire poi / aerial silks / juggling / magic / etc. (searchable/filterable)
- [x] **"Book for event" type** — Festival / Corporate / Wedding / Birthday / Theater / Street Fair / Club / Private
- [x] **Upcoming live show schedule** — where they're performing next (public calendar)
- [x] **Workshop availability** — book them to teach your group the skill
- [x] **TFP shoot availability** — available for fire/performance photography collaborations
- [x] **Audience & venue size range** — intimate 10-person / small venue 50 / medium 200 / large 500+ / festival


*👗 Fashion Designer:*
- [x] **Lookbook galleries** — organized by collection (Spring 2026, Fall 2026, etc.)
- [x] Collection release pages — with model credits, photographer credits
- [x] Pattern and digital download sales (Etsy alternative)
- [x] Fashion show / pop-up event posting
- [x] Retailer and brand collaboration tracking (CRM-style)
- [x] Wholesale inquiry form
- [x] Press/tearsheet clips

*🎬 Talent Agency:*
- [x] Agency profile with represented talent roster
- [x] Each talent links to their own individual creator profile
- [x] Booking requests routed through agency
- [x] Agency takes configurable commission % from bookings (CRM-tracked)

---

**⚙️ Technical Architecture — Creator Type System**

```prisma
enum CreatorType {
  PHOTOGRAPHER
  VIDEOGRAPHER
  CINEMATOGRAPHER
  PHOTOGRAPHY_STUDIO
  MODEL
  ACTOR
  COSPLAYER
  DANCER
  MUA
  HAIR_STYLIST
  STYLIST
  FASHION_DESIGNER
  ART_DIRECTOR
  SET_DESIGNER
  TALENT_AGENCY
  BRAND
  OTHER
}
```

- `PhotographerProfile` renamed → `CreatorProfile` with `creatorType` field
- Dashboard sections show/hide based on creator type
- Portfolio templates grouped by creator type
- CRM pipeline stage terminology adapts per type ("sessions" / "castings" / "shoots" / "bookings")
- Onboarding flow changes per creator type

---

**🔐 Three-Tier Access Model**

```
TIER 1 — Creator (Paid Subscription)
──────────────────────────────────────
Full platform access. Professional tools. Revenue earning.
- Portfolio website (custom domain)
- All gallery, booking, CRM, contract, invoice features
- Post to global Creator Feed
- Earn revenue (sales, tips, Stars, revenue sharing)
- Lightroom/Photoshop plugins (Phase 3)
- AI tools

TIER 2 — Supporter / Fan (Free)
──────────────────────────────────────
Community access. Monetization participation. No pro tools.
- Basic profile (name, photo, bio)
- Follow creators / friend requests
- View all public content
- Comment, like, share posts
- Join groups and community spaces
- Chat with creators (if creator allows)
- Send tips, Hearts & Stars ← revenue for creators
- Purchase prints and digital downloads ← revenue for creators
- Be tagged in event photos (face search + notifications)
- Post in Fan/Community spaces (NOT creator global feed)
- Upgrade path → Creator account when they turn professional

TIER 3 — Guest (No Account)
──────────────────────────────────────
View-only. Public content discovery.
- View public profiles, galleries, posts, events
- Guest checkout for prints/downloads
- Cannot comment, tip, follow, or interact
- "Join as Creator" and "Join as Fan" CTAs on every page
```

---

### 📱 Module 18 — Social Network (Feed, Stories & Social Graph)

> **Vision**: A professional creative social network — Instagram's visual quality + Facebook's community features + LinkedIn's professional context. Creator Feed stays high quality (Creator accounts only). Fan spaces are open and welcoming. Cross-posting to Instagram/Facebook/X drives discovery without competing with them.

---

**📰 Post Types**
- [x] **Photo post** — 1–20 photos, carousel format (like Instagram)
- [x] **Video post** — short or long-form (Cloudflare Stream)
- [x] **Text / status post** — thoughts, announcements, behind-the-scenes notes
- [x] **Story** — 24-hour disappearing photo or video (like Instagram Stories)
- [x] **Project post** — linked to a collaborative shoot, shows all contributors with credits
- [x] **Event post** — creates a calendar event AND a feed post simultaneously
- [x] **Reel / showcase** — curated highlight post (feature your best work)

**📰 Feed Types**
- [x] **Personal wall** — your own profile's posts (public or private per post)
- [x] **Following feed** — posts from creators and supporters you follow (chronological)
- [x] **Global Creator Feed** — all public posts from Creator accounts (algorithm-ranked)
- [x] **Discovery Feed** — curated top content, visible to guests (no login required)
- [x] **Creator Type Feed** — filter global feed by creator type (only photographers, only models, etc.)
- [x] **Local Feed** — posts from creators near your location
- [x] **Fan / Community Feed** — posts from Supporter accounts in community spaces

**🔒 Post Visibility**
- [x] Public — anyone can see (including guests)
- [x] Followers only — only people who follow you
- [x] Friends only — mutual connections
- [x] Private — only you

**🔄 Social Graph**
- [x] **Follow** (one-way — like Instagram): follow anyone public
- [x] **Friend / Connect** (mutual — like Facebook/LinkedIn): send + accept request
- [x] **Fan** relationship — public Supporter follows a Creator (consumer-side)
- [x] **Collaborator** badge — system-tracked, verified shoot partner (has a signed contract together)
- [x] Block and mute controls

**💬 Post Interactions**
- [x] Likes / reactions (customizable reaction set — ❤️ 🔥 👏 💯 ✨)
- [x] Comments (threaded replies)
- [x] Share to feed / share to story
- [x] Save to private collection
- [x] Tag another creator in the post
- [x] Tag a shoot / project (links to collaborative contract)
- [x] Send tips or Stars directly on a post
- [x] Buy prints directly from a photo post

**📤 Cross-Platform Auto-Posting**
- [x] Connect Instagram, Facebook, X/Twitter, TikTok, Pinterest accounts in settings
- [x] When posting, toggle which platforms to cross-post to
- [x] Every cross-posted item includes a link back to the creator's profile on the platform
- [x] Cross-post preview — see how the post will look on each platform before publishing
- [x] Scheduled posting — set a date/time to auto-publish
- [x] Cross-post analytics — see engagement from each external platform

**📖 Stories**
- [x] 24-hour disappearing photo or video stories (like Instagram Stories)
- [x] Story highlights — save stories to permanent highlight albums on your profile
- [x] Story reactions — viewers react with emojis
- [x] Link sticker in stories — link to gallery, booking page, or external URL
- [x] "Swipe up" equivalent — direct link from story to purchase/booking

---

### 📅 Module 19 — Event Calendar, Discovery & "Looking For" Board

> **Vision**: The central hub where creative collaborations are born. Creators post opportunities, the platform intelligently notifies the right people, and the community discovers events happening near them.

---

**📅 Public Event Calendar**
- [x] Any Creator account can post an event
- [x] Event types:
  - Styled shoot (photographer + model + MUA + etc.)
  - Mini session (booking slots with calendar)
  - Convention / cosplay event appearance
  - Fashion show or runway event
  - Workshop or masterclass
  - Open casting call
  - Brand activation or sponsored event
  - TFP shoot (free collaborative shoot)
  - Paid shoot posting
- [x] Event posts appear in both the social feed AND the public event calendar simultaneously
- [x] Global calendar view (searchable by date / location / event type / creator type needed)
- [x] Map view — see events near me
- [x] RSVP / "I'm interested" on any event
- [x] Calendar subscription — iCal feed of events you've RSVP'd to
- [x] Featured events — promoted placement for paid plan creators

**🔍 "Looking For" Board**

A dedicated casting and collaboration board — the professional upgrade of Craigslist for creatives:

- [x] **Post a listing:**
  - "Photographer seeking model for cosplay styled shoot — TFP — Austin TX — Jul 15"
  - "Model available for paid commercial work — NYC — flexible dates"
  - "MUA seeking photographers to build portfolio — open to TFP — Dallas"
  - "Fashion designer seeking model and videographer for lookbook — paid"
- [x] Listing types: SEEKING (you need someone) / AVAILABLE (you're offering yourself)
- [x] Compensation: TFP / Paid ($ amount or range) / Negotiable
- [x] Listing expires automatically (set duration: 7 / 14 / 30 days)
- [x] Filter board by: creator type needed, location, compensation type, date
- [x] Apply / Express interest button → sends message to poster
- [x] Listings linked to event (a styled shoot event can have a "still seeking MUA" tag)

**🔔 Smart Notification Engine**

The platform connects the right people automatically:

- [x] Creator sets "Availability Status" on their profile:
  - Available for TFP work
  - Available for paid work
  - Not currently taking new work
  - Available at specific dates only
- [x] Creator sets "Looking for" preferences:
  - Creator types they want to collaborate with
  - Compensation types they accept (TFP / paid / both)
  - Location radius (e.g. within 50 miles)
  - Frequency of notifications (instant / daily digest / weekly)
- [x] When a matching event or listing is posted → notify the creator
- [x] Example: Model in Austin set to "available for TFP + paid, seeking photographers" → gets notified when any Austin photographer posts a styled shoot
- [x] Suppress duplicates — smart deduplication so creators aren't bombarded
- [x] Notification channels: in-app, email, push notification (mobile)

**🗺️ Creator Discovery Map**
- [x] Browse a map of creators near any location
- [x] Filter by creator type, availability status, specialties
- [x] Useful for events (who's a photographer in Las Vegas for LVCC?)
- [x] Useful for clients (who's a photographer in my city?)

---

### 💰 Module 20 — Collaborative Revenue Sharing

> **Vision**: "The contract follows the content, and the money follows the contract." When multiple creators collaborate on a shoot, they agree on revenue splits upfront. Every dollar earned from that content — tips, Stars, prints, downloads — automatically splits to all contributors via Stripe. No manual math. No awkward conversations.

---

**🤝 Collaborative Shoot Contract**
- [x] Any Creator initiates a "Collaborative Project"
- [x] Invites participants by platform username or email
- [x] Each participant declares their role: Photographer / Videographer / Model / MUA / Stylist / Fashion Designer / Hair Stylist / Other
- [x] Revenue split percentages agreed upon (must total 100%)
- [x] All participants e-sign the collaborative contract (using our existing e-signature system)
- [x] Contract locked once all parties sign — percentages cannot be changed after signing
- [x] Contract stores: project name, shoot date, location, participants, splits, content rights

**📸 Content Tagging**
- [x] Photos and videos uploaded from the shoot are tagged to the collaborative contract
- [x] Photographer tags images: "This photo is from [Shoot Name]"
- [x] Tagged content shows all contributors with credits in a "Credits" section on the post
- [x] Contributors are notified when content from their shoot is posted
- [x] Content retains contract link permanently — even if reshared

**💸 Revenue Splitting — How It Works**

```
Example: Styled fashion shoot
  Photographer:    40%
  Fashion Designer: 25%
  Model:           20%
  MUA:             10%
  Hair Stylist:     5%
  ─────────────────────
  Total:          100%

Fan tips $20 on a photo from this shoot:
  Platform fee (10%):           $2.00
  Remaining for distribution:   $18.00
  Photographer receives:        $7.20  (40%)
  Fashion Designer receives:    $4.50  (25%)
  Model receives:               $3.60  (20%)
  MUA receives:                 $1.80  (10%)
  Hair Stylist receives:        $0.90  (5%)

All splits happen automatically via Stripe Connect Transfer Groups.
No manual calculations. No waiting. Instant distribution.
```

- [x] Tips on a post → split per contract percentages → Stripe transfer group
- [x] Stars/Hearts micropayments → split per percentages → credited to each wallet
- [x] Print sale from a collaborative photo → split after platform fee + lab/shipping costs
- [x] Digital download sale → split after platform fee
- [x] Each creator sees revenue from every collaborative project in their dashboard

**📊 Revenue Dashboard — Collaborative View**
- [x] Per-project revenue breakdown (how much each shoot has earned over time)
- [x] Individual earnings per shoot (my share from each project)
- [x] Content performance (which collaborative photo earns the most)
- [x] Contributor leaderboard (within a project — whose posts drove the most revenue)
- [x] Payout history per project
- [x] Tax summary per project (for accounting)

**⚖️ Rules & Edge Cases**
- [x] Revenue sharing requires ALL participants to have Creator accounts (or be invited — they have 30 days to create an account or their share goes to escrow)
- [x] Escrowed funds held 90 days — if unclaimed, redistributed proportionally to other signatories
- [x] Content can only earn split revenue if a signed contract exists — prevents disputes
- [x] Creator can post shoot content without revenue sharing (if no collaborative contract was created)
- [x] Photographer always controls what content is posted — collaborators don't get upload access
- [x] Dispute resolution: if a participant disputes a split, content revenue is paused pending resolution (admin review)
- [x] Minimum payout threshold: $10 (splits under $10 accumulate until threshold reached)

**🔗 Integration with Existing Systems**
- [x] Uses existing e-signature contract system (Module 4)
- [x] Uses existing Stripe Connect (Module 2) — transfer groups handle multi-party splits
- [x] Uses existing Stars/Hearts/Tips system (Module 2)
- [x] Linked to CRM — each collaborative shoot appears in CRM as a multi-participant session
- [x] Linked to social feed — project posts show contributor credits automatically
- [x] Revenue webhooks — external tools (QuickBooks via Module 16 API) receive split payment events

---





