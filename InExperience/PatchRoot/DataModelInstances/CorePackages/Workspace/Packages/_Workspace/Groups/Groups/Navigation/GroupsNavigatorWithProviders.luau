local groups = script:FindFirstAncestor("Groups")
local reactModule = require(groups.Parent.React)
local groupsPageModule = require(groups.Components.GroupsPage)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local initializeGroupsAnalyticsModule = require(groups.Analytics.initializeGroupsAnalytics)
local groupsAnalyticsContextModule = require(groups.Analytics.GroupsAnalyticsContext)

return function(p1)
	-- upvalues: useGroupsWrapperContextModule (ref), reactModule (ref), initializeGroupsAnalyticsModule (ref), groupsAnalyticsContextModule (ref), groupsPageModule (ref)
	local var1 = useGroupsWrapperContextModule()
	
	return reactModule.createElement(groupsAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: initializeGroupsAnalyticsModule (copy), var1 (ref)
			local var2 = initializeGroupsAnalyticsModule()
			var2.updateInfoForAllEvents({ userId = var1.userId })
			
			return var2
		end, { var1.userId })
	}, {
		GroupsPage = reactModule.createElement(groupsPageModule, p1)
	})
end