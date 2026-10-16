local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local _ = require(NavigationRodux.Parent.Navigation)
local _ = require(NavigationRodux.types)

local function _(p1) --[[ Line: 13 | Named "selectNavigationState" ]]
	return p1.Navigation
end

return {
	selectCurrentRoactNavigationRoute = function(p1) --[[ Line: 17 ]]
		return p1.Navigation.currentRoute
	end,
	selectLegacyHistory = function(p1) --[[ Line: 21 ]]
		return p1.Navigation.history
	end,
	selectNavigationLocked = function(p1) --[[ Line: 35 ]]
		return p1.Navigation.lockNavigationActions
	end,
	selectBackNavigationDisableCounter = function(p1) --[[ Line: 39 ]]
		return p1.Navigation.backNavigationDisableCounter
	end,
	selectCurrentPageName = function(p1) --[[ Line: 43 ]]
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry].name
	end,
	selectCurrentLegacyRoute = function(p1) --[[ Line: 25 ]]
		local History = p1.Navigation.history
		
		return History[#History]
	end,
	selectCurrentLegacyPage = function(p1) --[[ Line: 30 ]]
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry]
	end
}