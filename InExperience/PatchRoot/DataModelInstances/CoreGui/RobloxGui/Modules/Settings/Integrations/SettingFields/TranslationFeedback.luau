local RunService = game:GetService("RunService")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local SafetyService = game:GetService("SafetyService")
local SettingsServiceModule = require(game:GetService("CorePackages").Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal
local AvailabilitySignal = SettingsServiceModule.AvailabilitySignal
local SettingEnum = SettingsServiceModule.SettingEnum
local IsEnabled = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface):IsEnabled()
local LAYOUTORDER = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER

local function _() --[[ Line: 24 | Named "TranslationFeedbackValue" ]]
	-- upvalues: ValueChangedSignal (copy), ExperienceStateCaptureService (copy), SafetyService (copy)
	local NewValueChangedSignal = ValueChangedSignal.new()
	NewValueChangedSignal:connect(function() --[[ Line: 27 ]]
		-- upvalues: ExperienceStateCaptureService (upval), SafetyService (upval)
		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not ExperienceStateCaptureService:CanEnterCaptureMode() then return end
		local SettingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
		
		if SettingsHubModule then
			SettingsHubModule:SetVisibility(false)
		end
		if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
			SafetyService.IsCaptureModeForReport = false
		end
		if game:GetEngineFeature("CaptureModeEnabled") then
			ExperienceStateCaptureService:ToggleCaptureMode()
		end
	end)
	
	return NewValueChangedSignal
end

local _ = function() --[[ Line: 53 | Named "TranslationFeedbackAvailability" ]]
	-- upvalues: AvailabilitySignal (copy), RunService (copy), IsEnabled (copy)
	local NewAvailabilitySignal = AvailabilitySignal.new(true)
	
	if RunService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or IsEnabled then
		NewAvailabilitySignal:set(false)
	end
	return NewAvailabilitySignal
end

local NewValueChangedSignal = ValueChangedSignal.new()
NewValueChangedSignal:connect(function() --[[ Line: 27 ]]
	-- upvalues: ExperienceStateCaptureService (copy), SafetyService (copy)
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not ExperienceStateCaptureService:CanEnterCaptureMode() then return end
	local SettingsHubModule = require(script.Parent.Parent.Parent.SettingsHub)
	
	if SettingsHubModule then
		SettingsHubModule:SetVisibility(false)
	end
	if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		SafetyService.IsCaptureModeForReport = false
	end
	if game:GetEngineFeature("CaptureModeEnabled") then
		ExperienceStateCaptureService:ToggleCaptureMode()
	end
end)
local NewAvailabilitySignal = AvailabilitySignal.new(true)

if RunService:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or IsEnabled then
	NewAvailabilitySignal:set(false)
end
return {
	id = "translation-feedback",
	label = "CoreScripts.InGameMenu.GameSettings.GiveTranslationFeedback",
	text = "CoreScripts.InGameMenu.GameSettings.GiveFeedback",
	alreadyLocalized = false,
	field_type = SettingEnum.TextButton,
	onActivated = NewValueChangedSignal,
	layoutOrder = LAYOUTORDER.FeedbackModeButton,
	availability = NewAvailabilitySignal
}