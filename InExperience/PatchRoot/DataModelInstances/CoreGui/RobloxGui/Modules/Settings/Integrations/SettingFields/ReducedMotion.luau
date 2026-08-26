local settings = script:FindFirstAncestor("Settings")
local gameSettings = UserSettings().GameSettings
local settingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local settingEnum = settingsServiceModule.SettingEnum
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: gameSettings (ref), valueChangedSignal (ref)
	local var1 = valueChangedSignal.new(gameSettings.ReducedMotion)
	var1:connect(function(p1)
		-- upvalues: gameSettings (copy)
		if gameSettings.ReducedMotion == p1 then
			return
		end
		gameSettings.ReducedMotion = p1
	end)
	
	return var1
end

local t = {
	id = "reduced-motion",
	label = "CoreScripts.InGameMenu.GameSettings.ReduceMotionLabel",
	description = "CoreScripts.InGameMenu.GameSettings.ReduceMotionDescription",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle
}
local var1 = valueChangedSignal.new(gameSettings.ReducedMotion)
var1:connect(function(p1)
	-- upvalues: gameSettings (ref)
	if gameSettings.ReducedMotion == p1 then
		return
	end
	gameSettings.ReducedMotion = p1
end)
t.onChanged = var1
t.layoutOrder = LAYOUT_ORDER.ReducedMotionFrame

return t