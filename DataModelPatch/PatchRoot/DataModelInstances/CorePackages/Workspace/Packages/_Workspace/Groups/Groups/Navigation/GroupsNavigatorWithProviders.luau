local Groups = script:FindFirstAncestor("Groups")
local ReactModule = require(Groups.Parent.React)
local GroupsPageModule = require(Groups.Components.GroupsPage)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local InitializeGroupsAnalyticsModule = require(Groups.Analytics.initializeGroupsAnalytics)
local GroupsAnalyticsContextModule = require(Groups.Analytics.GroupsAnalyticsContext)

return function(p1)
	-- upvalues: UseGroupsWrapperContextModule (copy), ReactModule (copy), InitializeGroupsAnalyticsModule (copy), GroupsAnalyticsContextModule (copy), GroupsPageModule (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	
	return ReactModule.createElement(GroupsAnalyticsContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: InitializeGroupsAnalyticsModule (upval), UseGroupsWrapperContextModuleResult (copy)
			local InitializeGroupsAnalyticsModuleResult = InitializeGroupsAnalyticsModule()
			InitializeGroupsAnalyticsModuleResult.updateInfoForAllEvents({ userId = UseGroupsWrapperContextModuleResult.userId })
			
			return InitializeGroupsAnalyticsModuleResult
		end, { UseGroupsWrapperContextModuleResult.userId })
	}, {
		GroupsPage = ReactModule.createElement(GroupsPageModule, p1)
	})
end