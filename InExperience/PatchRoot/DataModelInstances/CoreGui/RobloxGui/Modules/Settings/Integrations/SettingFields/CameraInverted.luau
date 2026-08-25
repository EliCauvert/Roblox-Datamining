local settings = script:FindFirstAncestor("Settings")
local gameSettings = UserSettings().GameSettings
local settingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), gameSettings (ref)
	local var5 = valueChangedSignal.new(gameSettings.CameraYInverted)
	var5:connect(function(p0)
		-- upvalues: gameSettings (copy)
		if gameSettings.CameraYInverted == p0 then
			return
		end
		gameSettings.CameraYInverted = p0
	end, true)
	
	return var5
end

local _ = function()
	-- upvalues: availabilitySignal (ref), gameSettings (ref)
	local var6 = availabilitySignal.new(gameSettings.IsUsingCameraYInverted)
	gameSettings.Changed:Connect(function(p1)
		-- upvalues: var6 (ref), gameSettings (copy)
		if p1 == "IsUsingCameraYInverted" then
			var6:set(gameSettings.IsUsingCameraYInverted)
		end
	end)
	
	return var6
end

local t = {
	id = "camera-inverted",
	label = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle
}
local var3 = valueChangedSignal.new(gameSettings.CameraYInverted)
var3:connect(function(p2)
	-- upvalues: gameSettings (ref)
	if gameSettings.CameraYInverted == p2 then
		return
	end
	gameSettings.CameraYInverted = p2
end, true)
t.onChanged = var3
local var4 = availabilitySignal.new(gameSettings.IsUsingCameraYInverted)
gameSettings.Changed:Connect(function(p3)
	-- upvalues: var4 (ref), gameSettings (ref)
	if p3 == "IsUsingCameraYInverted" then
		var4:set(gameSettings.IsUsingCameraYInverted)
	end
end)
t.availability = var4
t.layoutOrder = LAYOUT_ORDER.CameraInvertedFrame

return t