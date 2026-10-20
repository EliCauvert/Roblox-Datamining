local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local _ = require(NavigationRodux.Parent.Navigation)
local _ = require(NavigationRodux.types)

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
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry].name
	end,
	selectCurrentLegacyRoute = function(p1)
		local History = p1.Navigation.history
		
		return History[#History]
	end,
	selectCurrentLegacyPage = function(p1)
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry]
	end
}