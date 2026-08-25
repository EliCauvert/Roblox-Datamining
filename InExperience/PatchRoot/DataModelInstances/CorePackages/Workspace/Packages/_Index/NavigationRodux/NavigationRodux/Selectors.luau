local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local _ = require(navigationRodux.Parent.Navigation)
local _ = require(navigationRodux.types)

local function _(p0)
	return p0.Navigation
end

return {
	selectCurrentRoactNavigationRoute = function(p1)
		return p1.Navigation.currentRoute
	end,
	selectLegacyHistory = function(p2)
		return p2.Navigation.history
	end,
	selectNavigationLocked = function(p3)
		return p3.Navigation.lockNavigationActions
	end,
	selectBackNavigationDisableCounter = function(p4)
		return p4.Navigation.backNavigationDisableCounter
	end,
	selectCurrentPageName = function(p5)
		local history = p5.Navigation.history
		local var1 = history[#history]
		
		return var1[#var1].name
	end,
	selectCurrentLegacyRoute = function(p6)
		local history = p6.Navigation.history
		
		return history[#history]
	end,
	selectCurrentLegacyPage = function(p7)
		local history = p7.Navigation.history
		local var2 = history[#history]
		
		return var2[#var2]
	end
}