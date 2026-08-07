local settings = script:FindFirstAncestor("Settings")
local gameSettings = UserSettings().GameSettings
local settingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local settingEnum = settingsServiceModule.SettingEnum
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local t = { ON = true, OFF = false }
local t_1 = { MAX = 1, MIN = 0 }

return {
	id = "haptics",
	label = "CoreScripts.InGameMenu.GameSettings.Haptics",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle,
	layoutOrder = LAYOUT_ORDER.HapticsFrame,
	onChanged = (function() --[[ line: 29 | named "HapticValue" ]]
		-- upvalues: gameSettings (ref), valueChangedSignal (ref), t_1 (ref), t (ref)
		local _ = function() --[[ line: 30 ]]
			-- upvalues: gameSettings (copy)
			return gameSettings.HapticStrength ~= 0
		end
		
		local var4 = valueChangedSignal.new(if gameSettings.HapticStrength == t_1.MIN then t.OFF else t.ON)
		var4:connect(function(p0) --[[ line: 35 ]]
			-- upvalues: gameSettings (copy), t_1 (copy), t (copy)
			if (if gameSettings.HapticStrength == t_1.MIN then t.OFF else t.ON) == p0 then
				return
			end
			gameSettings.HapticStrength = if p0 == true then 1 else 0
		end)
		
		return var4
	end)()
}