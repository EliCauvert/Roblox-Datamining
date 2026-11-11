local CorePackages = game:GetService("CorePackages")
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors

return function(p1, _)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FormFactor (copy)
	local Name = nil
	
	if not FFlagSignalsNavP3hMisc then
		local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
		Name = SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name
	end
	return {
		currentAppPage = Name,
		wideMode = p1.FormFactor == FormFactor.WIDE
	}
end