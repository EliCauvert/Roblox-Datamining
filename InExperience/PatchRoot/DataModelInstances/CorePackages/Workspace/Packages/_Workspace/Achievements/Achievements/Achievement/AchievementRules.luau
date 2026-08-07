return {
	AchievementPollster = function(p0) --[[ line: 8 ]]
		return p0 >= 5
	end,
	AchievementMarathon = function(p1) --[[ line: 11 ]]
		return p1 >= 3600
	end,
	Achievement20DayRoll = function(p2) --[[ line: 14 ]]
		return p2 >= 20
	end,
	Achievement10DayRoll = function(p3) --[[ line: 17 ]]
		return p3 >= 10
	end,
	Achievement3DayRoll = function(p4) --[[ line: 20 ]]
		return p4 >= 3
	end,
	AchievementFoursCompany = function(p5) --[[ line: 23 ]]
		return p5 >= 3
	end,
	AchievementOneNameManyFaces = function(p6) --[[ line: 26 ]]
		return p6
	end,
	AchievementStrengthInNumbers = function(p7) --[[ line: 3 ]]
		return p7 >= 0
	end,
	AchievementTrailblazer = function(p8) --[[ line: 30 ]]
		return p8 >= 15
	end,
	AchievementExplorer = function(p9) --[[ line: 33 ]]
		return p9 >= 5
	end,
	AchievementScout = function(p10) --[[ line: 36 ]]
		return p10 >= 1
	end
}