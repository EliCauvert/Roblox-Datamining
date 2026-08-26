local settings = script:FindFirstAncestor("Settings")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local gameSettings = UserSettings().GameSettings
local playersService = game:GetService("Players")
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local visibilitySignal = settingsServiceModule.VisibilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local localPlayer = playersService.LocalPlayer
local LAYOUT_ORDER = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER
local t = {
	[Enum.ControlMode.MouseLockSwitch] = true,
	[Enum.ControlMode.Classic] = false
}

local function _()
	-- upvalues: t (ref), gameSettings (ref), valueChangedSignal (ref)
	local var1 = valueChangedSignal.new(t[gameSettings.ControlMode])
	var1:connect(function(p1)
		-- upvalues: t (copy), gameSettings (copy)
		if t[gameSettings.ControlMode] == p1 then
			return
		end
		gameSettings.ControlMode = if p1 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
	end)
	
	return var1
end

local function ShiftLockAvailability(_, p1)
	-- upvalues: localPlayer (ref), userInputService (ref), availabilitySignal (ref)
	local function _()
		-- upvalues: localPlayer (copy), userInputService (copy)
		return userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true))
	end
	
	local var1 = availabilitySignal.new(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
	var1:connect(function(p2)
		-- upvalues: p1 (ref)
		if p2 then
			p1:set(p2)
		end
	end, true)
	
	if localPlayer then
		localPlayer.Changed:Connect(function(p2)
			-- upvalues: var1 (ref), localPlayer (copy), userInputService (copy)
			if p2 == "DevEnableMouseLock" then
				var1:set(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
			end
		end)
	end
	userInputService.Changed:Connect(function(p2)
		-- upvalues: var1 (ref), localPlayer (copy), userInputService (copy)
		if p2 == "MouseEnabled" or p2 == "KeyboardEnabled" then
			var1:set(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
		end
	end)
	
	return var1
end

local var1 = valueChangedSignal.new(t[gameSettings.ControlMode])
var1:connect(function(p1)
	-- upvalues: t (ref), gameSettings (ref)
	if t[gameSettings.ControlMode] == p1 then
		return
	end
	gameSettings.ControlMode = if p1 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
end)
local var2 = visibilitySignal.new(true)

return {
	id = "shift-lock",
	label = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle,
	onChanged = var1,
	availability = ShiftLockAvailability(var1, var2),
	visibility = var2,
	layoutOrder = LAYOUT_ORDER.ShiftLockFrame
}