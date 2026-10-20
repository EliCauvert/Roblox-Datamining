local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceAnalytics)

return function(Text: string, p1, p2): string
	local _, Match2, Match3, Match4, Match5 = string.match(Text, "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):%d+")
	
	return if Match2 == nil then Text elseif p1 == "OneMinute" or p1 == "HalfHour" or p1 == "OneHour" then `{Match4}:{Match5}` else `{p2[tonumber(Match2)] or Match2} {tonumber(Match3)}`
end