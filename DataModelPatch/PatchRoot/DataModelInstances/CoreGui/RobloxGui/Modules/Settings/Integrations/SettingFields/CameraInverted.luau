local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local AvailabilitySignal = SettingsServiceModule.AvailabilitySignal
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: ValueChangedSignal (copy), GameSettings (copy)
	local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.CameraYInverted)
	NewValueChangedSignal:connect(function(CameraYInverted)
		-- upvalues: GameSettings (upval)
		if GameSettings.CameraYInverted ~= CameraYInverted then
			GameSettings.CameraYInverted = CameraYInverted
			
			return
		end
	end, true)
	
	return NewValueChangedSignal
end

local _ = function()
	-- upvalues: AvailabilitySignal (copy), GameSettings (copy)
	local NewAvailabilitySignal = AvailabilitySignal.new(GameSettings.IsUsingCameraYInverted)
	GameSettings.Changed:Connect(function(p1)
		-- upvalues: NewAvailabilitySignal (copy), GameSettings (upval)
		if p1 == "IsUsingCameraYInverted" then
			NewAvailabilitySignal:set(GameSettings.IsUsingCameraYInverted)
		end
	end)
	
	return NewAvailabilitySignal
end

local CameraInvertedModule = {
	id = "camera-inverted",
	label = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
	alreadyLocalized = false,
	field_type = SettingsServiceModule.SettingEnum.Toggle
}
local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.CameraYInverted)
NewValueChangedSignal:connect(function(CameraYInverted)
	-- upvalues: GameSettings (copy)
	if GameSettings.CameraYInverted ~= CameraYInverted then
		GameSettings.CameraYInverted = CameraYInverted
		
		return
	end
end, true)
CameraInvertedModule.onChanged = NewValueChangedSignal
local NewAvailabilitySignal = AvailabilitySignal.new(GameSettings.IsUsingCameraYInverted)
GameSettings.Changed:Connect(function(p1)
	-- upvalues: NewAvailabilitySignal (copy), GameSettings (copy)
	if p1 == "IsUsingCameraYInverted" then
		NewAvailabilitySignal:set(GameSettings.IsUsingCameraYInverted)
	end
end)
CameraInvertedModule.availability = NewAvailabilitySignal
CameraInvertedModule.layoutOrder = LAYOUTORDER.CameraInvertedFrame

return CameraInvertedModule