local settings = script:FindFirstAncestor("Settings")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local guiService = game:GetService("GuiService")
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local utilsModule = require(settings.Integrations.Utils)

local function _()
	-- upvalues: utilsModule (ref)
	return if utilsModule.getDeviceType() ~= utilsModule.DeviceTypes.Desktop then utilsModule.getDeviceType() == utilsModule.DeviceTypes.Unknown else true
end

return {
	id = "fullscreen",
	label = "CoreScripts.InGameMenu.GameSettings.FullScreen",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle,
	layoutOrder = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.FullScreenFrame,
	onChanged = (function()
		-- upvalues: valueChangedSignal (ref), gameSettings (ref), guiService (ref)
		local var1 = valueChangedSignal.new(gameSettings:InFullScreen())
		var1:connect(function(p1)
			-- upvalues: gameSettings (copy), guiService (copy)
			if p1 == gameSettings:InFullScreen() then
				return
			end
			guiService:ToggleFullscreen()
		end, true)
		gameSettings.FullscreenChanged:Connect(function(p1)
			-- upvalues: var1 (ref)
			var1:set(p1)
		end)
		
		return var1
	end)(),
	availability = availabilitySignal.new(if utilsModule.getDeviceType() ~= utilsModule.DeviceTypes.Desktop then utilsModule.getDeviceType() == utilsModule.DeviceTypes.Unknown else true)
}