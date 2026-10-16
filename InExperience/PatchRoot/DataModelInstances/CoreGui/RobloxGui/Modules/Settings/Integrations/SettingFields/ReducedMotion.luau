local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _() --[[ Line: 21 | Named "ReducedMotionValue" ]]
	-- upvalues: GameSettings (copy), ValueChangedSignal (copy)
	local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.ReducedMotion)
	NewValueChangedSignal:connect(function(ReducedMotion) --[[ Line: 25 ]]
		-- upvalues: GameSettings (upval)
		if GameSettings.ReducedMotion ~= ReducedMotion then
			GameSettings.ReducedMotion = ReducedMotion
			
			return
		end
	end)
	
	return NewValueChangedSignal
end

local ReducedMotionModule = {
	id = "reduced-motion",
	label = "CoreScripts.InGameMenu.GameSettings.ReduceMotionLabel",
	description = "CoreScripts.InGameMenu.GameSettings.ReduceMotionDescription",
	alreadyLocalized = false,
	field_type = SettingsServiceModule.SettingEnum.Toggle
}
local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.ReducedMotion)
NewValueChangedSignal:connect(function(ReducedMotion) --[[ Line: 25 ]]
	-- upvalues: GameSettings (copy)
	if GameSettings.ReducedMotion ~= ReducedMotion then
		GameSettings.ReducedMotion = ReducedMotion
		
		return
	end
end)
ReducedMotionModule.onChanged = NewValueChangedSignal
ReducedMotionModule.layoutOrder = LAYOUTORDER.ReducedMotionFrame

return ReducedMotionModule