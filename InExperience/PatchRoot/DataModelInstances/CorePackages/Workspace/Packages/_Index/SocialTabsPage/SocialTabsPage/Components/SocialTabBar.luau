local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View
local useNavigation = require(parent.Navigation).useNavigation

return function(p1)
	-- upvalues: useNavigation (ref), reactModule (ref), view (ref), tabs (ref), inputSize (ref), fillBehavior (ref)
	local var1 = useNavigation()
	local routeName = var1.state.routes[var1.state.index].routeName
	local var2, var3 = reactModule.useState(routeName)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var1 (ref)
		var3(p2)
		var1.navigate(p2)
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), routeName (ref)
		var3(function(p2)
			-- upvalues: routeName (copy)
			return if p2 == routeName then p2 else routeName
		end)
	end, { routeName })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		SocialTabs = reactModule.createElement(tabs, {
			activeTabId = var2,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			onActivated = var4,
			tabs = p1.tabs
		})
	})
end