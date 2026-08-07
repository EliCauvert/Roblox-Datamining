local groups = script:FindFirstAncestor("Groups")
local reactModule = require(groups.Parent.React)
local groupsPageModule = require(groups.Components.GroupsPage)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local initializeGroupsAnalyticsModule = require(groups.Analytics.initializeGroupsAnalytics)
local groupsAnalyticsContextModule = require(groups.Analytics.GroupsAnalyticsContext)

return function(p0) --[[ line: 19 | named "GroupsWithContext" ]]
	-- upvalues: useGroupsWrapperContextModule (ref), reactModule (ref), initializeGroupsAnalyticsModule (ref), groupsAnalyticsContextModule (ref), groupsPageModule (ref)
	local var6 = useGroupsWrapperContextModule()
	
	return reactModule.createElement(groupsAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 22 ]]
			-- upvalues: initializeGroupsAnalyticsModule (copy), var6 (ref)
			local var7 = initializeGroupsAnalyticsModule()
			var7.updateInfoForAllEvents({ userId = var6.userId })
			
			return var7
		end, { var6.userId })
	}, {
		GroupsPage = reactModule.createElement(groupsPageModule, p0)
	})
end