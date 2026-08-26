local parent = script:FindFirstAncestor("GameCollections").Parent
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local responsiveModule = require(parent.Responsive)
local fFlagLuaAppEnableStickyShortcutBar = require(parent.SharedFlags).FFlagLuaAppEnableStickyShortcutBar
local fFlagLuaAppResponsiveEnginePreferredInput = require(parent.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local fFlagGuacStickyShortcutBarEnabled = require(parent.SharedFlags).FFlagGuacStickyShortcutBarEnabled
local var1 = if fFlagLuaAppEnableStickyShortcutBar then require(parent.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil
local var2 = if fFlagGuacStickyShortcutBarEnabled then require(parent.UniversalAppPolicy).useAppPolicy else nil

return function()
	-- upvalues: useUserExperiment (ref), appUserLayers (ref), responsiveModule (ref), useUiModeInfo (ref), fFlagGuacStickyShortcutBarEnabled (ref), var2 (ref), fFlagLuaAppEnableStickyShortcutBar (ref), var1 (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), uiMode (ref)
	local var3 = useUserExperiment({
		appUserLayers.PlatformExcellenceQualityImprovementConsoles
	}, function(p1)
		-- upvalues: appUserLayers (copy)
		return (p1[appUserLayers.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay
	end)
	local var4 = responsiveModule.useLastInput()
	local var5 = useUiModeInfo()
	local var6 = if fFlagGuacStickyShortcutBarEnabled then var2(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end) elseif fFlagLuaAppEnableStickyShortcutBar then var1() else nil
	local var7 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	local var8 = var3
	
	if var8 then
		if fFlagLuaAppResponsiveEnginePreferredInput then
			var8 = var7 == responsiveModule.Input.Directional
			var8 = nil
		else
			var8 = var4 == responsiveModule.Input.Directional
		end
		if var8 then
			var8 = true
			
			if var5.uiMode ~= uiMode.TenFoot then
				if fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled then
					return var6
				end
				var8 = false
			end
		end
	end
	return var8
end