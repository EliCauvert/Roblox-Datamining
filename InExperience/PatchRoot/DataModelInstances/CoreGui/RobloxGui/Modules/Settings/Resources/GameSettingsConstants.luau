local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local CorePackages = game:GetService("CorePackages")
local PartyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local GetFFlagEnablePlayerNamesEnabledSettingModule = require(Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local FFlagBadgeVisibilitySettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local FFlagIEMSettingsGroupsModule = require(Modules.Settings.Flags.FFlagIEMSettingsGroups)
local RUUserScalePreferenceAPIEngineFeature = game:GetEngineFeature("RUUserScalePreferenceAPI")
local FFlagAIRephraseSettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local UpdateRephraseSettingUI = game:DefineFastFlag("UpdateRephraseSettingUI", false)
local FFlagChatSummariesSettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChatSummariesSettingEnabled
local FFlagExpChatEnableFriendsTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatEnableFriendsTab
local FFlagExpChatDictationVoiceTypingModeSetting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatDictationVoiceTypingModeSetting
local FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ReactUtilsModule = require(CorePackages.Packages.ReactUtils)
local ChatModerationFrameLayoutOrder = game:DefineFastInt("ChatModerationFrameLayoutOrder", 9)
local config = { MoreSettingsBanner = 0, OverscanAdjustButton = 1 }

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent then
	config.ChatModerationFrame = ChatModerationFrameLayoutOrder
end
config.ShiftLockFrame = 10
config.CameraModeFrame = 11
config.MovementModeFrame = 12
config.FramerateCap = 13
config.GamepadSensitivityFrame = 14
config.CameraInvertedFrame = 90
config.CameraDeviceFrame = 91
config.MouseAdvancedFrame = 50
config.VoiceConnectDisconnectSelector = 17
config.VoiceConnectFrame = 18
config.VoiceDisconnectFrame = 19

if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
	config.PlayerChoiceTranslationFrame = 20
	config.LanguageSelectorFrame = 21
	config.ChatTranslationFrame = 30
	config.ChatLanguageSelectorFrame = 31
	config.ChatTranslationToggleFrame = 32
	config.FeedbackModeButton = 40
else
	config.LanguageSelectorFrame = 20
	config.FeedbackModeButton = 30
	config.ChatTranslationFrame = 40
	config.ChatLanguageSelectorFrame = 41
	config.ChatTranslationToggleFrame = 42
end
if FFlagExpChatEnableFriendsTab then
	config.ChatNotificationsFrame = 44
end
if IsInExperienceUIVREnabled then
	config.VRComfortSettingFrame = 54
	config.VRVignetteEnabledFrame = 55
	config.VRSteppedRotationEnabledFrame = 56
	config.VRThirdPersonFixedCamEnabledFrame = 57
	config.VRSafetyBubbleModeFrame = 58
end
config.DeviceFrameInput = 60
config.DeviceFrameOutput = 61
config.VolumeFrame = 62

if FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
	config.VoiceChatVolumeFrame = 63
	
	if PartyVoiceVolumeEngineFeature then
		config.PartyVoiceVolumeFrame = 64
	end
	config.HapticsFrame = if PartyVoiceVolumeEngineFeature then 65 else 64
else
	if PartyVoiceVolumeEngineFeature then
		config.PartyVoiceVolumeFrame = 63
	end
	config.HapticsFrame = if PartyVoiceVolumeEngineFeature then 64 else 63
end
config.FullScreenFrame = 70
config.GraphicsEnablerFrame = 71
config.GraphicsQualityFrame = 72
config.ReducedMotionFrame = 73
config.PreferredTransparencyFrame = 74
config.PreferredTextSizeFrame = 75

if RUUserScalePreferenceAPIEngineFeature then
	config.UIScaleModeFrame = 76
	config.UIScaleFrame = 77
	config.UiNavigationKeyBindEnabledFrame = 78
else
	config.UiNavigationKeyBindEnabledFrame = 76
end
config.PerformanceStatsFrame = 80
config.MicroProfilerFrame = 81
config.VREnabledFrame = 100
config.DeveloperConsoleButton = 101

if GetFFlagEnablePlayerNamesEnabledSettingModule() then
	config.PlayerNamesEnabledFrame = 105
end
if FFlagBadgeVisibilitySettingEnabled then
	config.BadgeVisibilityFrame = 106
end
if FFlagAIRephraseSettingEnabled then
	config.AIRephraseFrame = if UpdateRephraseSettingUI then 20 else 43
end
if FFlagChatSummariesSettingEnabled then
	config.ChatSummariesFrame = 20
end
if FFlagExpChatDictationVoiceTypingModeSetting then
	config.VoiceTypingModeFrame = 16
end
config.UiToggleRow = 200
config.UiToggleRowCustom = 200
config.UiToggleRowBillboards = 201
config.UiToggleRowNameplates = 202
config.FreecamToggleRow = 203
config.InformationFrame = 999
local v1 = nil

if FFlagIEMSettingsGroupsModule then
	local NextOrder = ReactUtilsModule.createNextOrder()
	v1 = {
		MoreSettingsBanner = NextOrder(),
		AudioHeader = NextOrder(),
		VolumeFrame = NextOrder(),
		VoiceChatVolumeFrame = if FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then NextOrder() else nil,
		PartyVoiceVolumeFrame = NextOrder(),
		DeviceFrameInput = NextOrder(),
		DeviceFrameOutput = NextOrder(),
		AudioDivider = NextOrder(),
		LanguageHeader = NextOrder(),
		VoiceTypingModeFrame = if FFlagExpChatDictationVoiceTypingModeSetting then NextOrder() else nil,
		ChatModerationFrame = NextOrder(),
		VoiceConnectDisconnectSelector = NextOrder(),
		VoiceConnectFrame = NextOrder(),
		VoiceDisconnectFrame = NextOrder(),
		ChatSummariesFrame = if FFlagChatSummariesSettingEnabled then NextOrder() else nil,
		AIRephraseFrame = if FFlagAIRephraseSettingEnabled then NextOrder() else nil,
		PlayerChoiceTranslationFrame = if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then NextOrder() else nil,
		LanguageSelectorFrame = NextOrder(),
		FeedbackModeButton = NextOrder(),
		ChatTranslationFrame = NextOrder(),
		ChatLanguageSelectorFrame = NextOrder(),
		ChatTranslationToggleFrame = NextOrder(),
		ChatNotificationsFrame = if FFlagExpChatEnableFriendsTab then NextOrder() else nil,
		LanguageDivider = NextOrder(),
		DisplayHeader = NextOrder(),
		OverscanAdjustButton = NextOrder(),
		FullScreenFrame = NextOrder(),
		PreferredTransparencyFrame = NextOrder(),
		PreferredTextSizeFrame = NextOrder(),
		UIScaleModeFrame = if RUUserScalePreferenceAPIEngineFeature then NextOrder() else nil,
		UIScaleFrame = if RUUserScalePreferenceAPIEngineFeature then NextOrder() else nil,
		VRComfortSettingFrame = if IsInExperienceUIVREnabled then NextOrder() else nil,
		VRVignetteEnabledFrame = if IsInExperienceUIVREnabled then NextOrder() else nil,
		VRSteppedRotationEnabledFrame = if IsInExperienceUIVREnabled then NextOrder() else nil,
		VRThirdPersonFixedCamEnabledFrame = if IsInExperienceUIVREnabled then NextOrder() else nil,
		VRSafetyBubbleModeFrame = if IsInExperienceUIVREnabled then NextOrder() else nil,
		PerformanceStatsFrame = NextOrder(),
		MicroProfilerFrame = NextOrder(),
		GraphicsEnablerFrame = NextOrder(),
		GraphicsQualityFrame = NextOrder(),
		HapticsFrame = NextOrder(),
		ReducedMotionFrame = NextOrder(),
		FramerateCap = NextOrder(),
		VREnabledFrame = NextOrder(),
		DisplayDivider = NextOrder(),
		ViewAndControlsHeader = NextOrder(),
		CameraModeFrame = NextOrder(),
		CameraInvertedFrame = NextOrder(),
		CameraSensitivityFrame = NextOrder(),
		MouseAdvancedFrame = NextOrder(),
		GamepadSensitivityFrame = NextOrder(),
		MovementModeFrame = NextOrder(),
		ShiftLockFrame = NextOrder(),
		CameraDeviceFrame = NextOrder(),
		UiNavigationKeyBindEnabledFrame = NextOrder(),
		DeveloperConsoleButton = NextOrder(),
		PlayerNamesEnabledFrame = if GetFFlagEnablePlayerNamesEnabledSettingModule() then NextOrder() else nil,
		BadgeVisibilityFrame = if FFlagBadgeVisibilitySettingEnabled then NextOrder() else nil,
		UiToggleRow = NextOrder(),
		UiToggleRowCustom = NextOrder(),
		UiToggleRowBillboards = NextOrder(),
		UiToggleRowNameplates = NextOrder(),
		FreecamToggleRow = NextOrder(),
		InformationFrame = NextOrder()
	}
end
local function _()
	-- upvalues: FFlagIEMSettingsGroupsModule (copy), v1 (ref), config (copy)
	return if FFlagIEMSettingsGroupsModule then v1 else config
end

return {
	SETTINGS_MENU_LAYOUT_ORDER = if FFlagIEMSettingsGroupsModule then v1 else config
}