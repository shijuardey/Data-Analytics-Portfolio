# 🏆 FIFA World Cup — Football Tournament Performance Analysis

A Power BI dashboard analyzing international football tournament performance across five FIFA World Cup editions (2002–2018), built on a star-schema data model with fully interactive KPIs, rankings, and historical trend views.

**Author:** Sijuade Enikansakin
**Tool:** Power BI Desktop (Power Query + DAX, no external DBMS)
**Domain:** Sports Analytics — FIFA World Cup Tournament

---

## 📖 Overview

This project consolidates five FIFA World Cup Excel datasets (2002, 2006, 2010, 2014, 2018) into a single Power BI data model and dashboard. Rather than looking at one tournament in isolation, the report surfaces comparable, filterable team performance across editions — games played, wins, draws, losses, goals for/against, goal difference, points, and rank — so a non-technical stakeholder can explore attacking strength, defensive record, and long-term team trajectory without writing a single query.

**Headline numbers (unfiltered, all editions):**

| Metric | Value |
|---|---|
| Total Countries | 59 |
| Total Matches | 640 |
| Total Goals Scored | 793 |
| Average Goals Scored | 1.24 |
| Highest Goal Difference | 14 |

---

## 🖥️ Dashboard Pages

| Page | What it shows |
|---|---|
| **Home** | Branded landing page with navigation into the three analytical pages |
| **Executive Overview** | 5 KPI cards, Team & Tournament Year slicers, Goal Scoring Trend line chart, full team performance table, Match Outcome Distribution (100% stacked column) by year |
| **Team Performance** | 5 KPI cards (Best Attack, Best Defense, Most Prolific Team, Most Win, Highest Point), Goal Scoring & Goal Conceded ranking bar charts, Best Overall Performers by Goal Difference line chart, Win-Loss Ratio 100%-stacked bar chart, supporting table |
| **Historical Trend** | 6 line charts trending goals scored, wins, goals conceded, attacking improvement, team ranking, and top-team performance improvement across tournament years |

## 🗂️ Data Model

Star-schema with one fact table and two dimension tables:

```
        ┌───────────────┐
        │   Country     │
        │  (Team)       │
        └───────┬───────┘
                │ 1-to-many
        ┌───────▼───────┐
        │  Football PB  │◄──── 1-to-many ────┐
        │ (fact table)  │                    │
        └───────────────┘           ┌─────────────────┐
                                     │ Tournament Year  │
                                     └──────────────────┘
```

- **Football PB** *(fact table)* — one row per team per tournament edition: games played, win, draw, loss, goals for, goals against, goals against per match, goal difference, points, rank.
- **Country** *(dimension)* — distinct Team names; drives the Team slicer and axis labels.
- **Tournament Year** *(dimension)* — distinct tournament years (2002–2018); drives the Year slicer and time-based axes.

### Data Dictionary

| Field | Table | Definition |
|---|---|---|
| Team | Country | Name of the national team / country |
| Tournament Year | Tournament Year / Football PB | Year the tournament edition took place (2002–2018) |
| Games Played (GP) | Football PB | Total matches played by the team |
| Win (W) | Football PB | Matches won |
| Draw (D) | Football PB | Matches drawn |
| Loss (L) | Football PB | Matches lost |
| Goals For (GF) | Football PB | Total goals scored |
| Goals Against (GA) | Football PB | Total goals conceded |
| Goals Against Per Match | Football PB | Average goals conceded per match |
| Goal Difference (GD) | Football PB | Goals For − Goals Against |
| Points | Football PB | Tournament points accumulated |
| RANK | Football PB | Team's finishing rank for that edition |

### Key DAX Measures

| Measure | Purpose |
|---|---|
| Total Countries | Distinct count of teams in the filtered dataset |
| Total Matches | Sum of games played |
| Total Goals Scored | Sum of Goals For |
| Average Goal Scored | Average goals scored per match |
| Highest Goal Difference | Max Goal Difference in context |
| Highest Point | Max Points in context |
| Most Win | Team with the highest Win count |
| Best Attack | Team with the highest Goals For |
| Best Defense | Team with the lowest Goals Against |
| Most Prolific Team | Team with highest cumulative scoring measure |

---

## 🧹 Data Preparation & Quality Checks

- Five FIFA World Cup Excel files (2002–2018) imported via Power Query and appended into one fact table.
- Tournament Year derived automatically from source file names (no manual entry).
- Column data types corrected; headers promoted and standardized across all files.
- Row counts validated post-append against each source file to confirm no records were lost or duplicated.
- Key metrics (matches, goals scored/conceded, W/D/L) spot-checked against source data.
- Duplicate/spelling checks run on Team names before building the Country dimension table.
- Missing values reviewed — no significant gaps affecting project objectives were found.
- Star schema relationships validated for correct filter propagation.

---

## 🔍 Key Findings

- **Attacking Performance:** Best Attack / Most Prolific / Most Win vary by edition, but **Germany** appears most often at the top, indicating sustained attacking strength across tournaments.
- **Defensive Performance:** Best Defense rotates across editions (Germany, Costa Rica, Switzerland, Portugal, Denmark have each led) — no single team dominates defensively across all editions.
- **Overall Team Success:** Germany and Brazil form a clear front tier in win-loss ratio and goal difference, ahead of a longer tail of more evenly matched teams.
- **Tournament-Year Trends:** Total goals scored fluctuates edition to edition rather than trending steadily up or down — a reminder to read any single tournament's total in the context of the multi-edition trend.
- **Team Trajectory:** The Historical Trend page's improvement charts answer *who is trending upward*, not just who currently ranks highest — the most forward-looking view in the dashboard.

---

## ⚠️ Limitations

- **Team-per-tournament grain only** — no match-by-match or head-to-head (opponent-level) data.
- **Five editions only (2002–2018)** — short time series limits confidence in long-run trend claims; more recent tournaments aren't yet included.
- **No player-level data** — individual contribution to a team's attack/defense can't be isolated.
- **No match date/stage field** — group-stage vs. knockout form can't be analyzed.
- Historical data describes the past; it does not predict future outcomes or account for squad changes, injuries, or managerial changes.

---

## 🚀 Recommendations

1. Freeze a single unfiltered KPI baseline before external distribution — several cards are slicer-sensitive.
2. Extend the model to match-level granularity where source data allows.
3. Add tournament editions beyond 2018 as they become available.
4. Document the exact points-scoring convention used in the Points field.
5. Add an on-page legend explaining how single-team superlative measures behave under multi-team slicer selections.
6. Pair Historical Trend improvement charts with written scouting notes once match-level data exists.

---

## 🛠️ Tech Stack

- **Power BI Desktop** — data modeling, DAX, report/dashboard build
- **Power Query (M)** — data import, transformation, and star-schema preparation
- **Source data:** FIFA World Cup Excel files (2002, 2006, 2010, 2014, 2018)

---

## 📁 Project Structure

```
├── football.pbix                  # Power BI report file
├── data/                          # Source Excel files (2002–2018)
├── screenshots/                   # Dashboard page exports
└── README.md
```

---

## ▶️ How to Use

1. Clone this repository.
2. Open `football.pbix` in **Power BI Desktop**.
3. Use the **Team** and **Tournament Year** slicers on the Executive Overview and Team Performance pages to filter the analysis.
4. Navigate between **Home → Executive Overview → Team Performance → Historical Trend** using the in-report navigation buttons.

---

## 📄 License

Add your preferred license here (e.g., MIT).

---

## 👤 Author

**Sijuade Enikansakin**
