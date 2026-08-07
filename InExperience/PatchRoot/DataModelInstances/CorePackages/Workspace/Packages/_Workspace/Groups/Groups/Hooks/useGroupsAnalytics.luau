local groups = script:FindFirstAncestor("Groups")
local reactModule = require(groups.Parent.React)
local groupsAnalyticsContextModule = require(groups.Analytics.GroupsAnalyticsContext)

return function() --[[ line: 13 | named "useGroupsAnalytics" ]]
	-- upvalues: reactModule (ref), groupsAnalyticsContextModule (ref)
	return reactModule.useContext(groupsAnalyticsContextModule)
end