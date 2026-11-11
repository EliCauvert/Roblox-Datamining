local CorePackages = game:GetService("CorePackages")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors

return function(p1)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	if FFlagUseNavigationSelectors then
		return Selectors.selectCurrentPageName(p1)
	else
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry].name
	end
end