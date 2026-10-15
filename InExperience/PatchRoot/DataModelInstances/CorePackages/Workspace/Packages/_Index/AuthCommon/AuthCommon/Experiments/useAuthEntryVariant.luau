local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useBrowserTrackerExperiment = require(parent.RoactAppExperiment).useBrowserTrackerExperiment
local useIXPService = require(parent.RoactAppExperiment).useIXPService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local appBtidLayers = require(parent.ExperimentLayers).AppBtidLayers
local fFlagGoogleAppleSsoDesktopModule = require(authCommon.Flags.FFlagGoogleAppleSsoDesktop)
local fFlagEnableAccountSwitchSsoLogin = require(parent.SharedFlags).FFlagEnableAccountSwitchSsoLogin
local debugAuthEntryVariantOverride = game:DefineFastInt("DebugAuthEntryVariantOverride", -1)
local universalAppAuthEntryLayer = appBtidLayers.UniversalAppAuthEntryLayer
local t = { Control = 0, Foundation = 1, FoundationSso = 2 }

local function _(a)
	-- upvalues: fFlagGoogleAppleSsoDesktopModule (ref)
	return if a == Enum.Platform.Windows or a == Enum.Platform.OSX then fFlagGoogleAppleSsoDesktopModule elseif a ~= Enum.Platform.IOS then a == Enum.Platform.Android else true
end

return {
	AuthEntryVariant = t,
	resolveAuthEntryVariant = function(p1, p2, p3)
		-- upvalues: t (ref)
		local var1 = if p3 == nil or p3 < 0 then p1 else p3
		
		return if p2 and (var1 == t.Foundation or var1 == t.FoundationSso) then var1 else t.Control
	end,
	useAuthEntryVariant = function(p1, p2)
		-- upvalues: useIXPService (ref), useBrowserTrackerExperiment (ref), universalAppAuthEntryLayer (ref), useAppPolicy (ref), useUiModeInfo (ref), reactModule (ref), fFlagEnableAccountSwitchSsoLogin (ref), userInputService (ref), fFlagGoogleAppleSsoDesktopModule (ref), uiMode (ref), isPioneerLaunch (ref), debugAuthEntryVariantOverride (ref), t (ref)
		local var1
		local var2 = useIXPService()
		local var3 = useBrowserTrackerExperiment({ universalAppAuthEntryLayer }, function(p3)
			-- upvalues: universalAppAuthEntryLayer (copy)
			return (p3[universalAppAuthEntryLayer] or {}).authEntryVariant
		end, false)
		local var4 = var2:GetBrowserTrackerStatusForLayer(universalAppAuthEntryLayer) == Enum.IXPLoadingStatus.Initialized
		local var5 = useAppPolicy(function(p3)
			return p3.getExcludeExternalIdentityLogin() or p3.getUseVNGUserAgreementPopup()
		end)
		local uiMode_1 = useUiModeInfo().uiMode
		local var6 = reactModule.useRef(false)
		
		if fFlagEnableAccountSwitchSsoLogin then
			var1 = p2 ~= false
			var1 = nil
		else
			var1 = true
		end
		p1 = p1 or userInputService:GetPlatform()
		local var7 = if p1 == Enum.Platform.Windows or p1 == Enum.Platform.OSX then fFlagGoogleAppleSsoDesktopModule elseif p1 ~= Enum.Platform.IOS then p1 == Enum.Platform.Android else true
		
		if var7 then
			var7 = uiMode_1 ~= uiMode.TenFoot and (uiMode_1 ~= uiMode.VR and (not var5 and not isPioneerLaunch()))
		end
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var7 (ref), var4 (ref), var6 (ref), var2 (ref), universalAppAuthEntryLayer (copy)
			if var1 and var7 and (var4 and not var6.current) then
				var6.current = true
				var2:LogBrowserTrackerLayerExposure(universalAppAuthEntryLayer)
			end
		end, { var2, var7, var4, var1 })
		local var8 = if debugAuthEntryVariantOverride == nil or debugAuthEntryVariantOverride < 0 then var3 else debugAuthEntryVariantOverride
		
		return if var7 and (var8 == t.Foundation or var8 == t.FoundationSso) then var8 else t.Control
	end
}