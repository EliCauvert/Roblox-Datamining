local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local _ = require(navigationRodux.Parent.Navigation)
local _ = require(navigationRodux.types)

local function _(p0) --[[ line: 13 | named "selectNavigationState" ]]
	return p0.Navigation
end

return {
	selectCurrentRoactNavigationRoute = function(p1) --[[ line: 17 ]]
		return p1.Navigation.currentRoute
	end,
	selectLegacyHistory = function(p2) --[[ line: 21 ]]
		return p2.Navigation.history
	end,
	selectNavigationLocked = function(p3) --[[ line: 35 ]]
		return p3.Navigation.lockNavigationActions
	end,
	selectBackNavigationDisableCounter = function(p4) --[[ line: 39 ]]
		return p4.Navigation.backNavigationDisableCounter
	end,
	selectCurrentPageName = function(p5) --[[ line: 43 ]]
		local history = p5.Navigation.history
		local var1 = history[#history]
		
		return var1[#var1].name
	end,
	selectCurrentLegacyRoute = function(p6) --[[ line: 25 ]]
		local history = p6.Navigation.history
		
		return history[#history]
	end,
	selectCurrentLegacyPage = function(p7) --[[ line: 30 ]]
		local history = p7.Navigation.history
		local var2 = history[#history]
		
		return var2[#var2]
	end
}