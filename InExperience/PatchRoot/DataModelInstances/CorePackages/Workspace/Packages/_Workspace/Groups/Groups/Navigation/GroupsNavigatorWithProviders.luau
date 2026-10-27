local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local GroupsPageModule = require(Groups.Components.GroupsPage)
local FFlagEnableGroupOverviewPane = require(Parent.SharedFlags).FFlagEnableGroupOverviewPane
local GroupsNavigatorModule = if FFlagEnableGroupOverviewPane then require(script.Parent.GroupsNavigator) else nil
local GroupsRoutesModule = if FFlagEnableGroupOverviewPane then require(script.Parent.GroupsRoutes) else nil
local UseIsCompactTouchModule = if FFlagEnableGroupOverviewPane then require(Groups.Hooks.useIsCompactTouch) else nil
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local InitializeGroupsAnalyticsModule = require(Groups.Analytics.initializeGroupsAnalytics)
local GroupsAnalyticsContextModule = require(Groups.Analytics.GroupsAnalyticsContext)

local function GroupsWithContext(p1)
	-- upvalues: UseGroupsWrapperContextModule (copy), FFlagEnableGroupOverviewPane (copy), UseIsCompactTouchModule (copy), ReactModule (copy), GroupsRoutesModule (copy), InitializeGroupsAnalyticsModule (copy), GroupsNavigatorModule (copy), GroupsPageModule (copy), GroupsAnalyticsContextModule (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	
	if FFlagEnableGroupOverviewPane then
		local UseIsCompactTouchModuleResult = UseIsCompactTouchModule()
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: UseGroupsWrapperContextModuleResult (copy), UseRefResult (copy), p1 (copy), UseIsCompactTouchModuleResult (copy), GroupsRoutesModule (upval)
			if UseGroupsWrapperContextModuleResult.groupId == nil then
				UseRefResult.current = nil
				
				return
			end
			if p1.navigation and UseIsCompactTouchModuleResult and UseRefResult.current ~= UseGroupsWrapperContextModuleResult.groupId then
				UseRefResult.current = UseGroupsWrapperContextModuleResult.groupId
				p1.navigation.navigate(GroupsRoutesModule.GroupOverviewPane, {
					groupId = UseGroupsWrapperContextModuleResult.groupId,
					source = UseGroupsWrapperContextModuleResult.groupOverviewPaneSource
				})
			end
		end, {
			UseGroupsWrapperContextModuleResult.groupId,
			UseGroupsWrapperContextModuleResult.groupOverviewPaneSource,
			p1.navigation,
			UseIsCompactTouchModuleResult
		})
	end
	return ReactModule.createElement(GroupsAnalyticsContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: InitializeGroupsAnalyticsModule (upval), UseGroupsWrapperContextModuleResult (copy)
			local InitializeGroupsAnalyticsModuleResult = InitializeGroupsAnalyticsModule()
			InitializeGroupsAnalyticsModuleResult.updateInfoForAllEvents({ userId = UseGroupsWrapperContextModuleResult.userId })
			
			return InitializeGroupsAnalyticsModuleResult
		end, { UseGroupsWrapperContextModuleResult.userId })
	}, if FFlagEnableGroupOverviewPane then {
		GroupsContent = ReactModule.createElement(GroupsNavigatorModule, p1)
	} else {
		GroupsPage = ReactModule.createElement(GroupsPageModule, p1)
	})
end

if FFlagEnableGroupOverviewPane then
	local GroupsNavigatorWithProviders = ReactModule.PureComponent:extend("GroupsNavigatorWithProviders")
	
	function GroupsNavigatorWithProviders.render(p1)
		-- upvalues: ReactModule (copy), GroupsWithContext (copy)
		return ReactModule.createElement(GroupsWithContext, p1.props)
	end
	
	GroupsNavigatorWithProviders.router = GroupsNavigatorModule.router
	
	return GroupsNavigatorWithProviders
else
	return GroupsWithContext
end