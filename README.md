# QABs-A-Quantitative-Analysis
A full analysis on the value of Quality At Bats (QABs).

## Question: Do quality at-bats lead to reaching base more often?

# Definitions
Quality at-bat: a plate appearance with 6 or more pitches
"reached base": got to the base by any means possible: batter reached base on a hit, walk, intentional walk, hit by pitch, error, or fielder’s choice (including force outs where the batter was safe)

## Data and Method
### Sample Sizes
27,314 pitches, 6,975 plate appearances (6,310 without walks), and 20.9% of plate appearances were QABs. 
I used baseballr to pull the data from Statcast.
### Part 1: Walks Inclusive
I pulled all pitches from June 1 to June 7, 2026 from Statcast with a loop. 
Then, I determined which pitches were QABs and which weren't, and determined the share of each that reached base.
Finally, I ran a prop.test to see the statistical significance of the findings.
### Part 2: Walks Exclusive
I ran a lot of the same code as in Part 1, but I eliminated walks, since a walk requires at least four pitches, making any walk naturally close to a QAB.

## Results, part 1
QAB reached base: 38.7%
Non-QAB reached base: 33.4%
p = 0.00017
95% confidence interval: +2.5 to +8.1 points

## Results, part 2
QABs reached base: 21.6%
Non-QABs reached base: 29.0%
p-value: 0.00000045
95% confidence interval: −10.2 to −4.7 percentage points

## Conclusion
When you include walks in QABs, a batter gets on base 5.3 percentage points more often than a non-QAB. 
However, once you remove walks from the data, the balance shifts: a batter gets on base 7.4 percentage points more often with a non-QAB instead of a QAB.
Both results were statistically significant.
The value of a long at-bat comes mainly from drawing walks, not from getting a better pitch to hit.
This makes sense, since in order for a QAB to exist, the batter must receive 2 strikes.
Once that's true, the batter is perilously close to a strikeout already.

## Limits
I only analyzed one week of data in June, so the results might differ over a full season, and players who didn’t play that week aren’t included.
Additionally, it is just a correlation between QABs and reaching base, not causation; just because they move in tandem does not prove that one causes the other.
My definition of a QAB was intentionally narrow, as many analysts and coaches include other factors in a QAB.
A natural next step would be comparing long at-bats with many two-strike fouls to those without.


