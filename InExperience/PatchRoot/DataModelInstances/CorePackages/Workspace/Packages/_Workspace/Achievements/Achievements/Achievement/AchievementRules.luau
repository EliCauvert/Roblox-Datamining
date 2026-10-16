return {
	AchievementPollster = function(p1: number): boolean --[[ Line: 8 ]]
		return p1 >= 5
	end,
	AchievementMarathon = function(p1: number): boolean --[[ Line: 11 ]]
		return p1 >= 3600
	end,
	Achievement20DayRoll = function(p1: number): boolean --[[ Line: 14 ]]
		return p1 >= 20
	end,
	Achievement10DayRoll = function(p1: number): boolean --[[ Line: 17 ]]
		return p1 >= 10
	end,
	Achievement3DayRoll = function(p1: number): boolean --[[ Line: 20 ]]
		return p1 >= 3
	end,
	AchievementFoursCompany = function(p1: number): boolean --[[ Line: 23 ]]
		return p1 >= 3
	end,
	AchievementOneNameManyFaces = function(p1) --[[ Line: 26 ]]
		return p1
	end,
	AchievementStrengthInNumbers = function(p1: number): boolean --[[ Line: 3 ]]
		return p1 >= 0
	end,
	AchievementTrailblazer = function(p1: number): boolean --[[ Line: 30 ]]
		return p1 >= 15
	end,
	AchievementExplorer = function(p1: number): boolean --[[ Line: 33 ]]
		return p1 >= 5
	end,
	AchievementScout = function(p1: number): boolean --[[ Line: 36 ]]
		return p1 >= 1
	end
}