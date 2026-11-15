# QABs: A Quantitative Analysis
# QAB = a plate appearance with 6 or more pitches
# Data: Statcast, June 1-7, 2026

library(baseballr)

# 1. Pull one week of pitches, one day at a time
dates <- seq(as.Date("2026-06-01"), as.Date("2026-06-07"), by = "day")
all_days <- list()
for (i in seq_along(dates)) {
  all_days[[i]] <- statcast_search(start_date = dates[i], end_date = dates[i],
                                   player_type = "batter")
}
day <- do.call(rbind, all_days)
nrow(day)   # 27,314 pitches

# 2. Label each plate appearance (game + at-bat number)
day$pa_id <- paste(day$game_pk, day$at_bat_number)

# 3. Count pitches per plate appearance and flag QABs
pitches_per_pa <- table(day$pa_id)
qab <- pitches_per_pa >= 6
mean(qab)   # 0.209 (20.9% of PAs were QABs)

# 4. Keep only the pitch that ended each plate appearance
last <- day[!is.na(day$events), ]
nrow(last)   # 6,975 plate appearances

# 5. Mark which plate appearances reached base
on_base_events <- c("single", "double", "triple", "home_run", "walk",
                    "intent_walk", "hit_by_pitch", "field_error",
                    "fielders_choice", "force_out", "fielders_choice_out")
last$on_base <- last$events %in% on_base_events

# 6. Attach the QAB flag to each plate appearance
last$qab <- as.vector(qab[last$pa_id])

# 7. Compare on-base rates
mean(last$on_base[last$qab])    # 0.387 for QABs
mean(last$on_base[!last$qab])   # 0.334 for non-QABs

# 8. Test whether the difference is real
prop.test(c(sum(last$on_base[last$qab]), sum(last$on_base[!last$qab])),
          c(sum(last$qab), sum(!last$qab)))
# p = 0.00017, 95% confidence interval: +2.5 to +8.1 percentage points

# ---- Part 2: Without walks ----

# Remove plate appearances that ended in a walk, intentional walk, or hit by pitch
walk_events <- c("walk", "intent_walk", "hit_by_pitch")
no_walks <- last[!last$events %in% walk_events, ]
nrow(no_walks)   # 6,310 plate appearances

# Compare on-base rates without walks
mean(no_walks$on_base[no_walks$qab])    # 0.216 for QABs
mean(no_walks$on_base[!no_walks$qab])   # 0.290 for non-QABs

# Test whether the difference is real
prop.test(c(sum(no_walks$on_base[no_walks$qab]), sum(no_walks$on_base[!no_walks$qab])),
          c(sum(no_walks$qab), sum(!no_walks$qab)))
# p = 0.00000045, 95% confidence interval: -10.2 to -4.7 percentage points
# Without walks, QABs reach base LESS often: the QAB advantage comes from walks
