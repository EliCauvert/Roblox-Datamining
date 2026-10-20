local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local config = { ON = true, OFF = false }
local config1 = { MAX = 1, MIN = 0 }

return {
	id = "haptics",
	label = "CoreScripts.InGameMenu.GameSettings.Haptics",
	alreadyLocalized = false,
	field_type = SettingsServiceModule.SettingEnum.Toggle,
	layoutOrder = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.HapticsFrame,
	onChanged = (function()
		-- upvalues: GameSettings (copy), ValueChangedSignal (copy), config1 (copy), config (copy)
		local function _(): boolean
			-- upvalues: GameSettings (upval)
			return GameSettings.HapticStrength ~= 0
		end
		
		local NewValueChangedSignal = ValueChangedSignal.new(if GameSettings.HapticStrength == config1.MIN then config.OFF else config.ON)
		NewValueChangedSignal:connect(function(Enabled)
			-- upvalues: GameSettings (upval), config1 (upval), config (upval)
			if (if GameSettings.HapticStrength == config1.MIN then config.OFF else config.ON) ~= Enabled then
				GameSettings.HapticStrength = if Enabled == true then 1 else 0
				
				return
			end
		end)
		
		return NewValueChangedSignal
	end)()
}