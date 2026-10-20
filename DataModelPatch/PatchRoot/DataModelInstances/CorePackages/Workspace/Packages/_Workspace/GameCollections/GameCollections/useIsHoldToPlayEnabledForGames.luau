local Parent = script:FindFirstAncestor("GameCollections").Parent
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local ResponsiveModule = require(Parent.Responsive)
local FFlagLuaAppEnableStickyShortcutBar = require(Parent.SharedFlags).FFlagLuaAppEnableStickyShortcutBar
local FFlagLuaAppResponsiveEnginePreferredInput = require(Parent.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local FFlagGuacStickyShortcutBarEnabled = require(Parent.SharedFlags).FFlagGuacStickyShortcutBarEnabled
local UseIsStickyShortcutBarEnabled = if FFlagLuaAppEnableStickyShortcutBar then require(Parent.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil
local UseAppPolicy = if FFlagGuacStickyShortcutBarEnabled then require(Parent.UniversalAppPolicy).useAppPolicy else nil

return function()
	-- upvalues: UseUserExperimentFunction (copy), AppUserLayers (copy), ResponsiveModule (copy), UseUiModeInfoFunction (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicy (copy), FFlagLuaAppEnableStickyShortcutBar (copy), UseIsStickyShortcutBarEnabled (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), UiMode (copy)
	local UseUserExperimentResult = UseUserExperimentFunction({
		AppUserLayers.PlatformExcellenceQualityImprovementConsoles
	}, function(p1)
		-- upvalues: AppUserLayers (upval)
		return (p1[AppUserLayers.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay
	end)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicy(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end) elseif FFlagLuaAppEnableStickyShortcutBar then UseIsStickyShortcutBarEnabled() else nil
	local UsePreferredInputResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() else nil
	local IsDirectionalMatch: boolean = UseUserExperimentResult
	
	if IsDirectionalMatch then
		IsDirectionalMatch = if FFlagLuaAppResponsiveEnginePreferredInput then UsePreferredInputResult == ResponsiveModule.Input.Directional else UseLastInputResult == ResponsiveModule.Input.Directional
		
		if IsDirectionalMatch then
			IsDirectionalMatch = true
			
			if UseUiModeInfoResult.uiMode ~= UiMode.TenFoot then
				if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then
					return UseAppPolicyResult
				end
				IsDirectionalMatch = false
			end
		end
	end
	return IsDirectionalMatch
end