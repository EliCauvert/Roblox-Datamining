local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local InputSize = FoundationModule.Enums.InputSize
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local DeviceSettingsPageSettingModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting)
local Toggle = FoundationModule.Toggle

return function(p1)
	-- upvalues: ReactModule (copy), UserGameSettings (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), DeviceSettingsPageSettingModule (copy), Toggle (copy), InputSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.HapticStrength)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		hapticToggleDescription = "Feature.Accessibility.Description.Haptics",
		hapticHeader = "Feature.Accessibility.Header.Haptics"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UserGameSettings (upval)
		UserGameSettings.HapticStrength = if UserGameSettings.HapticStrength == 1 then 0 else 1
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy)
		local Connection = UserGameSettings:GetPropertyChangedSignal("HapticStrength"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.HapticStrength)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end)
	
	return ReactModule.createElement(DeviceSettingsPageSettingModule, {
		style = UseStyleResult,
		header = UseLocalizationResult.hapticHeader,
		description = UseLocalizationResult.hapticToggleDescription,
		layoutOrder = p1.layoutOrder,
		Control = ReactModule.createElement(Toggle, {
			label = "",
			isChecked = UseStateResult ~= 0,
			onActivated = UseResult,
			size = InputSize.Large
		})
	})
end