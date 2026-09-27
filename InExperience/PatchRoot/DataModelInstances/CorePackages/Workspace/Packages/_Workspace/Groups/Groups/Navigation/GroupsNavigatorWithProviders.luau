local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local groupsPageModule = require(groups.Components.GroupsPage)
local fFlagEnableGroupDetailPane = require(parent.SharedFlags).FFlagEnableGroupDetailPane
local var1 = if fFlagEnableGroupDetailPane then require(script.Parent.GroupsNavigator) else nil
local var2 = if fFlagEnableGroupDetailPane then require(script.Parent.GroupsRoutes) else nil
local var3 = if fFlagEnableGroupDetailPane then require(groups.Hooks.useIsCompactTouch) else nil
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local initializeGroupsAnalyticsModule = require(groups.Analytics.initializeGroupsAnalytics)
local groupsAnalyticsContextModule = require(groups.Analytics.GroupsAnalyticsContext)

local function GroupsWithContext(p1)
	-- upvalues: useGroupsWrapperContextModule (ref), fFlagEnableGroupDetailPane (ref), var3 (ref), reactModule (ref), var2 (ref), initializeGroupsAnalyticsModule (ref), var1 (ref), groupsPageModule (ref), groupsAnalyticsContextModule (ref)
	local var4 = useGroupsWrapperContextModule()
	
	if fFlagEnableGroupDetailPane then
		local var5 = var3()
		local var6 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var6 (ref), p1 (ref), var5 (ref), var2 (copy)
			if var4.groupId == nil then
				var6.current = nil
				
				return
			elseif p1.navigation and var5 and var6.current ~= var4.groupId then
				var6.current = var4.groupId
				p1.navigation.navigate(var2.GroupDetailPane, {
					groupId = var4.groupId,
					source = var4.groupDetailPaneSource
				})
			end
		end, {
			var4.groupId,
			var4.groupDetailPaneSource,
			p1.navigation,
			var5
		})
	end
	return reactModule.createElement(groupsAnalyticsContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: initializeGroupsAnalyticsModule (copy), var4 (ref)
			local var7 = initializeGroupsAnalyticsModule()
			var7.updateInfoForAllEvents({ userId = var4.userId })
			
			return var7
		end, { var4.userId })
	}, if fFlagEnableGroupDetailPane then { GroupsContent = reactModule.createElement(var1, p1) } else {
		GroupsPage = reactModule.createElement(groupsPageModule, p1)
	})
end

if fFlagEnableGroupDetailPane then
	local groupsNavigatorWithProviders = reactModule.PureComponent:extend("GroupsNavigatorWithProviders")
	
	function groupsNavigatorWithProviders.render(p1)
		-- upvalues: reactModule (ref), GroupsWithContext (ref)
		return reactModule.createElement(GroupsWithContext, p1.props)
	end
	
	groupsNavigatorWithProviders.router = var1.router
	
	return groupsNavigatorWithProviders
end
return GroupsWithContext