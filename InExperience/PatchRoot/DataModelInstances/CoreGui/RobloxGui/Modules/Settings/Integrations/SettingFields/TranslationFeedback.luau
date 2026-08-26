local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local settings = script:FindFirstAncestor("Settings")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local safetyService = game:GetService("SafetyService")
local constantsModule = require(settings.Integrations.Constants)
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal
local availabilitySignal = settingsServiceModule.AvailabilitySignal
local settingEnum = settingsServiceModule.SettingEnum
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local LAYOUT_ORDER = constantsModule.GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), experienceStateCaptureService (ref), safetyService (ref)
	local var2 = valueChangedSignal.new()
	var2:connect(function()
		-- upvalues: experienceStateCaptureService (copy), safetyService (copy)
		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not experienceStateCaptureService:CanEnterCaptureMode() then return end
		local settingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
		
		if settingsHubModule then
			settingsHubModule:SetVisibility(false)
		end
		if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
			safetyService.IsCaptureModeForReport = false
		end
		if game:GetEngineFeature("CaptureModeEnabled") then
			experienceStateCaptureService:ToggleCaptureMode()
		end
	end)
	
	return var2
end

local _ = function()
	-- upvalues: availabilitySignal (ref), runService (ref), var1 (ref)
	local var2 = availabilitySignal.new(true)
	
	if runService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or var1 then
		var2:set(false)
	end
	return var2
end

local var2 = valueChangedSignal.new()
var2:connect(function()
	-- upvalues: experienceStateCaptureService (ref), safetyService (ref)
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not experienceStateCaptureService:CanEnterCaptureMode() then return end
	local settingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
	
	if settingsHubModule then
		settingsHubModule:SetVisibility(false)
	end
	if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		safetyService.IsCaptureModeForReport = false
	end
	if game:GetEngineFeature("CaptureModeEnabled") then
		experienceStateCaptureService:ToggleCaptureMode()
	end
end)
local var3 = availabilitySignal.new(true)

if runService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or var1 then
	var3:set(false)
end
return {
	id = "translation-feedback",
	label = "CoreScripts.InGameMenu.GameSettings.GiveTranslationFeedback",
	text = "CoreScripts.InGameMenu.GameSettings.GiveFeedback",
	alreadyLocalized = false,
	field_type = settingEnum.TextButton,
	onActivated = var2,
	layoutOrder = LAYOUT_ORDER.FeedbackModeButton,
	availability = var3
}