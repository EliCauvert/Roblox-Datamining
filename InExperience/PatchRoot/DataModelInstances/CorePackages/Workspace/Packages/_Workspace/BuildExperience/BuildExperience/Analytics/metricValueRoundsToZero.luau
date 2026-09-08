local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Analytics.AnalyticsUnit)
local formatStatNumberModule = require(buildExperience.Analytics.formatStatNumber)

return function(value, p1, p2, p3)
	-- upvalues: formatStatNumberModule (ref)
	return formatStatNumberModule(math.abs(value), p1, p2, p3) == formatStatNumberModule(0, p1, p2, p3)
end