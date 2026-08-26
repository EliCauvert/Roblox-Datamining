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
	local var1 = valueChangedSignal.new(gameSettings.UiNavigationKeyBindEnabled)
	var1:connect(function(p1)
		-- upvalues: gameSettings (copy)
		if gameSettings.UiNavigationKeyBindEnabled == p1 then
			return
		end
		gameSettings.UiNavigationKeyBindEnabled = p1
	end)
	
	return var1
end

local _ = function()
	-- upvalues: availabilitySignal (ref), userInputService (ref)
	local var1 = availabilitySignal.new(userInputService.KeyboardEnabled)
	userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
		-- upvalues: var1 (ref), userInputService (copy)
		var1:set(userInputService.KeyboardEnabled)
	end)
	
	return var1
end

local t = {
	id = "ui-nav-toggle",
	label = "CoreScripts.InGameMenu.GameSettings.UINavToggle",
	description = "CoreScripts.InGameMenu.GameSettings.UINavToggleDescription",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle
}
local var1 = valueChangedSignal.new(gameSettings.UiNavigationKeyBindEnabled)
var1:connect(function(p1)
	-- upvalues: gameSettings (ref)
	if gameSettings.UiNavigationKeyBindEnabled == p1 then
		return
	end
	gameSettings.UiNavigationKeyBindEnabled = p1
end)
t.onChanged = var1
local var2 = availabilitySignal.new(userInputService.KeyboardEnabled)
userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
	-- upvalues: var2 (ref), userInputService (ref)
	var2:set(userInputService.KeyboardEnabled)
end)
t.availability = var2
t.layoutOrder = LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame

return t