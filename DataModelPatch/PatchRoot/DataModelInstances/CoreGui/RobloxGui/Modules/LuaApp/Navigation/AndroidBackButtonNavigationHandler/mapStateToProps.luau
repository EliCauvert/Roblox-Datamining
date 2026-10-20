local CorePackages = game:GetService("CorePackages")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors

return function(p1, _)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
	
	return {
		canGoBackInAppRoute = #SelectLegacyHistoryResult[#SelectLegacyHistoryResult] > 1
	}
end