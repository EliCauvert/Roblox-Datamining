local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local _ = require(navigationRodux.Parent.Navigation)
local _ = require(navigationRodux.types)

local function _(p1)
	return p1.Navigation
end

return {
	selectCurrentRoactNavigationRoute = function(p1)
		return p1.Navigation.currentRoute
	end,
	selectLegacyHistory = function(p1)
		return p1.Navigation.history
	end,
	selectNavigationLocked = function(p1)
		return p1.Navigation.lockNavigationActions
	end,
	selectBackNavigationDisableCounter = function(p1)
		return p1.Navigation.backNavigationDisableCounter
	end,
	selectCurrentPageName = function(p1)
		local history = p1.Navigation.history
		local var1 = history[#history]
		
		return var1[#var1].name
	end,
	selectCurrentLegacyRoute = function(p1)
		local history = p1.Navigation.history
		
		return history[#history]
	end,
	selectCurrentLegacyPage = function(p1)
		local history = p1.Navigation.history
		local var1 = history[#history]
		
		return var1[#var1]
	end
}