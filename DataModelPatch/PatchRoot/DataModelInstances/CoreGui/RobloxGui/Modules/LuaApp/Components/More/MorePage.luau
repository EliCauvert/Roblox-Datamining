local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local ExperimentLayersModule = require(CorePackages.Workspace.Packages.ExperimentLayers)
local AppBtidLayers = ExperimentLayersModule.AppBtidLayers
local AppUserLayers = ExperimentLayersModule.AppUserLayers
local MorePageGridLayoutModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.More.MorePageGridLayout)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableAccountSwitcherIxpExposureGating = SharedFlagsModule.FFlagEnableAccountSwitcherIxpExposureGating
local UseTTINavigationTrackingFunction = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking

return function()
	-- upvalues: SharedFlagsModule (copy), UseTTINavigationTrackingFunction (copy), ReactModule (copy), IXPService (copy), AppUserLayers (copy), FFlagEnableAccountSwitcherIxpExposureGating (copy), AppBtidLayers (copy), RoactModule (copy), MorePageGridLayoutModule (copy)
	if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
		UseTTINavigationTrackingFunction("NavigateTo_More")
	end
	ReactModule.useEffect(function()
		-- upvalues: IXPService (upval), AppUserLayers (upval)
		IXPService:LogUserLayerExposure(AppUserLayers.MorePageExposureLayer)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableAccountSwitcherIxpExposureGating (upval), IXPService (upval), AppBtidLayers (upval)
		if FFlagEnableAccountSwitcherIxpExposureGating then
			IXPService:LogBrowserTrackerLayerExposure(AppBtidLayers.AccountSwitcherLayer)
		end
	end, {})
	
	return RoactModule.createElement(MorePageGridLayoutModule)
end