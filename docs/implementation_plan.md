# [Platform] Ã¢â‚¬â€ Full Implementation Plan v3

> **Note on name**: Originally "MyShutterHost" Ã¢â‚¬â€ a photography hosting platform. The vision has expanded significantly. See the Platform Naming Strategy section. This plan now describes a full **creative professional social network + business platform** serving 16+ creator types.

---

## Ã°Å¸Ââ€”Ã¯Â¸Â Three Distinct Products Ã¢â‚¬â€ Platform Architecture

> [!IMPORTANT]
> The platform is THREE interconnected products sharing one codebase (monorepo) and one backend.

```
Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
Ã¢â€â€š  PRODUCT 1: [Platform].com Ã¢â‚¬â€ Marketing & Company Site           Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Public landing page + pricing + creator type showcase        Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Creator signup & subscription purchase                       Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Tech support, bug reports, changelog, status page            Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Platform blog, tutorials, community resources                Ã¢â€â€š
Ã¢â€â€š  URL: [platform].com/about, /pricing, /blog, /support           Ã¢â€â€š
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
                              Ã¢â€ â€œ Subscribes / Joins
Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
Ã¢â€â€š  PRODUCT 2: The Creator Social Network (Main Platform)          Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Global discovery feed (public, no login required)            Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Creator social profiles  Ã¢â€ â€™  [platform].com/@username         Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Event calendar, Looking For board, Creator discovery map     Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Groups, chat, community spaces                               Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ Collaborative revenue sharing                                Ã¢â€â€š
Ã¢â€â€š  Ã¢â‚¬Â¢ ALL creator types: Photographers, Models, Actors,            Ã¢â€â€š
Ã¢â€â€š    Cosplayers, MUAs, Videographers, Fashion Designers, etc.     Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  FREE: Supporters get social profiles (no website, no tools)    Ã¢â€â€š
Ã¢â€â€š  FREE: Creator Free tier Ã¢â‚¬â€ limited tools, NO website            Ã¢â€â€š
Ã¢â€â€š  PAID: Creator Pro/Studio/Enterprise Ã¢â‚¬â€ full tools + website     Ã¢â€â€š
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
                              Ã¢â€ â€œ Included in paid Creator plans
Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
Ã¢â€â€š  PRODUCT 3: Creator Dedicated Websites (Hosted for ALL types)   Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  Every paid Creator gets their own professional website         Ã¢â€â€š
Ã¢â€â€š  POWERED BY THE SAME BACKEND as their social profile.           Ã¢â€â€š
Ã¢â€â€š  Same galleries, same bookings, same store, same posts.         Ã¢â€â€š
Ã¢â€â€š  The website is a professional-first view of the same data.     Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  URL options (all plans):                                       Ã¢â€â€š
Ã¢â€â€š    username.[platform].com          (subdomain, all plans)      Ã¢â€â€š
Ã¢â€â€š    www.theircustomdomain.com        (custom domain, Pro+)       Ã¢â€â€š
Ã¢â€â€š    [platform].com/meet/username     (event card, all plans)     Ã¢â€â€š
Ã¢â€â€š                                                                 Ã¢â€â€š
Ã¢â€â€š  Available to ALL creator types (not just photographers):       Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€œÂ¸ Photographer  Ã¢â€ â€™ gallery, print shop, client delivery      Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸Å½Â¬ Videographer  Ã¢â€ â€™ showreel, video delivery, booking         Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€˜Â¤ Model         Ã¢â€ â€™ comp card, tearsheets, casting page       Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸Å½Â­ Actor         Ã¢â€ â€™ rÃƒÂ©sumÃƒÂ©, headshots, demo reel              Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸Â¦Â¸ Cosplayer     Ã¢â€ â€™ character portfolio, con schedule, shop   Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€™â€ž MUA           Ã¢â€ â€™ service menu, before/after, booking       Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€˜â€” Fashion Dsgn  Ã¢â€ â€™ lookbooks, collections, pattern shop      Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€œÂ¸ Studio        Ã¢â€ â€™ team portfolio, studio rental, booking    Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸â€™â€¡ Hair Stylist  Ã¢â€ â€™ style portfolio, service menu, booking    Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸Å½Â¨ Stylist       Ã¢â€ â€™ look portfolios, brand collabs            Ã¢â€â€š
Ã¢â€â€š    Ã°Å¸Å½Â¬ Talent Agency Ã¢â€ â€™ talent roster, booking requests           Ã¢â€â€š
Ã¢â€â€š    + all other creator types                                    Ã¢â€â€š
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ

KEY INSIGHT: The social profile and the dedicated website
are TWO VIEWS OF THE SAME DATA. One backend serves both.

Creator posts on social network Ã¢â€ â€™ appears on their website feed
Fan books on their website Ã¢â€ â€™ appears in their CRM dashboard
Fan buys a print from website Ã¢â€ â€™ same Stripe flow as social platform
Collaborative shoot revenue Ã¢â€ â€™ splits to all contributors everywhere
```

### URL Structure

```
[platform].com                      Ã¢â€ â€™ Main social network (discovery feed)
[platform].com/explore              Ã¢â€ â€™ Browse all creators
[platform].com/events               Ã¢â€ â€™ Public event calendar + map
[platform].com/board                Ã¢â€ â€™ Looking For casting board
[platform].com/@username            Ã¢â€ â€™ Creator social profile
[platform].com/meet/username        Ã¢â€ â€™ Event Presence Card (QR/NFC)

username.[platform].com             Ã¢â€ â€™ Creator's dedicated website
username.[platform].com/            Ã¢â€ â€™ Homepage (portfolio/hero)
username.[platform].com/work        Ã¢â€ â€™ Portfolio / gallery
username.[platform].com/services    Ã¢â€ â€™ Services + pricing
username.[platform].com/store       Ã¢â€ â€™ Print shop + digital products
username.[platform].com/booking     Ã¢â€ â€™ Appointment / session booking
username.[platform].com/events      Ã¢â€ â€™ Their upcoming events
username.[platform].com/feed        Ã¢â€ â€™ Their social posts embedded
username.[platform].com/contact     Ã¢â€ â€™ Contact form

www.customdomain.com                Ã¢â€ â€™ Custom domain (Pro+) Ã¢â€ â€™ same website
```

### Monorepo App Structure

```
[Platform]/ (Turborepo + pnpm)
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ apps/
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ marketing/     Ã¢â€ Â [Platform].com company/marketing site (Product 1)
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ social/        Ã¢â€ Â Main creator social network (Product 2)
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ dashboard/     Ã¢â€ Â Creator backend admin panel (all creator types)
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ website/       Ã¢â€ Â Creator dedicated websites Ã¢â‚¬â€ all types (Product 3)
Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ mobile/        Ã¢â€ Â React Native + Expo app (Phase 4)
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ packages/
    Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ ui/            Ã¢â€ Â Shared design system & components
    Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ db/            Ã¢â€ Â Prisma schema & database client (single DB)
    Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ types/         Ã¢â€ Â Shared TypeScript types
    Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ config/        Ã¢â€ Â ESLint, Tailwind, TypeScript configs

NOTE: apps/social and apps/website share the same packages/db Ã¢â‚¬â€
one database, two front doors, same data.
```

---

## Technology Stack (Confirmed)

| Layer | Choice |
| ------- | -------- |
| **Framework** | Next.js 16 (App Router, TypeScript) |
| **Styling** | Tailwind CSS + shadcn/ui |
| **Monorepo** | Turborepo + pnpm (4 apps: marketing, dashboard, portfolio, mobile) |
| **Database** | PostgreSQL Ã¢â‚¬â€ self-hosted Docker container on Coolify (same Vultr server, migrate to dedicated later) |
| **ORM** | Prisma |
| **Auth** | Auth.js v5 |
| **Photo/Video Storage** | Cloudflare R2 (zero egress fees) |
| **CDN / DNS / DDoS** | Cloudflare |
| **VPS** | Vultr |
| **PaaS / Deploy** | Coolify (Docker, self-hosted) |
| **CI/CD** | GitHub Ã¢â€ â€™ Coolify webhook |
| **Reverse Proxy** | Traefik (bundled in Coolify) |
| **Payments** | Stripe (subscriptions + store + tips + pay-to-download) |
| **Email** | Resend |
| **AI Chatbox** | Vercel AI SDK v6 (npm package, runs on Vultr Ã¢â‚¬â€ no Vercel hosting required) |
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
| **Search** | PostgreSQL Full-Text Search Ã¢â€ â€™ Algolia (at scale) |
| **Cache** | Redis Ã¢â‚¬â€ self-hosted Docker container on Coolify (same Vultr server) |
| **Analytics Events DB** | **ClickHouse** Ã¢â‚¬â€ self-hosted Docker on Coolify (billions of view events, sub-second queries) |
| **Product Analytics** | **PostHog** (self-hosted) Ã¢â‚¬â€ funnels, session analysis, feature flags, GDPR-compliant |
| **Geolocation** | **MaxMind GeoIP2** Ã¢â‚¬â€ IP Ã¢â€ â€™ city/region/country, self-hosted database, no API fees |
| **Plugin SDK** | Custom REST + OAuth2 (for Lightroom/Photoshop plugins) |
| **Real-time Chat** | **Socket.io** (self-hosted on Vultr via Coolify Ã¢â‚¬â€ WebSocket DMs + group rooms + live view counters) |

---

## Platform Modules & Full Feature List

### Ã°Å¸â€œÂ¸ Module 1 Ã¢â‚¬â€ Photo & Video Galleries

**Gallery Layout Options (photographer picks per gallery):**

- [x] **Masonry** Ã¢â‚¬â€ Pinterest-style, variable heights, natural stacking
- [x] **Justified Grid** Ã¢â‚¬â€ all same height, variable widths (Google Photos style)
- [x] **Square Grid** Ã¢â‚¬â€ equal size squares, clean and minimal
- [x] **Mosaic** Ã¢â‚¬â€ mixed large/small tiles, editorial magazine feel
- [x] **Honeycomb** Ã¢â‚¬â€ hexagonal cells, very artistic
- [x] **Filmstrip** Ã¢â‚¬â€ horizontal scrolling strip
- [x] **Spotlight** Ã¢â‚¬â€ one hero image + surrounding thumbnails
- [x] **Magazine** Ã¢â‚¬â€ feature image + text columns + supporting photos
- [x] **Fullscreen** Ã¢â‚¬â€ one photo at a time, full viewport
- [x] **Panoramic** Ã¢â‚¬â€ wide horizontal scroll for landscape shots

**Slideshow Effects:**

- [x] **Ken Burns** Ã¢â‚¬â€ slow cinematic pan + zoom on still photos
- [x] **Fade** Ã¢â‚¬â€ classic crossfade between photos
- [x] **Slide** Ã¢â‚¬â€ photos push in from left/right
- [x] **Zoom Burst** Ã¢â‚¬â€ photo zooms into the next one
- [x] **3D Flip** Ã¢â‚¬â€ card flip transition
- [x] **Morph / Dissolve** Ã¢â‚¬â€ photos blend into each other
- [x] **Parallax Slide** Ã¢â‚¬â€ background + foreground move at different speeds
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

### Ã°Å¸â€™Â° Module 2 Ã¢â‚¬â€ Point of Sale & Monetization

> **Architecture**: Custom build on top of Stripe. No separate e-commerce platform. Everything lives in our Next.js + PostgreSQL monorepo. Stripe handles payments, taxes, fraud, and photographer payouts. We build the product catalog, cart, order routing, and download delivery.

---

**Ã°Å¸Ââ€”Ã¯Â¸Â POS Technical Architecture**

```
Customer Flow:
Views gallery Ã¢â€ â€™ clicks Buy/Download
      Ã¢â€ â€œ
Cart (Redis session Ã¢â‚¬â€ fast, no DB hit)
      Ã¢â€ â€œ
Stripe Checkout Session created (Stripe hosts the payment page)
      Ã¢â€ â€œ
Stripe webhook: payment_intent.succeeded
      Ã¢â€ â€œ
  IF digital download Ã¢â€ â€™ signed Cloudflare R2 URL (expires 48hrs)
                     Ã¢â€ â€™ email download link (Resend)
  IF print order     Ã¢â€ â€™ route to Printful / WHCC / self-fulfill
                     Ã¢â€ â€™ lab ships directly, tracking auto-emailed
      Ã¢â€ â€œ
Order in customer profile + photographer dashboard
```

**What Stripe Handles (we don't build these):**

- Payment UI + card processing (PCI compliant automatically)
- Automatic tax calculation Ã¢â‚¬â€ US sales tax + EU VAT (Stripe Tax)
- Fraud detection (Stripe Radar ML)
- Refund processing
- Photographer payouts (Stripe Connect Ã¢â‚¬â€ auto-splits revenue)
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
- [x] Guest checkout Ã¢â‚¬â€ buy without creating an account
- [x] Stripe Checkout Session Ã¢â‚¬â€ Stripe's hosted payment page (no card data touches our servers)
- [x] Apple Pay / Google Pay / Buy Now Pay Later via Stripe

*Digital Download Delivery:*

- [x] After payment: generate time-limited signed Cloudflare R2 URL (expires 48hrs)
- [x] Download limit enforcement (e.g. max 3 downloads per purchase)
- [x] Secure delivery Ã¢â‚¬â€ URL is unique per order, can't be shared/scraped
- [x] Re-download from order history (generates new signed URL on demand)
- [x] Bulk download (buy full gallery Ã¢â€ â€™ download as ZIP)

*Print Order Routing:*

- [x] **Printful** Ã¢â‚¬â€ automated API routing for consumer-grade prints, ships worldwide
- [x] **WHCC** Ã¢â‚¬â€ professional lab routing for high-end print orders
- [x] **Bay Photo / Miller's Lab** Ã¢â‚¬â€ additional pro lab options
- [x] **Self-fulfillment** Ã¢â‚¬â€ photographer prints themselves, marks as shipped manually
- [x] Per-product lab assignment Ã¢â‚¬â€ photographer sets which lab per print product
- [x] Lab fallback Ã¢â‚¬â€ if primary lab is down, route to backup lab

*Shipping (via EasyPost):*

- [x] **USPS** Ã¢â‚¬â€ First Class, Priority, Priority Express, Media Mail
- [x] **UPS** Ã¢â‚¬â€ Ground, 2-Day Air, Next Day Air, Worldwide
- [x] **FedEx** Ã¢â‚¬â€ Ground, Express, International Priority
- [x] **DHL** Ã¢â‚¬â€ international shipping
- [x] Real-time rate comparison across all carriers at checkout
- [x] Shipping label generation + purchase from dashboard
- [x] Auto-send tracking number to customer via email
- [x] Package size presets ("8x10 mailer = 6oz, 10x13 envelope")
- [x] Free shipping threshold rules (free shipping over $75)
- [x] Shipping zones Ã¢â‚¬â€ restrict or adjust rates by region/country
- [x] International customs forms auto-filled
- [x] Address validation before order placed
- [x] Return label generation
- [x] Batch label printing for multiple orders

*Pricing & Promotions:*

- [x] Discount codes & coupons (Stripe Promotion Codes + our UI)
- [x] Gift cards (Stripe + our balance tracking in DB)
- [x] Rush delivery upsell at checkout
- [x] Tax calculation Ã¢â‚¬â€ Stripe Tax (automatic, all US states + EU VAT)
- [x] **Stripe Connect** Ã¢â‚¬â€ photographers receive payouts directly (85% photographer / 15% platform)
- [x] Revenue dashboard (sales, tips, stars earned, payouts, shipping costs, lab fees)

*Order Management:*

- [x] Order status: `PENDING Ã¢â€ â€™ PAID Ã¢â€ â€™ IN_PRODUCTION Ã¢â€ â€™ SHIPPED Ã¢â€ â€™ DELIVERED Ã¢â€ â€™ REFUNDED`
- [x] Photographer order dashboard with filter by status
- [x] Customer order history in their profile with re-download links
- [x] Refund processing via Stripe (dashboard button Ã¢â€ â€™ Stripe handles it)

**Hearts & Stars Micropayment System:**

- [x] Platform-fixed tier system ($0.10 / $0.50 / $1.00 / $5.00 / $10.00)
- [x] Each tier = a different animated icon (spark, star, heart, gem, crown)
- [x] Visitors buy a bundle of credits via Stripe Ã¢â€ â€™ spend on any photographer
- [x] Platform takes 10% of all micropayments, rest goes to photographer
- [x] Tips (freeform amount) Ã¢â‚¬â€ platform takes 5%
- [x] All micropayments + tips visible in photographer revenue dashboard

---

### Ã°Å¸â€â€” Module 3 Ã¢â‚¬â€ Social & Sharing

**Standard Sharing:**

- [x] Like & favorite individual photos and galleries
- [x] Share to social media platforms (Facebook, Instagram, Pinterest, X/Twitter, TikTok)
- [x] Send gallery/photo links to friends via social media
- [x] Embedded social media feeds on photographer's site (Instagram feed, TikTok feed, etc.)
- [x] Public gallery comments
- [x] Shareable gallery link (optionally password-protected)
- [x] QR code for any gallery or photo
- [x] Embeddable gallery widget (embed your gallery on external websites)

**Ã°Å¸â€œÂ² Tap & Scan Event Presence Card**

A digital smart business card the photographer shows at events Ã¢â‚¬â€ guests scan or tap to instantly connect, find photos, and tip:

- [x] **Photographer "Meet" page** Ã¢â‚¬â€ a beautiful mobile-optimized landing page. URL depends on subscription tier:

  | Tier | Meet Page URL |
  | ------ | -------------- |
  | **Free** | `username.myshutterhost.com/meet` |
  | **Pro / Studio** | `www.theircustomdomain.com/meet` |
  | **Platform fallback** (always works) | `myshutterhost.com/meet/username` Ã¢â€ â€™ redirects to their primary URL |

  - QR code and NFC always use the photographer's **primary URL** (custom domain if they have one, subdomain if not)
  - The `myshutterhost.com/meet/username` fallback always redirects to the right place Ã¢â‚¬â€ useful for printed materials that outlive a domain change
  - Profile photo, name, specialty, location tagline

  - "Visit my website" button
  - "See today's event photos" Ã¢â‚¬â€ links to the photographer's **Active Event Gallery** (photographer sets which gallery is "active" before the event)
  - Social media links (Instagram, Facebook, TikTok, Pinterest, X Ã¢â‚¬â€ photographer picks which to show)
  - Ã¢Â­Â **Tip / Send Stars button** Ã¢â‚¬â€ guest can tip instantly with no account required (Stripe guest checkout)
  - "Save my contact" Ã¢â‚¬â€ downloads a `.vcf` vCard with name, phone, email, website, social links
  - "Follow me on MyShutterHost" button
- [x] **Dynamic QR code** Ã¢â‚¬â€ always points to their meet page; regenerates automatically if username changes
- [x] **Full-screen QR display in mobile app** Ã¢â‚¬â€ photographer opens the app Ã¢â€ â€™ taps "Event Card" Ã¢â€ â€™ phone displays a bright full-screen QR code guests can scan instantly (high contrast, no fumbling with links)
- [x] **NFC tap-to-share** Ã¢â‚¬â€ photographer taps their phone to a guest's phone Ã¢â€ â€™ guest's phone opens the meet page instantly (Android + iPhone 13+ with background NFC tag reading)
- [x] **Printable QR card** Ã¢â‚¬â€ download a print-ready PNG/PDF of the QR code for:
  - Table tent cards at events
  - Badge lanyards at conventions
  - Foam board signs at outdoor shoots
  - Studio wall display
- [x] **Active Event toggle** Ã¢â‚¬â€ in the dashboard or app, photographer taps one button to set which gallery is "active" Ã¢â‚¬â€ it appears on the meet page as the featured event link
- [x] **QR on photographer's website profile page** Ã¢â‚¬â€ their public website profile section shows their QR code so returning visitors can save it or scan it again
- [x] **Tip tracking** Ã¢â‚¬â€ all tips received via the meet page appear in the revenue dashboard, tagged as "Event Tip"
- [x] **Meet page analytics** Ã¢â‚¬â€ see how many people scanned the code, tipped, clicked social links, or saved the contact at each event

---

### Ã°Å¸â€œâ€¦ Module 4 Ã¢â‚¬â€ Booking, Contracts & Client Management

> **Architecture**: Fully custom, built into the photographer dashboard. No third-party CRM service. Replaces standalone tools like HoneyBook, Dubsado, and Studio Ninja Ã¢â‚¬â€ all included in our subscription.

---

**Ã°Å¸â€œâ€¹ CRM Ã¢â‚¬â€ Lead Pipeline (Kanban Board)**

Visual pipeline Ã¢â‚¬â€ drag clients through stages:

```
NEW INQUIRY Ã¢â€ â€™ CONSULTATION Ã¢â€ â€™ PROPOSAL SENT Ã¢â€ â€™ BOOKED Ã¢â€ â€™ SHOT Ã¢â€ â€™ EDITING Ã¢â€ â€™ DELIVERED Ã¢â€ â€™ ARCHIVED
```

- [x] Kanban board view Ã¢â‚¬â€ drag cards between stages
- [x] List view Ã¢â‚¬â€ sortable table of all clients
- [x] Filter by stage, tag, session type, date range, revenue
- [x] Search clients by name, email, phone
- [x] Client tags Ã¢â‚¬â€ [VIP] [Wedding] [Portrait] [Cosplay] [Referral] (custom tags)
- [x] Quick stats Ã¢â‚¬â€ total leads this month, conversion rate, avg booking value

**Ã°Å¸â€˜Â¤ Client Detail Page Ã¢â‚¬â€ Everything in One Place**

- [x] Contact info (name, email, phone, location, social links)
- [x] Full session timeline (every touchpoint from first inquiry to delivery)
- [x] Private photographer notes (client never sees these)
- [x] All documents in one place Ã¢â‚¬â€ contracts, invoices, questionnaires
- [x] Gallery activity pulled from client profile (photos liked, downloaded, purchased)
- [x] Purchase history Ã¢â‚¬â€ all orders, total spent
- [x] Past + upcoming sessions with this client
- [x] One-click rebooking with same package
- [x] Stars & tips sent history

**Ã°Å¸â€œÂ¬ Communication Log**

- [x] Send emails to clients directly from the dashboard (powered by Resend)
- [x] Every email sent is automatically logged to the client's timeline
- [x] AI email drafting Ã¢â‚¬â€ AI writes the email based on context (uses Module 8 AI)
- [x] Log calls and texts manually (add a note: "Called Sarah, confirmed date")
- [x] Inbound email replies visible in the communication log
- [x] Email delivery status tracking (delivered / opened / bounced via Resend webhooks)
- [x] Email templates Ã¢â‚¬â€ save commonly used emails ("Gallery ready", "Booking confirmed", "Follow-up")

**Ã°Å¸â€â€ Reminders & Follow-Ups**

- [x] Set reminders on any client ("Follow up on Jun 28")
- [x] Auto-reminders Ã¢â‚¬â€ system creates these automatically:
  - 3 weeks before session: "Send shot list to [Client]"
  - 1 week before session: "Confirm session details with [Client]"
  - 7 days after session: "Gallery due Ã¢â‚¬â€ start editing [Client]"
  - 3 days after gallery delivery: "Check in Ã¢â‚¬â€ did [Client] view their gallery?"
- [x] Reminder dashboard Ã¢â‚¬â€ all upcoming reminders in one view
- [x] Daily digest email (optional opt-in) Ã¢â‚¬â€ today's reminders

**Ã°Å¸â€œâ€¦ Booking Calendar**

- [x] Photographer sets availability (open/blocked dates)
- [x] Clients self-book from the photographer's website
- [x] Session packages Ã¢â‚¬â€ bundle hours + deliverables + pricing
- [x] Deposit collection at booking (Stripe Ã¢â‚¬â€ set % or fixed amount)
- [x] Balance due reminder before session
- [x] iCal feed export (subscribe in Google Calendar, Apple Calendar, Outlook)
- [x] Google Calendar two-way sync (changes in either direction sync both ways)
- [x] Mini sessions Ã¢â‚¬â€ fixed time slots, limited availability, displayed on public site
- [x] Booking confirmation email (automated, Resend)
- [x] Session reminder emails (automated Ã¢â‚¬â€ 1 week + 1 day before)

**Ã°Å¸â€œâ€ž Digital Contracts & E-Signatures**

- [x] Photographer creates contract templates (wedding, portrait, TFP, model release)
- [x] Client signs online Ã¢â‚¬â€ legally binding e-signature
- [x] Signed contract PDF stored and linked to client's session
- [x] Contract status visible in pipeline (signed / unsigned / expired)
- [x] Auto-send contract after booking (with deposit payment link)
- [x] AI contract clause helper Ã¢â‚¬â€ AI explains legal terms or suggests additions

**Ã°Å¸Â§Â¾ Invoicing & Payments**

- [x] Create and send invoices from the dashboard (Stripe Invoices)
- [x] Stripe payment link embedded in invoice email
- [x] Partial payments / installment schedules
- [x] Invoice status Ã¢â‚¬â€ draft / sent / partially paid / paid / overdue
- [x] Automatic overdue reminders
- [x] PDF invoice download (client + photographer copies)
- [x] Invoice history per client

**Ã°Å¸â€œâ€¹ Questionnaires & Intake Forms**

- [x] Build custom intake questionnaires per session type
- [x] Auto-send questionnaire after booking confirmation
- [x] Client fills out form in their profile Ã¢â‚¬â€ photographer sees responses
- [x] Question types: short text, long text, multiple choice, date picker, file upload
- [x] AI questionnaire generator Ã¢â‚¬â€ *"Generate a wedding intake questionnaire"*
- [x] Questionnaire responses linked to client's session in the CRM

**Ã°Å¸Å½Â¨ Mood Board Builder**

- [x] Client shares style inspiration images (upload or link from Pinterest)
- [x] Photographer adds their own reference images
- [x] Collaborative board Ã¢â‚¬â€ both sides can add/comment
- [x] AI style analysis Ã¢â‚¬â€ AI describes the mood/style of the board to help align expectations

**Ã°Å¸â€™â€™ Wedding Planner**

- [x] Multi-event timeline (engagement, rehearsal dinner, ceremony, reception)
- [x] Shot list builder with drag-and-drop sections (getting ready, first look, ceremony, etc.)
- [x] Vendor contact book (DJ, florist, venue, caterer Ã¢â‚¬â€ with name/phone/email)
- [x] Day-of timeline (hour-by-hour schedule)
- [x] AI shot list generator Ã¢â‚¬â€ *"Generate a shot list for a 6-hour Indian fusion wedding"*

---

### Ã°Å¸â€“Â¼Ã¯Â¸Â Module 5 Ã¢â‚¬â€ Client Galleries, Proofing & Social Tagging

**Download Tier System (photographer sets per gallery):**

- [x] **Free tier** Ã¢â‚¬â€ low-res download (800px, 72 DPI), always watermarked, always available to everyone
- [x] **Standard paid tier** Ã¢â‚¬â€ medium-res (2000px), no watermark, photographer sets price
- [x] **High-res paid tier** Ã¢â‚¬â€ full print-ready resolution, no watermark, photographer sets price
- [x] **Free high-res override** Ã¢â‚¬â€ photographer can unlock full-res for free on any gallery (e.g. for clients who already paid for a session)
- [x] Per-photo overrides Ã¢â‚¬â€ set different download tiers on individual photos within a gallery
- [x] Download limits Ã¢â‚¬â€ cap how many photos a client can download (e.g. 20 free downloads included)
- [x] Guest checkout Ã¢â‚¬â€ visitors buy/download without creating an account
- [x] Watermark auto-applied to free downloads, stripped on paid

**Social People Tagging (Viral Event Gallery System):**

- [x] **Tag people in photos** Ã¢â‚¬â€ click a face in a photo, type a name or email to tag them
- [x] **AI face detection** Ã¢â‚¬â€ automatically detects faces in photos and draws tag boxes, photographer approves suggested tags
- [x] **"Find My Photos" selfie search** Ã¢â‚¬â€ visitor uploads a selfie Ã¢â€ â€™ AI searches the entire gallery and highlights every photo they appear in (huge for large events Ã¢â‚¬â€ weddings, concerts, sports, school events)
- [x] **Event QR code** Ã¢â‚¬â€ photographer displays a QR code sign at the event Ã¢â€ â€™ guests scan it Ã¢â€ â€™ instantly taken to the gallery to find their photos
- [x] **Tag notification emails** Ã¢â‚¬â€ "You were tagged in 12 photos at [Event Name]! Click to view & download" Ã¢â€ â€™ drives people back to the gallery
- [x] **"My Photos" filtered view** Ã¢â‚¬â€ once tagged/found, the gallery highlights only that person's photos so they don't have to scroll through hundreds of images
- [x] **Privacy & untag** Ã¢â‚¬â€ anyone can request to be untagged from a photo (GDPR/privacy compliance)
- [x] **Tag friends** Ã¢â‚¬â€ visitors can tag their friends in photos, triggering a notification to that friend
- [x] **Bulk share my tagged photos** Ã¢â‚¬â€ share all photos you appear in to Facebook, Instagram, etc. in one click

**Viral Monetization Loop (per event gallery):**

- [x] Visitors who find their photos can:
  - Download free (low-res, watermarked) and share to social media
  - Pay to download high-res
  - Buy a print of any photo they're in
  - Leave a tip to the photographer
  - Send hearts / stars to support the photographer
- [x] Every social share includes a link back to the gallery (organic traffic engine)
- [x] Shareable Open Graph preview Ã¢â‚¬â€ when gallery link is posted to Facebook/X, it shows a beautiful preview image + gallery title

**Client Proofing:**

- [x] Password-protected private client galleries
- [x] Client proofing (clients mark favorites / request edits)
- [x] Pay-to-unlock gallery (client pays before viewing full gallery)
- [x] Print proofing (client approves prints before order is placed)
- [x] Gallery expiry dates
- [x] Client notification when gallery is ready

**Tech Required for Tagging & Face Search:**

- [x] **AWS Rekognition** or **Azure Face API** Ã¢â‚¬â€ face detection, face matching for selfie search
- [x] Face index per gallery Ã¢â‚¬â€ store face embeddings so selfie search is fast even with 1000+ photos
- [x] Tag data stored in PostgreSQL Ã¢â‚¬â€ linked to photo ID + person (name, email, or registered user)

---

### Ã°Å¸Å½Â¨ Module 6 Ã¢â‚¬â€ Creator Website Builder (All Creator Types)

> **Expanded**: Previously photographer-only. Now every paid Creator account Ã¢â‚¬â€ regardless of type Ã¢â‚¬â€ gets a fully hosted professional website. Same WYSIWYG builder, same backend, creator-type-specific templates and sections.

---

**Ã°Å¸Å’Â Dual-Surface Architecture (Social Profile + Website)**

```
Every paid Creator gets TWO presences Ã¢â‚¬â€ powered by one backend:

1. Social Profile   Ã¢â€ â€™ [platform].com/@username
   Social-first. Feed, followers, activity, discovery.
   Fans find you here via the global network.

2. Dedicated Website Ã¢â€ â€™ username.[platform].com
   Professional-first. Portfolio, booking, store, events.
   Clients and industry contacts go here for business.

Both surfaces show the same galleries, posts, bookings, and store.
Changes in one reflect immediately in the other.
Custom domain (Pro+) points to the dedicated website.
```

---

**Ã°Å¸â€”â€šÃ¯Â¸Â Template Packs Ã¢â‚¬â€ Organized by Creator Type**

*Photography Templates:*

- [x] Minimal Ã¢â‚¬â€ white space, elegant, fine art
- [x] Bold Ã¢â‚¬â€ dark background, high contrast, dramatic
- [x] Editorial Ã¢â‚¬â€ magazine-style layouts, typography-driven
- [x] Wedding Ã¢â‚¬â€ soft tones, romantic, serif fonts
- [x] Portrait Ã¢â‚¬â€ face-forward, warm tones
- [x] Commercial Ã¢â‚¬â€ clean, corporate, product-feel
- [x] Adventure Ã¢â‚¬â€ full-bleed landscapes, rugged
- [x] Dark Room Ã¢â‚¬â€ ultra-dark, moody, cinematic

*Videography Templates:*

- [x] Reel Focus Ã¢â‚¬â€ hero video autoplay, project tiles below
- [x] Cinema Ã¢â‚¬â€ fullscreen video background, film-inspired
- [x] Production House Ã¢â‚¬â€ clean and corporate for commercial work

*Model Templates:*

- [x] Comp Card First Ã¢â‚¬â€ stats and comp card front and center
- [x] Editorial Model Ã¢â‚¬â€ full-bleed fashion imagery, minimal text
- [x] Commercial Model Ã¢â‚¬â€ clean, bright, casting-ready

*Actor Templates:*

- [x] RÃƒÂ©sumÃƒÂ© Forward Ã¢â‚¬â€ credits and training prominent, headshots alongside
- [x] Headshot Hero Ã¢â‚¬â€ large headshot gallery, reel prominently featured
- [x] Stage & Screen Ã¢â‚¬â€ theatrical feel, serif fonts, dramatic

*Cosplay Templates:*

- [x] Character Showcase Ã¢â‚¬â€ franchise-organized, colorful, fan-forward
- [x] Convention Star Ã¢â‚¬â€ schedule front and center, merch store prominent
- [x] Build Journal Ã¢â‚¬â€ blog/WIP style, process-focused

*MUA / Hair / Stylist Templates:*

- [x] Before & After Ã¢â‚¬â€ split-panel portfolio, service menu below
- [x] Beauty Editorial Ã¢â‚¬â€ high-fashion inspired, bold imagery
- [x] Clean & Booking Ã¢â‚¬â€ service menu + booking calendar as hero

*Fashion Designer Templates:*

- [x] Lookbook Ã¢â‚¬â€ collection galleries as hero, editorial imagery
- [x] Runway Ã¢â‚¬â€ fashion show video + collection tiles
- [x] Shop First Ã¢â‚¬â€ digital/pattern store as primary CTA

*Photography Studio Templates:*

- [x] Team + Portfolio Ã¢â‚¬â€ photographer roster + shared portfolio
- [x] Space First Ã¢â‚¬â€ studio rental with calendar + equipment list

---

**Ã°Å¸â€Â§ Shared Sections (Available to ALL creator types)**

Every creator type can add any of these sections to their website:

- [x] Hero / Banner Ã¢â‚¬â€ full-width intro with photo, video, or animation
- [x] About Ã¢â‚¬â€ bio, photo, background story
- [x] Portfolio / Gallery Ã¢â‚¬â€ pulls from their uploaded galleries
- [x] Social Feed Ã¢â‚¬â€ live embed of their posts from the social network
- [x] Services & Pricing Ã¢â‚¬â€ service cards with descriptions and rates
- [x] Store Ã¢â‚¬â€ print shop, digital downloads, commissions
- [x] Booking Calendar Ã¢â‚¬â€ appointment scheduler with package options
- [x] Events Ã¢â‚¬â€ upcoming appearances, workshops, mini sessions
- [x] Testimonials Ã¢â‚¬â€ client reviews and quotes
- [x] Press / Features Ã¢â‚¬â€ media mentions, brand collabs, publications
- [x] Blog / Journal Ã¢â‚¬â€ posts and updates
- [x] Contact Form Ã¢â‚¬â€ with lead capture and inquiry routing to CRM
- [x] FAQ Ã¢â‚¬â€ expandable questions and answers
- [x] Map Ã¢â‚¬â€ embedded location map (for studios, on-site businesses)
- [x] Social Links Ã¢â‚¬â€ Instagram, TikTok, YouTube, etc.
- [x] Custom HTML block Ã¢â‚¬â€ for advanced users

**Ã°Å¸â€Â§ Creator-Type-Specific Sections**

- [x] **Photographer**: Client Gallery Delivery button, Print Shop, Lightroom/PS plugin promo
- [x] **Videographer**: Showreel embed, Project delivery links, Production credits
- [x] **Model**: Digital Comp Card (stats + measurements), Tearsheet gallery, Rate Card
- [x] **Actor**: Digital RÃƒÂ©sumÃƒÂ© (credits, training, unions), Demo Reel, Headshot gallery, IMDB link
- [x] **Cosplayer**: Character portfolio (by franchise), Convention Schedule, Commission Store, Build Journal
- [x] **MUA / Hair / Stylist**: Before/After gallery, Service Menu, Kit/Product list, Certifications
- [x] **Fashion Designer**: Collection Lookbooks (by season), Pattern/Digital Shop, Wholesale Inquiry form
- [x] **Photography Studio**: Team roster, Studio Rental calendar, Equipment list
- [x] **Talent Agency**: Talent roster with links to each creator's profile

---

**Ã°Å¸â€“Â±Ã¯Â¸Â WYSIWYG Visual Editor (Puck-based drag & drop)**

- [x] Live preview Ã¢â‚¬â€ see changes in real time as you edit
- [x] Drag & drop sections Ã¢â‚¬â€ add, reorder, resize, delete visually
- [x] Click any text to edit inline (no pop-ups)
- [x] Per-section settings Ã¢â‚¬â€ colors, fonts, spacing, layout
- [x] Creator-type section library Ã¢â‚¬â€ filtered to show relevant sections first
- [x] Add/remove pages (About, Gallery, Store, Booking, Blog, etc.)
- [x] Navigation builder (drag to reorder, add dropdowns)
- [x] Mobile / tablet preview mode
- [x] Undo / redo history (50 steps)
- [x] Save as draft or publish instantly
- [x] Per-section animation picker
- [x] AI section writer Ã¢â‚¬â€ "Write an About page for a wedding photographer in Austin"

**Ã¢Å“Â¨ Scroll Animation System (GSAP + ScrollTrigger + Lenis)**

- [x] Ken Burns on sections Ã¢â‚¬â€ background photos slowly pan/zoom as you scroll
- [x] Parallax layers Ã¢â‚¬â€ foreground/background at different speeds
- [x] Reveal on scroll Ã¢â‚¬â€ text and photos fade/slide in on viewport entry
- [x] Sticky sections Ã¢â‚¬â€ section pins while content animates over it
- [x] Horizontal scroll sections Ã¢â‚¬â€ cinematic sideways scroll
- [x] Scale on scroll Ã¢â‚¬â€ photos grow/shrink as you scroll past
- [x] Blur to sharp Ã¢â‚¬â€ photos come into focus as they appear
- [x] Counter animations Ã¢â‚¬â€ numbers count up on scroll
- [x] Text split animations Ã¢â‚¬â€ words/letters animate in one by one
- [x] Smooth scrolling Ã¢â‚¬â€ Lenis for silky feel across all browsers
- [x] Animation intensity picker (subtle / medium / dramatic)
- [x] Disable all animations option (accessibility)

**Ã¢Å¡â„¢Ã¯Â¸Â Website Settings & Publishing**

- [x] Custom subdomain Ã¢â‚¬â€ `username.[platform].com` (all paid plans)
- [x] Custom domain Ã¢â‚¬â€ bring your own domain (Pro+ plans)
- [x] SEO tools Ã¢â‚¬â€ meta titles, descriptions, image alt text, XML sitemap
- [x] Open Graph tags Ã¢â‚¬â€ controls how links look when shared on social media
- [x] Google Analytics / Meta Pixel integration
- [x] Dark / light mode toggle per site
- [x] Password-protect entire website (for private portfolios)
- [x] Coming soon / maintenance mode page
- [x] Website analytics Ã¢â‚¬â€ page views, visitor locations, top pages (Module 9)
- [x] Social feed integration Ã¢â‚¬â€ posts from [platform] social profile appear on website automatically

---

### Ã°Å¸â€Å’ Module 7 Ã¢â‚¬â€ Lightroom & Photoshop Integration

> **Plugin Tech**: Lightroom Classic plugin (Lua + LR SDK). Photoshop plugin (UXP Ã¢â‚¬â€ JavaScript/React, Adobe's modern plugin system). Both use the same MyShutterHost OAuth2 account. Same trained style profile shared between both apps.

---

**Three Workflow Modes Ã¢â‚¬â€ Photographer Chooses in Dashboard:**

| Mode | Best For | Flow |
| ------ | ---------- | ------ |
| **Ã°Å¸Å¸Â¡ Lightroom Only** | Event/wedding volume work | Import Ã¢â€ â€™ AI Cull Ã¢â€ â€™ AI Style in LR Ã¢â€ â€™ Export |
| **Ã°Å¸â€Âµ Photoshop Only** | Beauty, boudoir, high fashion | Open in PS Ã¢â€ â€™ AI Retouch Ã¢â€ â€™ Export |
| **Ã°Å¸Å¸Â¢ LR Ã¢â€ â€™ PS Hybrid** | Professional mixed workflow | LR batch edits all Ã¢â€ â€™ select hero shots Ã¢â€ â€™ PS deep retouch Ã¢â€ â€™ back to LR |

---

**Ã°Å¸Å¸Â¡ Lightroom Plugin Ã¢â‚¬â€ Full Feature Set**

*Phase 1 Ã¢â‚¬â€ Gallery Integration:*

- [x] Upload photos directly from Lightroom to MyShutterHost galleries
- [x] Create new gallery from Lightroom collection with one click
- [x] OAuth2 login Ã¢â‚¬â€ no passwords stored in the plugin
- [x] Import/export Lightroom presets (.lrtemplate / .xmp format)
- [x] Preset marketplace Ã¢â‚¬â€ browse, download, and publish presets from inside Lightroom

*Phase 3 Ã¢â‚¬â€ AI Style Trainer (Lightroom):*

- [x] **"Train from existing catalog"** Ã¢â‚¬â€ select any folders of already-edited photos; plugin reads every develop setting from edited photos and sends patterns to MyShutterHost (no full-res upload Ã¢â‚¬â€ thumbnails + metadata only)
- [x] Folder selector UI Ã¢â‚¬â€ photographer checks which folders to include/exclude (exclude old style, different genres, etc.)
- [x] Estimated accuracy preview before training starts
- [x] Per-shoot-type style learning Ã¢â‚¬â€ AI builds separate style profiles for weddings, portraits, cosplay, golden hour, studio, etc. and applies the right one automatically
- [x] **AI Auto-Cull** Ã¢â‚¬â€ AI sets pick/reject/unflag on every photo in a folder based on: sharpness, exposure quality, blink detection, duplicate grouping, expression scoring
- [x] **AI Apply My Style** Ã¢â‚¬â€ AI sends thumbnails + EXIF to API, receives predicted develop settings, applies them to all selected photos in Lightroom non-destructively
- [x] **AI Color Balance** Ã¢â‚¬â€ corrects white balance (Temp + Tint) per photo based on lighting conditions learned from photographer's style
- [x] **AI Skin Tone Recovery** Ã¢â‚¬â€ adjusts HSL Orange/Red channels to match the photographer's typical skin rendering
- [x] **AI Noise Reduction** Ã¢â‚¬â€ applies Luminance + Color noise reduction at the level the photographer uses per ISO range
- [x] **AI Eye Brightening** Ã¢â‚¬â€ face detection locates iris Ã¢â€ â€™ local adjustment brush applied at photographer's typical settings (+exposure, +clarity)
- [x] **AI Under-Eye Correction** Ã¢â‚¬â€ face detection locates under-eye region Ã¢â€ â€™ healing/adjustment brush applied at photographer's typical settings
- [x] **AI Spot Removal** Ã¢â‚¬â€ vision AI detects skin blemishes Ã¢â€ â€™ Lightroom healing spots placed automatically
- [x] Continuous learning Ã¢â‚¬â€ corrections made after AI edits feed back as new training data automatically
- [x] **"Send to Photoshop"** button Ã¢â‚¬â€ sends selected hero shots to Photoshop plugin for deep retouching
- [x] Style accuracy dashboard Ã¢â‚¬â€ shows current model accuracy %, training photo count, last trained date

---

**Ã°Å¸â€Âµ Photoshop Plugin Ã¢â‚¬â€ Full Feature Set**

*Phase 1 Ã¢â‚¬â€ Gallery Integration:*

- [x] Export images from Photoshop directly to MyShutterHost galleries
- [x] Import/export Photoshop actions & presets
- [x] Skin smoothing, retouching presets library
- [x] OAuth2 login Ã¢â‚¬â€ same account as Lightroom plugin

*Phase 3 Ã¢â‚¬â€ AI Style Trainer (Photoshop):*

- [x] **Learn from existing PS work** Ã¢â‚¬â€ plugin reads the photographer's Action history, layer stack structure, brush settings relative to detected face landmarks
- [x] **AI Frequency Separation** Ã¢â‚¬â€ auto-creates the photographer's preferred frequency separation layer stack; heals blemishes on texture layer, smooths color/tone on base layer
- [x] **AI Dodge & Burn** Ã¢â‚¬â€ creates dodge/burn layer; applies learned brightness sculpting relative to face structure (cheekbones, jawline, brow)
- [x] **AI Eye Brightening (precise)** Ã¢â‚¬â€ face detection + iris segmentation Ã¢â€ â€™ applies dodge to iris and whites at learned opacity/radius
- [x] **AI Under-Eye Healing** Ã¢â‚¬â€ face detection Ã¢â€ â€™ healing brush on texture layer at photographer's typical settings
- [x] **AI Flyaway Hair Removal** Ã¢â‚¬â€ detects stray hairs at head boundary Ã¢â€ â€™ content-aware fill removes them
- [x] **AI Blemish & Spot Removal** Ã¢â‚¬â€ vision AI detects blemishes Ã¢â€ â€™ healing brush + clone stamp on correct layer
- [x] **AI Background Cleanup** Ã¢â‚¬â€ detects distracting elements Ã¢â€ â€™ content-aware fill (photographer approves before applying)
- [x] **Neural Filters (Adobe AI)** Ã¢â‚¬â€ applies Adobe's Skin Smoothing and Smart Portrait Neural Filters at the strength the photographer prefers
- [x] **AI LUT Color Grading** Ã¢â‚¬â€ applies photographer's preferred LUT at their typical opacity as a layer
- [x] **AI Liquify (subtle)** Ã¢â‚¬â€ Face Tool micro-adjustments at the level the photographer typically uses (conservative by default, adjustable)
- [x] **High-Pass Sharpening** Ã¢â‚¬â€ creates high-pass sharpening layer at photographer's typical radius and opacity
- [x] **"Send back to Lightroom"** Ã¢â‚¬â€ saves and syncs the retouched file back to the Lightroom catalog automatically
- [x] All AI edits on separate named layers Ã¢â‚¬â€ photographer can turn any step on/off

---

**Ã°Å¸Å¸Â¢ LR Ã¢â€ â€™ PS Hybrid Workflow**

- [x] Photographer clicks "Send to Photoshop" on selected hero shots from inside the Lightroom plugin
- [x] Lightroom develop settings are preserved as a smart object in Photoshop
- [x] Photoshop AI runs the deep retouching routine automatically on arrival
- [x] "Return to Lightroom" button saves and syncs the retouched file back to the catalog
- [x] Lightroom shows a "PS Retouched" badge on photos that have been through Photoshop

---

**Ã°Å¸ÂÂª Plugin & Preset Marketplace**

- [x] Photographers can publish their own Lightroom presets for free or paid download
- [x] Photographers can publish their own Photoshop actions for free or paid download
- [x] Photographers can publish their own custom plugins (built on LR SDK or PS UXP) Ã¢â‚¬â€ free or paid
- [x] Open-source option Ã¢â‚¬â€ mark plugin/preset as open-source with GitHub link
- [x] Optional Adobe Exchange distribution alongside marketplace listing
- [x] Plugin submissions reviewed before listing (malware prevention)
- [x] Platform takes 20% cut of paid plugin/preset sales
- [x] Star ratings and reviews on all marketplace items

---

### Ã°Å¸Â¤â€“ Module 8 Ã¢â‚¬â€ AI Features

> **Provider**: User-selectable in dashboard (OpenAI GPT-4o / Anthropic Claude / Google Gemini). Photographer brings their own API key. Vision-capable models enable photo analysis features.

---

**Ã°Å¸Â§Â­ Level 1 Ã¢â‚¬â€ Platform Assistant (Q&A Chatbox)**

The AI knows every feature of MyShutterHost and guides photographers contextually based on which page they're on:

- [x] Platform help & navigation Ã¢â‚¬â€ *"How do I set up a private client gallery?"*
- [x] Context-aware suggestions Ã¢â‚¬â€ AI sees which page you're on and offers relevant help proactively
- [x] Conversation history Ã¢â‚¬â€ saved chat sessions so photographers can reference past advice
- [x] Prompt library Ã¢â‚¬â€ pre-built quick-start prompts (*"Write my bio"*, *"Caption this photo"*, *"Draft a client email"*)
- [x] Photography education Ã¢â‚¬â€ camera settings, composition, lighting, editing techniques
- [x] Lightroom & Photoshop guidance Ã¢â‚¬â€ workflow tips, adjustment advice, preset suggestions
- [x] Legal & contract help Ã¢â‚¬â€ explain model releases, copyright basics, flag risky contract language
- [x] Pricing & business advice Ã¢â‚¬â€ package structuring, how to handle difficult clients, market positioning
- [x] SEO coaching Ã¢â‚¬â€ review page titles, suggest keywords, explain best practices

---

**Ã¢Å¡Â¡ Level 2 Ã¢â‚¬â€ Agentic Actions (AI Does Things FOR You)**

The AI can execute real tasks inside the platform Ã¢â‚¬â€ photographer reviews and approves before anything publishes:

- [x] *"Create a new gallery called 'Sarah & Mike Wedding 2026'"* Ã¢â€ â€™ creates gallery, sets to private, opens upload
- [x] *"Block my calendar next weekend"* Ã¢â€ â€™ marks dates unavailable in booking calendar
- [x] *"Generate a client questionnaire for a newborn session"* Ã¢â€ â€™ builds questionnaire, saves to their forms library
- [x] *"Draft a 'gallery is ready' email to my client Sarah"* Ã¢â€ â€™ writes email, shows preview, photographer approves & sends
- [x] *"Create a TFP post for a Halloween cosplay shoot in Dallas, looking for a MUA"* Ã¢â€ â€™ fills collaboration post form for review
- [x] *"Apply a 15% discount code called SPRING2026"* Ã¢â€ â€™ creates the coupon in store settings
- [x] *"Write alt text for all photos in my Summer Gallery"* Ã¢â€ â€™ analyzes each photo, populates alt text fields in bulk
- [x] *"Generate a shot list for a 6-hour wedding"* Ã¢â€ â€™ creates comprehensive shot list, saves to event planner
- [x] *"Write my Instagram bio"* Ã¢â€ â€™ generates bio based on their portfolio style and specialties
- [x] *"Set up a mini session Ã¢â‚¬â€ 30 mins, $150, 3 slots, Saturday April 5th"* Ã¢â€ â€™ creates the event with booking slots

---

**Ã¢Å“ÂÃ¯Â¸Â Content Generation**

- [x] **Bio writer** Ã¢â‚¬â€ generates professional photographer bio from a few prompts
- [x] **Gallery descriptions** Ã¢â‚¬â€ SEO-optimized descriptions per gallery (*"Describe my Austin sunset engagement gallery"*)
- [x] **Blog post writer** Ã¢â‚¬â€ full blog posts (*"Write: 5 reasons to hire a professional photographer for your wedding"*)
- [x] **Social media captions** Ã¢â‚¬â€ platform-specific captions for Instagram, Facebook, Pinterest, X/Twitter
- [x] **Hashtag generator** Ã¢â‚¬â€ 30 targeted hashtags based on shoot type, style, and location
- [x] **Client email drafts** Ã¢â‚¬â€ inquiry responses, follow-ups, gallery delivery emails, thank-you notes
- [x] **Invoice & contract language** Ã¢â‚¬â€ help draft custom clauses, explain existing terms
- [x] **Event/mini session descriptions** Ã¢â‚¬â€ write compelling booking page copy
- [x] **Testimonial summarizer** Ã¢â‚¬â€ from multiple client reviews, generate one compelling summary quote
- [x] **Email marketing campaigns** Ã¢â‚¬â€ write full newsletter content for photographer's mailing list
- [x] **Website page copy** Ã¢â‚¬â€ help write About, Services, FAQ, Contact pages
- [x] **Gallery name suggestions** Ã¢â‚¬â€ suggest gallery names based on event details

---

**Ã°Å¸â€œÂ¸ Photo Intelligence (Vision AI)**

- [x] **AI photo culling** Ã¢â‚¬â€ rank photos by: sharpness, exposure, composition, facial expression quality (eyes open, genuine smile), subject placement
- [x] **Duplicate / near-duplicate detector** Ã¢â‚¬â€ in a burst of 10 similar shots, identify the best one and flag the rest for deletion
- [x] **Auto-tagging** Ã¢â‚¬â€ detect and tag: people, locations, scene types (indoor/outdoor/golden hour/night), events (wedding/portrait/cosplay/landscape)
- [x] **Expression detector** Ã¢â‚¬â€ in portrait sessions, identify which shots have the best facial expressions
- [x] **AI-generated alt text** Ã¢â‚¬â€ analyze actual photo content and write descriptive, SEO-friendly alt text
- [x] **Smart album builder** Ã¢â‚¬â€ group uploaded photos into suggested albums by scene, subject, or time
- [x] **Composition feedback** Ã¢â‚¬â€ analyze a photo's composition and provide constructive feedback
- [x] **Photo-to-caption** Ã¢â‚¬â€ upload any photo Ã¢â€ â€™ AI writes a caption for it
- [x] **AI upscaling** Ã¢â‚¬â€ upscale low-res photos for print-quality output (Real-ESRGAN technology)
- [x] **Watermark position optimizer** Ã¢â‚¬â€ AI suggests optimal watermark placement that avoids covering key subjects
- [x] **Color palette extractor** Ã¢â‚¬â€ extract the dominant colors from a photographer's portfolio to suggest website brand colors
- [x] **Sky & scene classifier** Ã¢â‚¬â€ identify which photos have skies suitable for enhancement, scenes suitable for certain print products

---

**Ã°Å¸â€œÅ  Business Intelligence**

- [x] **Analytics insights in plain English** Ã¢â‚¬â€ *"Your Tuesday galleries get 3x more engagement than Friday ones. Consider posting new galleries on Tuesdays."*
- [x] **Revenue insights** Ã¢â‚¬â€ *"Your print sales spike in November Ã¢â‚¬â€ consider running a holiday promotion in October"*
- [x] **Pricing optimizer** Ã¢â‚¬â€ based on their market, niche, and experience, suggest competitive pricing for sessions and products
- [x] **Client retention alerts** Ã¢â‚¬â€ *"You haven't heard from 5 repeat clients in over a year. Want me to draft a re-engagement email?"*
- [x] **Gallery performance summary** Ã¢â‚¬â€ *"Your 'Golden Hour Portraits' gallery has 3x more saves than average. Consider promoting it."*
- [x] **SEO site audit** Ã¢â‚¬â€ scan the photographer's entire website, score each page, give specific improvement suggestions
- [x] **Booking conversion tips** Ã¢â‚¬â€ if inquiry-to-booking rate is low, AI suggests what to change in the booking flow

---

**Ã°Å¸â€™Â¬ Client-Facing AI Widget (on Photographer's OWN website)**

Photographers can optionally add an AI chat widget to their public portfolio website. Their clients and visitors can ask it questions:

- [x] *"What packages do you offer?"* Ã¢â€ â€™ AI answers based on the photographer's services/pricing page
- [x] *"Are you available on June 14th?"* Ã¢â€ â€™ AI checks the booking calendar and answers
- [x] *"How long until I get my photos back?"* Ã¢â€ â€™ AI answers based on the photographer's turnaround settings
- [x] *"How do I download my photos?"* Ã¢â€ â€™ AI explains the download process
- [x] *"I'd like to book a session"* Ã¢â€ â€™ AI collects client info and creates a lead in the photographer's CRM
- [x] Fully trained on the photographer's own website content, services, and FAQ
- [x] Photographer writes a short "About my business" prompt to personalize the AI's voice/tone
- [x] Toggle on/off per website in the dashboard
- [x] Uses photographer's own API key (no additional cost to MyShutterHost)

---

**Ã°Å¸Å¡â‚¬ Phase 3 Ã¢â‚¬â€ AI Style Trainer (Confirmed, Not Future)**

- [x] **Train from existing Lightroom catalog** Ã¢â‚¬â€ select folders of already-edited work; AI learns from thousands of before/after develop setting pairs instantly
- [x] **Train from existing Photoshop work** Ã¢â‚¬â€ reads Action history, layer structures, local adjustment patterns relative to face landmarks
- [x] Folder selector with accuracy estimate ("3,810 training photos Ã¢â€ â€™ estimated 91% accuracy")
- [x] Per-shoot-type style profiles Ã¢â‚¬â€ separate learned styles for weddings, portraits, cosplay, golden hour, studio
- [x] Style date filtering Ã¢â‚¬â€ exclude older work that doesn't represent current style
- [x] Continuous background learning Ã¢â‚¬â€ every post-AI correction feeds back as training data
- [x] Style accuracy dashboard Ã¢â‚¬â€ current %, training count, improvement over time graph
- [x] Works in Lightroom only / Photoshop only / LRÃ¢â€ â€™PS hybrid mode

**Ã°Å¸Å¡â‚¬ Future AI Roadmap (Phase 4)**

- [ ] **AI shooting location finder** Ã¢â‚¬â€ based on desired mood/style, suggest nearby locations with GPS coordinates
- [ ] **AI mood board generator** Ã¢â‚¬â€ describe a shoot concept Ã¢â€ â€™ AI generates a mood board with color palettes and style references
- [ ] **AI social media scheduler** Ã¢â‚¬â€ analyze engagement patterns and suggest/auto-schedule the optimal posting times
- [ ] **AI style trainer v2** Ã¢â‚¬â€ vision-model based (CLIP embeddings) for even deeper style understanding beyond slider patterns
- [ ] **AI equipment advisor** Ã¢â‚¬â€ based on what a photographer shoots, suggest gear upgrades with explanation of why
- [ ] **Multilingual AI** Ã¢â‚¬â€ AI responds in the user's language automatically (ties into i18n)

---

### Ã°Å¸â€œÅ  Module 9 Ã¢â‚¬â€ Creator Analytics & Audience Intelligence

> **Architecture**: Two-database analytics stack. PostgreSQL handles business data (users, orders, bookings). **ClickHouse** handles the analytics event firehose (billions of view events, sub-second queries). **Redis** powers real-time counters. **PostHog** (self-hosted) handles product funnels and session analysis. **MaxMind GeoIP2** resolves IP Ã¢â€ â€™ city/region/country with no API fees.

---

> [!IMPORTANT]
> **Privacy & Legal Compliance Built In**
> Age, gender, and behavioral analytics fall under GDPR Article 22 (profiling) and CCPA rules.
>
> - Users **consent** to demographic/behavioral analytics at signup (opt-in checkbox, not pre-ticked)
> - Creators see **aggregated anonymous data only** Ã¢â‚¬â€ never individual user identities
> - "Names" in stats are replaced with anonymous viewer IDs (hashed fingerprints)
> - Users can **opt out** in their account settings at any time
> - Under-13 users (COPPA) are excluded from all demographic tracking
> - "Personality traits" are implemented as **Audience Interest Segments** (inferred from content engagement, not personal data) Ã¢â‚¬â€ legally cleaner and more useful

---

**Ã¢Å¡â„¢Ã¯Â¸Â Analytics Event Pipeline**

```
User views a photo / page / video / post
         Ã¢â€ â€œ
Client fires an event (lightweight, <1KB):
{
  event:           "photo_view",
  contentId:       "photo_abc123",
  creatorId:       "creator_xyz",
  viewerToken:     "anon_hash_789a",   Ã¢â€ Â hashed, NOT real user ID
  sessionId:       "sess_xyz",
  duration:        4.2,                Ã¢â€ Â seconds on this photo
  scrollDepth:     0.73,               Ã¢â€ Â 73% of page scrolled
  referrer:        "instagram",        Ã¢â€ Â where they came from
  country:         "US",
  region:          "Texas",
  city:            "Austin",
  device:          "mobile",
  os:              "iOS",
  browser:         "Safari",
  hour:            14,                 Ã¢â€ Â 2:00 PM local time
  dayOfWeek:       3,                  Ã¢â€ Â Wednesday
  timestamp:       "2026-06-25T19:32Z"
}
         Ã¢â€ â€œ
  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â    Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
  Ã¢â€â€š  ClickHouse DB   Ã¢â€â€š    Ã¢â€â€š  Redis Counter   Ã¢â€â€š
  Ã¢â€â€š  (stored async,  Ã¢â€â€š    Ã¢â€â€š  (real-time      Ã¢â€â€š
  Ã¢â€â€š   milliseconds)  Ã¢â€â€š    Ã¢â€â€š   view ticker)   Ã¢â€â€š
  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ    Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
                                   Ã¢â€â€š
                              Socket.io
                                   Ã¢â€â€š
                          Live counter pushed
                          to all viewers on
                          that post/gallery
```

---

**Ã°Å¸â€œË† Content Performance Analytics**

*Views & Engagement:*

- [x] Total views per photo / post / video / gallery / page (all-time, 7d, 30d, 90d, custom range)
- [x] Unique viewer count (distinct anonymous visitor fingerprints)
- [x] **View duration** Ã¢â‚¬â€ average time spent on each photo, video (seconds watched), page
- [x] **Scroll depth** Ã¢â‚¬â€ what % of visitors scrolled past each section of a page
- [x] **Video completion rate** Ã¢â‚¬â€ what % of viewers watched to 25%, 50%, 75%, 100%
- [x] **Engagement rate** Ã¢â‚¬â€ (likes + comments + shares + saves) ÃƒÂ· views Ãƒâ€” 100
- [x] Like, comment, share, save counts per post with trend charts
- [x] Click-through rate Ã¢â‚¬â€ how many viewers clicked "Book Now", "Buy Print", "Follow", etc.
- [x] **Photo heatmap** Ã¢â‚¬â€ on a gallery page, which individual photos get the most attention (eye-catching vs. skipped)
- [x] **Gallery exit point** Ã¢â‚¬â€ which photo or page section causes visitors to leave

*Repeat Viewer Intelligence:*

- [x] **Return visitor rate** Ã¢â‚¬â€ what % of views are from the same anonymous viewer (days/weeks apart)
- [x] **"Top fans" frequency tracker** Ã¢â‚¬â€ see that anonymous viewer #A7F3 has visited your profile 47 times this month (name always hidden)
- [x] **Content affinity** Ã¢â‚¬â€ which specific photos/videos does the same anonymous viewer keep returning to
- [x] **Superfan detection** Ã¢â‚¬â€ flag anonymous viewers who have viewed, liked, and returned more than a configurable threshold
- [x] View streak detection Ã¢â‚¬â€ content that the same viewer returns to daily

*Real-Time Live Counters:*

- [x] **Live view ticker on posts** Ã¢â‚¬â€ "Ã°Å¸â€Â´ 23 people viewing this right now" (updates every second via Socket.io)
- [x] **Live gallery counter** Ã¢â‚¬â€ real-time count of how many people are in a gallery right now
- [x] **Trending now indicator** Ã¢â‚¬â€ posts gaining views faster than usual get a "Ã°Å¸â€Â¥ Trending" badge
- [x] **Real-time dashboard** Ã¢â‚¬â€ creator dashboard shows live activity as it happens (incoming views, tips, orders)
- [x] **Spike notifications** Ã¢â‚¬â€ push notification when a post hits unusual traffic (e.g., 10x normal rate in an hour)

---

**Ã°Å¸â€˜Â¥ Audience Demographics & Segments**

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
  - Ã°Å¸Å½Â­ **Cosplay Enthusiast** Ã¢â‚¬â€ engages heavily with cosplay content
  - Ã°Å¸â€˜â€” **Fashion Forward** Ã¢â‚¬â€ engages with fashion, styling, editorial
  - Ã°Å¸â€œÂ¸ **Photography Hobbyist** Ã¢â‚¬â€ browses technique posts, gear discussions
  - Ã°Å¸â€™â€™ **Wedding Prospect** Ã¢â‚¬â€ views wedding galleries, clicks "Book a Consultation"
  - Ã°Å¸Å½Â¨ **Art Collector** Ã¢â‚¬â€ views and saves fine art, landscape, abstract work
  - Ã°Å¸Ââ€¹Ã¯Â¸Â **Fitness & Lifestyle** Ã¢â‚¬â€ engages with fitness model, active lifestyle content
  - Ã°Å¸Å½Â¬ **Production Professional** Ã¢â‚¬â€ views videography, behind-the-scenes, crew content
  - Ã°Å¸Â¦Â¸ **Fan / Convention Goer** Ã¢â‚¬â€ follows cosplayers, visits convention event posts
  - Ã°Å¸â€™Â¼ **Commercial Buyer** Ã¢â‚¬â€ views commercial photography/video, clicks rate cards
  - Ã°Å¸Å½â€œ **Creative Student** Ã¢â‚¬â€ engages with tutorials, educational content
- [x] Creator sees their top 3 audience segments as a pie chart
- [x] Segment performance Ã¢â‚¬â€ which segments convert to buyers/bookers best

---

**Ã°Å¸Å’Â Geographic Analytics**

- [x] **World heatmap** Ã¢â‚¬â€ interactive globe/map showing where all views originate, colored by density
- [x] **Top countries** Ã¢â‚¬â€ ranked list with view counts and % of total
- [x] **Top regions / states** Ã¢â‚¬â€ drill down from country into states/provinces
- [x] **Top cities** Ã¢â‚¬â€ most common cities viewers are in
- [x] **Local vs. out-of-market** Ã¢â‚¬â€ what % of viewers are within 50mi of creator's listed location vs. elsewhere
- [x] City-level filtering Ã¢â‚¬â€ see stats for "only viewers in Austin"
- [x] Geographic revenue breakdown Ã¢â‚¬â€ where are your buyers located?
- [x] International reach score Ã¢â‚¬â€ metric of how globally distributed your audience is

---

**Ã¢ÂÂ° Time & Pattern Analytics**

- [x] **Hourly heatmap** Ã¢â‚¬â€ 24-hour grid showing views by hour of day (across your audience's local times)
- [x] **Day of week heatmap** Ã¢â‚¬â€ MondayÃ¢â‚¬â€œSunday breakdown, which days drive the most views
- [x] **Best time to post** Ã¢â‚¬â€ AI recommendation based on when your specific audience is most active
  - *"Your audience is most active Tuesday 7Ã¢â‚¬â€œ9pm. Schedule your next post for then."*
- [x] **Seasonal trends** Ã¢â‚¬â€ 12-month view showing which months are your busiest
- [x] **Holiday traffic patterns** Ã¢â‚¬â€ detect spikes around Christmas, Valentine's Day, Comic Con seasons, etc.
- [x] **Post timing optimizer** Ã¢â‚¬â€ compare posts made at different times, show which performed better

---

**Ã°Å¸â€™Â° Revenue & Conversion Analytics**

- [x] **Revenue per post** Ã¢â‚¬â€ which specific photos, galleries, or posts generated tip/star/sale revenue
- [x] **Revenue attribution** Ã¢â‚¬â€ which marketing channel (Instagram link, Google search, direct URL, email) led to the actual sale
- [x] **Conversion funnel** Ã¢â‚¬â€ Viewer Ã¢â€ â€™ Follower Ã¢â€ â€™ Buyer (drop-off rates at each stage)
- [x] **Average order value** over time
- [x] **Revenue per viewer** Ã¢â‚¬â€ how much each unique viewer generates on average
- [x] **Best-selling content** Ã¢â‚¬â€ which photos/videos have generated the most revenue (tips + prints + downloads)
- [x] **Booking conversion rate** Ã¢â‚¬â€ of people who visit your booking page, what % actually book
- [x] **Abandoned booking tracking** Ã¢â‚¬â€ visitors who started but didn't complete a booking (send re-engagement email)
- [x] Collaborative project revenue tracking Ã¢â‚¬â€ earnings from revenue-sharing contracts (Module 20)

---

**Ã°Å¸â€œË† Growth & Audience Analytics**

- [x] **Follower growth timeline** Ã¢â‚¬â€ chart of follows/unfollows over time with event markers (e.g., "this post caused +127 follows")
- [x] **Profile visitor Ã¢â€ â€™ follower conversion rate** Ã¢â‚¬â€ what % of profile visitors follow you
- [x] **Follower source** Ã¢â‚¬â€ how did followers find you? (direct search, shared post, event page, looking for board)
- [x] **Audience retention** Ã¢â‚¬â€ are followers still engaging 30/60/90 days after following?
- [x] **Churn rate** Ã¢â‚¬â€ unfollows per week, with context ("you lost 12 followers the week you posted less frequently")
- [x] **Reach vs. impressions** Ã¢â‚¬â€ unique viewers (reach) vs. total views including repeats (impressions)
- [x] **Organic vs. cross-post reach** Ã¢â‚¬â€ views from within the platform vs. views driven by Instagram/Facebook/X cross-posts

---

**Ã°Å¸â€œÂ± Device & Technical Analytics**

- [x] Device breakdown Ã¢â‚¬â€ Mobile / Desktop / Tablet (% split with trend over time)
- [x] Operating system Ã¢â‚¬â€ iOS / Android / Windows / macOS / Other
- [x] Browser breakdown Ã¢â‚¬â€ Safari / Chrome / Firefox / Samsung Browser / Other
- [x] Screen resolution distribution (useful for optimizing photo display sizes)
- [x] Connection type Ã¢â‚¬â€ WiFi vs. cellular (important for video quality decisions)
- [x] Page load time Ã¢â‚¬â€ average load speed per page type (flag slow pages)

---

**Ã°Å¸Ââ€  Content Comparison & Benchmarking**

- [x] **Head-to-head comparison** Ã¢â‚¬â€ select any two posts and compare all metrics side by side
- [x] **Your best performers** Ã¢â‚¬â€ top 10 photos/posts/videos of all time, this month, this week
- [x] **Content type performance** Ã¢â‚¬â€ do your cosplay posts outperform your portrait posts? Color-coded breakdown
- [x] **Creator type benchmarking** (opt-in) Ã¢â‚¬â€ how does your engagement compare to similar creators in your category? (all anonymous, shown as percentile: "You're in the top 23% of photographers for engagement rate")
- [x] **A/B testing** Ã¢â‚¬â€ post two versions of similar content on different days, platform helps compare performance

---

**Ã°Å¸â€â€ Alerts & Notifications**

- [x] **Trending alert** Ã¢â‚¬â€ push notification when a post hits 2x its normal view rate in under 1 hour
- [x] **Milestone alerts** Ã¢â‚¬â€ "Ã°Å¸Å½â€° Your gallery just hit 10,000 views!" / "You reached 500 followers!"
- [x] **Revenue alert** Ã¢â‚¬â€ "Ã°Å¸â€™Â° You just earned $47 from tips and print sales today"
- [x] **Booking spike alert** Ã¢â‚¬â€ "Ã°Å¸â€œâ€¦ 3 people viewed your booking page in the last 10 minutes"
- [x] **Superfan alert** Ã¢â‚¬â€ anonymous viewer has crossed your set threshold (e.g., 25+ profile visits)
- [x] All alerts configurable Ã¢â‚¬â€ set thresholds, turn any off

---

**Ã°Å¸â€œÂ¬ Reporting & Exports**

- [x] **Weekly email digest** Ã¢â‚¬â€ automated every Monday morning: top stats from the past week, highlights, tip of the week
- [x] **Monthly performance report** Ã¢â‚¬â€ PDF + email: month-over-month comparison, top content, audience growth, revenue
- [x] **Custom date range reports** Ã¢â‚¬â€ pull stats for any date range
- [x] **CSV export** Ã¢â‚¬â€ download raw event data for your own analysis / QuickBooks / Excel
- [x] **Goal tracking** Ã¢â‚¬â€ set goals (1,000 followers, $500/month revenue, 50 bookings this year) and track progress with visual progress bars
- [x] **AI insights summary** Ã¢â‚¬â€ plain English explanation of your stats: *"Your Tuesday posts get 3x more engagement than Friday ones. Your audience in Texas converts to buyers at 4x the rate of your California viewers."*
- [x] **Scheduled reports** Ã¢â‚¬â€ set reports to auto-send weekly, monthly, or quarterly to your email

---

**Ã°Å¸â€™Â¾ Storage Management (same module)**

- [x] Storage usage dashboard (per creator, per plan tier) Ã¢â‚¬â€ GB used vs. plan limit
- [x] External storage connection Ã¢â‚¬â€ link your own S3, Backblaze B2, or Google Drive as overflow storage
- [x] Backup & version history Ã¢â‚¬â€ restore deleted photos up to 90 days
- [x] Bandwidth and download tracking Ã¢â‚¬â€ see how much CDN bandwidth your galleries consume
- [x] Storage optimizer Ã¢â‚¬â€ flag duplicate files, unused galleries, low-res duplicates of high-res originals

---

### Ã°Å¸â€˜Â¤ Module 10 Ã¢â‚¬â€ Platform Admin & Accounts

- [x] Photographer account with subscription billing (Free / Pro / Studio tiers)
- [x] Multi-photographer studio accounts (one studio, multiple photographer sub-accounts)
- [x] Affiliate / referral program (refer a photographer, earn credits)
- [x] Email marketing integration (Mailchimp, ConvertKit Ã¢â‚¬â€ build mailing list from fans/followers)
- [x] Newsletter signup widget for photographer websites
- [x] Multi-language / internationalization support (i18n)
- [x] Mobile app (iOS + Android) for photographers to manage on the go *(Phase 4)*

---

### Ã°Å¸â€˜Â¥ Module 11 Ã¢â‚¬â€ Client Accounts & Profiles

Clients (the people who visit photographer websites) get their own accounts on MyShutterHost that track everything they do across all photographer sites on the platform.

**Client Profile:**

- [x] Client signup via email, Google, Facebook, or Apple (social login for easy onboarding)
- [x] Profile photo upload
- [x] Name, bio, location, website
- [x] Public or private profile toggle
- [x] Profile visible to photographers whose galleries they've interacted with

**Activity Tracking (auto-tracked, visible to client):**

- [x] **Photos liked** Ã¢â‚¬â€ all photos they've hearted across any gallery
- [x] **Photos shared** Ã¢â‚¬â€ history of every share to social media
- [x] **Photos purchased** Ã¢â‚¬â€ all digital downloads bought, with re-download links
- [x] **Photos tagged in** Ã¢â‚¬â€ every photo they appear in or were tagged in
- [x] **Print orders** Ã¢â‚¬â€ full order history, status, tracking numbers
- [x] **Galleries visited** Ã¢â‚¬â€ history of galleries they've browsed
- [x] **Galleries saved/bookmarked** Ã¢â‚¬â€ galleries they want to revisit
- [x] **Wishlist** Ã¢â‚¬â€ photos saved to buy later

**Bookings & Appointments:**

- [x] Upcoming booked sessions with any photographer on the platform
- [x] Past session history
- [x] Session documents (contracts, invoices, questionnaires) in one place
- [x] One-click rebooking with the same photographer

**Stars & Tips Wallet:**

- [x] Stars balance dashboard (how many stars they currently hold)
- [x] Buy stars / credits directly from their profile (Stripe)
- [x] Full stars sent history Ã¢â‚¬â€ which photographers they supported, when, how much
- [x] Full tips sent history Ã¢â‚¬â€ tip amounts, dates, photographers
- [x] Earned stars (if referral program is active)
- [x] Stars expiry reminders (if stars expire after X months)

**Followed Photographers:**

- [x] Follow/unfollow photographers
- [x] Feed of new galleries posted by followed photographers
- [x] Notification when a photographer they follow posts a new gallery

**Notifications:**

- [x] In-app notification center (new tags, gallery ready, order shipped, etc.)
- [x] Email notification preferences (opt-in/out per type)
- [x] Push notifications (mobile app Ã¢â‚¬â€ Phase 4)

**Privacy & Security:**

- [x] Untag requests (remove themselves from tagged photos)
- [x] Delete account + all personal data (GDPR right to erasure)
- [x] Control who can tag them (anyone / only verified photographers / nobody)
- [x] Two-factor authentication (2FA)

**What to Use for Client Auth:**
> Auth.js v5 already handles this Ã¢â‚¬â€ supports email/password + Google + Facebook + Apple OAuth out of the box. Client accounts and photographer accounts are the same auth system, just different roles.

---

### Ã°Å¸â€“Â¥Ã¯Â¸Â Module 12 Ã¢â‚¬â€ Photographer Dashboard & Admin Panel

The photographer's private backend Ã¢â‚¬â€ everything they need to run their business.

**Gallery & Content Management:**

- [x] Upload, organize, and manage all galleries and photos
- [x] Set download tiers per gallery (free low-res / paid standard / paid high-res / free high-res)
- [x] Watermark settings (upload custom watermark, set position + opacity)
- [x] Gallery visibility (public / private / password-protected / client-only)
- [x] Schedule gallery publish date

**Face Recognition Settings (per photographer account):**

- [x] **Face search toggle** Ã¢â‚¬â€ enable or disable "Find My Photos" for their entire account
- [x] **API provider selector** Ã¢â‚¬â€ choose between:
  - AWS Rekognition (pay-per-use, ~$1/1,000 searches)
  - Azure Face API (similar pricing, different accuracy profile)
  - Disabled (no face search at all Ã¢â‚¬â€ for photographers who serve privacy-sensitive clients)
- [x] **Per-gallery face search toggle** Ã¢â‚¬â€ even if enabled globally, they can disable for specific galleries (e.g. disable for a private boudoir gallery)
- [x] Photographer enters their own AWS or Azure API key (they pay their own usage fees directly)
- [x] Usage stats Ã¢â‚¬â€ how many face searches have been run this month

**Store & Orders:**

- [x] Order management (pending / in production / shipped / delivered)
- [x] Shipping label generation (EasyPost Ã¢â‚¬â€ USPS, UPS, FedEx, DHL)
- [x] Revenue dashboard (sales, downloads, tips, stars, payouts)
- [x] Payout history (Stripe Connect)
- [x] Product catalog management (prints, products, pricing)

**Client Management:**

- [x] Client list with profile photos and full history
- [x] Per-client activity view (what they bought, tipped, shared, booked)
- [x] Send messages to clients
- [x] Client tags and notes (internal Ã¢â‚¬â€ clients don't see these)

**Booking & Business:**

- [x] Booking calendar (availability, session types, pricing)
- [x] Contract templates (create once, reuse per booking)
- [x] Invoice generator
- [x] Wedding planner per event
- [x] Lead management (inquiries Ã¢â€ â€™ follow-up Ã¢â€ â€™ booked)

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

### Ã°Å¸Â¤Â Module 13 Ã¢â‚¬â€ TFP Collaboration Hub & Events

**What is TFP?** Time For Print (also Trade For Print) Ã¢â‚¬â€ a common photography arrangement where photographer, model, makeup artist, stylist, etc. all work for free and each receives the final images in exchange.

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
- [x] Availability polling ("what dates work for everyone?" Ã¢â‚¬â€ like Doodle but built-in)
- [x] Shoot date confirmed Ã¢â€ â€™ auto-added to all members' calendars
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
- [x] Mini session booking: limited time slots (e.g. "Saturday April 5th Ã¢â‚¬â€ 10am / 11am / 12pm Ã¢â‚¬â€ $150 for 30 min")
- [x] "Book a slot" button Ã¢â€ â€™ goes straight to Stripe checkout
- [x] Countdown timer on upcoming events ("12 days away")
- [x] Spots remaining counter ("3 of 8 slots left")
- [x] RSVP for free events
- [x] Share event to Facebook, Instagram, X with one click
- [x] **Facebook Events sync** Ã¢â‚¬â€ publish event to Facebook Events automatically via Facebook Graph API
- [x] Event reminder emails to people who RSVP'd or booked
- [x] Past events archive (shows previous shoots, links to the gallery)
- [x] Embed events widget on external websites (share your mini session calendar anywhere)

**Social Linking for Events:**

- [x] Link any event to an existing Facebook Group or Facebook Event page
- [x] Link to Instagram post or story about the event
- [x] Share event QR code (for printing and posting at venues, conventions, etc.)
- [x] Auto-post new events to connected social media accounts

---

### Ã°Å¸â€™Â¬ Module 14 Ã¢â‚¬â€ Real-time Chat & Messaging

A **Facebook Messenger + Discord hybrid** built directly into the platform. Users never have to leave MyShutterHost to communicate.

**Tech: Socket.io** Ã¢â‚¬â€ runs self-hosted on your Vultr server as part of the Next.js app. Zero extra monthly cost, fully controlled, no third-party dependency.

**Direct Messages (Messenger-style):**

- [x] 1-on-1 private DMs between any two users (photographers, clients, models, collaborators)
- [x] Message history stored in PostgreSQL
- [x] Seen / delivered receipts
- [x] Typing indicator ("Jane is typing...")  
- [x] Emoji reactions on messages
- [x] Reply to a specific message (threaded reply)
- [x] Share photos/files directly in chat (stored on Cloudflare R2)
- [x] Share gallery links Ã¢â‚¬â€ renders a preview card in-chat
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
- [x] Push notifications (mobile app Ã¢â‚¬â€ Phase 4)
- [x] "Do not disturb" mode

**Platform Connections (link, don't replace):**

- [x] Link a Facebook Messenger conversation from chat (photographer can paste their Messenger link)
- [x] Link a Discord server from a group room
- [x] These are just shortcut links Ã¢â‚¬â€ core communication always happens inside MyShutterHost

---

| Your Feature | Status |
| --- | --- |
| Photo gallery | Ã¢Å“â€¦ Module 1 |
| Video gallery | Ã¢Å“â€¦ Module 1 |
| Point of sale (photos, prints, products) | Ã¢Å“â€¦ Module 2 |
| Social media sharing | Ã¢Å“â€¦ Module 3 |
| Like & share for galleries + individual pics | Ã¢Å“â€¦ Module 3 |
| Send galleries/pics to friends on social media | Ã¢Å“â€¦ Module 3 |
| Pay to download | Ã¢Å“â€¦ Module 2 |
| Accept tips | Ã¢Å“â€¦ Module 2 |
| Hearts & Stars micropayment system | Ã¢Å“â€¦ Module 2 |
| Contracts | Ã¢Å“â€¦ Module 4 |
| Booking calendar | Ã¢Å“â€¦ Module 4 |
| Watermarks | Ã¢Å“â€¦ Module 1 |
| External storage | Ã¢Å“â€¦ Module 9 |
| Lightroom plugin | Ã¢Å“â€¦ Module 7 |
| Photoshop plugin | Ã¢Å“â€¦ Module 7 |
| Import/export presets | Ã¢Å“â€¦ Module 7 |
| Photo culling | Ã¢Å“â€¦ Module 1 + Module 8 |
| Wedding planner | Ã¢Å“â€¦ Module 4 |
| Portfolios | Ã¢Å“â€¦ Module 6 |
| Music for photo albums | Ã¢Å“â€¦ Module 1 |
| Photographer profile page | Ã¢Å“â€¦ Module 6 |
| AI chatbox | Ã¢Å“â€¦ Module 8 |
| Embedded social media feeds | Ã¢Å“â€¦ Module 3 |
| Subscriptions | Ã¢Å“â€¦ Module 10 |
| Customizable UI & templates | Ã¢Å“â€¦ Module 6 |
| Pre-made templates | Ã¢Å“â€¦ Module 6 |

---

## Ã°Å¸â€™Â¡ Suggested Features You Didn't Mention (Worth Considering)

> [!NOTE]
> These are common features on top photography platforms that you may want to add.

| Suggested Feature | Why It Matters |
| --- | --- |
| **Print lab integrations** (WHCC, Printful, Bay Photo) | Without these, print orders have no fulfillment Ã¢â‚¬â€ you need a real lab to print and ship |
| **Client CRM** | Track leads Ã¢â€ â€™ booked Ã¢â€ â€™ shot Ã¢â€ â€™ delivered workflow |
| **Digital contracts + e-signatures** | Legally protects photographers (model releases, session agreements) |
| **Invoicing & payment requests** | Photographers often invoice separately from store sales |
| **Mood board builder** | Clients share style inspiration before the shoot |
| **Intake questionnaires** | Photographers send forms to clients before sessions |
| **Preset marketplace** | Photographers can sell/share presets Ã¢â‚¬â€ a revenue stream for you |
| **Affiliate/referral program** | Viral growth Ã¢â‚¬â€ photographers refer others, earn credits |
| **Email marketing integration** | Build a mailing list from fans who love their work |
| **Multi-photographer studio accounts** | Studios with 5+ photographers need team management |
| **SEO tools built in** | Photographers need their sites to rank on Google |
| **Geographic/map gallery view** | "Photos taken in Paris" Ã¢â‚¬â€ great for travel photographers |
| **EXIF data display** | Photography enthusiasts love seeing camera settings |
| **Embeddable gallery widget** | Lets photographers embed galleries on external blogs/sites |
| **Gift cards** | Great for holiday print sales |
| **Coupon/discount codes** | Session promotions, holiday sales |
| **Mobile app** (Phase 4) | Manage galleries, approve bookings, check sales on the go |
| **QR code generator** | Print QR codes at events linking to gallery |
| **Multi-language (i18n)** | International photographers |

---

## Development Phases

### ðŸ›  Module 15 â€” Support & Platform Transparency

> Lives inside the **super-admin panel** (your side) and the **user's profile** (their side). Not a separate website â€” fully integrated into the existing apps.
> [!NOTE]
> When you're ready to split, use `pg_dump` to export the database and `pg_restore` to import it on the new server. Zero code changes required â€” just an env var update in Coolify.

**Support Ticket Submission (user side â€” in their profile/dashboard):**

- [x] "Submit a Support Ticket" form in user's dashboard profile section
- [x] Fields: ticket type (Bug / Feature Request / General Help), title, description, severity, optional screenshot upload
- [x] After submitting, ticket appears in their **"My Support Tickets"** section in their profile
- [x] Ticket status visible in-profile: Submitted â†’ Under Review â†’ In Progress â†’ Resolved â†’ Closed
- [x] In-app notification when ticket status changes (default â€” no email required)
- [x] **Email notifications: opt-in only** â€” user can toggle "Email me when my ticket updates" in their notification settings
- [x] User can add follow-up comments to an open ticket
- [x] User can mark a resolved ticket as "Still Having This Issue" to reopen it

**Support Ticket Management (your side Ã¢â‚¬â€ super-admin panel):**

- [x] All tickets listed in a dedicated **Support** section of your super-admin panel
- [x] Filter by: status, severity, ticket type, date submitted, user
- [x] Click any ticket to see full details, user info, and screenshot
- [x] Update ticket status from the admin panel Ã¢â€ â€™ triggers in-app notification to the user
- [x] Add internal admin notes (not visible to user)
- [x] Reply to user directly from the ticket (message appears in their ticket thread)
- [x] Mark duplicate tickets and link them together
- [x] Assign tickets to a release version / milestone

**Changelog & Update Notes (admin posts, users read):**

- [x] You write changelog entries in the super-admin panel using a rich text editor (TipTap)
- [x] Entries tagged by version (v1.4.0) and type: Ã°Å¸Ââ€º Bug Fix / Ã¢Å“Â¨ New Feature / Ã°Å¸â€Â§ Improvement
- [x] Changelog page visible on MyShutterHost.com and inside the photographer dashboard
- [x] **"What's New"** bell icon in the dashboard shows unread changelog entries
- [x] Email digest: opt-in only Ã¢â‚¬â€ users can choose to receive changelog summaries

**Feature Roadmap & Suggestions (community-driven):**

- [x] Users submit feature suggestions from their profile or the roadmap page
- [x] Upvoting Ã¢â‚¬â€ users upvote suggestions they want most
- [x] You review suggestions in the admin panel and move them to the roadmap
- [x] Public roadmap shows: Ã°Å¸â€™Â­ Considering Ã¢â€ â€™ Ã°Å¸â€œÅ’ Planned Ã¢â€ â€™ Ã°Å¸â€Â§ In Progress Ã¢â€ â€™ Ã¢Å“â€¦ Shipped
- [x] In-app notification (opt-in email) when a suggestion the user voted for ships

**Planned Maintenance Notices:**

- [x] You post planned downtime notices in the admin panel
- [x] Banner auto-appears in the photographer dashboard and on MyShutterHost.com before the window
- [x] In-app notification sent to all users when a maintenance window is posted

**Tech for this module Ã¢â‚¬â€ nothing new needed:**

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

### Phase 2 Ã¢â‚¬â€ Client & Business Tools

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

### Phase 3 Ã¢â‚¬â€ Power Tools & AI

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

### Phase 4 Ã¢â‚¬â€ Mobile & Scale

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

**Phase 1 (Launch) Ã¢â‚¬â€ Everything on one server:**

```
Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
Ã¢â€â€š         Single Vultr VPS            Ã¢â€â€š
Ã¢â€â€š         (Coolify manages all)       Ã¢â€â€š
Ã¢â€â€š                                     Ã¢â€â€š
Ã¢â€â€š  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â  Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€š Next.js Ã¢â€â€š  Ã¢â€â€š  PG  Ã¢â€â€š  Ã¢â€â€š Redis Ã¢â€â€š  Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€š  App    Ã¢â€â€š  Ã¢â€â€š  DB  Ã¢â€â€š  Ã¢â€â€š Cache Ã¢â€â€š  Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ  Ã¢â€â€š
Ã¢â€â€š         (Docker containers)         Ã¢â€â€š
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
             Ã¢â€ â€˜
     Cloudflare CDN sits in front
```

**Phase 2 (Post-Launch) Ã¢â‚¬â€ Migrate DB to dedicated server:**

```
Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â     Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
Ã¢â€â€š  Vultr VPS #1    Ã¢â€â€š     Ã¢â€â€š   Vultr VPS #2       Ã¢â€â€š
Ã¢â€â€š  (App Server)    Ã¢â€â€šÃ¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€“Â¶Ã¢â€â€š   (Database Server)  Ã¢â€â€š
Ã¢â€â€š                  Ã¢â€â€š     Ã¢â€â€š                      Ã¢â€â€š
Ã¢â€â€š  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â  Ã¢â€â€š     Ã¢â€â€š  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â  Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€š Next.js    Ã¢â€â€š  Ã¢â€â€š     Ã¢â€â€š  Ã¢â€â€š  PG  Ã¢â€â€š  Ã¢â€â€š Redis Ã¢â€â€š Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€š App        Ã¢â€â€š  Ã¢â€â€š     Ã¢â€â€š  Ã¢â€â€š  DB  Ã¢â€â€š  Ã¢â€â€š Cache Ã¢â€â€š Ã¢â€â€š
Ã¢â€â€š  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ  Ã¢â€â€š     Ã¢â€â€š  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ  Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ Ã¢â€â€š
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ     Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
```

> **Migration is easy** Ã¢â‚¬â€ just update the `DATABASE_URL` environment variable in Coolify to point to the new server. Prisma doesn't care where the DB lives.
>
> [!NOTE]
> When you're ready to split, use `pg_dump` to export the database and `pg_restore` to import it on the new server. Zero code changes required Ã¢â‚¬â€ just an env var update in Coolify.

| Tier | Price | Storage | Key Features |
| ------ | ------- | --------- | -------------- |
| **Free** | $0/mo | 5 GB | 3 galleries, subdomain only, watermark |
| **Pro** | $29/mo | 200 GB | Unlimited galleries, custom domain, store, booking |
| **Studio** | $79/mo | 1 TB | Everything + Lightroom/PS plugins, multi-user, analytics |
| **Enterprise** | Custom | Unlimited | White-label, API access, dedicated support |

---

## Ã¢Å“â€¦ All Decisions Resolved

### 1. Print Fulfillment

- **Printful** Ã¢â‚¬â€ easiest integration, wide product range, global fulfillment
- **WHCC** Ã¢â‚¬â€ professional lab quality, preferred by serious photographers
- **Self-fulfillment** Ã¢â‚¬â€ photographer prints their own, handles their own shipping; platform just manages the order, address, and payment
- Photographer chooses one or more in their dashboard. Can run all three simultaneously (e.g. self-fulfill local orders, use WHCC for pro prints, Printful for merchandise)

### 2. Hearts & Stars Micropayment Tiers

Platform sets fixed rates (not photographer-defined). Each icon = a different tier with a fixed dollar value:

| Icon | Name | Value | Use Case |
| ------ | ------ | ------- | ---------- |
| Ã°Å¸â€™â„¢ | Heart | $0.10 | Quick appreciation |
| Ã¢Â­Â | Star | $0.25 | Nice work! |
| Ã°Å¸â€™Â« | Shooting Star | $0.50 | Wow, great shot |
| Ã°Å¸â€™Å½ | Diamond | $1.00 | Exceptional work |
| Ã°Å¸â€˜â€˜ | Crown | $5.00 | True fan support |
| Ã°Å¸â€Â¥ | Fire | $10.00 | Top supporter |

Clients buy icon packs (e.g. 10 Hearts for $1.00). Platform takes a small % cut (e.g. 10%). Photographer gets the rest via Stripe Connect payout.

### 3. Plugin Distribution

- **Primary**: Direct download from MyShutterHost plugin marketplace
- **Photographer-created plugins**: Any photographer can build and list their own Lightroom/Photoshop plugin on the marketplace, either free or paid
- **Open-source option**: Photographers can mark plugins as open-source with a GitHub link
- **Adobe Exchange**: Optional secondary distribution Ã¢â‚¬â€ photographers can choose to also list on Adobe Exchange
- Platform takes a % cut of paid plugin sales (revenue stream for MyShutterHost)
- Plugin submissions go through a basic review process before listing (prevent malware)

### 4. Video Storage Ã¢â‚¬â€ Multi-Tier Options

Photographers choose their video storage method in their dashboard:

| Option | Cost | Best For |
| -------- | ------ | ---------- |
| **Cloudflare Stream** (paid) | ~$5/1,000 min stored | Photographers who want zero infrastructure hassle |
| **Self-hosted via PeerTube** | Server cost only | Photographers who want full control + no per-minute fees |
| **BYO Cloudflare Stream account** | Their own CF billing | Photographers who already have a Cloudflare account |
| **BYO S3/R2 bucket** | Their own storage cost | Power users with existing storage setups |
| **Free tier (limited)** | Included in subscription | Short clips only, limited minutes per month |

### 5. AI Provider Ã¢â‚¬â€ User-Selectable in Dashboard

Photographers bring their own API key. The dashboard **AI Settings** section includes:

- Provider selector: OpenAI (GPT-4o) / Anthropic (Claude) / Google (Gemini)
- API key input field
- **"Get API Key"** button Ã¢â‚¬â€ opens the correct provider's API key page in a new tab
- Test connection button Ã¢â‚¬â€ verifies the key works before saving
- Usage display Ã¢â‚¬â€ shows approximate token usage this month
- Fallback: if no API key set, AI chatbox uses a limited MyShutterHost shared key (rate-limited)

### 6. White-Label & Branding by Subscription Tier

| Tier | Branding | Domain | Features |
| ------ | ---------- | -------- | ---------- |
| **Free** | "Powered by MyShutterHost" badge visible | `name.myshutterhost.com` only | Limited galleries, limited storage, watermarked downloads |
| **Pro** | Badge can be hidden | Custom domain (BYOD) | Full store, booking, unlimited galleries |
| **Studio** | No badge, custom logo in dashboard | Custom domain | All features + plugins + multi-user |
| **Enterprise** | Full white-label (your brand, zero MyShutterHost mention) | Custom domain + custom email domain | Everything + API access + priority support |

### 7. Mobile App Ã¢â‚¬â€ React Native + Expo

- **Framework**: React Native with Expo (cross-platform Ã¢â‚¬â€ one codebase, iOS + Android)
- **Why Expo**: Expo Go for easy dev testing, EAS Build for production, OTA updates without app store resubmission
- Shares TypeScript types and API client code with the main Next.js app (monorepo benefit)
- Phase 4 delivery

### 8. Team Size Ã¢â‚¬â€ Solo Developer (You)

- Build order prioritizes **vertical slices** over horizontal (ship something real in Phase 1)
- Automated tests are critical Ã¢â‚¬â€ Vitest for unit tests, Playwright for E2E (prevents regressions as solo dev)
- Coolify makes deployment a one-person job (no DevOps team needed)
- Modular architecture (each module is independent) means you can hand off modules to future hires

---

## Ã°Å¸â€™Â¡ Additional Features to Add

### Ã°Å¸â€ºÂ¡Ã¯Â¸Â Platform Super-Admin Panel (for you, the owner)

- View all photographers on the platform
- Manage subscriptions, manually apply credits
- Content moderation dashboard (reported photos, flagged content)
- Revenue overview (platform-wide earnings, payout history)
- Plugin marketplace approvals
- Dispute resolution tools (print order issues, contract disputes)
- Platform-wide announcement system (notify all photographers of updates)

### Ã°Å¸â€ºÂ¡Ã¯Â¸Â Content Moderation

- Report button on any photo, gallery, profile, or chat message
- Auto-flag system (AI scans uploads for prohibited content)
- Manual review queue in super-admin panel
- DMCA takedown request form (photographers can report their stolen images)
- **Copyright protection tools**: reverse image search integration to find unauthorized use of photographer's images

### Ã°Å¸Å’Â GDPR & Privacy Compliance

- Cookie consent banner (configurable per photographer's site)
- Privacy policy generator for photographer sites
- Data export tool (client requests their data Ã¢â‚¬â€ GDPR right of access)
- Account deletion + full data erasure (GDPR right to erasure)
- Face search consent prompt (shown before any visitor uses "Find My Photos")

### Ã°Å¸â€Â Photography-Specific SEO Schema

- Auto-generate `LocalBusiness` schema for photographer profile
- `Photograph` schema markup on individual photos
- `Person` schema for photographer bio
- `Event` schema for mini sessions and events
- These make Google show rich results (star ratings, event dates, etc.) in search

### Ã°Å¸â€ºÂ Ã¯Â¸Â Staging Environment

- Coolify supports multiple environments on the same server
- **Dev** Ã¢â€ â€™ **Staging** Ã¢â€ â€™ **Production** pipeline
- Push to `develop` branch Ã¢â€ â€™ deploys to staging for testing
- Push to `main` branch Ã¢â€ â€™ deploys to production
- Staging uses separate DB and separate Cloudflare R2 bucket

### Ã°Å¸â€™Â° Platform Monetization Model (how MyShutterHost earns)

| Revenue Stream | Rate | Notes |
| --- | --- | --- |
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
| ------- | -------- |
| **Mobile App** | React Native + Expo (iOS + Android, Phase 4) |
| **Self-hosted Video** | PeerTube (Docker container on Coolify) |
| **Error Monitoring** | Sentry (catches bugs in production automatically) |
| **Staging Pipeline** | Coolify multi-environment (dev Ã¢â€ â€™ staging Ã¢â€ â€™ prod) |

---

## Ã¢Å¡Â Ã¯Â¸Â Solo Developer Build Strategy

> [!IMPORTANT]
> Building this alone is very achievable but requires discipline. Here's the recommended approach:

1. **Build vertically, not horizontally** Ã¢â‚¬â€ Ship a complete working slice (auth + one gallery + one template + Stripe) before building the next feature
2. **Phase 1 is the business** Ã¢â‚¬â€ Get photographers paying before building Phase 3/4
3. **Use AI aggressively** Ã¢â‚¬â€ AI coding assistance (like this session) dramatically multiplies solo dev output
4. **Don't build what you can buy** Ã¢â‚¬â€ Use Stripe for billing, EasyPost for shipping, Auth.js for auth. Only build what's unique to MyShutterHost
5. **Automated tests from day one** Ã¢â‚¬â€ As sole developer, tests are your safety net
6. **Launch with 3 templates, not 8** Ã¢â‚¬â€ Polish 3 templates perfectly rather than 8 mediocrely
7. **Hire a designer** Ã¢â‚¬â€ Even a one-time contract designer for the template themes will be worth it

---

### Ã°Å¸â€Å’ Module 16 Ã¢â‚¬â€ Public API & External Integrations

> **Purpose**: Let photographers connect MyShutterHost to their existing tools Ã¢â‚¬â€ QuickBooks, Google Calendar, Zapier, booking software, and custom workflows. Also enables third-party developers to build integrations. This is what separates a platform from just a website.

---

**Ã°Å¸Å’Â Public REST API (v1)**

> **Architecture**: Custom REST API built into our Next.js app using Route Handlers. Authenticated via API key or OAuth 2.0 token. Versioned, rate-limited, fully documented.

```
Base URL:       api.myshutterhost.com/v1/
Auth:           Authorization: Bearer <api_key>
Format:         JSON
Rate limits:    60 req/min (Pro) / 200 req/min (Studio) / 500 req/min (Enterprise)
Versioning:     URL-based (/v1/, /v2/) Ã¢â‚¬â€ old versions supported 12 months post-deprecation
```

*Clients & CRM:*

- [x] `GET    /clients` Ã¢â‚¬â€ list all clients (paginated, filterable by stage/tag/date)
- [x] `POST   /clients` Ã¢â‚¬â€ create a new client or lead
- [x] `GET    /clients/:id` Ã¢â‚¬â€ full client detail
- [x] `PATCH  /clients/:id` Ã¢â‚¬â€ update client info, stage, tags, notes
- [x] `GET    /clients/:id/communications` Ã¢â‚¬â€ full communication log
- [x] `POST   /clients/:id/communications` Ã¢â‚¬â€ log a call, note, or email

*Bookings & Sessions:*

- [x] `GET    /bookings` Ã¢â‚¬â€ list all bookings
- [x] `POST   /bookings` Ã¢â‚¬â€ create a booking
- [x] `GET    /bookings/:id` Ã¢â‚¬â€ booking detail
- [x] `PATCH  /bookings/:id` Ã¢â‚¬â€ update booking (date, status, package, notes)
- [x] `DELETE /bookings/:id` Ã¢â‚¬â€ cancel booking
- [x] `GET    /availability` Ã¢â‚¬â€ available booking slots for a date range

*Galleries:*

- [x] `GET    /galleries` Ã¢â‚¬â€ list all galleries
- [x] `POST   /galleries` Ã¢â‚¬â€ create a gallery
- [x] `GET    /galleries/:id` Ã¢â‚¬â€ gallery detail + metadata
- [x] `PATCH  /galleries/:id` Ã¢â‚¬â€ update gallery settings
- [x] `GET    /galleries/:id/photos` Ã¢â‚¬â€ list photos in a gallery

*Orders & Invoices:*

- [x] `GET    /orders` Ã¢â‚¬â€ list all orders with status
- [x] `GET    /orders/:id` Ã¢â‚¬â€ order detail with line items + tracking
- [x] `GET    /invoices` Ã¢â‚¬â€ list all invoices
- [x] `POST   /invoices` Ã¢â‚¬â€ create and send an invoice
- [x] `GET    /invoices/:id` Ã¢â‚¬â€ invoice detail with payment status

*Events & Calendar:*

- [x] `GET    /events` Ã¢â‚¬â€ list upcoming events and mini sessions
- [x] `POST   /events` Ã¢â‚¬â€ create an event
- [x] `GET    /calendar/feed.ics` Ã¢â‚¬â€ iCal feed (subscribe in any calendar app)

---

**Ã°Å¸â€â€˜ API Key Management**

- [x] Photographer generates named API keys in dashboard settings ("QuickBooks", "Zapier", "Custom App")
- [x] Per-key permission scopes Ã¢â‚¬â€ `read:clients` / `write:bookings` / `read:invoices` / `read:galleries` / `write:orders` etc.
- [x] Key revocation Ã¢â‚¬â€ disable a key instantly if compromised
- [x] API usage log Ã¢â‚¬â€ see every request made by each key (endpoint, timestamp, response code)
- [x] Rate limit usage shown per key in dashboard

---

**Ã°Å¸â€Â OAuth 2.0 Provider**

For third-party apps needing user-authorized access (not just static API keys):

- [x] Authorization code flow Ã¢â‚¬â€ user clicks "Connect to [App]", grants specific permissions
- [x] Granular scopes Ã¢â‚¬â€ `read:clients` / `write:bookings` / `read:invoices` / `read:galleries`
- [x] Token refresh Ã¢â‚¬â€ long-lived access without re-authentication prompts
- [x] App registration Ã¢â‚¬â€ developers register apps at `developers.myshutterhost.com`
- [x] Connected apps list in photographer dashboard settings Ã¢â‚¬â€ see + revoke any connected app
- [x] Token revocation Ã¢â‚¬â€ photographer disconnects an app with one click

---

**Ã°Å¸â€œÂ¡ Webhooks**

Push events to external systems the moment something happens:

| Event | When It Fires |
| ------- | -------------- |
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
- [x] Signed payloads Ã¢â‚¬â€ HMAC-SHA256 signature header for security (same pattern as Stripe)
- [x] Automatic retry Ã¢â‚¬â€ 3 attempts with exponential backoff on failure (5s, 30s, 5min)
- [x] Webhook delivery log Ã¢â‚¬â€ every event sent, HTTP status returned, response body
- [x] "Send test event" button Ã¢â‚¬â€ fire a sample payload to verify your endpoint works
- [x] Pause / resume webhooks per endpoint without deleting

---

**Ã°Å¸â€â€” Pre-Built Connectors**

*Ã°Å¸â€œÅ  QuickBooks Online:*

- [x] Connect via OAuth in dashboard ("Connect to QuickBooks" one-click button)
- [x] Auto-sync clients Ã¢â€ â€™ QuickBooks customers (new client created Ã¢â€ â€™ QB customer created)
- [x] Auto-sync invoices Ã¢â€ â€™ QuickBooks invoices (invoice sent from our dashboard Ã¢â€ â€™ appears in QB)
- [x] Payment sync Ã¢â‚¬â€ invoice marked paid in Stripe Ã¢â€ â€™ auto-mark paid in QuickBooks
- [x] Tax data sync Ã¢â‚¬â€ Stripe Tax amounts Ã¢â€ â€™ correct QuickBooks tax categories
- [x] Revenue export Ã¢â‚¬â€ pull monthly/quarterly revenue report into QuickBooks
- [x] Two-way option Ã¢â‚¬â€ changes made in QuickBooks reflect in our CRM

*Ã°Å¸â€œâ€¦ Google Calendar:*

- [x] Connect via OAuth ("Connect Google Calendar" button in dashboard)
- [x] Two-way sync Ã¢â‚¬â€ bookings created in our system appear in Google Calendar automatically
- [x] Blocks in Google Calendar import as unavailable dates in our booking calendar
- [x] Session details (client name, location, package) sync as calendar event description
- [x] Date changes sync both ways Ã¢â‚¬â€ update in either app, both reflect the change

*Ã°Å¸â€œâ€  iCal Feed (Apple Calendar, Outlook, any app):*

- [x] Read-only iCal subscription URL generated per photographer
- [x] Paste URL into Apple Calendar, Outlook, Fantastical, or any calendar app
- [x] Auto-updates every hour Ã¢â‚¬â€ new bookings appear automatically
- [x] All bookings + events included in the feed
- [x] Secure token in URL Ã¢â‚¬â€ can be regenerated if shared accidentally

*Ã¢Å¡Â¡ Zapier Integration:*

- [x] Official MyShutterHost Zapier app (submitted to Zapier marketplace)
- [x] **Triggers** (MyShutterHost Ã¢â€ â€™ Zapier Ã¢â€ â€™ 6,000+ apps):
  - New booking created
  - New client/lead added
  - Invoice paid
  - Gallery published or delivered
  - New order placed
  - Contract signed
  - Tip received
- [x] **Actions** (6,000+ apps Ã¢â€ â€™ Zapier Ã¢â€ â€™ MyShutterHost):
  - Create a client
  - Create a booking
  - Log a communication note
  - Send an invoice
  - Update pipeline stage
- [x] Example Zaps: "When booking created Ã¢â€ â€™ add to Google Sheet" / "When invoice paid Ã¢â€ â€™ send Slack message" / "When client created Ã¢â€ â€™ add to Mailchimp list"

*Ã°Å¸â€Â§ Make (Integromat) Integration:*

- [x] Same triggers and actions as Zapier, available in Make marketplace
- [x] Supports multi-step scenarios and data transformation

---

**Ã°Å¸â€œâ€“ Developer Portal**

- [x] Public API docs at `developers.myshutterhost.com`
- [x] Interactive API explorer Ã¢â‚¬â€ try live API calls from the browser (like Stripe's API explorer)
- [x] Code examples in JavaScript, Python, PHP, Ruby, and curl
- [x] Webhook testing tool Ã¢â‚¬â€ send sample events without real data
- [x] OAuth app registration for third-party developers
- [x] API changelog Ã¢â‚¬â€ documented breaking changes and deprecation notices
- [x] Sandbox environment Ã¢â‚¬â€ full API access against dummy data, separate from real account

---

## Ã°Å¸ÂÂ·Ã¯Â¸Â Platform Naming Strategy

> [!IMPORTANT]
> The original name **"MyShutterHost"** was appropriate for a photography-only hosting platform. With the expansion to actors, models, cosplayers, fashion designers, and a full social network, the name no longer reflects the full vision. A rename should be considered before public launch.

**The platform is now two things in one:**

1. A **professional creative business platform** (portfolio, booking, CRM, contracts, payments, AI tools)
2. A **creative professional social network** (feed, stories, events, collaboration, revenue sharing)

**Naming approaches to evaluate:**

| Direction | Concept | Example Names |
| ----------- | --------- | -------------- |
| Creator + Community | The place where creatives connect | CreatorForge, CollabHive, CreativeBase |
| Portfolio + Social | Show your work + build your network | ShowFrame, PortfolioHub, FrameWork |
| Professional focus | Business tools for creative pros | ProCreator, StudioLink, CreatorPro |
| Short & brandable | Clean, modern, memorable | Collabr, Foliohub, Creatify, Framr |

**Recommended path:** Keep **MyShutterHost LLC** as the company/infrastructure name. Launch the creator social network under a new brand. Many companies do this (Alphabet Ã¢â€ â€™ Google, Meta Ã¢â€ â€™ Instagram).

---

### Ã°Å¸Å½Â¨ Module 17 Ã¢â‚¬â€ Multi-Creator Platform Expansion

> **Vision**: Expand from a photography-only platform to a full **creative professional ecosystem** serving all visual and performing arts. The core infrastructure (portfolio, booking, CRM, payments, galleries, social) is shared. Creator-type-specific features are layered on top via a `creatorType` field on the profile.

---

**Ã°Å¸Å’Â Platform Identity Shift**

```
OLD: Photography SaaS hosting platform
NEW: Creative Professional Social Network + Business Platform

Serves: Photographers, Videographers, Models, Actors, Cosplayers,
        MUAs, Nail Techs, Fashion Designers, Photography Studios,
        Stylists, Fire Spinners, Circus Performers, Aerialists,
        Dancers, Magicians, Musicians, DJs, Comedians, Buskers,
        Stunt Performers, Body Painters, Tattoo Artists,
        Screenwriters, Film Directors, Film Producers,
        Performance Troupes, and more Ã¢â‚¬â€ all in one ecosystem.
```

---

**Ã°Å¸â€˜Â¥ Supported Creator Types**

*Visual Capture & Film:*

- [x] **Photographer** Ã¢â‚¬â€ all existing features (core creator type)
- [x] **Videographer / Filmmaker** Ã¢â‚¬â€ video projects, showreels, production credits, client video delivery
- [x] **Cinematographer / DP** Ã¢â‚¬â€ gear list, production credits, reel hosting
- [x] **Photography Studio** Ã¢â‚¬â€ multi-photographer accounts, studio rental, equipment list
- [x] **Screenwriter / Script Writer** Ã¢â‚¬â€ protected script library, logline discovery, pitch deck builder, optioning workflow, table read events, WGA registration display, writing contest tracker, script coverage service
- [x] **Film Director / Indie Filmmaker** Ã¢â‚¬â€ film portfolio, production project manager (dev Ã¢â€ â€™ pre-prod Ã¢â€ â€™ shoot Ã¢â€ â€™ post Ã¢â€ â€™ festival Ã¢â€ â€™ distribution), crew call board, cast call board, festival submission tracker with laurel display, production blog, crowdfunding, call sheet generator, credit aggregator
- [x] **Film Producer / Line Producer** Ã¢â‚¬â€ production slate, crew roster, budget tracker, call sheet generator, clearance tracker, distribution tracker, production contract templates, finance tracker

*Models & Talent:*

- [x] **Model** (fashion, commercial, fitness, glamour, plus-size, petite, etc.)
- [x] **Actor** Ã¢â‚¬â€ rÃƒÂ©sumÃƒÂ©, headshots, demo reel, credits, audition material
- [x] **Cosplayer** Ã¢â‚¬â€ character portfolio, convention schedule, build journal, commission store
- [x] **Voice Actor** Ã¢â‚¬â€ audio reel hosting, demo clips, casting page

*Ã°Å¸â€Â¥ Fire & Flow Arts:*

- [x] **Fire Spinner / Fire Dancer** Ã¢â‚¬â€ poi, staff, fans, rope dart, dragon staff, buugeng
- [x] **Fire Breather / Fire Eater** Ã¢â‚¬â€ performance portfolio, safety certifications
- [x] **Poi Spinner** Ã¢â‚¬â€ non-fire: LED poi, glow poi, contact poi
- [x] **Hoop Artist** Ã¢â‚¬â€ hula hoop, LED hoop, multi-hoop, isolations
- [x] **Flow Artist** Ã¢â‚¬â€ general flow props (fans, orbs, contact ball, ribbons)
- [x] **Fire Juggler** Ã¢â‚¬â€ torch juggling, fire clubs, fire rings

*Ã°Å¸Å½Âª Circus Arts:*

- [x] **Juggler** Ã¢â‚¬â€ balls, clubs, rings, torches, diabolos, devil sticks, cigar boxes
- [x] **Acrobat / Gymnast** Ã¢â‚¬â€ tumbling, partner acrobatics, hand balancing
- [x] **Aerialist** Ã¢â‚¬â€ aerial silks, aerial hoop (lyra), trapeze (static/flying/dance), aerial straps, aerial rope
- [x] **Contortionist / Flexibilist** Ã¢â‚¬â€ flexibility performance, partner contortion
- [x] **Tightrope / Slackline Artist** Ã¢â‚¬â€ wire walking, slacklining
- [x] **Unicyclist** Ã¢â‚¬â€ standard, giraffe, ultimate wheel, trials
- [x] **Stilt Walker** Ã¢â‚¬â€ drywall stilts, peg stilts, spring stilts, character stilts
- [x] **Human Statue / Living Statue** Ã¢â‚¬â€ interactive street art
- [x] **Clown / Physical Comedian** Ã¢â‚¬â€ classic clown, new circus clown, bouffon
- [x] **Escape Artist** Ã¢â‚¬â€ Houdini-style escape performance
- [x] **Equilibrist / Balance Artist** Ã¢â‚¬â€ rola bola, spinning plates, peacock feather balancing
- [x] **Sideshow Performer** Ã¢â‚¬â€ sword swallowing, glass walking, human blockhead, strongman

*Ã°Å¸Å½Â© Magic & Illusion:*

- [x] **Stage Magician / Illusionist** Ã¢â‚¬â€ full stage illusions, grand illusions
- [x] **Close-up Magician** Ã¢â‚¬â€ sleight of hand, table magic, walkabout magic
- [x] **Mentalist** Ã¢â‚¬â€ mind reading, psychological illusion, prediction
- [x] **Cardician** Ã¢â‚¬â€ card magic specialist

*Ã°Å¸â€™Æ’ Dance:*

- [x] **Ballet Dancer** Ã¢â‚¬â€ classical ballet, contemporary ballet
- [x] **Contemporary / Modern Dancer**
- [x] **Hip-hop / Street Dancer** Ã¢â‚¬â€ breaking, popping, locking, krump, waacking
- [x] **Ballroom / Latin Dancer** Ã¢â‚¬â€ salsa, tango, foxtrot, cha-cha, samba
- [x] **Pole Artist / Pole Fitness** Ã¢â‚¬â€ artistic pole, sport pole
- [x] **Belly Dancer** Ã¢â‚¬â€ tribal, fusion, cabaret
- [x] **Burlesque Performer** Ã¢â‚¬â€ neo-burlesque, classic burlesque
- [x] **Flamenco Dancer**
- [x] **Irish / Folk Dancer**
- [x] **Go-go / Event Dancer** Ã¢â‚¬â€ nightclub, corporate event, festival
- [x] **Exotic / Sensual Dancer** (age-verified adult content controls)

*Ã°Å¸Å½Â­ Stage & Live Performance:*

- [x] **Stand-up Comedian** Ã¢â‚¬â€ set clips, upcoming shows, booking
- [x] **Improv / Sketch Performer** Ã¢â‚¬â€ troupe profiles, show schedule
- [x] **Spoken Word Artist / Slam Poet** Ã¢â‚¬â€ audio + video of performances
- [x] **Performance Artist** Ã¢â‚¬â€ conceptual / installation / live art
- [x] **Mime Artist**
- [x] **Puppeteer** Ã¢â‚¬â€ marionette, hand puppet, shadow puppet, ventriloquist
- [x] **Street Performer / Busker** Ã¢â‚¬â€ location schedule, pitch info
- [x] **Character Entertainer** Ã¢â‚¬â€ mascots, themed characters for events

*Ã¢Å¡â€Ã¯Â¸Â Specialty Physical Arts:*

- [x] **Stage Combat / Sword Fighter** Ã¢â‚¬â€ choreography portfolio, safety training display
- [x] **Stunt Performer** Ã¢â‚¬â€ stunt reel, union affiliations, specialty skills
- [x] **Martial Artist** (demo/showcase performer) Ã¢â‚¬â€ discipline, dojo, competition record
- [x] **Pro Wrestler / Lucha Libre** Ã¢â‚¬â€ match clips, character persona, promotion affiliations
- [x] **Parkour / Freerunning Artist**

*Ã°Å¸Å½Âµ Music Performance:*

- [x] **Musician / Solo Artist** Ã¢â‚¬â€ performance videos, discography, upcoming shows, booking
- [x] **Band / Music Group** Ã¢â‚¬â€ multi-member group profile, set list, rider
- [x] **DJ / Electronic Artist** Ã¢â‚¬â€ mix portfolio, setlists, event bookings
- [x] **Drummer / Percussionist** (especially visual performance / drum corps)

*Ã°Å¸Å½Â¨ Body Arts:*

- [x] **Body Painter** Ã¢â‚¬â€ portfolio by theme/event, live painting bookings
- [x] **Tattoo Artist** Ã¢â‚¬â€ portfolio by style, appointment booking (crosses into creative service)

*Ã°Å¸Å½Âª Performance Companies & Groups:*

- [x] **Circus Troupe / Fire Company** Ã¢â‚¬â€ group profile with individual performer sub-profiles, group bookings
- [x] **Dance Company** Ã¢â‚¬â€ company profile, roster, performance schedule
- [x] **Theater Company** Ã¢â‚¬â€ production portfolio, audition announcements, show schedule

*Business:*

- [x] **Talent Agency** Ã¢â‚¬â€ multi-talent roster, booking requests for represented talent
- [x] **Event Producer / Festival Organizer** Ã¢â‚¬â€ event portfolios, performer recruitment board
- [x] **Brand / Business** Ã¢â‚¬â€ sponsor profiles, collab opportunities, advertising

---

**Ã°Å¸â€Â§ Creator-Type-Specific Features**

*Ã°Å¸â€œÂ¸ Photography Studio:*

- [x] Studio profile (separate from individual photographer)
- [x] Multiple staff photographers under one studio account
- [x] Studio space rental calendar (photographers book the space)
- [x] Equipment rental list with availability
- [x] Shared portfolio (work shot at/by the studio)
- [x] Collective revenue dashboard

*Ã°Å¸Å½Â¬ Videographer:*

- [x] Showreel / demo reel hosting (Cloudflare Stream)
- [x] Video project galleries (private client delivery links)
- [x] Video download sales (4K, RAW footage packages)
- [x] Production credit list (directed / shot / edited / produced)
- [x] Behind-the-scenes photo galleries alongside video projects
- [x] Production package pricing (wedding film / commercial / music video / doc)
- [x] Client video approval workflow (client marks scenes approved)

*Ã°Å¸â€˜Â¤ Model:*

- [x] **Digital comp card** Ã¢â‚¬â€ industry-standard stats: height, measurements, eye/hair color, sizes, agency info
- [x] **Tearsheet portfolio** Ã¢â‚¬â€ published work organized by brand/publication
- [x] **Media kit** Ã¢â‚¬â€ downloadable PDF (comp card + portfolio highlights)
- [x] Casting availability calendar Ã¢â‚¬â€ open dates for bookings
- [x] Rate card Ã¢â‚¬â€ hourly/day/half-day rates by project type (editorial, commercial, fitness, etc.)
- [x] Agency + agent info display
- [x] "Book me" inquiry form on public profile

*Ã°Å¸Å½Â­ Actor:*

- [x] **Digital rÃƒÂ©sumÃƒÂ©** Ã¢â‚¬â€ film/TV/theater/commercial credits, training, unions (SAG-AFTRA, AEA), special skills
- [x] **Headshot gallery** Ã¢â‚¬â€ organized by type (commercial, theatrical, casual, character)
- [x] **Demo reel hosting** Ã¢â‚¬â€ video reel with scene timestamps
- [x] Audition material storage Ã¢â‚¬â€ sides, monologues (private)
- [x] Credits list Ã¢â‚¬â€ IMDB-style filmography (role / project / year / director)
- [x] Agent / manager display
- [x] Commercial rate card
- [x] IMDB link integration

*Ã°Å¸Â¦Â¸ Cosplayer:*

- [x] **Character portfolio** Ã¢â‚¬â€ organized by franchise / series / universe
- [x] **Convention schedule** Ã¢â‚¬â€ upcoming appearances with event links and booth/table info
- [x] **Build journal / WIP blog** Ã¢â‚¬â€ document costume creation with photos + notes
- [x] Commission store Ã¢â‚¬â€ sell prints, patterns, tutorial PDFs, prop replicas
- [x] Fan interaction tools Ã¢â‚¬â€ autograph session scheduling, meetup times at conventions
- [x] Costume stats Ã¢â‚¬â€ materials, build time, character origin
- [x] Convention QR event card Ã¢â‚¬â€ specialized version of the photographer event card for con floors
- [x] Heavy social integration Ã¢â‚¬â€ TikTok and Instagram as primary cross-post targets

*Ã°Å¸â€™â€ž MUA / Makeup Artist:*

- [x] Before/after portfolio Ã¢â‚¬â€ bridal, editorial, special FX, film/TV makeup
- [x] Service menu Ã¢â‚¬â€ with pricing per service type
- [x] Kit / product brand list
- [x] Training and certification display
- [x] On-location vs. studio booking toggle

*Ã°Å¸â€Â¥ Performing Artists (Fire, Circus, Dance, Stage, Magic & more):*

- [x] **Performance showreel** Ã¢â‚¬â€ video portfolio is the primary asset (Cloudflare Stream hosted)
- [x] **Performance photo gallery** Ã¢â‚¬â€ high-quality stills from shows (fire photography, aerial shots, stage shots)
- [x] **Technical rider** Ã¢â‚¬â€ space requirements, power needs, fire safety equipment, music/sound needs, insurance requirements Ã¢â‚¬â€ downloadable PDF for venues
- [x] **Safety certifications display** Ã¢â‚¬â€ fire safety certs, rigging certifications, insurance info (critical for event/venue bookings)
- [x] **Insurance info display** Ã¢â‚¬â€ public liability insurance details (venues require this before booking)
- [x] **Performance packages** Ã¢â‚¬â€ priced by format and duration:
  - Walkabout (roaming entertainment, billed per hour)
  - Short set (5Ã¢â‚¬â€œ10 min stage show)
  - Full show (20Ã¢â‚¬â€œ45 min stage production)
  - Workshop / class (teach the art form, billed per student)
  - Private event (birthday / corporate / wedding entertainment)
  - Festival / outdoor event
- [x] **Venue type suitability tags** Ã¢â‚¬â€ Outdoor / Indoor / Stage / Walkabout / Corporate / Festival / Intimate / 18+ venue
- [x] **Troupe / company profile** Ã¢â‚¬â€ group of performers bookable as a unit, with individual performer sub-profiles linked
- [x] **Prop & equipment list** Ã¢â‚¬â€ what they bring, what the venue needs to provide
- [x] **Performance duration options** Ã¢â‚¬â€ selectable at booking time
- [x] **Skill discipline tags** Ã¢â‚¬â€ fire poi / aerial silks / juggling / magic / etc. (searchable/filterable)
- [x] **"Book for event" type** Ã¢â‚¬â€ Festival / Corporate / Wedding / Birthday / Theater / Street Fair / Club / Private
- [x] **Upcoming live show schedule** Ã¢â‚¬â€ where they're performing next (public calendar)
- [x] **Workshop availability** Ã¢â‚¬â€ book them to teach your group the skill
- [x] **TFP shoot availability** Ã¢â‚¬â€ available for fire/performance photography collaborations
- [x] **Audience & venue size range** Ã¢â‚¬â€ intimate 10-person / small venue 50 / medium 200 / large 500+ / festival

*Ã°Å¸â€˜â€” Fashion Designer:*

- [x] **Lookbook galleries** Ã¢â‚¬â€ organized by collection (Spring 2026, Fall 2026, etc.)
- [x] Collection release pages Ã¢â‚¬â€ with model credits, photographer credits
- [x] Pattern and digital download sales (Etsy alternative)
- [x] Fashion show / pop-up event posting
- [x] Retailer and brand collaboration tracking (CRM-style)
- [x] Wholesale inquiry form
- [x] Press/tearsheet clips

*Ã°Å¸Å½Â¬ Talent Agency:*

- [x] Agency profile with represented talent roster
- [x] Each talent links to their own individual creator profile
- [x] Booking requests routed through agency
- [x] Agency takes configurable commission % from bookings (CRM-tracked)

---

**Ã¢Å¡â„¢Ã¯Â¸Â Technical Architecture Ã¢â‚¬â€ Creator Type System**

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

- `PhotographerProfile` renamed Ã¢â€ â€™ `CreatorProfile` with `creatorType` field
- Dashboard sections show/hide based on creator type
- Portfolio templates grouped by creator type
- CRM pipeline stage terminology adapts per type ("sessions" / "castings" / "shoots" / "bookings")
- Onboarding flow changes per creator type

---

**Ã°Å¸â€Â Five-Tier Access Model**

```
GUEST (no account)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
Ã¢Å“â€¦ View all public profiles, galleries, posts, events
Ã¢Å“â€¦ Guest checkout (buy prints/downloads without account)
Ã¢ÂÅ’ Cannot comment, tip, follow, or interact
Ã¢ÂÅ’ No profile of any kind

SUPPORTER / FAN Ã¢â‚¬â€ Free (community member, NOT a creator)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
For fans, followers, general public. No creator identity.
Ã¢Å“â€¦ Social profile (name, photo, bio)
Ã¢Å“â€¦ Follow creators, send friend requests
Ã¢Å“â€¦ Comment, like, share, react to posts
Ã¢Å“â€¦ Join groups and community spaces
Ã¢Å“â€¦ Chat with creators (if creator allows)
Ã¢Å“â€¦ Send tips, Hearts & Stars Ã¢â€ Â revenue for creators
Ã¢Å“â€¦ Purchase prints and digital downloads
Ã¢Å“â€¦ Be tagged in event photos (face search)
Ã¢Å“â€¦ Post in fan / community spaces
Ã¢ÂÅ’ No creator type designation
Ã¢ÂÅ’ No professional tools of any kind
Ã¢ÂÅ’ No dedicated website
Ã¢ÂÅ’ No revenue earning

CREATOR FREE Ã¢â‚¬â€ Free (creator-identified, freemium)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
For creators who arenÃ¢â‚¬â„¢t ready to pay yet. Try before you buy.
Limited professional tools. NO website. Higher commission.
Ã¢Å“â€¦ Creator type designation (Photographer, Model, Fire Performer, etc.)
Ã¢Å“â€¦ Social profile on main platform
Ã¢Å“â€¦ Post to the creator global feed
Ã¢Å“â€¦ Limited gallery upload (15 photos max, no RAW)
Ã¢Å“â€¦ 2GB storage
Ã¢Å“â€¦ Basic portfolio on social profile
Ã¢Å“â€¦ Basic booking calendar (3 active slots at a time)
Ã¢Å“â€¦ Basic CRM (5 active contacts)
Ã¢Å“â€¦ Sell content / products (15% platform commission)
Ã¢Å“â€¦ Receive tips and Stars
Ã¢Å“â€¦ Post on Looking For board
Ã¢Å“â€¦ TFP collaboration board access
Ã¢Å“â€¦ Basic analytics (last 30 days only)
Ã¢ÂÅ’ Platform watermark applied to shared content
Ã¢ÂÅ’ NO dedicated website
Ã¢ÂÅ’ NO craft-specific tools (no rider PDF, no comp card builder, etc.)
Ã¢ÂÅ’ NO revenue-sharing contracts
Ã¢ÂÅ’ NO full CRM / contracts / invoicing
Ã¢ÂÅ’ NO AI tools
Ã¢ÂÅ’ NO Lightroom / Photoshop plugin
Ã¢ÂÅ’ NO API access
Upgrade path Ã¢â€ â€™ Creator Pro at any time (website activates instantly)

CREATOR PRO Ã¢â‚¬â€ Paid (~$25/month)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
Full tools + dedicated website on platform subdomain.
Ã¢Å“â€¦ Everything in Creator Free, plus:
Ã¢Å“â€¦ Dedicated website: username.[platform].com
Ã¢Å“â€¦ All craft-specific tools (comp card / rider PDF / flash manager / etc.)
Ã¢Å“â€¦ 50GB storage
Ã¢Å“â€¦ Unlimited gallery uploads
Ã¢Å“â€¦ Full CRM (unlimited contacts, pipeline, invoicing, contracts)
Ã¢Å“â€¦ Unlimited booking slots
Ã¢Å“â€¦ Revenue-sharing contracts (Module 20)
Ã¢Å“â€¦ Full analytics dashboard (all time, all metrics)
Ã¢Å“â€¦ Platform watermark removed
Ã¢Å“â€¦ 5% platform commission on sales
Ã¢Å“â€¦ AI tools (bio writer, content generator, insights)
Ã¢Å“â€¦ All post types (photo / video / reel / story / project / event)
Ã¢ÂÅ’ No custom domain (subdomain only)
Ã¢ÂÅ’ No multi-staff accounts
Ã¢ÂÅ’ No API access

CREATOR STUDIO Ã¢â‚¬â€ Paid (~$55/month)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
Pro + custom domain + advanced features.
Ã¢Å“â€¦ Everything in Creator Pro, plus:
Ã¢Å“â€¦ Custom domain: www.theircustomdomain.com
Ã¢Å“â€¦ 500GB storage
Ã¢Å“â€¦ 3% platform commission on sales
Ã¢Å“â€¦ Priority support
Ã¢Å“â€¦ Advanced analytics (audience demographics, revenue attribution)
Ã¢Å“â€¦ Scheduled posts (queue posts in advance)
Ã¢Å“â€¦ Email newsletter tool (send to follower mailing list)
Ã¢ÂÅ’ No multi-staff accounts
Ã¢ÂÅ’ No API access

CREATOR ENTERPRISE Ã¢â‚¬â€ Paid (~$100+/month)
Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
For studios, agencies, troupes, talent companies.
Ã¢Å“â€¦ Everything in Creator Studio, plus:
Ã¢Å“â€¦ Multi-staff sub-accounts (up to 10 seats per account)
Ã¢Å“â€¦ 2TB storage
Ã¢Å“â€¦ 1% platform commission on sales
Ã¢Å“â€¦ Public REST API access (Module 16)
Ã¢Å“â€¦ Dedicated account manager
Ã¢Å“â€¦ Custom contract terms
Ã¢Å“â€¦ White-label option (remove platform branding from their website)
Ã¢Å“â€¦ Priority AI processing queue
Ã¢Å“â€¦ Advanced reporting (custom date ranges, PDF exports)
```

---

**Ã°Å¸â€™Â¡ Creator Free Upgrade Triggers (what motivates the upgrade)**

- Watermark on every photo they share publicly Ã¢â€ â€™ looks unprofessional
- Commission: 15% free vs 5% paid Ã¢â€ â€™ every sale motivates upgrade
- 15-photo limit fills up fast Ã¢â€ â€™ immediate upgrade pressure
- No website Ã¢â€ â€™ canÃ¢â‚¬â„¢t send clients a professional link
- No craft-specific tools Ã¢â€ â€™ comp card, rider, flash sales all locked
- 3 booking slots Ã¢â€ â€™ as soon as they start getting bookings, they hit the wall
- 30-day analytics only Ã¢â€ â€™ canÃ¢â‚¬â„¢t see their full growth story
- Upgrade happens instantly Ã¢â€ â€™ website goes live the moment they subscribe

---

### Ã°Å¸â€œÂ± Module 18 Ã¢â‚¬â€ Social Network (Feed, Stories & Social Graph)

> **Vision**: A professional creative social network Ã¢â‚¬â€ Instagram's visual quality + Facebook's community features + LinkedIn's professional context. Creator Feed stays high quality (Creator accounts only). Fan spaces are open and welcoming. Cross-posting to Instagram/Facebook/X drives discovery without competing with them.

---

**Ã°Å¸â€œÂ° Post Types**

- [x] **Photo post** Ã¢â‚¬â€ 1Ã¢â‚¬â€œ20 photos, carousel format (like Instagram)
- [x] **Video post** Ã¢â‚¬â€ short or long-form (Cloudflare Stream)
- [x] **Text / status post** Ã¢â‚¬â€ thoughts, announcements, behind-the-scenes notes
- [x] **Story** Ã¢â‚¬â€ 24-hour disappearing photo or video (like Instagram Stories)
- [x] **Project post** Ã¢â‚¬â€ linked to a collaborative shoot, shows all contributors with credits
- [x] **Event post** Ã¢â‚¬â€ creates a calendar event AND a feed post simultaneously
- [x] **Reel / showcase** Ã¢â‚¬â€ curated highlight post (feature your best work)

**Ã°Å¸â€œÂ° Feed Types**

- [x] **Personal wall** Ã¢â‚¬â€ your own profile's posts (public or private per post)
- [x] **Following feed** Ã¢â‚¬â€ posts from creators and supporters you follow (chronological)
- [x] **Global Creator Feed** Ã¢â‚¬â€ all public posts from Creator accounts (algorithm-ranked)
- [x] **Discovery Feed** Ã¢â‚¬â€ curated top content, visible to guests (no login required)
- [x] **Creator Type Feed** Ã¢â‚¬â€ filter global feed by creator type (only photographers, only models, etc.)
- [x] **Local Feed** Ã¢â‚¬â€ posts from creators near your location
- [x] **Fan / Community Feed** Ã¢â‚¬â€ posts from Supporter accounts in community spaces

**Ã°Å¸â€â€™ Post Visibility**

- [x] Public Ã¢â‚¬â€ anyone can see (including guests)
- [x] Followers only Ã¢â‚¬â€ only people who follow you
- [x] Friends only Ã¢â‚¬â€ mutual connections
- [x] Private Ã¢â‚¬â€ only you

**Ã°Å¸â€â€ž Social Graph**

- [x] **Follow** (one-way Ã¢â‚¬â€ like Instagram): follow anyone public
- [x] **Friend / Connect** (mutual Ã¢â‚¬â€ like Facebook/LinkedIn): send + accept request
- [x] **Fan** relationship Ã¢â‚¬â€ public Supporter follows a Creator (consumer-side)
- [x] **Collaborator** badge Ã¢â‚¬â€ system-tracked, verified shoot partner (has a signed contract together)
- [x] Block and mute controls

**Ã°Å¸â€™Â¬ Post Interactions**

- [x] Likes / reactions (customizable reaction set Ã¢â‚¬â€ Ã¢ÂÂ¤Ã¯Â¸Â Ã°Å¸â€Â¥ Ã°Å¸â€˜Â Ã°Å¸â€™Â¯ Ã¢Å“Â¨)
- [x] Comments (threaded replies)
- [x] Share to feed / share to story
- [x] Save to private collection
- [x] Tag another creator in the post
- [x] Tag a shoot / project (links to collaborative contract)
- [x] Send tips or Stars directly on a post
- [x] Buy prints directly from a photo post

**Ã°Å¸â€œÂ¤ Cross-Platform Auto-Posting**

- [x] Connect Instagram, Facebook, X/Twitter, TikTok, Pinterest accounts in settings
- [x] When posting, toggle which platforms to cross-post to
- [x] Every cross-posted item includes a link back to the creator's profile on the platform
- [x] Cross-post preview Ã¢â‚¬â€ see how the post will look on each platform before publishing
- [x] Scheduled posting Ã¢â‚¬â€ set a date/time to auto-publish
- [x] Cross-post analytics Ã¢â‚¬â€ see engagement from each external platform

**Ã°Å¸â€œâ€“ Stories**

- [x] 24-hour disappearing photo or video stories (like Instagram Stories)
- [x] Story highlights Ã¢â‚¬â€ save stories to permanent highlight albums on your profile
- [x] Story reactions Ã¢â‚¬â€ viewers react with emojis
- [x] Link sticker in stories Ã¢â‚¬â€ link to gallery, booking page, or external URL
- [x] "Swipe up" equivalent Ã¢â‚¬â€ direct link from story to purchase/booking

---

### Ã°Å¸â€œâ€¦ Module 19 Ã¢â‚¬â€ Event Calendar, Discovery & "Looking For" Board

> **Vision**: The central hub where creative collaborations are born. Creators post opportunities, the platform intelligently notifies the right people, and the community discovers events happening near them.

---

**Ã°Å¸â€œâ€¦ Public Event Calendar**

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
- [x] Map view Ã¢â‚¬â€ see events near me
- [x] RSVP / "I'm interested" on any event
- [x] Calendar subscription Ã¢â‚¬â€ iCal feed of events you've RSVP'd to
- [x] Featured events Ã¢â‚¬â€ promoted placement for paid plan creators

**Ã°Å¸â€Â "Looking For" Board**

A dedicated casting and collaboration board Ã¢â‚¬â€ the professional upgrade of Craigslist for creatives:

- [x] **Post a listing:**
  - "Photographer seeking model for cosplay styled shoot Ã¢â‚¬â€ TFP Ã¢â‚¬â€ Austin TX Ã¢â‚¬â€ Jul 15"
  - "Model available for paid commercial work Ã¢â‚¬â€ NYC Ã¢â‚¬â€ flexible dates"
  - "MUA seeking photographers to build portfolio Ã¢â‚¬â€ open to TFP Ã¢â‚¬â€ Dallas"
  - "Fashion designer seeking model and videographer for lookbook Ã¢â‚¬â€ paid"
- [x] Listing types: SEEKING (you need someone) / AVAILABLE (you're offering yourself)
- [x] Compensation: TFP / Paid ($ amount or range) / Negotiable
- [x] Listing expires automatically (set duration: 7 / 14 / 30 days)
- [x] Filter board by: creator type needed, location, compensation type, date
- [x] Apply / Express interest button Ã¢â€ â€™ sends message to poster
- [x] Listings linked to event (a styled shoot event can have a "still seeking MUA" tag)

**Ã°Å¸â€â€ Smart Notification Engine**

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
- [x] When a matching event or listing is posted Ã¢â€ â€™ notify the creator
- [x] Example: Model in Austin set to "available for TFP + paid, seeking photographers" Ã¢â€ â€™ gets notified when any Austin photographer posts a styled shoot
- [x] Suppress duplicates Ã¢â‚¬â€ smart deduplication so creators aren't bombarded
- [x] Notification channels: in-app, email, push notification (mobile)

**Ã°Å¸â€”ÂºÃ¯Â¸Â Creator Discovery Map**

- [x] Browse a map of creators near any location
- [x] Filter by creator type, availability status, specialties
- [x] Useful for events (who's a photographer in Las Vegas for LVCC?)
- [x] Useful for clients (who's a photographer in my city?)

---

### Ã°Å¸â€™Â° Module 20 Ã¢â‚¬â€ Collaborative Revenue Sharing

> **Vision**: "The contract follows the content, and the money follows the contract." When multiple creators collaborate on a shoot, they agree on revenue splits upfront. Every dollar earned from that content Ã¢â‚¬â€ tips, Stars, prints, downloads Ã¢â‚¬â€ automatically splits to all contributors via Stripe. No manual math. No awkward conversations.

---

**Ã°Å¸Â¤Â Collaborative Shoot Contract**

- [x] Any Creator initiates a "Collaborative Project"
- [x] Invites participants by platform username or email
- [x] Each participant declares their role: Photographer / Videographer / Model / MUA / Stylist / Fashion Designer / Hair Stylist / Other
- [x] Revenue split percentages agreed upon (must total 100%)
- [x] All participants e-sign the collaborative contract (using our existing e-signature system)
- [x] Contract locked once all parties sign Ã¢â‚¬â€ percentages cannot be changed after signing
- [x] Contract stores: project name, shoot date, location, participants, splits, content rights

**Ã°Å¸â€œÂ¸ Content Tagging**

- [x] Photos and videos uploaded from the shoot are tagged to the collaborative contract
- [x] Photographer tags images: "This photo is from [Shoot Name]"
- [x] Tagged content shows all contributors with credits in a "Credits" section on the post
- [x] Contributors are notified when content from their shoot is posted
- [x] Content retains contract link permanently Ã¢â‚¬â€ even if reshared

**Ã°Å¸â€™Â¸ Revenue Splitting Ã¢â‚¬â€ How It Works**

```
Example: Styled fashion shoot
  Photographer:    40%
  Fashion Designer: 25%
  Model:           20%
  MUA:             10%
  Hair Stylist:     5%
  Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬
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

- [x] Tips on a post Ã¢â€ â€™ split per contract percentages Ã¢â€ â€™ Stripe transfer group
- [x] Stars/Hearts micropayments Ã¢â€ â€™ split per percentages Ã¢â€ â€™ credited to each wallet
- [x] Print sale from a collaborative photo Ã¢â€ â€™ split after platform fee + lab/shipping costs
- [x] Digital download sale Ã¢â€ â€™ split after platform fee
- [x] Each creator sees revenue from every collaborative project in their dashboard

**Ã°Å¸â€œÅ  Revenue Dashboard Ã¢â‚¬â€ Collaborative View**

- [x] Per-project revenue breakdown (how much each shoot has earned over time)
- [x] Individual earnings per shoot (my share from each project)
- [x] Content performance (which collaborative photo earns the most)
- [x] Contributor leaderboard (within a project Ã¢â‚¬â€ whose posts drove the most revenue)
- [x] Payout history per project
- [x] Tax summary per project (for accounting)

**Ã¢Å¡â€“Ã¯Â¸Â Rules & Edge Cases**

- [x] Revenue sharing requires ALL participants to have Creator accounts (or be invited Ã¢â‚¬â€ they have 30 days to create an account or their share goes to escrow)
- [x] Escrowed funds held 90 days Ã¢â‚¬â€ if unclaimed, redistributed proportionally to other signatories
- [x] Content can only earn split revenue if a signed contract exists Ã¢â‚¬â€ prevents disputes
- [x] Creator can post shoot content without revenue sharing (if no collaborative contract was created)
- [x] Photographer always controls what content is posted Ã¢â‚¬â€ collaborators don't get upload access
- [x] Dispute resolution: if a participant disputes a split, content revenue is paused pending resolution (admin review)
- [x] Minimum payout threshold: $10 (splits under $10 accumulate until threshold reached)

**Ã°Å¸â€â€” Integration with Existing Systems**

- [x] Uses existing e-signature contract system (Module 4)
- [x] Uses existing Stripe Connect (Module 2) Ã¢â‚¬â€ transfer groups handle multi-party splits
- [x] Uses existing Stars/Hearts/Tips system (Module 2)
- [x] Linked to CRM Ã¢â‚¬â€ each collaborative shoot appears in CRM as a multi-participant session
- [x] Linked to social feed Ã¢â‚¬â€ project posts show contributor credits automatically
- [x] Revenue webhooks Ã¢â‚¬â€ external tools (QuickBooks via Module 16 API) receive split payment events

---
