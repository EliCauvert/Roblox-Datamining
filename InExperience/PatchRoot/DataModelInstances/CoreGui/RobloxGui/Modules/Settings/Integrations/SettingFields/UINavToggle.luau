local UserInputService = game:GetService("UserInputService")
local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local AvailabilitySignal = SettingsServiceModule.AvailabilitySignal
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _() --[[ Line: 23 | Named "UINavValue" ]]
	-- upvalues: ValueChangedSignal (copy), GameSettings (copy)
	local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.UiNavigationKeyBindEnabled)
	NewValueChangedSignal:connect(function(UiNavigationKeyBindEnabled) --[[ Line: 26 ]]
		-- upvalues: GameSettings (upval)
		if GameSettings.UiNavigationKeyBindEnabled ~= UiNavigationKeyBindEnabled then
			GameSettings.UiNavigationKeyBindEnabled = UiNavigationKeyBindEnabled
			
			return
		end
	end)
	
	return NewValueChangedSignal
end

local _ = function() --[[ Line: 39 | Named "UINavAvailability" ]]
	-- upvalues: AvailabilitySignal (copy), UserInputService (copy)
	local NewAvailabilitySignal = AvailabilitySignal.new(UserInputService.KeyboardEnabled)
	UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 42 ]]
		-- upvalues: NewAvailabilitySignal (copy), UserInputService (upval)
		NewAvailabilitySignal:set(UserInputService.KeyboardEnabled)
	end)
	
	return NewAvailabilitySignal
end

local UINavToggleModule = {
	id = "ui-nav-toggle",
	label = "CoreScripts.InGameMenu.GameSettings.UINavToggle",
	description = "CoreScripts.InGameMenu.GameSettings.UINavToggleDescription",
	alreadyLocalized = false,
	field_type = SettingsServiceModule.SettingEnum.Toggle
}
local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.UiNavigationKeyBindEnabled)
NewValueChangedSignal:connect(function(UiNavigationKeyBindEnabled) --[[ Line: 26 ]]
	-- upvalues: GameSettings (copy)
	if GameSettings.UiNavigationKeyBindEnabled ~= UiNavigationKeyBindEnabled then
		GameSettings.UiNavigationKeyBindEnabled = UiNavigationKeyBindEnabled
		
		return
	end
end)
UINavToggleModule.onChanged = NewValueChangedSignal
local NewAvailabilitySignal = AvailabilitySignal.new(UserInputService.KeyboardEnabled)
UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 42 ]]
	-- upvalues: NewAvailabilitySignal (copy), UserInputService (copy)
	NewAvailabilitySignal:set(UserInputService.KeyboardEnabled)
end)
UINavToggleModule.availability = NewAvailabilitySignal
UINavToggleModule.layoutOrder = LAYOUTORDER.UiNavigationKeyBindEnabledFrame

return UINavToggleModule