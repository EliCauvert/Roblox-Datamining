local parent = script:FindFirstAncestor("GameCollections").Parent
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local responsiveModule = require(parent.Responsive)
local fFlagLuaAppResponsiveEnginePreferredInput = require(parent.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useUserExperiment (ref), appUserLayers (ref), responsiveModule (ref), useUiModeInfo (ref), useAppPolicy (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), uiMode (ref)
	local var1 = useUserExperiment({
		appUserLayers.PlatformExcellenceQualityImprovementConsoles
	}, function(p1)
		-- upvalues: appUserLayers (copy)
		return (p1[appUserLayers.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay
	end)
	local var2 = responsiveModule.useLastInput()
	local var3 = useUiModeInfo()
	local var4 = useAppPolicy(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end)
	local var5 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	local var6 = var1
	
	if var6 then
		if fFlagLuaAppResponsiveEnginePreferredInput then
			var6 = var5 == responsiveModule.Input.Directional
			var6 = nil
		else
			var6 = var2 == responsiveModule.Input.Directional
		end
		if var6 then
			var6 = if var3.uiMode ~= uiMode.TenFoot then var4 else true
		end
	end
	return var6
end