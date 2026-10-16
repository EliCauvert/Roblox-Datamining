local Settings = script:FindFirstAncestor("Settings")
local GameSettings = UserSettings().GameSettings
local GuiService = game:GetService("GuiService")
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local UtilsModule = require(Settings.Integrations.Utils)

local function _(): boolean --[[ Line: 45 | Named "initAvailability" ]]
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getDeviceType() == UtilsModule.DeviceTypes.Desktop or UtilsModule.getDeviceType() == UtilsModule.DeviceTypes.Unknown
end

return {
	id = "fullscreen",
	label = "CoreScripts.InGameMenu.GameSettings.FullScreen",
	alreadyLocalized = false,
	field_type = SettingsServiceModule.SettingEnum.Toggle,
	layoutOrder = require(Settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.FullScreenFrame,
	onChanged = (function() --[[ Line: 24 | Named "FullScreenValue" ]]
		-- upvalues: ValueChangedSignal (copy), GameSettings (copy), GuiService (copy)
		local NewValueChangedSignal = ValueChangedSignal.new(GameSettings:InFullScreen())
		NewValueChangedSignal:connect(function(p1) --[[ Line: 27 ]]
			-- upvalues: GameSettings (upval), GuiService (upval)
			if p1 ~= GameSettings:InFullScreen() then
				GuiService:ToggleFullscreen()
				
				return
			end
		end, true)
		GameSettings.FullscreenChanged:Connect(function(IsFullscreen) --[[ Line: 35 ]]
			-- upvalues: NewValueChangedSignal (copy)
			NewValueChangedSignal:set(IsFullscreen)
		end)
		
		return NewValueChangedSignal
	end)(),
	availability = SettingsServiceModule.AvailabilitySignal.new(UtilsModule.getDeviceType() == UtilsModule.DeviceTypes.Desktop or UtilsModule.getDeviceType() == UtilsModule.DeviceTypes.Unknown)
}