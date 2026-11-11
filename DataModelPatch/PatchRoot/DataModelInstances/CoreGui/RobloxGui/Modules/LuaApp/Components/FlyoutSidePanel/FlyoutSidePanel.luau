local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local OpenCentralOverlayForReportLogsModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForReportLogs)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local BuildCreatorWebNavUrlModule = require(Modules.LuaApp.buildCreatorWebNavUrl)
local FlyoutSidePanelComponent = require(CorePackages.Workspace.Packages.FlyoutSidePanel).Components.FlyoutSidePanelComponent
local FlyoutLogoutButtonModule = require(script.Parent.FlyoutLogoutButton)
local ShouldFlyoutShowAccountSwitchModule = require(script.Parent.Hooks.shouldFlyoutShowAccountSwitch)
local UseFlyoutSwitchAccountModule = require(script.Parent.Hooks.useFlyoutSwitchAccount)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetFFlagForceEnableReportLogsButtonModule = require(Modules.LuaApp.Flags.GetFFlagForceEnableReportLogsButton)
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local ExperimentLayersModule = require(CorePackages.Workspace.Packages.ExperimentLayers)
local AppBtidLayers = ExperimentLayersModule.AppBtidLayers
local AppUserLayers = ExperimentLayersModule.AppUserLayers
local FFlagEnableAccountSwitcherIxpExposureGating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAccountSwitcherIxpExposureGating

return function(p1, _)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), OpenPurchaseRobuxPageModule (copy), OpenCentralOverlayForReportLogsModule (copy), UseSelectorFunction (copy), FlyoutLogoutButtonModule (copy), ShouldFlyoutShowAccountSwitchModule (copy), UseFlyoutSwitchAccountModule (copy), OpenProfilePeekViewModule (copy), GetFFlagForceEnableReportLogsButtonModule (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), FFlagEnableAccountSwitcherIxpExposureGating (copy), IXPService (copy), AppBtidLayers (copy), FlyoutSidePanelComponent (copy), BuildCreatorWebNavUrlModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenPurchaseRobuxPageModule (upval), UseRoactServiceResult (copy)
		UseDispatchResult(OpenPurchaseRobuxPageModule(nil, UseRoactServiceResult))
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForReportLogsModule (upval)
		UseDispatchResult(OpenCentralOverlayForReportLogsModule())
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.Users[p2.LocalUserId]
	end)
	local UseResult2 = ReactModule.useCallback(function(LayoutOrder)
		-- upvalues: ReactModule (upval), FlyoutLogoutButtonModule (upval)
		return ReactModule.createElement(FlyoutLogoutButtonModule, { layoutOrder = LayoutOrder })
	end, {})
	local ShouldFlyoutShowAccountSwitchModule1, ShouldFlyoutShowAccountSwitchModule2, ShouldFlyoutShowAccountSwitchModule3 = ShouldFlyoutShowAccountSwitchModule()
	local UseFlyoutSwitchAccountModuleResult = UseFlyoutSwitchAccountModule(ShouldFlyoutShowAccountSwitchModule2, ShouldFlyoutShowAccountSwitchModule3)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), OpenProfilePeekViewModule (upval)
		if UseSelectorResult and UseSelectorResult.id then
			UseDispatchResult(OpenProfilePeekViewModule(UseSelectorResult.id, { source = "FlyoutSidePanel" }))
		end
	end, { UseSelectorResult })
	local FFlagForceEnableReportLogsButtonModule = GetFFlagForceEnableReportLogsButtonModule() or UseUserExperimentFunction({ AppUserLayers.AppHealthReportLogs }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.AppHealthReportLogs] or {}).ReportLogsButtonEnabled or nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableAccountSwitcherIxpExposureGating (upval), IXPService (upval), AppBtidLayers (upval)
		if FFlagEnableAccountSwitcherIxpExposureGating then
			IXPService:LogBrowserTrackerLayerExposure(AppBtidLayers.AccountSwitcherLayer)
		end
	end, {})
	
	return ReactModule.createElement(FlyoutSidePanelComponent, {
		displayOrder = p1.displayOrder,
		renderLogOut = UseResult2,
		localUserModel = UseSelectorResult,
		onSwitchAccountActivated = if ShouldFlyoutShowAccountSwitchModule1 then UseFlyoutSwitchAccountModuleResult else nil,
		onProfileActivated = UseResult3,
		openPurchaseRobuxPage = UseResult,
		openReportLogConfirmation = if FFlagForceEnableReportLogsButtonModule then UseResult1 else nil,
		buildCreatorWebNavUrl = BuildCreatorWebNavUrlModule
	})
end