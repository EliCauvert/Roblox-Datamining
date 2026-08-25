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
local var8 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local LAYOUT_ORDER = constantsModule.GAMESETTINGS.LAYOUT_ORDER

local function _()
	-- upvalues: valueChangedSignal (ref), experienceStateCaptureService (ref), safetyService (ref)
	local var11 = valueChangedSignal.new()
	var11:connect(function()
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
	
	return var11
end

local _ = function()
	-- upvalues: availabilitySignal (ref), runService (ref), var8 (ref)
	local var13 = availabilitySignal.new(true)
	
	if runService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or var8 then
		var13:set(false)
	end
	return var13
end

local var9 = valueChangedSignal.new()
var9:connect(function()
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
local var10 = availabilitySignal.new(true)

if runService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or var8 then
	var10:set(false)
end
return {
	id = "translation-feedback",
	label = "CoreScripts.InGameMenu.GameSettings.GiveTranslationFeedback",
	text = "CoreScripts.InGameMenu.GameSettings.GiveFeedback",
	alreadyLocalized = false,
	field_type = settingEnum.TextButton,
	onActivated = var9,
	layoutOrder = LAYOUT_ORDER.FeedbackModeButton,
	availability = var10
}