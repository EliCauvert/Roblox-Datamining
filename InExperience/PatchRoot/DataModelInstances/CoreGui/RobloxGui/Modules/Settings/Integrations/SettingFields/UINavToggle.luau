local settings = script:FindFirstAncestor("Settings")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local gameSettings = UserSettings().GameSettings
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), gameSettings (ref)
	local var7 = valueChangedSignal.new(gameSettings.UiNavigationKeyBindEnabled)
	var7:connect(function(p0)
		-- upvalues: gameSettings (copy)
		if gameSettings.UiNavigationKeyBindEnabled == p0 then
			return
		end
		gameSettings.UiNavigationKeyBindEnabled = p0
	end)
	
	return var7
end

local _ = function()
	-- upvalues: availabilitySignal (ref), userInputService (ref)
	local var8 = availabilitySignal.new(userInputService.KeyboardEnabled)
	userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
		-- upvalues: var8 (ref), userInputService (copy)
		var8:set(userInputService.KeyboardEnabled)
	end)
	
	return var8
end

local t = {
	id = "ui-nav-toggle",
	label = "CoreScripts.InGameMenu.GameSettings.UINavToggle",
	description = "CoreScripts.InGameMenu.GameSettings.UINavToggleDescription",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle
}
local var5 = valueChangedSignal.new(gameSettings.UiNavigationKeyBindEnabled)
var5:connect(function(p1)
	-- upvalues: gameSettings (ref)
	if gameSettings.UiNavigationKeyBindEnabled == p1 then
		return
	end
	gameSettings.UiNavigationKeyBindEnabled = p1
end)
t.onChanged = var5
local var6 = availabilitySignal.new(userInputService.KeyboardEnabled)
userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
	-- upvalues: var6 (ref), userInputService (ref)
	var6:set(userInputService.KeyboardEnabled)
end)
t.availability = var6
t.layoutOrder = LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame

return t