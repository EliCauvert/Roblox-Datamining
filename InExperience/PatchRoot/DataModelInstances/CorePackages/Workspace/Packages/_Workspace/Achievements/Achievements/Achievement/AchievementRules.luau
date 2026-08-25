return {
	AchievementPollster = function(p0)
		return p0 >= 5
	end,
	AchievementMarathon = function(p1)
		return p1 >= 3600
	end,
	Achievement20DayRoll = function(p2)
		return p2 >= 20
	end,
	Achievement10DayRoll = function(p3)
		return p3 >= 10
	end,
	Achievement3DayRoll = function(p4)
		return p4 >= 3
	end,
	AchievementFoursCompany = function(p5)
		return p5 >= 3
	end,
	AchievementOneNameManyFaces = function(p6)
		return p6
	end,
	AchievementStrengthInNumbers = function(p7)
		return p7 >= 0
	end,
	AchievementTrailblazer = function(p8)
		return p8 >= 15
	end,
	AchievementExplorer = function(p9)
		return p9 >= 5
	end,
	AchievementScout = function(p10)
		return p10 >= 1
	end
}