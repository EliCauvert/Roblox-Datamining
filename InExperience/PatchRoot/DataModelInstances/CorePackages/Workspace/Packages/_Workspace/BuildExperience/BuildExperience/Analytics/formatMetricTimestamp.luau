local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceAnalytics)

return function(p1, p2, p3)
	local _, match, match_1, match_2, match_3 = string.match(p1, "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):%d+")
	
	return if match == nil then p1 elseif p2 == "OneMinute" or p2 == "HalfHour" or p2 == "OneHour" then `{match_2}:{match_3}` else `{p3[tonumber(match)] or match} {tonumber(match_1)}`
end