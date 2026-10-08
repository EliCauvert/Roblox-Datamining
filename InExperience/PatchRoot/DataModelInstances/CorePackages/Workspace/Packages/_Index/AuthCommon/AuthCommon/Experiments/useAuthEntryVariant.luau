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
	useAuthEntryVariant = function(p1)
		-- upvalues: useIXPService (ref), useBrowserTrackerExperiment (ref), universalAppAuthEntryLayer (ref), useAppPolicy (ref), useUiModeInfo (ref), reactModule (ref), userInputService (ref), fFlagGoogleAppleSsoDesktopModule (ref), uiMode (ref), isPioneerLaunch (ref), debugAuthEntryVariantOverride (ref), t (ref)
		local var1 = useIXPService()
		local var2 = useBrowserTrackerExperiment({ universalAppAuthEntryLayer }, function(p2)
			-- upvalues: universalAppAuthEntryLayer (copy)
			return (p2[universalAppAuthEntryLayer] or {}).authEntryVariant
		end, false)
		local var3 = var1:GetBrowserTrackerStatusForLayer(universalAppAuthEntryLayer) == Enum.IXPLoadingStatus.Initialized
		local var4 = useAppPolicy(function(p2)
			return p2.getExcludeExternalIdentityLogin() or p2.getUseVNGUserAgreementPopup()
		end)
		local uiMode_1 = useUiModeInfo().uiMode
		local var5 = reactModule.useRef(false)
		p1 = p1 or userInputService:GetPlatform()
		local var6 = if p1 == Enum.Platform.Windows or p1 == Enum.Platform.OSX then fFlagGoogleAppleSsoDesktopModule elseif p1 ~= Enum.Platform.IOS then p1 == Enum.Platform.Android else true
		
		if var6 then
			var6 = uiMode_1 ~= uiMode.TenFoot and (uiMode_1 ~= uiMode.VR and (not var4 and not isPioneerLaunch()))
		end
		reactModule.useEffect(function()
			-- upvalues: var6 (ref), var3 (ref), var5 (ref), var1 (ref), universalAppAuthEntryLayer (copy)
			if var6 and var3 and not var5.current then
				var5.current = true
				var1:LogBrowserTrackerLayerExposure(universalAppAuthEntryLayer)
			end
		end, { var1, var6, var3 })
		local var7 = if debugAuthEntryVariantOverride == nil or debugAuthEntryVariantOverride < 0 then var2 else debugAuthEntryVariantOverride
		
		return if var6 and (var7 == t.Foundation or var7 == t.FoundationSso) then var7 else t.Control
	end
}