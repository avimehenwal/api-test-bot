# API

## AnimeChan

Why did I choose this API? As i interest in anime and love the animes

### API Usage

```
API_BASE=https://animechan.vercel.app/api
curl -s ${API_BASE}/random

{
  "anime": "Diamond No Ace",
  "character": "Tetsuya Yūki",
  "quote": "Even when times are at their hardest, don't let it show on your face. If the captain is shaken, the team will waver."
}

curl -s ${API_BASE}/quotes

[ {} ... ]
```

#### Get Quotes by Animation Title

```
curl -s ${API_BASE}/quotes/anime?title=naruto

{
    "anime": "Naruto",
    ...
}

```

#### Get quotes by character name

#### Get all the available anime

#### Pagination on search byTitle

## What can we test in an API?

### Functional

- [ ] HTTP status code with timing
- [ ] response time should be within SLA
- [ ] Edge case and boundary value analysis, cover all API paths
- [ ] test pagination, headers
- [ ] Response Schema Validation
- [ ] Negative Testing, test if errors are handleded gracefully

### Non-Functional

- [ ] Performance overtime
- [ ] Security and CORS
- [ ] Rechability from multiple regions
