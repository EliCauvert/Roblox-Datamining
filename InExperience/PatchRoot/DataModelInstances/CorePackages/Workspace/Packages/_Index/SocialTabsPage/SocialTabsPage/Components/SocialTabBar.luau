local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View
local useNavigation = require(parent.Navigation).useNavigation

return function(p0) --[[ line: 19 | named "SocialTabBar" ]]
	-- upvalues: useNavigation (ref), reactModule (ref), view (ref), tabs (ref), inputSize (ref), fillBehavior (ref)
	local var2 = useNavigation()
	local routeName = var2.state.routes[var2.state.index].routeName
	local var3, var4 = reactModule.useState(routeName)
	local var5 = reactModule.useCallback(function(p1) --[[ line: 24 ]]
		-- upvalues: var4 (ref), var2 (ref)
		var4(p1)
		var2.navigate(p1)
	end, { var2 })
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: var4 (ref), routeName (ref)
		var4(function(p2) --[[ line: 30 ]]
			-- upvalues: routeName (copy)
			return if p2 == routeName then p2 else routeName
		end)
	end, { routeName })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y bg-surface-0",
		LayoutOrder = p0.layoutOrder
	}, {
		SocialTabs = reactModule.createElement(tabs, {
			activeTabId = var3,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			onActivated = var5,
			tabs = p0.tabs
		})
	})
end