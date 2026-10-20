local ConnectionsHub = script:FindFirstAncestor("ConnectionsHub")
local Parent = ConnectionsHub.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local AnalyticsModule = require(ConnectionsHub.Analytics)
local UseCoHubAnalyticsFunction = AnalyticsModule.useCoHubAnalytics
local EventNames = AnalyticsModule.EventNames

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), UseCoHubAnalyticsFunction (copy), EventNames (copy), FoundationModule (copy), Tabs (copy), InputSize (copy), FillBehavior (copy)
	local UseNavigationResult = UseNavigationFunction()
	local RouteName = UseNavigationResult.state.routes[UseNavigationResult.state.index].routeName
	local UseStateResult, UseStateResult2 = ReactModule.useState(RouteName)
	local FireAnalyticsEventFunction = UseCoHubAnalyticsFunction().fireAnalyticsEvent
	local UseResult = ReactModule.useCallback(function(Btn)
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseStateResult (copy), UseStateResult2 (copy), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.CoHubTabClicked, { subpage = UseStateResult, btn = Btn })
		UseStateResult2(Btn)
		UseNavigationResult.navigate(Btn)
	end, { UseNavigationResult, UseStateResult2 })
	ReactModule.useEffect(function()
		-- upvalues: RouteName (copy), UseStateResult (copy), UseStateResult2 (copy)
		if RouteName ~= UseStateResult then
			UseStateResult2(RouteName)
		end
	end, { RouteName })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-1200 bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		ConnectionsTabs = ReactModule.createElement(Tabs, {
			activeTabId = UseStateResult,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			onActivated = UseResult,
			tabs = p1.tabs
		})
	})
end