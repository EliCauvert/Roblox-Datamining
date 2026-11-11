local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local Modules = CoreGui.RobloxGui.Modules
local Panel3D = require(CorePackages.Packages.UIBlox).Core.VR.Panel3D
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local Object = require(CorePackages.Packages.LuauPolyfill).Object
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local OverlayComponent = require(Modules.LuaApp.Components.CentralOverlayUtils).OverlayComponent
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local VRCentralFoundationOverlayProviderModule = require(Modules.LuaApp.Components.CrossPlatformCompatibility.VRCentralFoundationOverlayProvider)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local GetFFlagEnableVRChartsTabFunction = SharedFlagsModule.GetFFlagEnableVRChartsTab
local EnableCentralFoundationOverlayProvider = game:DefineFastFlag("EnableCentralFoundationOverlayProvider", false)
local config = { hideCentralOverlay = false }

local function v18(p1)
	return p1.CentralOverlay.OverlayType
end

local function v19(p1)
	return p1.CentralOverlay.Arguments
end

local function v20(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: Object (copy), config (copy), UseSelectorFunction (copy), v18 (copy), OverlayComponent (copy), v19 (copy), v20 (copy), UseDispatchFunction (copy), ReactModule (copy), CloseCentralOverlayModule (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), IxpUtilsModule (copy), VRPanelWidthIXP (copy), GetFFlagEnableVRChartsTabFunction (copy), RoactModule (copy), CoreGui (copy), Panel3D (copy), VRConstants (copy), EnableCentralFoundationOverlayProvider (copy), VRCentralFoundationOverlayProviderModule (copy)
	local AssignResult = Object.assign({}, config, p1)
	local UseSelectorResult = UseSelectorFunction(v18)
	local OverlayComponentEntry = OverlayComponent[UseSelectorResult]
	local UseSelectorResult1 = UseSelectorFunction(v19)
	local UseSelectorResult2 = UseSelectorFunction(v20)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
		UseDispatchResult(CloseCentralOverlayModule())
	end)
	local UseTestVariablesResult = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local UseTestVariablesResult1 = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseResult (copy)
		if not UseSelectorResult then
			UseResult()
		end
	end, { UseSelectorResult or false })
	local AssignResult1 = UseSelectorResult1
	local OpenPosition = if UseSelectorResult1 then UseSelectorResult1.openPosition else nil
	
	if GetFFlagEnableVRChartsTabFunction() and OpenPosition then
		local XRatio = UseSelectorResult2.X / 2
		AssignResult1 = Object.assign({}, UseSelectorResult1, {
			openPosition = Vector2.new(XRatio + (OpenPosition.X - XRatio) / 1.2, OpenPosition.Y)
		})
	end
	local Element = ReactModule.createElement(OverlayComponentEntry, Object.assign({}, AssignResult1, {
		containerWidth = UseSelectorResult2.X,
		closeCentralOverlayThunk = CloseCentralOverlayModule
	}))
	
	return if AssignResult.hideCentralOverlay or not OverlayComponentEntry then nil else ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		VRCentralOverlay = ReactModule.createElement(Panel3D, {
			panelName = "CentralOverlay",
			partSize = Vector2.new(VRConstants.MainScreenSize.X * (if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult then 1.2 else 1.2 * UseTestVariablesResult), VRConstants.MainScreenSize.Y),
			offset = if FFlagLuaAppForceVrAppPanelWidthRollout or GetFFlagVRPanelWidthIXPEnabledFunction() and UseTestVariablesResult1 == 0 then CFrame.new(VRConstants.CentralOverlayPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(VRConstants.CentralOverlayPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = Vector2.new(UseSelectorResult2.X, UseSelectorResult2.Y),
			curvature = if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult1 then VRConstants.MainScreenCurvature else UseTestVariablesResult1
		}, {
			TextButtonWrapper = ReactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = "",
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				VRCentralFoundationOverlayProvider = if EnableCentralFoundationOverlayProvider then ReactModule.createElement(VRCentralFoundationOverlayProviderModule, nil, { OverlayComponent = Element }) else nil,
				OverlayComponent = if EnableCentralFoundationOverlayProvider then nil else Element
			})
		})
	})
end