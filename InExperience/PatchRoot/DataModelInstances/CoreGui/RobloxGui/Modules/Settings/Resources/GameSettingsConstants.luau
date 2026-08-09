local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local corePackagesService = game:GetService("CorePackages")
local partyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local getFFlagEnablePlayerNamesEnabledSettingModule = require(modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local fFlagBadgeVisibilitySettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local fFlagEnableModerateChatRemoteEvent = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local fFlagIEMSettingsGroupsModule = require(modules.Settings.Flags.FFlagIEMSettingsGroups)
local fFlagAIRephraseSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local updateRephraseSettingUI = game:DefineFastFlag("UpdateRephraseSettingUI", false)
local fFlagChatSummariesSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChatSummariesSettingEnabled
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local chatModerationFrameLayoutOrder = game:DefineFastInt("ChatModerationFrameLayoutOrder", 9)
local t = { OverscanAdjustButton = 1 }

if fFlagEnableModerateChatRemoteEvent then
	t.ChatModerationFrame = chatModerationFrameLayoutOrder
end
t.ShiftLockFrame = 10
t.CameraModeFrame = 11
t.MovementModeFrame = 12
t.FramerateCap = 13
t.GamepadSensitivityFrame = 14
t.CameraInvertedFrame = 90
t.CameraDeviceFrame = 91
t.MouseAdvancedFrame = 50
t.VoiceConnectDisconnectSelector = 17
t.VoiceConnectFrame = 18
t.VoiceDisconnectFrame = 19

if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
	t.PlayerChoiceTranslationFrame = 20
	t.LanguageSelectorFrame = 21
	t.ChatTranslationFrame = 30
	t.ChatLanguageSelectorFrame = 31
	t.ChatTranslationToggleFrame = 32
	t.FeedbackModeButton = 40
else
	t.LanguageSelectorFrame = 20
	t.FeedbackModeButton = 30
	t.ChatTranslationFrame = 40
	t.ChatLanguageSelectorFrame = 41
	t.ChatTranslationToggleFrame = 42
end
if isInExperienceUIVREnabled then
	t.VRComfortSettingFrame = 54
	t.VRVignetteEnabledFrame = 55
	t.VRSteppedRotationEnabledFrame = 56
	t.VRThirdPersonFixedCamEnabledFrame = 57
	t.VRSafetyBubbleModeFrame = 58
end
t.DeviceFrameInput = 60
t.DeviceFrameOutput = 61
t.VolumeFrame = 62

if partyVoiceVolumeEngineFeature then
	t.PartyVoiceVolumeFrame = 63
end
t.HapticsFrame = if partyVoiceVolumeEngineFeature then 64 else 63
t.FullScreenFrame = 70
t.GraphicsEnablerFrame = 71
t.GraphicsQualityFrame = 72
t.ReducedMotionFrame = 73
t.PreferredTransparencyFrame = 74
t.PreferredTextSizeFrame = 75
t.UiNavigationKeyBindEnabledFrame = 76
t.PerformanceStatsFrame = 80
t.MicroProfilerFrame = 81
t.VREnabledFrame = 100
t.DeveloperConsoleButton = 101

if getFFlagEnablePlayerNamesEnabledSettingModule() then
	t.PlayerNamesEnabledFrame = 105
end
if fFlagBadgeVisibilitySettingEnabled then
	t.BadgeVisibilityFrame = 106
end
if fFlagAIRephraseSettingEnabled then
	t.AIRephraseFrame = if updateRephraseSettingUI then 20 else 43
end
if fFlagChatSummariesSettingEnabled then
	t.ChatSummariesFrame = 20
end
t.UiToggleRow = 200
t.UiToggleRowCustom = 200
t.UiToggleRowBillboards = 201
t.UiToggleRowNameplates = 202
t.FreecamToggleRow = 203
t.InformationFrame = 999
local t_1 = nil

if fFlagIEMSettingsGroupsModule then
	local var9 = reactUtilsModule.createNextOrder()
	t_1 = {
		AudioHeader = var9(),
		VolumeFrame = var9(),
		PartyVoiceVolumeFrame = var9(),
		DeviceFrameInput = var9(),
		DeviceFrameOutput = var9(),
		AudioDivider = var9(),
		LanguageHeader = var9(),
		ChatModerationFrame = var9(),
		VoiceConnectDisconnectSelector = var9(),
		VoiceConnectFrame = var9(),
		VoiceDisconnectFrame = var9(),
		ChatSummariesFrame = if fFlagChatSummariesSettingEnabled then var9() else nil,
		AIRephraseFrame = if fFlagAIRephraseSettingEnabled then var9() else nil,
		PlayerChoiceTranslationFrame = if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then var9() else nil,
		LanguageSelectorFrame = var9(),
		FeedbackModeButton = var9(),
		ChatTranslationFrame = var9(),
		ChatLanguageSelectorFrame = var9(),
		ChatTranslationToggleFrame = var9(),
		LanguageDivider = var9(),
		DisplayHeader = var9(),
		OverscanAdjustButton = var9(),
		FullScreenFrame = var9(),
		PreferredTransparencyFrame = var9(),
		PreferredTextSizeFrame = var9(),
		VRComfortSettingFrame = if isInExperienceUIVREnabled then var9() else nil,
		VRVignetteEnabledFrame = if isInExperienceUIVREnabled then var9() else nil,
		VRSteppedRotationEnabledFrame = if isInExperienceUIVREnabled then var9() else nil,
		VRThirdPersonFixedCamEnabledFrame = if isInExperienceUIVREnabled then var9() else nil,
		VRSafetyBubbleModeFrame = if isInExperienceUIVREnabled then var9() else nil,
		PerformanceStatsFrame = var9(),
		MicroProfilerFrame = var9(),
		GraphicsEnablerFrame = var9(),
		GraphicsQualityFrame = var9(),
		HapticsFrame = var9(),
		ReducedMotionFrame = var9(),
		FramerateCap = var9(),
		VREnabledFrame = var9(),
		DisplayDivider = var9(),
		ViewAndControlsHeader = var9(),
		CameraModeFrame = var9(),
		CameraInvertedFrame = var9(),
		CameraSensitivityFrame = var9(),
		MouseAdvancedFrame = var9(),
		GamepadSensitivityFrame = var9(),
		MovementModeFrame = var9(),
		ShiftLockFrame = var9(),
		CameraDeviceFrame = var9(),
		UiNavigationKeyBindEnabledFrame = var9(),
		DeveloperConsoleButton = var9(),
		PlayerNamesEnabledFrame = if getFFlagEnablePlayerNamesEnabledSettingModule() then var9() else nil,
		BadgeVisibilityFrame = if fFlagBadgeVisibilitySettingEnabled then var9() else nil,
		UiToggleRow = var9(),
		UiToggleRowCustom = var9(),
		UiToggleRowBillboards = var9(),
		UiToggleRowNameplates = var9(),
		FreecamToggleRow = var9(),
		InformationFrame = var9()
	}
end
local function _() --[[ line: 195 | named "getLayoutOrder" ]]
	-- upvalues: fFlagIEMSettingsGroupsModule (ref), t_1 (write), t (ref)
	local _ = {}
	
	return if fFlagIEMSettingsGroupsModule then t_1 else t
end

return {
	SETTINGS_MENU_LAYOUT_ORDER = if fFlagIEMSettingsGroupsModule then t_1 else t
}