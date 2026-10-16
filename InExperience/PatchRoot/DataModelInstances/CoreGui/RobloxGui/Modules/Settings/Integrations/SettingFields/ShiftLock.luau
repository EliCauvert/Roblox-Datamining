local UserInputService = game:GetService("UserInputService")
local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local AvailabilitySignal = SettingsServiceModule.AvailabilitySignal
local VisibilitySignal = SettingsServiceModule.VisibilitySignal
local SettingEnum = SettingsServiceModule.SettingEnum
local LocalPlayer = game:GetService("Players").LocalPlayer
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local config = {
	[Enum.ControlMode.MouseLockSwitch] = true,
	[Enum.ControlMode.Classic] = false
}

local function _() --[[ Line: 31 | Named "ShiftLockValue" ]]
	-- upvalues: config (copy), GameSettings (copy), ValueChangedSignal (copy)
	local NewValueChangedSignal = ValueChangedSignal.new(config[GameSettings.ControlMode])
	NewValueChangedSignal:connect(function(p1) --[[ Line: 34 ]]
		-- upvalues: config (upval), GameSettings (upval)
		if config[GameSettings.ControlMode] ~= p1 then
			GameSettings.ControlMode = if p1 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
			
			return
		end
	end)
	
	return NewValueChangedSignal
end

local function ShiftLockAvailability(_, NewResult) --[[ Line: 45 ]]
	-- upvalues: LocalPlayer (copy), UserInputService (copy), AvailabilitySignal (copy)
	local function _() --[[ Line: 46 | Named "available" ]]
		-- upvalues: LocalPlayer (upval), UserInputService (upval)
		local NoLocalPlayer = not LocalPlayer or LocalPlayer.DevEnableMouseLock
		
		return UserInputService.MouseEnabled and (UserInputService.KeyboardEnabled and NoLocalPlayer)
	end
	
	local NoLocalPlayer = not LocalPlayer or LocalPlayer.DevEnableMouseLock
	local NewAvailabilitySignal = AvailabilitySignal.new(UserInputService.MouseEnabled and (UserInputService.KeyboardEnabled and NoLocalPlayer))
	NewAvailabilitySignal:connect(function(p1) --[[ Line: 52 ]]
		-- upvalues: NewResult (copy)
		if p1 then
			NewResult:set(p1)
		end
	end, true)
	
	if LocalPlayer then
		LocalPlayer.Changed:Connect(function(p1) --[[ Line: 59 ]]
			-- upvalues: NewAvailabilitySignal (copy), LocalPlayer (upval), UserInputService (upval)
			if p1 == "DevEnableMouseLock" then
				local NoLocalPlayer = not LocalPlayer or LocalPlayer.DevEnableMouseLock
				NewAvailabilitySignal:set(UserInputService.MouseEnabled and (UserInputService.KeyboardEnabled and NoLocalPlayer))
			end
		end)
	end
	UserInputService.Changed:Connect(function(p1) --[[ Line: 66 ]]
		-- upvalues: NewAvailabilitySignal (copy), LocalPlayer (upval), UserInputService (upval)
		if p1 == "MouseEnabled" or p1 == "KeyboardEnabled" then
			local NoLocalPlayer = not LocalPlayer or LocalPlayer.DevEnableMouseLock
			NewAvailabilitySignal:set(UserInputService.MouseEnabled and (UserInputService.KeyboardEnabled and NoLocalPlayer))
		end
	end)
	
	return NewAvailabilitySignal
end

local NewValueChangedSignal = ValueChangedSignal.new(config[GameSettings.ControlMode])
NewValueChangedSignal:connect(function(p1) --[[ Line: 34 ]]
	-- upvalues: config (copy), GameSettings (copy)
	if config[GameSettings.ControlMode] ~= p1 then
		GameSettings.ControlMode = if p1 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
		
		return
	end
end)
local NewVisibilitySignal = VisibilitySignal.new(true)

return {
	id = "shift-lock",
	label = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
	alreadyLocalized = false,
	field_type = SettingEnum.Toggle,
	onChanged = NewValueChangedSignal,
	availability = ShiftLockAvailability(NewValueChangedSignal, NewVisibilitySignal),
	visibility = NewVisibilitySignal,
	layoutOrder = LAYOUTORDER.ShiftLockFrame
}