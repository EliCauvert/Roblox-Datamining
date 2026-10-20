local Parent = script:FindFirstAncestor("GameCollections").Parent
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local ResponsiveModule = require(Parent.Responsive)
local FFlagLuaAppResponsiveEnginePreferredInput = require(Parent.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: UseUserExperimentFunction (copy), AppUserLayers (copy), ResponsiveModule (copy), UseUiModeInfoFunction (copy), UseAppPolicyFunction (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), UiMode (copy)
	local UseUserExperimentResult = UseUserExperimentFunction({
		AppUserLayers.PlatformExcellenceQualityImprovementConsoles
	}, function(p1)
		-- upvalues: AppUserLayers (upval)
		return (p1[AppUserLayers.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay
	end)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end)
	local UsePreferredInputResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() else nil
	
	return UseUserExperimentResult and (if FFlagLuaAppResponsiveEnginePreferredInput then UsePreferredInputResult == ResponsiveModule.Input.Directional and (UseUiModeInfoResult.uiMode == UiMode.TenFoot or UseAppPolicyResult) else UseLastInputResult == ResponsiveModule.Input.Directional and (UseUiModeInfoResult.uiMode == UiMode.TenFoot or UseAppPolicyResult))
end