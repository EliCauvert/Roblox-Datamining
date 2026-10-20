local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Analytics.AnalyticsUnit)
local FormatStatNumberModule = require(BuildExperience.Analytics.formatStatNumber)

return function(Value: number, p1, p2, p3): boolean
	-- upvalues: FormatStatNumberModule (copy)
	return FormatStatNumberModule(math.abs(Value), p1, p2, p3) == FormatStatNumberModule(0, p1, p2, p3)
end