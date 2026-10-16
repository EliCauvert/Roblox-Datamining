local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PlayerPermissionsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local AvailabilitySignal = SettingsServiceModule.AvailabilitySignal
local SettingEnum = SettingsServiceModule.SettingEnum
local DevConsoleMasterModule = require(script.Parent.Parent.Parent.Parent.DevConsoleMaster)
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _() --[[ Line: 22 | Named "DeveloperConsoleValue" ]]
	-- upvalues: ValueChangedSignal (copy), DevConsoleMasterModule (copy)
	local NewValueChangedSignal = ValueChangedSignal.new()
	NewValueChangedSignal:connect(function() --[[ Line: 25 ]]
		-- upvalues: DevConsoleMasterModule (upval)
		if DevConsoleMasterModule then
			DevConsoleMasterModule:SetVisibility(true)
			local SettingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
			
			if SettingsHubModule then
				SettingsHubModule:SetVisibility(false)
			end
		end
	end)
	
	return NewValueChangedSignal
end

local function DeveloperConsoleAvailability() --[[ Line: 40 ]]
	-- upvalues: AvailabilitySignal (copy), RunService (copy), PlayerPermissionsModule (copy), Players (copy)
	local NewAvailabilitySignal = AvailabilitySignal.new(false)
	
	if RunService:IsStudio() then
		NewAvailabilitySignal:set(true)
		
		return NewAvailabilitySignal
	else
		spawn(function() --[[ Line: 46 ]]
			-- upvalues: PlayerPermissionsModule (upval), Players (upval), NewAvailabilitySignal (copy)
			NewAvailabilitySignal:set((PlayerPermissionsModule.CanPlayerManagePlaceAsync(Players.LocalPlayer)))
		end)
		
		return NewAvailabilitySignal
	end
end

local NewValueChangedSignal = ValueChangedSignal.new()
NewValueChangedSignal:connect(function() --[[ Line: 25 ]]
	-- upvalues: DevConsoleMasterModule (copy)
	if DevConsoleMasterModule then
		DevConsoleMasterModule:SetVisibility(true)
		local SettingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
		
		if SettingsHubModule then
			SettingsHubModule:SetVisibility(false)
		end
	end
end)

return {
	id = "developer-console",
	label = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole",
	text = "CoreScripts.InGameMenu.GameSettings.Open",
	alreadyLocalized = false,
	field_type = SettingEnum.TextButton,
	onActivated = NewValueChangedSignal,
	layoutOrder = LAYOUTORDER.DeveloperConsoleButton,
	availability = DeveloperConsoleAvailability()
}