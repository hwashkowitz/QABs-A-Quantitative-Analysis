# QABs-A-Quantitative-Analysis
A full analysis on the value of Quality At Bats (QABs) and their value.

# Question: Do quality at-bats lead to reaching base more often?

# Definitions
Quality at-bat: a plate appearance with 6 or more pitches
"reached base": got to the base by any means possible: batter reached base on a hit, walk, intentional walk, hit by pitch, error, or fielder’s choice (including force outs where the batter was safe)

# Data and Method
## Part 1: Walks Inclusive
I pulled all pitches from June 1 to June 7, 2026 from Statcast with a loop. 
Then, I filtered those pitches based on whether it was a QAB and whether the batter got to base, filtered again based on which fulfilled both criteria, and ran the numbers on those.
Finally, I ran a prop.test to see the statistical significance of the findings.
## Part 2: Walks Exclusive
I ran a lot of the same code as in Part 1, but I eliminated walks, since most QABs under my definition were achieved with a lot of balls.

# Results, part 1
QAB reached base: 38.7%
Non-QAB reached base: 33.4%
p = 0.00017
95% confidence interval: 2.5 to +8.1 points

# Results, part 2
QABs reached base: 21.6%
Non-QABs reached base: 29.0%
p-value: 0.00000045, 
95% confidence interval: −10.2 to −4.7 percentage points
