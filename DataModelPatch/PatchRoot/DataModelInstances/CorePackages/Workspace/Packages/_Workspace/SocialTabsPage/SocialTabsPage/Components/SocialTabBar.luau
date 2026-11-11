local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local UseNavigationFunction = require(Parent.Navigation).useNavigation

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), View (copy), Tabs (copy), InputSize (copy), FillBehavior (copy)
	local UseNavigationResult = UseNavigationFunction()
	local RouteName = UseNavigationResult.state.routes[UseNavigationResult.state.index].routeName
	local UseStateResult, UseStateResult2 = ReactModule.useState(RouteName)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), UseNavigationResult (copy)
		UseStateResult2(p2)
		UseNavigationResult.navigate(p2)
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), RouteName (copy)
		UseStateResult2(function(RouteName1)
			-- upvalues: RouteName (upval)
			return if RouteName1 == RouteName then RouteName1 else RouteName
		end)
	end, { RouteName })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		SocialTabs = ReactModule.createElement(Tabs, {
			activeTabId = UseStateResult,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			onActivated = UseResult,
			tabs = p1.tabs
		})
	})
end