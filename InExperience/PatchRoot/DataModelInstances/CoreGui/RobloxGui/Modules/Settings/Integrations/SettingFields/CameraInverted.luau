local settings = script:FindFirstAncestor("Settings")
local gameSettings = UserSettings().GameSettings
local settingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), gameSettings (ref)
	local var1 = valueChangedSignal.new(gameSettings.CameraYInverted)
	var1:connect(function(p1)
		-- upvalues: gameSettings (copy)
		if gameSettings.CameraYInverted == p1 then
			return
		end
		gameSettings.CameraYInverted = p1
	end, true)
	
	return var1
end

local _ = function()
	-- upvalues: availabilitySignal (ref), gameSettings (ref)
	local var1 = availabilitySignal.new(gameSettings.IsUsingCameraYInverted)
	gameSettings.Changed:Connect(function(p1)
		-- upvalues: var1 (ref), gameSettings (copy)
		if p1 == "IsUsingCameraYInverted" then
			var1:set(gameSettings.IsUsingCameraYInverted)
		end
	end)
	
	return var1
end

local t = {
	id = "camera-inverted",
	label = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle
}
local var1 = valueChangedSignal.new(gameSettings.CameraYInverted)
var1:connect(function(p1)
	-- upvalues: gameSettings (ref)
	if gameSettings.CameraYInverted == p1 then
		return
	end
	gameSettings.CameraYInverted = p1
end, true)
t.onChanged = var1
local var2 = availabilitySignal.new(gameSettings.IsUsingCameraYInverted)
gameSettings.Changed:Connect(function(p1)
	-- upvalues: var2 (ref), gameSettings (ref)
	if p1 == "IsUsingCameraYInverted" then
		var2:set(gameSettings.IsUsingCameraYInverted)
	end
end)
t.availability = var2
t.layoutOrder = LAYOUT_ORDER.CameraInvertedFrame

return t