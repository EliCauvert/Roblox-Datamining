local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local v1 = if FFlagSignalsNavP3hMisc then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		canGoBackInAppRoute = #UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute) > 1
	}))
end else require(CorePackages.Packages.RoactRodux).connect(if FFlagSignalsNavP3hMisc then nil else MapStateToPropsModule, (require(script.Parent.mapDispatchToProps)))((require(script.Parent.AndroidBackButtonNavigationHandler)))

return v1