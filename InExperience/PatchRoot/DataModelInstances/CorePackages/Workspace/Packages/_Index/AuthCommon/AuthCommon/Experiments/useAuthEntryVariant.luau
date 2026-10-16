local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseBrowserTrackerExperimentFunction = require(Parent.RoactAppExperiment).useBrowserTrackerExperiment
local UseIXPServiceFunction = require(Parent.RoactAppExperiment).useIXPService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local FFlagGoogleAppleSsoDesktopModule = require(AuthCommon.Flags.FFlagGoogleAppleSsoDesktop)
local FFlagEnableAccountSwitchSsoLogin = require(Parent.SharedFlags).FFlagEnableAccountSwitchSsoLogin
local DebugAuthEntryVariantOverride = game:DefineFastInt("DebugAuthEntryVariantOverride", -1)
local UniversalAppAuthEntryLayer = require(Parent.ExperimentLayers).AppBtidLayers.UniversalAppAuthEntryLayer
local AuthEntryVariant = { Control = 0, Foundation = 1, FoundationSso = 2 }

local function _(Platform) --[[ Line: 37 | Named "isPlatformInPopulation" ]]
	-- upvalues: FFlagGoogleAppleSsoDesktopModule (copy)
	return if Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then FFlagGoogleAppleSsoDesktopModule else Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
end

return {
	AuthEntryVariant = AuthEntryVariant,
	resolveAuthEntryVariant = function(p1, p2, p3: number) --[[ Line: 27 ]]
		-- upvalues: AuthEntryVariant (copy)
		local Foundation = if p3 == nil or p3 < 0 then p1 else p3
		
		return if p2 and (Foundation == AuthEntryVariant.Foundation or Foundation == AuthEntryVariant.FoundationSso) then Foundation else AuthEntryVariant.Control
	end,
	useAuthEntryVariant = function(p1, Enabled) --[[ Line: 44 ]]
		-- upvalues: UseIXPServiceFunction (copy), UseBrowserTrackerExperimentFunction (copy), UniversalAppAuthEntryLayer (copy), UseAppPolicyFunction (copy), UseUiModeInfoFunction (copy), ReactModule (copy), FFlagEnableAccountSwitchSsoLogin (copy), UserInputService (copy), FFlagGoogleAppleSsoDesktopModule (copy), UiMode (copy), IsPioneerLaunchFunction (copy), DebugAuthEntryVariantOverride (copy), AuthEntryVariant (copy)
		local UseIXPServiceResult = UseIXPServiceFunction()
		local UseBrowserTrackerExperimentResult = UseBrowserTrackerExperimentFunction({ UniversalAppAuthEntryLayer }, function(p2) --[[ Line: 46 ]]
			-- upvalues: UniversalAppAuthEntryLayer (upval)
			return (p2[UniversalAppAuthEntryLayer] or {}).authEntryVariant
		end, false)
		local IsBrowserTrackerStatusForLayerMatch = UseIXPServiceResult:GetBrowserTrackerStatusForLayer(UniversalAppAuthEntryLayer) == Enum.IXPLoadingStatus.Initialized
		local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 53 ]]
			return p2.getExcludeExternalIdentityLogin() or p2.getUseVNGUserAgreementPopup()
		end)
		local UiMode1 = UseUiModeInfoFunction().uiMode
		local UseRefResult = ReactModule.useRef(false)
		local NoFFlagEnableAccountSwitchSsoLogin: boolean = not FFlagEnableAccountSwitchSsoLogin or Enabled ~= false
		local P4 = p1 or UserInputService:GetPlatform()
		local Inverted: boolean = if P4 == Enum.Platform.Windows or P4 == Enum.Platform.OSX then FFlagGoogleAppleSsoDesktopModule and (UiMode1 ~= UiMode.TenFoot and (UiMode1 ~= UiMode.VR and (not UseAppPolicyResult and not IsPioneerLaunchFunction()))) else (P4 == Enum.Platform.IOS or P4 == Enum.Platform.Android) and (UiMode1 ~= UiMode.TenFoot and (UiMode1 ~= UiMode.VR and (not UseAppPolicyResult and not IsPioneerLaunchFunction())))
		ReactModule.useEffect(function() --[[ Line: 65 ]]
			-- upvalues: NoFFlagEnableAccountSwitchSsoLogin (copy), Inverted (copy), IsBrowserTrackerStatusForLayerMatch (copy), UseRefResult (copy), UseIXPServiceResult (copy), UniversalAppAuthEntryLayer (upval)
			if NoFFlagEnableAccountSwitchSsoLogin and Inverted and IsBrowserTrackerStatusForLayerMatch and not UseRefResult.current then
				UseRefResult.current = true
				UseIXPServiceResult:LogBrowserTrackerLayerExposure(UniversalAppAuthEntryLayer)
			end
		end, {
			UseIXPServiceResult,
			Inverted,
			IsBrowserTrackerStatusForLayerMatch,
			NoFFlagEnableAccountSwitchSsoLogin
		})
		local UseBrowserTrackerExperimentResult1 = if DebugAuthEntryVariantOverride == nil or DebugAuthEntryVariantOverride < 0 then UseBrowserTrackerExperimentResult else DebugAuthEntryVariantOverride
		
		return if Inverted and (UseBrowserTrackerExperimentResult1 == AuthEntryVariant.Foundation or UseBrowserTrackerExperimentResult1 == AuthEntryVariant.FoundationSso) then UseBrowserTrackerExperimentResult1 else AuthEntryVariant.Control
	end
}