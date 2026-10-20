local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local VolumeSettingsModule = require(script.Parent.VolumeSettings)

return function(p1)
	-- upvalues: ReactModule (copy), UserGameSettings (copy), VolumeSettingsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.PartyVoiceVolume)
	local UseResult = ReactModule.useCallback(function(p2: number)
		-- upvalues: UserGameSettings (upval)
		UserGameSettings.PartyVoiceVolume = p2 / 10
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy)
		local Connection = UserGameSettings:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.PartyVoiceVolume)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end)
	
	return ReactModule.createElement(VolumeSettingsModule, {
		volumeHeaderKey = "CoreScripts.InGameMenu.GameSettings.PartyVoiceVolume",
		volumeSliderDescriptionKey = "Application.Settings.PartyVoiceVolumeSliderDescription",
		formFactor = p1.formFactor,
		layoutOrder = p1.layoutOrder,
		sliderGuiObjectRef = p1.sliderGuiObjectRef,
		value = UseStateResult,
		onValueChanged = UseResult
	})
end