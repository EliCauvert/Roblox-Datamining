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

local function _() --[[ line: 31 | named "ShiftLockValue" ]]
	-- upvalues: t (ref), gameSettings (ref), valueChangedSignal (ref)
	local var9 = valueChangedSignal.new(t[gameSettings.ControlMode])
	var9:connect(function(p0) --[[ line: 34 ]]
		-- upvalues: t (copy), gameSettings (copy)
		if t[gameSettings.ControlMode] == p0 then
			return
		end
		gameSettings.ControlMode = if p0 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
	end)
	
	return var9
end

local function ShiftLockAvailability(_, p1) --[[ line: 45 ]]
	-- upvalues: localPlayer (ref), userInputService (ref), availabilitySignal (ref)
	local function _() --[[ line: 46 | named "available" ]]
		-- upvalues: localPlayer (copy), userInputService (copy)
		return userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true))
	end
	
	local var10 = availabilitySignal.new(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
	var10:connect(function(p2) --[[ line: 52 ]]
		-- upvalues: p1 (ref)
		if p2 then
			p1:set(p2)
		end
	end, true)
	
	if localPlayer then
		localPlayer.Changed:Connect(function(p3) --[[ line: 59 ]]
			-- upvalues: var10 (ref), localPlayer (copy), userInputService (copy)
			if p3 == "DevEnableMouseLock" then
				var10:set(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
			end
		end)
	end
	userInputService.Changed:Connect(function(p4) --[[ line: 66 ]]
		-- upvalues: var10 (ref), localPlayer (copy), userInputService (copy)
		if p4 == "MouseEnabled" or p4 == "KeyboardEnabled" then
			var10:set(userInputService.MouseEnabled and (userInputService.KeyboardEnabled and (if localPlayer then localPlayer.DevEnableMouseLock else true)))
		end
	end)
	
	return var10
end

local var7 = valueChangedSignal.new(t[gameSettings.ControlMode])
var7:connect(function(p5) --[[ line: 34 ]]
	-- upvalues: t (ref), gameSettings (ref)
	if t[gameSettings.ControlMode] == p5 then
		return
	end
	gameSettings.ControlMode = if p5 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic
end)
local var8 = visibilitySignal.new(true)

return {
	id = "shift-lock",
	label = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
	alreadyLocalized = false,
	field_type = settingEnum.Toggle,
	onChanged = var7,
	availability = ShiftLockAvailability(var7, var8),
	visibility = var8,
	layoutOrder = LAYOUT_ORDER.ShiftLockFrame
}