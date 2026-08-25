local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local playerPermissionsModule = require(robloxGui.Modules.PlayerPermissionsModule)
local constantsModule = require(script:FindFirstAncestor("Settings").Integrations.Constants)
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local devConsoleMasterModule = require(script.Parent.Parent.Parent.Parent.DevConsoleMaster)
local LAYOUT_ORDER = constantsModule.GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), devConsoleMasterModule (ref)
	local var10 = valueChangedSignal.new()
	var10:connect(function()
		-- upvalues: devConsoleMasterModule (copy)
		if devConsoleMasterModule then
			devConsoleMasterModule:SetVisibility(true)
			local settingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
			
			if settingsHubModule then
				settingsHubModule:SetVisibility(false)
			end
		end
	end)
	
	return var10
end

local function DeveloperConsoleAvailability()
	-- upvalues: availabilitySignal (ref), runService (ref), playerPermissionsModule (ref), playersService (ref)
	local var12 = availabilitySignal.new(false)
	
	if runService:IsStudio() then
		var12:set(true)
		
		return var12
	end
	spawn(function()
		-- upvalues: playerPermissionsModule (copy), playersService (copy), var12 (ref)
		var12:set(playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer))
	end)
	
	return var12
end

local var9 = valueChangedSignal.new()
var9:connect(function()
	-- upvalues: devConsoleMasterModule (ref)
	if devConsoleMasterModule then
		devConsoleMasterModule:SetVisibility(true)
		local settingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
		
		if settingsHubModule then
			settingsHubModule:SetVisibility(false)
		end
	end
end)

return {
	id = "developer-console",
	label = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole",
	text = "CoreScripts.InGameMenu.GameSettings.Open",
	alreadyLocalized = false,
	field_type = settingEnum.TextButton,
	onActivated = var9,
	layoutOrder = LAYOUT_ORDER.DeveloperConsoleButton,
	availability = DeveloperConsoleAvailability()
}