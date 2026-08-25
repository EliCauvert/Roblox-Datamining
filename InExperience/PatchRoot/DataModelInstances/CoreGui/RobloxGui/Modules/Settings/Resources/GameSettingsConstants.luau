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
local fFlagExpChatEnableFriendsTab = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
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
if fFlagExpChatEnableFriendsTab then
	t.ChatNotificationsFrame = 44
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

if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
	t.VoiceChatVolumeFrame = 63
	
	if partyVoiceVolumeEngineFeature then
		t.PartyVoiceVolumeFrame = 64
	end
	t.HapticsFrame = if partyVoiceVolumeEngineFeature then 65 else 64
elseif partyVoiceVolumeEngineFeature then
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
	local var10 = reactUtilsModule.createNextOrder()
	t_1 = {
		AudioHeader = var10(),
		VolumeFrame = var10(),
		VoiceChatVolumeFrame = if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then var10() else nil,
		PartyVoiceVolumeFrame = var10(),
		DeviceFrameInput = var10(),
		DeviceFrameOutput = var10(),
		AudioDivider = var10(),
		LanguageHeader = var10(),
		ChatModerationFrame = var10(),
		VoiceConnectDisconnectSelector = var10(),
		VoiceConnectFrame = var10(),
		VoiceDisconnectFrame = var10(),
		ChatSummariesFrame = if fFlagChatSummariesSettingEnabled then var10() else nil,
		AIRephraseFrame = if fFlagAIRephraseSettingEnabled then var10() else nil,
		PlayerChoiceTranslationFrame = if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then var10() else nil,
		LanguageSelectorFrame = var10(),
		FeedbackModeButton = var10(),
		ChatTranslationFrame = var10(),
		ChatLanguageSelectorFrame = var10(),
		ChatTranslationToggleFrame = var10(),
		ChatNotificationsFrame = if fFlagExpChatEnableFriendsTab then var10() else nil,
		LanguageDivider = var10(),
		DisplayHeader = var10(),
		OverscanAdjustButton = var10(),
		FullScreenFrame = var10(),
		PreferredTransparencyFrame = var10(),
		PreferredTextSizeFrame = var10(),
		VRComfortSettingFrame = if isInExperienceUIVREnabled then var10() else nil,
		VRVignetteEnabledFrame = if isInExperienceUIVREnabled then var10() else nil,
		VRSteppedRotationEnabledFrame = if isInExperienceUIVREnabled then var10() else nil,
		VRThirdPersonFixedCamEnabledFrame = if isInExperienceUIVREnabled then var10() else nil,
		VRSafetyBubbleModeFrame = if isInExperienceUIVREnabled then var10() else nil,
		PerformanceStatsFrame = var10(),
		MicroProfilerFrame = var10(),
		GraphicsEnablerFrame = var10(),
		GraphicsQualityFrame = var10(),
		HapticsFrame = var10(),
		ReducedMotionFrame = var10(),
		FramerateCap = var10(),
		VREnabledFrame = var10(),
		DisplayDivider = var10(),
		ViewAndControlsHeader = var10(),
		CameraModeFrame = var10(),
		CameraInvertedFrame = var10(),
		CameraSensitivityFrame = var10(),
		MouseAdvancedFrame = var10(),
		GamepadSensitivityFrame = var10(),
		MovementModeFrame = var10(),
		ShiftLockFrame = var10(),
		CameraDeviceFrame = var10(),
		UiNavigationKeyBindEnabledFrame = var10(),
		DeveloperConsoleButton = var10(),
		PlayerNamesEnabledFrame = if getFFlagEnablePlayerNamesEnabledSettingModule() then var10() else nil,
		BadgeVisibilityFrame = if fFlagBadgeVisibilitySettingEnabled then var10() else nil,
		UiToggleRow = var10(),
		UiToggleRowCustom = var10(),
		UiToggleRowBillboards = var10(),
		UiToggleRowNameplates = var10(),
		FreecamToggleRow = var10(),
		InformationFrame = var10()
	}
end
local function _()
	-- upvalues: fFlagIEMSettingsGroupsModule (ref), t_1 (write), t (ref)
	local _ = {}
	
	return if fFlagIEMSettingsGroupsModule then t_1 else t
end

return {
	SETTINGS_MENU_LAYOUT_ORDER = if fFlagIEMSettingsGroupsModule then t_1 else t
}