local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local SoundService = game:GetService("SoundService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local UserSettingsResult = UserSettings()
local GameSettings = UserSettingsResult.GameSettings
local VideoCaptureService = game:GetService("VideoCaptureService")
local UserGameSettings = UserSettingsResult:GetService("UserGameSettings")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local TextChatService = game:GetService("TextChatService")
local SafetyService = game:GetService("SafetyService")
local ExperienceStateCaptureService = if game:GetEngineFeature("CaptureModeEnabled") then game:GetService("ExperienceStateCaptureService") else nil
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagIEMSettingsGroupsModule = require(RobloxGui.Modules.Settings.Flags.FFlagIEMSettingsGroups)
local NewResult = nil
NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local GetCamMicPermissionsModule = require(RobloxGui.Modules.Settings.getCamMicPermissions)
local IsCamEnabledForUserAndPlaceModule = require(RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace)
local Callback = nil
local Callback1 = nil

if FFlagIEMSettingsGroupsModule then
	Callback = require(RobloxGui.Modules.Settings.Components.renderSettingsHeader)
	Callback1 = require(RobloxGui.Modules.Settings.Components.renderSettingsDivider)
end
local RenderMoreSettingsBannerModule = if require(RobloxGui.Modules.Settings.Flags.FFlagEnablePioneerIGMSettingsBanner) and require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch() then require(RobloxGui.Modules.Settings.Components.renderMoreSettingsBanner) else nil
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local IsVoiceFocusedFunction = require(CorePackages.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local ObserveIsVoiceFocusedFunction = require(CorePackages.Workspace.Packages.CrossExperience).Utils.observeIsVoiceFocused
local CameraDevicePermissionGrantedSignalModule = require(CoreGui.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction = SharedFlagsModule.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local GetFFlagSelfViewCameraSettingsFunction = SharedFlagsModule.GetFFlagSelfViewCameraSettings
local GetFFlagAlwaysShowVRToggleModule = require(RobloxGui.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local GetFIntDebounceDisconnectButtonDelayModule = require(RobloxGui.Modules.Flags.GetFIntDebounceDisconnectButtonDelay)
local GetFIntDebounceAIRephraseSettingDelayModule = require(RobloxGui.Modules.Flags.GetFIntDebounceAIRephraseSettingDelay)
local GetFIntDebounceChatSummariesSettingDelayModule = require(RobloxGui.Modules.Flags.GetFIntDebounceChatSummariesSettingDelay)
local TouchEnabled = UserInputService.TouchEnabled
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = SharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local FFlagIEMTabFocusNav = SharedFlagsModule.FFlagIEMTabFocusNav
local ShowAntiHarassmentSettings = game:DefineFastFlag("ShowAntiHarassmentSettings", false)
local GetFFlagEnablePlayerNamesEnabledSettingModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local FFlagUpdatePeopleNamesSettingCopyModule = require(RobloxGui.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy)
local FFlagBadgeVisibilitySettingEnabled = SharedFlagsModule.FFlagBadgeVisibilitySettingEnabled
local GetFFlagEnableVoiceUxUpdatesFunction = SharedFlagsModule.GetFFlagEnableVoiceUxUpdates
local GetFFlagEnableVrVoiceConnectDisconnectFunction = SharedFlagsModule.GetFFlagEnableVrVoiceConnectDisconnect
local HideVoiceChatSelectorForFaeAEGIS2 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false)
local CenterShiftLockOverride = game:DefineFastFlag("CenterShiftLockOverride", true)
local VoiceChatSelectorReconnectFocus2AEGIS2 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false)
local MicroProfilerReadOnlyInformationLabel = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false)
local FFlagEnableModerateChatRemoteEvent = SharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local VoiceSelectorAvailableAfterFae = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false)
local DifferentiateVoiceSelectorSystemAndUser = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false)
local DeferProgrammaticChange = game:DefineFastFlag("DeferProgrammaticChange", false)
local FFlagRenameVolumeToMainVolumeModule = require(RobloxGui.Modules.Flags.FFlagRenameVolumeToMainVolume)
local FFlagAIRephraseSettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local FFlagChatSummariesSettingEnabled = SharedFlagsModule.FFlagChatSummariesSettingEnabled
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictationVoiceTypingModeSetting and (SharedFlagsModule.FFlagExpChatDictation or SharedFlagsModule.FFlagExpChatContinuousDictation)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagVoiceRewarmTelemetry = SharedFlagsModule.FFlagVoiceRewarmTelemetry
local DebounceVoiceSelectorIndexChange = game:DefineFastFlag("DebounceVoiceSelectorIndexChange", false)
local VoiceSelectorIgnoreFailedStateDisconnect = game:DefineFastFlag("VoiceSelectorIgnoreFailedStateDisconnect", false)
local VoiceConnectSelectorDebounce = game:DefineFastFlag("VoiceConnectSelectorDebounce", false)
local FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(RobloxGui.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local VoiceVolumeControlsFixSliderVisibilityOnEligibleGames = game:DefineFastFlag("VoiceVolumeControlsFixSliderVisibilityOnEligibleGames", false)
local VoiceVolumeControlsDisableInteractionWhenNoMasterVolume = game:DefineFastFlag("VoiceVolumeControlsDisableInteractionWhenNoMasterVolume", false)
local FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(CorePackages.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(RobloxGui.Modules.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local VoiceVolumeControlsSuppressInExperienceUiForPartyVoice = game:DefineFastFlag("VoiceVolumeControlsSuppressInExperienceUiForPartyVoice", false)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Default1 = require(CorePackages.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local HasPartyVoiceVolume = Default1 and Default1.getHasPartyVoiceVolume()
local ConstantsModule = require(RobloxGui:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local config = {
	["Enum.SavedQualitySetting.Automatic"] = 0,
	["Enum.SavedQualitySetting.QualityLevel1"] = 1,
	["Enum.SavedQualitySetting.QualityLevel2"] = 2,
	["Enum.SavedQualitySetting.QualityLevel3"] = 3,
	["Enum.SavedQualitySetting.QualityLevel4"] = 4,
	["Enum.SavedQualitySetting.QualityLevel5"] = 5,
	["Enum.SavedQualitySetting.QualityLevel6"] = 6,
	["Enum.SavedQualitySetting.QualityLevel7"] = 7,
	["Enum.SavedQualitySetting.QualityLevel8"] = 8,
	["Enum.SavedQualitySetting.QualityLevel9"] = 9,
	["Enum.SavedQualitySetting.QualityLevel10"] = 10
}

local function _(p1: number): number
	return (math.floor(p1 * 5 + 0.5))
end

local _ = function(p1: number): number
	return p1 / 5
end

local config1 = {
	DevComputerMovementMode = true,
	DevComputerCameraMode = true,
	DevEnableMouseLock = true
}
local config2 = { DevTouchMovementMode = true, DevTouchCameraMode = true }
local config3 = {
	DEFAULT_FOLLOW = "Default (Follow)",
	DEFAULT_CLASSIC = "Default (Classic)"
}
local config4 = { Input = "Input", Output = "Output" }
local config5 = {
	DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)",
	DEFAULT_KEYBOARD = "Default (Keyboard)",
	TAP_TO_MOVE = "Tap to Move",
	CLICK_TO_MOVE = "Click to Move"
}
local FeatureSettingsHubTouchMovementModeClassicThumbstick = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local FeatureSettingsHubLanguageSelectionUnavailable = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local CoreScriptsFeedbackEntryPointButtonText = RobloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local config6 = { On = 1, Off = 2 }

local _ = function(): string
	-- upvalues: UserInputService (copy)
	return if UserInputService.PreferredInput == Enum.PreferredInput.Touch then "Default (Follow)" else "Default (Classic)"
end

local _ = function()
	-- upvalues: UserInputService (copy), RobloxTranslatorModule (copy), ConstantsModule (copy)
	return if UserInputService.PreferredInput == Enum.PreferredInput.Touch then RobloxTranslatorModule:FormatByKey(ConstantsModule.MovementModeDynamicThumbstickKey) else "Default (Keyboard)"
end

local _ = function(): string
	-- upvalues: UserInputService (copy)
	return if UserInputService.PreferredInput == Enum.PreferredInput.Touch then "Tap to Move" else "Click to Move"
end

local SETTINGSMENULAYOUTORDER = require(RobloxGui.Modules.Settings.Resources.GameSettingsConstants).SETTINGS_MENU_LAYOUT_ORDER
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local GetFFlagChatTranslationSettingEnabledModule = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationSettingEnabled)
local GetFStringChatTranslationLayerNameModule = require(RobloxGui.Modules.Flags.GetFStringChatTranslationLayerName)
local GetFFlagChatTranslationHoldoutEnabledModule = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled)
local GetFFlagChatTranslationWaitForIXPModule = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationWaitForIXP)
local GetFFlagChatTranslationForceSettingModule = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationForceSetting)
local GetFFlagChatTranslationNewDefaultsModule = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationNewDefaults)
local TextChatServiceSettingsSavedEngineFeature = game:GetEngineFeature("TextChatServiceSettingsSaved")
local ChatTranslationOptionsWithChatLanguageSwitcherInitializerModule = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer)
local GameBasicSettingsFramerateCapEngineFeature = game:GetEngineFeature("GameBasicSettingsFramerateCap")
local RUUserScalePreferenceAPIEngineFeature = game:GetEngineFeature("RUUserScalePreferenceAPI")
local FramerateCapIOSOptions = game:DefineFastFlag("FramerateCapIOSOptions", false)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local CoreUtilityModule = require(RobloxGui.Modules.CoreUtility)
local PlayerPermissionsModule = require(RobloxGui.Modules.PlayerPermissionsModule)
local GetHasGuiHidingPermissionModule = require(RobloxGui.Modules.Common.GetHasGuiHidingPermission)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local CryoModule = require(CorePackages.Packages.Cryo)
local GfxResetModule = require(script.Parent.Parent.GfxReset)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ThrottleFunctionCallModule = require(CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall)
local DebounceModule = require(RobloxGui.Modules.Chrome.ChromeShared.Utility.debounce)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local SignalsModule = require(CorePackages.Packages.Signals)
local Migration = BuilderIconsModule.Migration
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
RobloxGui:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local LocalPlayer = Players.LocalPlayer
local Platform = UserInputService:GetPlatform()
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local Default2 = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceVolumeControlsEligibility = require(CorePackages.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local Default3 = require(CorePackages.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local FeatureSettingsHubVideoSystemDefault = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local FeatureSettingsHubVideoVideoCamera = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local NewResult1 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local RomarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local Inverted = not CachedPolicyServiceModule:IsSubjectToChinaPolicies()
local IsPlatformMatch: boolean = Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
local IsPlatformMatch1: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
local Inverted1: boolean = if IsInExperienceUIVREnabled then if IsPlatformMatch1 or IsPlatformMatch then Inverted else IsSpatialFunction() and Inverted elseif IsPlatformMatch1 then Inverted else IsPlatformMatch and Inverted
local GetFIntVoiceChatDeviceChangeDebounceDelayModule = require(RobloxGui.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay)
local GetFFlagVoiceChatUILoggingModule = require(RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local GetFFlagEnableUniveralVoiceToastsModule = require(RobloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local GetFFlagEnableExplicitSettingsChangeAnalyticsModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics)
local GetFFlagFixCyclicFullscreenIndexEventModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent)
local DisableFeedbackSoothsayerCheck = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false)
local UserShowGuiHideToggles = game:DefineFastFlag("UserShowGuiHideToggles", false)
local UserFreecamGuiDestabilization = game:DefineFastFlag("UserFreecamGuiDestabilization", false)
local FixDeveloperConsoleButtonSizeAndPositioning = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false)
local EnableTFFeedbackModeEntryCheck = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false)
local FeedbackEntryPointButtonSizeAdjustment2 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false)
local FeedbackEntryPointImprovedStrictnessCheck = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false)
local GetFFlagEnableLocalesForExperienceLanguageSwitcherModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher)
local GetFFlagLazyInitiateExperienceLanguageSwitcherModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagLazyInitiateExperienceLanguageSwitcher)
local ExperienceLanguageSwitcherInitializerModule = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer)
local PlayerChoiceTranslationSettingInitializerModule = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer)
local UpdateVisibilitySettingsCopy = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false)
local ExpChatDebounceRephraseIndexSelection = game:DefineFastFlag("ExpChatDebounceRephraseIndexSelection", false)
local EraseFPSFromDefaultSetting = game:DefineFastFlag("EraseFPSFromDefaultSetting", false)

local function reportSettingsChangeForAnalytics(Name, Floored, Name1, p1)
	-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), UserInputService (copy), CryoModule (copy), RbxAnalyticsService (copy), ConstantsModule (copy)
	if not GetFFlagEnableExplicitSettingsChangeAnalyticsModule() or Floored == Name1 or Floored == nil or Name1 == nil then return end
	local JoinResult = {
		universe_id = tostring(game.GameId),
		name = Name,
		old_value = tostring(Floored),
		new_value = tostring(Name1),
		has_touch = UserInputService.TouchEnabled,
		has_mouse = UserInputService.MouseEnabled,
		has_gamepad = UserInputService.GamepadEnabled
	}
	
	if p1 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p1)
	end
	RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsExplicitSettingsChangeName, JoinResult)
end

local function reportSettingsForAnalytics()
	-- upvalues: UserInputService (copy), GameSettings (copy), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), GameBasicSettingsFramerateCapEngineFeature (copy), GetFFlagEnablePlayerNamesEnabledSettingModule (copy), RbxAnalyticsService (copy), ConstantsModule (copy)
	local AdditionalArgs = {}
	local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if IsPreferredInputMatch then
		AdditionalArgs.camera_mode_touch = tostring(GameSettings.TouchCameraMovementMode)
	else
		AdditionalArgs.camera_mode_desktop = tostring(GameSettings.ComputerCameraMovementMode)
	end
	if IsPreferredInputMatch then
		AdditionalArgs.movement_mode_touch = tostring(GameSettings.TouchMovementMode)
	else
		AdditionalArgs.movement_mode_desktop = tostring(GameSettings.ComputerMovementMode)
	end
	if UserInputService.MouseEnabled then
		AdditionalArgs.shift_lock_enabled = tostring(GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
	end
	if UserInputService.GamepadEnabled and GameSettings.IsUsingGamepadCameraSensitivity then
		AdditionalArgs.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", GameSettings.GamepadCameraSensitivity))))
	end
	if UserInputService.MouseEnabled then
		AdditionalArgs.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", GameSettings.MouseSensitivityFirstPerson.X))))
	end
	AdditionalArgs.camera_y_inverted = tostring(GameSettings.CameraYInverted)
	AdditionalArgs.show_performance_stats = tostring(GameSettings.PerformanceStatsVisible)
	AdditionalArgs.volume = tostring((math.floor(GameSettings.MasterVolume * 10 + 0.5)))
	
	if FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		AdditionalArgs.voice_chat_volume = tostring((math.floor(GameSettings.VoiceChatVolume * 5 + 0.5)))
	end
	AdditionalArgs.gfx_quality_level = tostring(settings().Rendering.QualityLevel)
	
	if GameBasicSettingsFramerateCapEngineFeature then
		AdditionalArgs.framerate_cap = tostring(GameSettings.FramerateCap)
	end
	AdditionalArgs.fullscreen_enabled = tostring(GameSettings:InFullScreen())
	AdditionalArgs.microprofiler_enabled = tostring(GameSettings.OnScreenProfilerEnabled)
	AdditionalArgs.microprofiler_webserver_enabled = tostring(GameSettings.MicroProfilerWebServerEnabled)
	AdditionalArgs.reduced_motion = tostring(GameSettings.ReducedMotion)
	AdditionalArgs.preferred_transparency = tostring(GameSettings.PreferredTransparency)
	AdditionalArgs.preferred_text_size = tostring(GameSettings.PreferredTextSize)
	AdditionalArgs.ui_navigation_key_bind_enabled = tostring(GameSettings.UiNavigationKeyBindEnabled)
	AdditionalArgs.universeid = tostring(game.GameId)
	
	if GetFFlagEnablePlayerNamesEnabledSettingModule() then
		AdditionalArgs.player_names_enabled = tostring(GameSettings.PlayerNamesEnabled)
	end
	RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsSettingsChangeName, AdditionalArgs)
end

game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0)
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "")
local IGMEnableGFXReset = game:DefineFastFlag("IGMEnableGFXReset", false)

local function getLastValueChangerFrame(NewPage)
	local LayoutOrder = nil
	local ValueChangerFrame = nil
	
	for _, row in pairs(NewPage:GetRows()) do
		local SelectionFrame = row.SelectionFrame
		
		if not LayoutOrder or LayoutOrder <= SelectionFrame.LayoutOrder then
			LayoutOrder = SelectionFrame.LayoutOrder
			ValueChangerFrame = NewPage:getValueChangerFrame(row.ValueChanger)
		end
	end
	return ValueChangerFrame
end

local function getFirstValueChangerFrame(NewPage)
	-- upvalues: FFlagIEMTabFocusNav (copy)
	if not FFlagIEMTabFocusNav then return end
	local LayoutOrder = nil
	local ValueChangerFrame = nil
	
	for _, row in pairs(NewPage:GetRows()) do
		local SelectionFrame = row.SelectionFrame
		
		if not LayoutOrder or SelectionFrame.LayoutOrder < LayoutOrder then
			LayoutOrder = SelectionFrame.LayoutOrder
			ValueChangerFrame = NewPage:getValueChangerFrame(row.ValueChanger)
		end
	end
	return ValueChangerFrame
end

return ((function()
	-- upvalues: IGMEnableGFXReset (copy), GfxResetModule (copy), RobloxGui (copy), GetFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), VRService (copy), GameSettings (copy), UtilityModule (copy), SETTINGSMENULAYOUTORDER (copy), GuiService (copy), GetFFlagFixCyclicFullscreenIndexEventModule (copy), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), RbxAnalyticsService (copy), ConstantsModule (copy), GameBasicSettingsFramerateCapEngineFeature (copy), FramerateCapIOSOptions (copy), Platform (copy), EraseFPSFromDefaultSetting (copy), RobloxTranslatorModule (copy), RomarkStartWithGraphicQualityLevelFastInt (copy), config (copy), UpdateVisibilitySettingsCopy (copy), FFlagUpdatePeopleNamesSettingCopyModule (copy), config6 (copy), UserGameSettings (copy), NewResult (ref), UserInputService (copy), CreateFunction (copy), ThemeModule (copy), CenterShiftLockOverride (copy), MicroProfilerReadOnlyInformationLabel (copy), TouchEnabled (copy), IsPlatformMatch1 (copy), IsPlatformMatch (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), LocalPlayer (copy), CoreUtilityModule (copy), config3 (copy), GetFFlagAlwaysShowVRToggleModule (copy), GetAppFeaturePoliciesFunction (copy), config5 (copy), FeatureSettingsHubTouchMovementModeClassicThumbstick (copy), config2 (copy), config1 (copy), Url (copy), HttpService (copy), FeedbackEntryPointImprovedStrictnessCheck (copy), SafetyService (copy), ExperienceStateCaptureService (ref), FeedbackEntryPointButtonSizeAdjustment2 (copy), CoreScriptsFeedbackEntryPointButtonText (copy), DisableFeedbackSoothsayerCheck (copy), NewResult1 (copy), Players (copy), FeatureSettingsHubLanguageSelectionUnavailable (copy), RunService (copy), GetFFlagChatTranslationWaitForIXPModule (copy), IXPServiceWrapper (copy), GetFFlagChatTranslationNewDefaultsModule (copy), FFlagRenameVolumeToMainVolumeModule (copy), GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction (copy), Default3 (copy), VoiceVolumeControlsDisableInteractionWhenNoMasterVolume (copy), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), CorePackages (copy), ContextActionService (copy), FixDeveloperConsoleButtonSizeAndPositioning (copy), PlayerPermissionsModule (copy), UserFreecamGuiDestabilization (copy), UserShowGuiHideToggles (copy), SoundService (copy), GetFIntVoiceChatDeviceChangeDebounceDelayModule (copy), Default2 (copy), GetFFlagEnableCrossExpVoiceFunction (copy), SignalsModule (copy), GetFIntDebounceAIRephraseSettingDelayModule (copy), TextChatService (copy), ExpChatDebounceRephraseIndexSelection (copy), ThrottleFunctionCallModule (copy), GetFIntDebounceChatSummariesSettingDelayModule (copy), FeatureSettingsHubVideoVideoCamera (copy), GetFFlagVoiceChatUILoggingModule (copy), VideoCaptureService (copy), FeatureSettingsHubVideoSystemDefault (copy), RUUserScalePreferenceAPIEngineFeature (copy), DifferentiateVoiceSelectorSystemAndUser (copy), VoiceSelectorAvailableAfterFae (copy), GetFIntDebounceDisconnectButtonDelayModule (copy), FFlagVoiceRewarmTelemetry (copy), ConstantsModule1 (copy), VoiceSelectorIgnoreFailedStateDisconnect (copy), VoiceConnectSelectorDebounce (copy), DebounceModule (copy), VoiceChatSelectorReconnectFocus2AEGIS2 (copy), DebounceVoiceSelectorIndexChange (copy), DeferProgrammaticChange (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (copy), IsVoiceFocusedFunction (copy), GetFFlagEnableVrVoiceConnectDisconnectFunction (copy), GetFFlagEnableVoiceUxUpdatesFunction (copy), HideVoiceChatSelectorForFaeAEGIS2 (copy), ObserveIsVoiceFocusedFunction (copy), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), VoiceVolumeControlsEligibility (copy), GetFFlagEnableUniveralVoiceToastsModule (copy), config4 (copy), GetFFlagSelfViewCameraSettingsFunction (copy), IsCamEnabledForUserAndPlaceModule (copy), GetCamMicPermissionsModule (copy), Default (copy), CameraDevicePermissionGrantedSignalModule (copy), IsEnabled (copy), FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (copy), HasPartyVoiceVolume (copy), ShowAntiHarassmentSettings (copy), GetFFlagEnablePlayerNamesEnabledSettingModule (copy), PlayerChoiceTranslationSettingInitializerModule (copy), CachedPolicyServiceModule (copy), Inverted1 (copy), FFlagBadgeVisibilitySettingEnabled (copy), FFlagEnableModerateChatRemoteEvent (copy), FFlagAIRephraseSettingEnabled (copy), FFlagChatSummariesSettingEnabled (copy), FFlagExpChatDictation (copy), FFlagExpChatEnableFriendsTab (copy), GetHasGuiHidingPermissionModule (copy), RenderMoreSettingsBannerModule (ref), FFlagIEMSettingsGroupsModule (copy), Callback (ref), Callback1 (ref), Migration (copy), BuilderIconsModule (copy), EnableTFFeedbackModeEntryCheck (copy), GetFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), ExperienceLanguageSwitcherInitializerModule (copy), getLastValueChangerFrame (copy), FFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy), GetFFlagChatTranslationSettingEnabledModule (copy), GetFFlagChatTranslationHoldoutEnabledModule (copy), GetFStringChatTranslationLayerNameModule (copy), TextChatServiceSettingsSavedEngineFeature (copy), GetFFlagChatTranslationForceSettingModule (copy), ChatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy)
	if IGMEnableGFXReset then
		GfxResetModule.RunGfxReset()
	end
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if GetFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		NewPage.LanguageSwitcherInitialized = false
	end
	local Flag = false
	local t = {}
	
	local function _()
		-- upvalues: VRService (upval), t (copy)
		local VREnabled = VRService.VREnabled
		
		for i, _ in pairs(t) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function()
		-- upvalues: VRService (upval), Flag (ref), t (copy)
		if VRService.VREnabled and Flag then
			local VREnabled = VRService.VREnabled
			
			for i, _ in pairs(t) do
				i.Visible = not VREnabled
			end
		end
	end)
	
	if VRService.VREnabled and Flag then
		local VREnabled = VRService.VREnabled
		
		for i, _ in pairs(t) do
			i.Visible = not VREnabled
		end
	end
	local function createGraphicsOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), t (copy), GuiService (upval), GetFFlagFixCyclicFullscreenIndexEventModule (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval), RbxAnalyticsService (upval), ConstantsModule (upval), GameBasicSettingsFramerateCapEngineFeature (upval), VRService (upval), FramerateCapIOSOptions (upval), Platform (upval), EraseFPSFromDefaultSetting (upval), RobloxTranslatorModule (upval), IGMEnableGFXReset (upval), GfxResetModule (upval), RomarkStartWithGraphicQualityLevelFastInt (upval), config (upval)
		NewPage.FullscreenFrame, NewPage.FullscreenLabel, NewPage.FullscreenEnabler = UtilityModule:AddNewRow(NewPage, "Fullscreen", "Selector", { "On", "Off" }, if GameSettings:InFullScreen() then 1 else 2)
		NewPage.FullscreenFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.FullScreenFrame
		t[NewPage.FullscreenFrame] = true
		NewPage.FullscreenEnabler.IndexChanged:connect(function(p1)
			-- upvalues: GameSettings (upval), GuiService (upval), GetFFlagFixCyclicFullscreenIndexEventModule (upval), NewPage (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local InFullScreenResult = GameSettings:InFullScreen()
			
			if p1 == 1 then
				if not GameSettings:InFullScreen() then
					GuiService:ToggleFullscreen()
					
					if GetFFlagFixCyclicFullscreenIndexEventModule() then
						if NewPage.FullscreenEnabler.GetSelectedIndex() ~= 1 then
							NewPage.FullscreenEnabler:SetSelectionIndex(1)
						end
					else
						NewPage.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p1 == 2 and GameSettings:InFullScreen() then
				GuiService:ToggleFullscreen()
				
				if GetFFlagFixCyclicFullscreenIndexEventModule() then
					if NewPage.FullscreenEnabler.GetSelectedIndex() ~= 2 then
						NewPage.FullscreenEnabler:SetSelectionIndex(2)
					end
				else
					NewPage.FullscreenEnabler:SetSelectionIndex(2)
				end
			end
			spawn(function()
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), InFullScreenResult (copy), GameSettings (upval), reportSettingsForAnalytics (upval)
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", InFullScreenResult, GameSettings:InFullScreen())
				end
				reportSettingsForAnalytics()
			end)
		end)
		GameSettings.FullscreenChanged:connect(function(Enabled)
			-- upvalues: NewPage (upval), RbxAnalyticsService (upval), ConstantsModule (upval)
			if Enabled then
				if NewPage.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					NewPage.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif NewPage.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				NewPage.FullscreenEnabler:SetSelectionIndex(2)
			end
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsFullscreenModeName, { enabled = Enabled })
		end)
		NewPage.GraphicsEnablerFrame, NewPage.GraphicsEnablerLabel, NewPage.GraphicsQualityEnabler = UtilityModule:AddNewRow(NewPage, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then 1 else 2)
		NewPage.GraphicsEnablerFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.GraphicsEnablerFrame
		NewPage.GraphicsQualityFrame, NewPage.GraphicsQualityLabel, NewPage.GraphicsQualitySlider = UtilityModule:AddNewRow(NewPage, "Graphics Quality", "Slider", 10, 1)
		NewPage.GraphicsQualityFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.GraphicsQualityFrame
		NewPage.GraphicsQualitySlider:SetMinStep(1)
		
		if GameBasicSettingsFramerateCapEngineFeature and not VRService.VREnabled then
			local Copy = table.clone(if FramerateCapIOSOptions and Platform == Enum.Platform.IOS then ConstantsModule.FramerateCapsIOS else ConstantsModule.FramerateCaps)
			local FeatureSettingsHubGameSettingsFramerateEntries = {
				if EraseFPSFromDefaultSetting then RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.Default") else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", { Frames = GameSettings:GetDefaultFramerateCap() })
			}
			
			for _, Frames in Copy do
				table.insert(FeatureSettingsHubGameSettingsFramerateEntries, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", { Frames = Frames }))
			end
			table.insert(Copy, 1, -1)
			task.defer(function()
				-- upvalues: NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubGameSettingsFramerateEntries (copy), FramerateCapIOSOptions (upval), Copy (copy), GameSettings (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
				NewPage.FramerateCapFrame, NewPage.FramerateCapLabel, NewPage.FramerateCapMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", FeatureSettingsHubGameSettingsFramerateEntries, if FramerateCapIOSOptions then table.find(Copy, GameSettings.FramerateCap) or 1 else table.find(Copy, GameSettings.FramerateCap), nil, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				NewPage.FramerateCapFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.FramerateCap
				NewPage.FramerateCapMode.IndexChanged:Connect(function(p1)
					-- upvalues: GameSettings (upval), Copy (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
					local FramerateCap = GameSettings.FramerateCap
					GameSettings.FramerateCap = Copy[p1]
					
					if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						reportSettingsChangeForAnalytics("framerate_cap", FramerateCap, GameSettings.FramerateCap)
					end
					reportSettingsForAnalytics()
				end)
			end)
		end
		settings().Rendering.EnableFRM = true
		
		function SetGraphicsQuality(SavedQualityLevel: number, p1)
			-- upvalues: IGMEnableGFXReset (upval), GfxResetModule (upval), GameSettings (upval)
			if IGMEnableGFXReset then
				local TemporaryOverrideResult, TemporaryOverrideResult2 = GfxResetModule.TemporaryOverride(SavedQualityLevel)
				
				if TemporaryOverrideResult then
					settings().Rendering.QualityLevel = TemporaryOverrideResult2
					
					return
				end
			end
			local Floored = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * (SavedQualityLevel / 10))
			
			if Floored == 20 then
				Floored = 21
			elseif SavedQualityLevel == 1 then
				Floored = 1
			elseif SavedQualityLevel < 1 and not p1 then
				SavedQualityLevel = 1
				Floored = 1
			elseif settings().Rendering:GetMaxQualityLevel() < Floored then
				Floored = settings().Rendering:GetMaxQualityLevel() - 1
			end
			GameSettings.SavedQualityLevel = SavedQualityLevel
			settings().Rendering.QualityLevel = Floored
		end
		
		local function _()
			-- upvalues: NewPage (upval)
			NewPage.GraphicsQualitySlider:SetZIndex(1)
			NewPage.GraphicsQualityLabel.ZIndex = 1
			NewPage.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		end
		
		local function setGraphicsToManual(RomarkStartWithGraphicQualityLevelFastInt)
			-- upvalues: NewPage (upval)
			NewPage.GraphicsQualitySlider:SetZIndex(2)
			NewPage.GraphicsQualityLabel.ZIndex = 2
			NewPage.GraphicsQualitySlider:SetInteractable(true)
			
			if NewPage.GraphicsQualitySlider:GetValue() == RomarkStartWithGraphicQualityLevelFastInt then
				SetGraphicsQuality(RomarkStartWithGraphicQualityLevelFastInt)
				
				return
			else
				NewPage.GraphicsQualitySlider:SetValue(RomarkStartWithGraphicQualityLevelFastInt)
			end
		end
		
		local Enabled = false
		NewPage.GraphicsQualitySlider.ValueChanged:connect(function(p1)
			-- upvalues: Enabled (ref), reportSettingsForAnalytics (upval)
			SetGraphicsQuality(p1)
			
			if Enabled == true then
				reportSettingsForAnalytics()
			end
			Enabled = true
		end)
		NewPage.GraphicsQualityEnabler.IndexChanged:connect(function(p1)
			-- upvalues: NewPage (upval), setGraphicsToManual (copy), reportSettingsForAnalytics (upval), reportSettingsChangeForAnalytics (upval)
			local config = {
				Automatic = { Name = "Automatic", Value = 1 },
				Manual = { Name = "Manual", Value = 2 }
			}
			local Name = config.Automatic.Name
			local Name1 = config.Manual.Name
			
			if p1 == config.Automatic.Value then
				Name = config.Manual.Name
				Name1 = config.Automatic.Name
				NewPage.GraphicsQualitySlider:SetZIndex(1)
				NewPage.GraphicsQualityLabel.ZIndex = 1
				NewPage.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p1 == config.Manual.Value then
				setGraphicsToManual(NewPage.GraphicsQualitySlider:GetValue())
			end
			reportSettingsForAnalytics()
			reportSettingsChangeForAnalytics("gfx_mode", Name, Name1)
		end)
		game.GraphicsQualityChangeRequest:Connect(function(BetterQuality)
			-- upvalues: GameSettings (upval), NewPage (upval)
			if GameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local Value: number = NewPage.GraphicsQualitySlider:GetValue()
				NewPage.GraphicsQualitySlider:SetValue(if BetterQuality then Value + 1 else Value - 1)
			end
		end)
		
		if RomarkStartWithGraphicQualityLevelFastInt >= 0 then
			if RomarkStartWithGraphicQualityLevelFastInt == 0 then
				NewPage.GraphicsQualityEnabler:SetSelectionIndex(1)
				NewPage.GraphicsQualitySlider:SetZIndex(1)
				NewPage.GraphicsQualityLabel.ZIndex = 1
				NewPage.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			else
				NewPage.GraphicsQualityEnabler:SetSelectionIndex(2)
				setGraphicsToManual(RomarkStartWithGraphicQualityLevelFastInt)
			end
		elseif GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			NewPage.GraphicsQualitySlider:SetValue(5)
			NewPage.GraphicsQualitySlider:SetZIndex(1)
			NewPage.GraphicsQualityLabel.ZIndex = 1
			NewPage.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		else
			local Text = tostring(GameSettings.SavedQualityLevel)
			local Entry = if config[Text] then config[Text] else 10
			SetGraphicsQuality(Entry)
			spawn(function()
				-- upvalues: NewPage (upval), Entry (ref)
				NewPage.GraphicsQualitySlider:SetValue(Entry)
			end)
		end
	end
	
	local function createReducedMotionOptions()
		-- upvalues: GameSettings (upval), RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		NewPage.ReducedMotionFrame, NewPage.ReducedMotionLabel, NewPage.ReducedMotionMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			(RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"))
		}, if GameSettings.ReducedMotion then 1 else 2, nil, (RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion")))
		NewPage.ReducedMotionFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.ReducedMotionFrame
		NewPage.ReducedMotionMode.IndexChanged:connect(function(p1)
			-- upvalues: GameSettings (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local ReducedMotion = GameSettings.ReducedMotion
			GameSettings.ReducedMotion = p1 == 1
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("reduced_motion", ReducedMotion, GameSettings.ReducedMotion)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPlayerNamesEnabledOptions()
		-- upvalues: UpdateVisibilitySettingsCopy (upval), RobloxTranslatorModule (upval), FFlagUpdatePeopleNamesSettingCopyModule (upval), GameSettings (upval), config6 (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local function _(): number
			-- upvalues: GameSettings (upval)
			return if GameSettings.PlayerNamesEnabled then 1 else 2
		end
		
		NewPage.PlayerNamesEnabledFrame, NewPage.playerNamesEnabledLabel, NewPage.playerNamesEnabledMode = UtilityModule:AddNewRow(NewPage, if UpdateVisibilitySettingsCopy then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif FFlagUpdatePeopleNamesSettingCopyModule then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if UpdateVisibilitySettingsCopy then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if UpdateVisibilitySettingsCopy then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if GameSettings.PlayerNamesEnabled then config6.On else config6.Off, nil, if FFlagUpdatePeopleNamesSettingCopyModule then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		NewPage.PlayerNamesEnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.PlayerNamesEnabledFrame
		NewPage.playerNamesEnabledMode.IndexChanged:connect(function(p1)
			-- upvalues: GameSettings (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local PlayerNamesEnabled = GameSettings.PlayerNamesEnabled
			GameSettings.PlayerNamesEnabled = p1 == 1
			reportSettingsChangeForAnalytics("player_names_enabled", PlayerNamesEnabled, GameSettings.PlayerNamesEnabled)
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTransparencyOptions()
		-- upvalues: GameSettings (upval), RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		NewPage.PreferredTransparencyFrame, NewPage.PreferredTransparencyLabel, NewPage.PreferredTransparencySlider = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(GameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), RobloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), (RobloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque")))
		NewPage.PreferredTransparencyFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.PreferredTransparencyFrame
		NewPage.PreferredTransparencySlider.ValueChanged:connect(function(Value: number)
			-- upvalues: GameSettings (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local PreferredTransparency = GameSettings.PreferredTransparency
			GameSettings.PreferredTransparency = (10 - math.clamp(math.floor(Value), 0, 10)) / 10
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_transparency", PreferredTransparency, GameSettings.PreferredTransparency)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTextSizeOptions()
		-- upvalues: GameSettings (upval), RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local EnumItems = Enum.PreferredTextSize:GetEnumItems()
		NewPage.PreferredTextSizeFrame, NewPage.PreferredTextSizeLabel, NewPage.PreferredTextSizeSlider = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, GameSettings.PreferredTextSize.Value - 1, nil, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), RobloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), (RobloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest")))
		NewPage.PreferredTextSizeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.PreferredTextSizeFrame
		NewPage.PreferredTextSizeSlider.ValueChanged:connect(function(p1: number)
			-- upvalues: GameSettings (upval), EnumItems (copy), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local PreferredTextSize = GameSettings.PreferredTextSize
			GameSettings.PreferredTextSize = EnumItems[p1 + 1]
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_text_size", PreferredTextSize, GameSettings.PreferredTextSize)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local ScaledCeiled = nil
	local ScaledFloored = nil
	
	local function createUIScaleOptionsImpl()
		-- upvalues: GuiService (upval), ScaledCeiled (ref), ScaledFloored (ref), NewPage (copy), UserGameSettings (upval), UtilityModule (upval), NewResult (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local AutoUIScaleHundredths = GuiService:GetAutoUIScaleHundredths()
		local RawScreenScale: number = GuiService:GetRawScreenScale()
		local CurrentCamera = workspace.CurrentCamera
		
		if not CurrentCamera then return end
		local ScaledCeiled1 = math.ceil(100 / RawScreenScale / 25) * 25
		local ScaledFloored1 = math.floor(CurrentCamera.ViewportSize.Y * RawScreenScale * GuiService:GetEffectiveUIScaleHundredths() / 100 / (540 * RawScreenScale) * 4) / 4 * 100
		local Rounded = math.round((ScaledFloored1 - ScaledCeiled1) / 25)
		
		if Rounded <= 0 then
			ScaledCeiled = nil
			ScaledFloored = nil
			
			if NewPage.UIScaleModeFrame then
				NewPage.UIScaleModeFrame:Destroy()
				NewPage.UIScaleModeFrame = nil
			end
			if NewPage.UIScaleFrame then
				NewPage.UIScaleFrame:Destroy()
				NewPage.UIScaleFrame = nil
			end
			return
		else
			if NewPage.UIScaleModeFrame and ScaledCeiled1 == ScaledCeiled and ScaledFloored1 == ScaledFloored then return end
			ScaledCeiled = ScaledCeiled1
			ScaledFloored = ScaledFloored1
			
			if NewPage.UIScaleModeFrame then
				NewPage.UIScaleModeFrame:Destroy()
				NewPage.UIScaleModeFrame = nil
			end
			if NewPage.UIScaleFrame then
				NewPage.UIScaleFrame:Destroy()
				NewPage.UIScaleFrame = nil
			end
			local function _(p1: number): number
				-- upvalues: ScaledCeiled1 (copy)
				return ScaledCeiled1 + p1 * 25
			end
			
			local _ = function(p1): number
				-- upvalues: ScaledCeiled1 (copy), Rounded (copy)
				return (math.clamp(math.round((p1 - ScaledCeiled1) / 25), 0, Rounded))
			end
			
			local UIScaleMultiplierHundredths = UserGameSettings.UIScaleMultiplierHundredths
			local IsNotUIScaleMultiplierHundredthsMatch = UIScaleMultiplierHundredths ~= 0
			local ClampedValue: number = if IsNotUIScaleMultiplierHundredthsMatch then math.clamp(math.round((UIScaleMultiplierHundredths - ScaledCeiled1) / 25), 0, Rounded) else 0
			NewPage.UIScaleModeFrame, NewPage.UIScaleModeLabel, NewPage.UIScaleModeSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScaleMode"), "Selector", {
				NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeAuto"),
				NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeManual")
			}, if IsNotUIScaleMultiplierHundredthsMatch then 2 else 1)
			NewPage.UIScaleModeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.UIScaleModeFrame
			NewPage.UIScaleFrame, NewPage.UIScaleLabel, NewPage.UIScaleSlider = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScale"), "Slider", Rounded, ClampedValue, nil, nil, NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScaleSmallest"), NewResult:Format("CoreScripts.InGameMenu.GameSettings.UIScaleLargest"))
			NewPage.UIScaleFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.UIScaleFrame
			NewPage.UIScaleFrame.Visible = IsNotUIScaleMultiplierHundredthsMatch
			NewPage.UIScaleModeSelector.IndexChanged:connect(function(p1)
				-- upvalues: NewPage (upval), AutoUIScaleHundredths (copy), ScaledCeiled1 (copy), Rounded (copy), GuiService (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
				local Visible = p1 == 2
				NewPage.UIScaleFrame.Visible = Visible
				
				if Visible then
					local ClampedValue = math.clamp(math.round(AutoUIScaleHundredths / 25) * 25, ScaledCeiled1, ScaledCeiled1 + Rounded * 25)
					NewPage.UIScaleSlider:SetValue((math.clamp(math.round((ClampedValue - ScaledCeiled1) / 25), 0, Rounded)))
					GuiService:SetUIScaleMultiplier(ClampedValue)
					reportSettingsChangeForAnalytics("ui_scale_mode", "auto", "manual")
				else
					GuiService:SetUIScaleMultiplier(0)
					reportSettingsChangeForAnalytics("ui_scale_mode", "manual", "auto")
				end
				reportSettingsForAnalytics()
			end)
			NewPage.UIScaleSlider.ValueChanged:connect(function(p1: number)
				-- upvalues: UserGameSettings (upval), ScaledCeiled1 (copy), GuiService (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
				local UIScaleMultiplierHundredths = UserGameSettings.UIScaleMultiplierHundredths
				local NewScaledCeiled = ScaledCeiled1 + p1 * 25
				GuiService:SetUIScaleMultiplier(NewScaledCeiled)
				reportSettingsChangeForAnalytics("ui_scale_value", UIScaleMultiplierHundredths, NewScaledCeiled)
				reportSettingsForAnalytics()
			end)
		end
	end
	
	local _ = function()
		-- upvalues: createUIScaleOptionsImpl (copy)
		local Success, Result = pcall(createUIScaleOptionsImpl)
		
		if not Success then
			warn("createUIScaleOptions failed: " .. tostring(Result))
		end
	end
	
	local function createUiNavigationKeyBindOptions()
		-- upvalues: GameSettings (upval), RobloxTranslatorModule (upval), UserInputService (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local config = { On = 1, Off = 2 }
		NewPage.UiNavigationKeyBindEnabledFrame, NewPage.UiNavigationKeyBindEnabledLabel, NewPage.UiNavigationKeyBindEnabledMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			(RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"))
		}, if GameSettings.UiNavigationKeyBindEnabled then 1 else 2, nil, (RobloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = UserInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})))
		NewPage.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.UiNavigationKeyBindEnabledFrame
		NewPage.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p1)
			-- upvalues: GameSettings (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local UiNavigationKeyBindEnabled = GameSettings.UiNavigationKeyBindEnabled
			GameSettings.UiNavigationKeyBindEnabled = p1 == 1
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("ui_navigation_key_bind_enabled", UiNavigationKeyBindEnabled, GameSettings.UiNavigationKeyBindEnabled)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _()
			-- upvalues: UserInputService (upval), NewPage (upval), GameSettings (upval)
			local KeyboardEnabled = UserInputService.KeyboardEnabled
			
			if NewPage.UiNavigationKeyBindEnabledFrame then
				NewPage.UiNavigationKeyBindEnabledFrame.Visible = KeyboardEnabled
				
				if KeyboardEnabled then
					NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(if GameSettings.UiNavigationKeyBindEnabled then 1 else 2)
					
					return
				end
				NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(2)
				GameSettings.UiNavigationKeyBindEnabled = false
			end
		end
		
		local KeyboardEnabled = UserInputService.KeyboardEnabled
		
		if NewPage.UiNavigationKeyBindEnabledFrame then
			NewPage.UiNavigationKeyBindEnabledFrame.Visible = KeyboardEnabled
			
			if KeyboardEnabled then
				NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(GameSettings.UiNavigationKeyBindEnabled and config.On or config.Off)
			else
				NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(config.Off)
				GameSettings.UiNavigationKeyBindEnabled = false
			end
		end
		UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: UserInputService (upval), NewPage (upval), GameSettings (upval), config (copy)
			local KeyboardEnabled = UserInputService.KeyboardEnabled
			
			if NewPage.UiNavigationKeyBindEnabledFrame then
				NewPage.UiNavigationKeyBindEnabledFrame.Visible = KeyboardEnabled
				
				if KeyboardEnabled then
					NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(GameSettings.UiNavigationKeyBindEnabled and config.On or config.Off)
					
					return
				end
				NewPage.UiNavigationKeyBindEnabledMode:SetSelectionIndex(config.Off)
				GameSettings.UiNavigationKeyBindEnabled = false
			end
		end)
	end
	
	local function createPerformanceStatsOptions()
		-- upvalues: NewPage (copy), GameSettings (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), CreateFunction (upval), ThemeModule (upval), CenterShiftLockOverride (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		NewPage.PerformanceStatsFrame = nil
		NewPage.PerformanceStatsLabel = nil
		NewPage.PerformanceStatsMode = nil
		NewPage.PerformanceStatsOverrideText = nil
		
		function GetDesiredPerformanceStatsIndex(): number
			-- upvalues: GameSettings (upval)
			return if GameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		NewPage.PerformanceStatsFrame, NewPage.PerformanceStatsLabel, NewPage.PerformanceStatsMode = UtilityModule:AddNewRow(NewPage, "Performance Stats", "Selector", { "On", "Off" }, (GetDesiredPerformanceStatsIndex()))
		NewPage.PerformanceStatsFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.PerformanceStatsFrame
		NewPage.PerformanceStatsOverrideText = CreateFunction("TextLabel")({
			Name = "PerformanceStatsLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = ThemeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = ThemeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = if CenterShiftLockOverride then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0),
			Position = if CenterShiftLockOverride then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0),
			AnchorPoint = if CenterShiftLockOverride then Vector2.new(1, 0.5) else nil,
			Parent = NewPage.PerformanceStatsFrame
		})
		NewPage.PerformanceStatsMode.IndexChanged:connect(function(p1)
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local PerformanceStatsVisible = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then GameSettings.PerformanceStatsVisible else nil
			
			if p1 == 1 then
				GameSettings.PerformanceStatsVisible = true
			else
				GameSettings.PerformanceStatsVisible = false
			end
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", PerformanceStatsVisible, GameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		GameSettings.PerformanceStatsVisibleChanged:connect(function()
			-- upvalues: NewPage (upval)
			local DesiredPerformanceStatsIndex = GetDesiredPerformanceStatsIndex()
			
			if DesiredPerformanceStatsIndex ~= NewPage.PerformanceStatsMode.CurrentIndex then
				NewPage.PerformanceStatsMode:SetSelectionIndex(DesiredPerformanceStatsIndex)
			end
		end)
	end
	
	local function createWebServerInformationRow()
		-- upvalues: NewPage (copy), UtilityModule (upval), MicroProfilerReadOnlyInformationLabel (upval), SETTINGSMENULAYOUTORDER (upval), TouchEnabled (upval), CreateFunction (upval), ThemeModule (upval)
		NewPage.InformationFrame, NewPage.InformationLabel, NewPage.InformationTextBox = UtilityModule:AddNewRow(NewPage, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not MicroProfilerReadOnlyInformationLabel and nil)
		NewPage.InformationFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.InformationFrame
		NewPage.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		
		if TouchEnabled then
			NewPage.InformationText = CreateFunction("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				BackgroundTransparency = 1,
				Visible = true,
				ZIndex = 2,
				Font = ThemeModule.font(Enum.Font.SourceSans),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size18),
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(0, 5, 0, 0),
				Parent = NewPage.InformationFrame
			})
		else
			NewPage.InformationText = CreateFunction("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				BackgroundTransparency = 1,
				Visible = true,
				ZIndex = 2,
				Font = ThemeModule.font(Enum.Font.SourceSans),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size14),
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(1, -650, 0, 20),
				Parent = NewPage.InformationFrame
			})
		end
		return NewPage.InformationFrame, NewPage.InformationText
	end
	
	local function createMicroProfilerOptions()
		-- upvalues: NewPage (copy), GameSettings (upval), createWebServerInformationRow (copy), IsPlatformMatch1 (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), IsPlatformMatch (upval), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), RbxAnalyticsService (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval), RobloxTranslatorModule (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval)
		NewPage.MicroProfilerFrame = nil
		NewPage.MicroProfilerLabel = nil
		NewPage.MicroProfilerMode = nil
		NewPage.MicroProfilerOverrideText = nil
		
		local function _(): boolean
			-- upvalues: GameSettings (upval), NewPage (upval), createWebServerInformationRow (upval)
			local MicroProfilerWebServerPort = GameSettings.MicroProfilerWebServerPort
			
			if MicroProfilerWebServerPort == 0 then
				return false
			else
				NewPage.InformationFrame, NewPage.InformationText = createWebServerInformationRow()
				NewPage.InformationText.Text = GameSettings.MicroProfilerWebServerIP .. MicroProfilerWebServerPort
				
				return true
			end
		end
		
		local function setMicroProfilerIndex(p1)
			-- upvalues: GameSettings (upval), NewPage (upval), IsPlatformMatch1 (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), createWebServerInformationRow (upval), IsPlatformMatch (upval), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), RbxAnalyticsService (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local function _()
				-- upvalues: GameSettings (upval), NewPage (upval)
				GameSettings.MicroProfilerWebServerEnabled = false
				
				if NewPage.InformationFrame or NewPage.InformationText then
					NewPage.InformationFrame.Visible = false
					NewPage.InformationFrame.Parent = nil
					NewPage.InformationText.Parent = nil
					NewPage.InformationFrame = nil
					NewPage.InformationText = nil
				end
			end
			
			local Microprofiler_type: string? = nil
			local MicroProfilerWebServerEnabled = nil
			local MicroProfilerWebServerEnabled1 = nil
			
			if IsPlatformMatch1 then
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					Microprofiler_type = "webserver"
					MicroProfilerWebServerEnabled = GameSettings.MicroProfilerWebServerEnabled
				end
				if p1 == 1 then
					GameSettings.MicroProfilerWebServerEnabled = true
					local Count = 30
					while Count >= 1 do
						local MicroProfilerWebServerPort = GameSettings.MicroProfilerWebServerPort
						local Flag = nil
						
						if MicroProfilerWebServerPort == 0 then
							Flag = false
						else
							NewPage.InformationFrame, NewPage.InformationText = createWebServerInformationRow()
							NewPage.InformationText.Text = GameSettings.MicroProfilerWebServerIP .. MicroProfilerWebServerPort
							Flag = true
						end
						if Flag then break end
						Count -= 1
						wait(0.1)
					end
					if Count <= 0 then
						NewPage.MicroProfilerMode:SetSelectionIndex(2)
						GameSettings.MicroProfilerWebServerEnabled = false
						
						if NewPage.InformationFrame or NewPage.InformationText then
							NewPage.InformationFrame.Visible = false
							NewPage.InformationFrame.Parent = nil
							NewPage.InformationText.Parent = nil
							NewPage.InformationFrame = nil
							NewPage.InformationText = nil
						end
					end
				else
					GameSettings.MicroProfilerWebServerEnabled = false
					
					if NewPage.InformationFrame or NewPage.InformationText then
						NewPage.InformationFrame.Visible = false
						NewPage.InformationFrame.Parent = nil
						NewPage.InformationText.Parent = nil
						NewPage.InformationFrame = nil
						NewPage.InformationText = nil
					end
				end
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					MicroProfilerWebServerEnabled1 = GameSettings.MicroProfilerWebServerEnabled
				end
			elseif IsPlatformMatch or IsInExperienceUIVREnabled and IsSpatialFunction() then
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					Microprofiler_type = "regular"
					MicroProfilerWebServerEnabled = GameSettings.OnScreenProfilerEnabled
				end
				GameSettings.OnScreenProfilerEnabled = p1 == 1
				
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					MicroProfilerWebServerEnabled1 = GameSettings.OnScreenProfilerEnabled
				end
			end
			RbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", MicroProfilerWebServerEnabled, MicroProfilerWebServerEnabled1, { microprofiler_type = Microprofiler_type })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function(): number
			-- upvalues: IsPlatformMatch1 (upval), GameSettings (upval), IsPlatformMatch (upval), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval)
			return if IsPlatformMatch1 then if GameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif (IsPlatformMatch or IsInExperienceUIVREnabled and IsSpatialFunction()) and GameSettings.OnScreenProfilerEnabled then 1 else 2
		end
		
		NewPage.MicroProfilerFrame, NewPage.MicroProfilerLabel, NewPage.MicroProfilerMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if IsPlatformMatch1 then if GameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif (IsPlatformMatch or IsInExperienceUIVREnabled and IsSpatialFunction()) and GameSettings.OnScreenProfilerEnabled then 1 else 2)
		NewPage.MicroProfilerFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.MicroProfilerFrame
		local MicroProfilerWebServerPort = GameSettings.MicroProfilerWebServerPort
		
		if MicroProfilerWebServerPort ~= 0 then
			NewPage.InformationFrame, NewPage.InformationText = createWebServerInformationRow()
			NewPage.InformationText.Text = GameSettings.MicroProfilerWebServerIP .. MicroProfilerWebServerPort
		end
		local Flag = false
		GameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
			-- upvalues: Flag (ref), GameSettings (upval), NewPage (upval)
			Flag = true
			
			if GameSettings.OnScreenProfilerEnabled then
				NewPage.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			else
				NewPage.MicroProfilerMode:SetSelectionIndex(2)
			end
		end)
		NewPage.MicroProfilerMode.IndexChanged:connect(function(...)
			-- upvalues: Flag (ref), setMicroProfilerIndex (copy)
			if Flag then
				Flag = false
				
				return
			else
				setMicroProfilerIndex(...)
			end
		end)
	end
	
	local function createCameraModeOptions(TouchEnabled)
		-- upvalues: NewPage (copy), GameSettings (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), t (copy), CreateFunction (upval), ThemeModule (upval), CenterShiftLockOverride (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval), LocalPlayer (upval), UserInputService (upval), CoreUtilityModule (upval), config3 (upval), VRService (upval), GetFFlagAlwaysShowVRToggleModule (upval), GetAppFeaturePoliciesFunction (upval), RobloxTranslatorModule (upval), ConstantsModule (upval), config5 (upval), FeatureSettingsHubTouchMovementModeClassicThumbstick (upval), config2 (upval), config1 (upval)
		NewPage.ShiftLockFrame = nil
		NewPage.ShiftLockLabel = nil
		NewPage.ShiftLockMode = nil
		NewPage.ShiftLockOverrideText = nil
		NewPage.ShiftLockFrame, NewPage.ShiftLockLabel, NewPage.ShiftLockMode = UtilityModule:AddNewRow(NewPage, "Shift Lock Switch", "Selector", { "On", "Off" }, if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		NewPage.ShiftLockFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.ShiftLockFrame
		t[NewPage.ShiftLockFrame] = true
		NewPage.ShiftLockOverrideText = CreateFunction("TextLabel")({
			Name = "ShiftLockOverrideLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = ThemeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = ThemeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = if CenterShiftLockOverride then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0),
			Position = if CenterShiftLockOverride then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0),
			AnchorPoint = if CenterShiftLockOverride then Vector2.new(1, 0.5) else nil,
			Parent = NewPage.ShiftLockFrame
		})
		NewPage.ShiftLockMode.IndexChanged:connect(function(p1)
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local IsControlModeMatch = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p1 == 1 then
				GameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				GameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", IsControlModeMatch, GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _(p1)
			-- upvalues: LocalPlayer (upval), NewPage (upval)
			local DevEnableMouseLock = p1 and LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockMode then
				NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
				NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
			end
		end
		
		local _ = function()
			-- upvalues: LocalPlayer (upval), NewPage (upval)
			local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockOverrideText then
				NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
				local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
				
				if NewPage.ShiftLockMode then
					NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
					NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
				end
			end
		end
		
		local _ = function()
			-- upvalues: UserInputService (upval), NewPage (upval), LocalPlayer (upval)
			local KeyboardEnabled = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled
			
			if NewPage.ShiftLockFrame then
				NewPage.ShiftLockFrame.Visible = KeyboardEnabled
			end
			local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockOverrideText then
				NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
				local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
				
				if NewPage.ShiftLockMode then
					NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
					NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
				end
			end
		end
		
		local KeyboardEnabled = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled
		
		if NewPage.ShiftLockFrame then
			NewPage.ShiftLockFrame.Visible = KeyboardEnabled
		end
		local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
		
		if NewPage.ShiftLockOverrideText then
			NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
			local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockMode then
				NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
				NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
			end
		end
		UserInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(function()
			-- upvalues: UserInputService (upval), NewPage (upval), LocalPlayer (upval)
			local KeyboardEnabled = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled
			
			if NewPage.ShiftLockFrame then
				NewPage.ShiftLockFrame.Visible = KeyboardEnabled
			end
			local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockOverrideText then
				NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
				local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
				
				if NewPage.ShiftLockMode then
					NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
					NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
				end
			end
		end)
		UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: UserInputService (upval), NewPage (upval), LocalPlayer (upval)
			local KeyboardEnabled = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled
			
			if NewPage.ShiftLockFrame then
				NewPage.ShiftLockFrame.Visible = KeyboardEnabled
			end
			local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockOverrideText then
				NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
				local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
				
				if NewPage.ShiftLockMode then
					NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
					NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
				end
			end
		end)
		
		function cameraModeIsUserChoice(): boolean
			-- upvalues: UserInputService (upval), LocalPlayer (upval)
			return if UserInputService.PreferredInput == Enum.PreferredInput.Touch then LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		
		function setCameraModeVisible(Visible)
			-- upvalues: NewPage (upval)
			if NewPage.CameraMode then
				NewPage.CameraMode.SelectorFrame.Visible = Visible
				NewPage.CameraMode:SetInteractable(Visible)
				NewPage.CameraModeOverrideText.Visible = not Visible
			end
		end
		
		local PlayerScripts = CoreUtilityModule.waitForChildOfClass(LocalPlayer, "PlayerScripts")
		local Names = {}
		local t1 = {}
		
		local function updateCurrentCameraMovementIndex(Count): boolean
			-- upvalues: t1 (ref), Names (ref), UserInputService (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), reportSettingsChangeForAnalytics (upval)
			local ComputerCameraMovementMode = nil
			
			if not pcall(function()
				-- upvalues: ComputerCameraMovementMode (ref), t1 (upval), Names (upval), Count (copy)
				ComputerCameraMovementMode = t1[Names[Count]]
			end) or ComputerCameraMovementMode == nil then
				return false
			end
			local Value = nil
			local IsNotValueMatch = nil
			
			if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					Value = GameSettings.TouchCameraMovementMode.Value
				end
				IsNotValueMatch = GameSettings.TouchCameraMovementMode.Value ~= ComputerCameraMovementMode
				GameSettings.TouchCameraMovementMode = ComputerCameraMovementMode
			else
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					Value = GameSettings.ComputerCameraMovementMode.Value
				end
				IsNotValueMatch = GameSettings.ComputerCameraMovementMode.Value ~= ComputerCameraMovementMode
				GameSettings.ComputerCameraMovementMode = ComputerCameraMovementMode
			end
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() and IsNotValueMatch then
				reportSettingsChangeForAnalytics("camera_mode", Value, ComputerCameraMovementMode)
			end
			return IsNotValueMatch
		end
		
		local function updateCameraMovementModes()
			-- upvalues: PlayerScripts (copy), UserInputService (upval), Names (ref), t1 (ref), config3 (upval), NewPage (upval), GameSettings (upval), updateCurrentCameraMovementIndex (copy)
			local RegisteredTouchCameraMovementModes = {}
			
			if PlayerScripts then
				local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
				RegisteredTouchCameraMovementModes = if IsPreferredInputMatch then PlayerScripts:GetRegisteredTouchCameraMovementModes() else PlayerScripts:GetRegisteredComputerCameraMovementModes()
			end
			Names = {}
			t1 = {}
			
			if #RegisteredTouchCameraMovementModes <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #RegisteredTouchCameraMovementModes do
				local RegisteredTouchCameraMovementMode = RegisteredTouchCameraMovementModes[i]
				local Name = RegisteredTouchCameraMovementMode.Name
				
				if Name == "Default" then
					local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
					Name = if IsPreferredInputMatch then config3.DEFAULT_FOLLOW else config3.DEFAULT_CLASSIC
				end
				Names[#Names + 1] = Name
				t1[Name] = RegisteredTouchCameraMovementMode.Value
			end
			if NewPage.CameraMode then
				NewPage.CameraMode:UpdateOptions(Names)
			end
			local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
			local Value = if IsPreferredInputMatch then GameSettings.TouchCameraMovementMode.Value else GameSettings.ComputerCameraMovementMode.Value
			
			if Value > -1 then
				if IsPreferredInputMatch or GameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					Value += 1
				end
				updateCurrentCameraMovementIndex(Value)
				NewPage.CameraMode:SetSelectionIndex(Value)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		NewPage.CameraModeFrame, NewPage.CameraModeLabel, NewPage.CameraMode = UtilityModule:AddNewRow(NewPage, "Camera Mode", "Selector", Names, 1)
		NewPage.CameraModeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.CameraModeFrame
		t[NewPage.CameraMode] = true
		NewPage.CameraModeOverrideText = CreateFunction("TextLabel")({
			Name = "CameraDevOverrideLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = ThemeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = ThemeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = UDim2.new(0.6, 0, 1, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Parent = NewPage.CameraModeFrame
		})
		
		if PlayerScripts then
			PlayerScripts.TouchCameraMovementModeRegistered:connect(function(_)
				-- upvalues: UserInputService (upval), updateCameraMovementModes (copy)
				if UserInputService.TouchEnabled then
					updateCameraMovementModes()
				end
			end)
			PlayerScripts.ComputerCameraMovementModeRegistered:connect(function(_)
				-- upvalues: UserInputService (upval), updateCameraMovementModes (copy)
				if UserInputService.MouseEnabled then
					updateCameraMovementModes()
				end
			end)
		end
		UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: updateCameraMovementModes (copy)
			updateCameraMovementModes()
		end)
		local Flag = false
		NewPage.CameraMode.IndexChanged:connect(function(p1)
			-- upvalues: updateCurrentCameraMovementIndex (copy), Flag (ref), reportSettingsForAnalytics (upval)
			if updateCurrentCameraMovementIndex(p1) then
				if Flag then
					reportSettingsForAnalytics()
				end
				Flag = true
			end
		end)
		updateCameraMovementModes()
		local Flag1 = false
		
		local function createVROption()
			-- upvalues: Flag1 (ref), GameSettings (upval), NewPage (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval)
			if not Flag1 then
				Flag1 = true
				local List = nil
				List = if GameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				NewPage.VREnabledFrame, NewPage.VREnabledLabel, NewPage.VREnabledSelector = UtilityModule:AddNewRow(NewPage, "VR", "Selector", List, if GameSettings.VREnabled then 1 else 2)
				NewPage.VREnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VREnabledFrame
				NewPage.VREnabledSelector.IndexChanged:connect(function(p1)
					-- upvalues: GameSettings (upval), List (ref), reportSettingsChangeForAnalytics (upval)
					local config = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local IsValueMatch = p1 == config.On.Value
					
					if GameSettings.VREnabled ~= IsValueMatch then
						GameSettings.VREnabled = IsValueMatch
						local Entry = List[config.On.Value]
						local Entry1 = List[p1]
						
						if Entry1 == List[config.On.Value] then
							Entry = List[config.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", Entry, Entry1)
					end
				end)
			end
		end
		
		local function onVREnabledChanged()
			-- upvalues: VRService (upval), GameSettings (upval), createVROption (copy)
			if VRService.VREnabled then
				GameSettings.HasEverUsedVR = true
				createVROption()
				
				return
			end
			if GameSettings.HasEverUsedVR then
				createVROption()
			end
		end
		
		if GetFFlagAlwaysShowVRToggleModule() and GetAppFeaturePoliciesFunction().getIsLinkedVRModeAvailable() then
			createVROption()
		else
			if VRService.VREnabled then
				GameSettings.HasEverUsedVR = true
				createVROption()
			elseif GameSettings.HasEverUsedVR then
				createVROption()
			end
			VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabledChanged)
		end
		local RegisteredTouchMovementModes = {}
		local t2 = {}
		local t3 = {}
		local t4 = {}
		
		local function v322(_) end
		
		local _ = function(p1)
			-- upvalues: NewPage (upval), RegisteredTouchMovementModes (ref)
			if NewPage.MovementMode then
				local Visible: boolean = p1 and #RegisteredTouchMovementModes > 0
				NewPage.MovementMode.SelectorFrame.Visible = Visible
				NewPage.MovementMode:SetInteractable(Visible)
				NewPage.MovementModeOverrideText.Visible = not Visible
			end
		end
		
		if TouchEnabled then
			local PlayerScripts1 = CoreUtilityModule.waitForChildOfClass(LocalPlayer, "PlayerScripts")
			
			local _ = function(CLICKTOMOVE)
				-- upvalues: UserInputService (upval), RobloxTranslatorModule (upval), ConstantsModule (upval), config5 (upval), FeatureSettingsHubTouchMovementModeClassicThumbstick (upval)
				local CLICKTOMOVE1 = CLICKTOMOVE
				
				if CLICKTOMOVE ~= "Default" then
					if CLICKTOMOVE == "KeyboardMouse" then
						CLICKTOMOVE1 = "Keyboard + Mouse"
						
						return CLICKTOMOVE1
					end
					if CLICKTOMOVE ~= "ClickToMove" then
						if CLICKTOMOVE == "DynamicThumbstick" then
							CLICKTOMOVE1 = "Dynamic Thumbstick"
							
							return CLICKTOMOVE1
						end
						if CLICKTOMOVE == "Thumbstick" then
							CLICKTOMOVE1 = FeatureSettingsHubTouchMovementModeClassicThumbstick
						end
						return CLICKTOMOVE1
					elseif UserInputService.PreferredInput == Enum.PreferredInput.Touch then
						return config5.TAP_TO_MOVE
					else
						CLICKTOMOVE1 = config5.CLICK_TO_MOVE
						
						return CLICKTOMOVE1
					end
				elseif UserInputService.PreferredInput == Enum.PreferredInput.Touch then
					return (RobloxTranslatorModule:FormatByKey(ConstantsModule.MovementModeDynamicThumbstickKey))
				else
					CLICKTOMOVE1 = config5.DEFAULT_KEYBOARD
					
					return CLICKTOMOVE1
				end
			end
			
			NewPage.MovementModeFrame, NewPage.MovementModeLabel, NewPage.MovementMode = UtilityModule:AddNewRow(NewPage, "Movement Mode", "Selector", {}, 1)
			NewPage.MovementModeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.MovementModeFrame
			t[NewPage.MovementMode] = true
			NewPage.MovementModeOverrideText = CreateFunction("TextLabel")({
				Name = "MovementDevOverrideLabel",
				Text = "Set by Developer",
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 2,
				TextColor3 = Color3.new(1, 1, 1),
				Font = ThemeModule.font(Enum.Font.SourceSans, "GameSettings"),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
				Size = UDim2.new(0.6, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Parent = NewPage.MovementModeFrame
			})
			
			local function setMovementMode(TouchMovementMode)
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), reportSettingsChangeForAnalytics (upval)
				local ComputerMovementMode = nil
				
				if TouchMovementMode.EnumType == Enum.TouchMovementMode then
					if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						ComputerMovementMode = GameSettings.TouchMovementMode
					end
					GameSettings.TouchMovementMode = TouchMovementMode
				else
					if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						ComputerMovementMode = GameSettings.ComputerMovementMode
					end
					GameSettings.ComputerMovementMode = TouchMovementMode
				end
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("movement_mode", ComputerMovementMode, TouchMovementMode)
				end
			end
			
			v322 = function(p1)
				-- upvalues: LocalPlayer (upval), NewPage (upval), RegisteredTouchMovementModes (ref)
				local IsDevTouchMovementModeMatch: boolean = if p1 then LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if NewPage.MovementMode then
					local Visible: boolean = IsDevTouchMovementModeMatch and #RegisteredTouchMovementModes > 0
					NewPage.MovementMode.SelectorFrame.Visible = Visible
					NewPage.MovementMode:SetInteractable(Visible)
					NewPage.MovementModeOverrideText.Visible = not Visible
				end
				if NewPage.MovementModeOverrideText then
					NewPage.MovementModeOverrideText.Visible = not IsDevTouchMovementModeMatch
				end
			end
			
			local function updateMovementModes()
				-- upvalues: UserInputService (upval), PlayerScripts1 (copy), RegisteredTouchMovementModes (ref), t2 (ref), t3 (ref), t4 (ref), NewPage (upval), RobloxTranslatorModule (upval), ConstantsModule (upval), config5 (upval), FeatureSettingsHubTouchMovementModeClassicThumbstick (upval), GameSettings (upval), setMovementMode (copy), v322 (ref)
				local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if PlayerScripts1 then
					RegisteredTouchMovementModes = if IsPreferredInputMatch then PlayerScripts1:GetRegisteredTouchMovementModes() else PlayerScripts1:GetRegisteredComputerMovementModes()
				end
				t2 = {}
				t3 = {}
				t4 = {}
				
				if #RegisteredTouchMovementModes > 0 then
					if NewPage.MovementMode then
						local Visible = #RegisteredTouchMovementModes > 0
						NewPage.MovementMode.SelectorFrame.Visible = Visible
						NewPage.MovementMode:SetInteractable(Visible)
						NewPage.MovementModeOverrideText.Visible = not Visible
					end
					for i, registeredTouchMovementMode in RegisteredTouchMovementModes do
						t3[i] = registeredTouchMovementMode
						local FormatByKeyResults = t4
						local Name = registeredTouchMovementMode.Name
						local FormatByKeyResult = Name
						
						if Name == "Default" then
							local IsPreferredInputMatch1 = UserInputService.PreferredInput == Enum.PreferredInput.Touch
							FormatByKeyResult = if IsPreferredInputMatch1 then RobloxTranslatorModule:FormatByKey(ConstantsModule.MovementModeDynamicThumbstickKey) else config5.DEFAULT_KEYBOARD
						elseif Name == "KeyboardMouse" then
							FormatByKeyResult = "Keyboard + Mouse"
						elseif Name == "ClickToMove" then
							local IsPreferredInputMatch2 = UserInputService.PreferredInput == Enum.PreferredInput.Touch
							FormatByKeyResult = if IsPreferredInputMatch2 then config5.TAP_TO_MOVE else config5.CLICK_TO_MOVE
						elseif Name == "DynamicThumbstick" then
							FormatByKeyResult = "Dynamic Thumbstick"
						elseif Name == "Thumbstick" then
							FormatByKeyResult = FeatureSettingsHubTouchMovementModeClassicThumbstick
						end
						FormatByKeyResults[i] = FormatByKeyResult
						t2[registeredTouchMovementMode] = i
					end
					if NewPage.MovementMode then
						NewPage.MovementMode:UpdateOptions(t4)
					end
					local TouchMovementMode = if IsPreferredInputMatch then GameSettings.TouchMovementMode else GameSettings.ComputerMovementMode
					
					if TouchMovementMode then
						setMovementMode(TouchMovementMode)
						NewPage.MovementMode:SetSelectionIndex(t2[TouchMovementMode])
					end
					v322(IsPreferredInputMatch)
					
					return
				elseif NewPage.MovementMode then
					NewPage.MovementMode.SelectorFrame.Visible = false
					NewPage.MovementMode:SetInteractable(false)
					NewPage.MovementModeOverrideText.Visible = true
				end
			end
			
			updateMovementModes()
			
			if PlayerScripts1 then
				PlayerScripts1.TouchMovementModeRegistered:connect(function(_)
					-- upvalues: UserInputService (upval), updateMovementModes (copy)
					if UserInputService.TouchEnabled then
						updateMovementModes()
					end
				end)
				PlayerScripts1.ComputerMovementModeRegistered:connect(function(_)
					-- upvalues: UserInputService (upval), updateMovementModes (copy)
					if UserInputService.MouseEnabled then
						updateMovementModes()
					end
				end)
			end
			UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
				-- upvalues: updateMovementModes (copy)
				updateMovementModes()
			end)
			NewPage.MovementMode.IndexChanged:connect(function(p1)
				-- upvalues: setMovementMode (copy), t3 (ref), reportSettingsForAnalytics (upval)
				setMovementMode(t3[p1])
				reportSettingsForAnalytics()
			end)
		end
		local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if if IsPreferredInputMatch then LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
			NewPage.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			NewPage.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local IsDevTouchMovementModeMatch: boolean = if IsPreferredInputMatch then LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		
		if NewPage.MovementModeOverrideText then
			if IsDevTouchMovementModeMatch then
				NewPage.MovementModeOverrideText.Visible = false
				
				if NewPage.MovementMode then
					local Visible = #RegisteredTouchMovementModes > 0
					NewPage.MovementMode.SelectorFrame.Visible = Visible
					NewPage.MovementMode:SetInteractable(Visible)
					NewPage.MovementModeOverrideText.Visible = not Visible
				end
			else
				NewPage.MovementModeOverrideText.Visible = true
				
				if NewPage.MovementMode then
					NewPage.MovementMode.SelectorFrame.Visible = false
					NewPage.MovementMode:SetInteractable(false)
					NewPage.MovementModeOverrideText.Visible = true
				end
			end
		end
		local NoDevEnableMouseLock1 = not LocalPlayer.DevEnableMouseLock
		
		if NewPage.ShiftLockOverrideText then
			NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock1
			local DevEnableMouseLock = not NoDevEnableMouseLock1 and LocalPlayer.DevEnableMouseLock
			
			if NewPage.ShiftLockMode then
				NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
				NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(p1)
			-- upvalues: LocalPlayer (upval), NewPage (upval), v322 (ref), RegisteredTouchMovementModes (ref)
			if p1 == "DevEnableMouseLock" then
				local NoDevEnableMouseLock = not LocalPlayer.DevEnableMouseLock
				
				if NewPage.ShiftLockOverrideText then
					NewPage.ShiftLockOverrideText.Visible = NoDevEnableMouseLock
					local DevEnableMouseLock = not NoDevEnableMouseLock and LocalPlayer.DevEnableMouseLock
					
					if NewPage.ShiftLockMode then
						NewPage.ShiftLockMode.SelectorFrame.Visible = DevEnableMouseLock
						NewPage.ShiftLockMode:SetInteractable(DevEnableMouseLock)
						
						return
					end
				end
			else
				if p1 == "DevComputerCameraMode" then
					local IsDevComputerCameraModeMatch = LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
					setCameraModeVisible(IsDevComputerCameraModeMatch)
					NewPage.CameraModeOverrideText.Visible = not IsDevComputerCameraModeMatch
					
					return
				end
				if p1 == "DevComputerMovementMode" then
					if v322 ~= nil then
						v322(false)
						
						return
					end
					local IsDevComputerMovementModeMatch = LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
					
					if NewPage.MovementMode then
						local Visible: boolean = IsDevComputerMovementModeMatch and #RegisteredTouchMovementModes > 0
						NewPage.MovementMode.SelectorFrame.Visible = Visible
						NewPage.MovementMode:SetInteractable(Visible)
						NewPage.MovementModeOverrideText.Visible = not Visible
					end
					if NewPage.MovementModeOverrideText then
						NewPage.MovementModeOverrideText.Visible = not IsDevComputerMovementModeMatch
						
						return
					end
				elseif p1 == "DevTouchMovementMode" then
					if v322 ~= nil then
						v322(true)
						
						return
					end
					local IsDevTouchMovementModeMatch = LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					
					if NewPage.MovementMode then
						local Visible: boolean = IsDevTouchMovementModeMatch and #RegisteredTouchMovementModes > 0
						NewPage.MovementMode.SelectorFrame.Visible = Visible
						NewPage.MovementMode:SetInteractable(Visible)
						NewPage.MovementModeOverrideText.Visible = not Visible
					end
					if NewPage.MovementModeOverrideText then
						NewPage.MovementModeOverrideText.Visible = not IsDevTouchMovementModeMatch
						
						return
					end
				elseif p1 == "DevTouchCameraMode" then
					local IsDevTouchCameraModeMatch = LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
					setCameraModeVisible(IsDevTouchCameraModeMatch)
					NewPage.CameraModeOverrideText.Visible = not IsDevTouchCameraModeMatch
				end
			end
		end
		
		LocalPlayer.Changed:connect(function(p1)
			-- upvalues: config2 (upval), updateUserSettingsMenu (copy), config1 (upval)
			if config2[p1] then
				updateUserSettingsMenu(p1)
			end
			if config1[p1] then
				updateUserSettingsMenu(p1)
			end
		end)
	end
	
	local function createFeedbackModeOptions()
		-- upvalues: Url (upval), HttpService (upval), FeedbackEntryPointImprovedStrictnessCheck (upval), NewPage (copy), SafetyService (upval), ExperienceStateCaptureService (upval), reportSettingsChangeForAnalytics (upval), FeedbackEntryPointButtonSizeAdjustment2 (upval), UtilityModule (upval), CoreScriptsFeedbackEntryPointButtonText (upval), RobloxTranslatorModule (upval), SETTINGSMENULAYOUTORDER (upval), DisableFeedbackSoothsayerCheck (upval), NewResult1 (upval)
		local Text = Url.ROLES_URL .. "v1/users/authenticated/roles"
		local RequestInternalResult = HttpService:RequestInternal({ Method = "GET", Url = Text })
		
		local function rolesCheckCallback(p1)
			-- upvalues: FeedbackEntryPointImprovedStrictnessCheck (upval), NewPage (upval), SafetyService (upval), ExperienceStateCaptureService (upval), reportSettingsChangeForAnalytics (upval), FeedbackEntryPointButtonSizeAdjustment2 (upval), UtilityModule (upval), CoreScriptsFeedbackEntryPointButtonText (upval), RobloxTranslatorModule (upval), SETTINGSMENULAYOUTORDER (upval)
			if p1 then
				if not FeedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not NewPage.FeedbackEntryPointEnabled then return end
				local function onToggleFeedbackMode()
					-- upvalues: FeedbackEntryPointImprovedStrictnessCheck (upval), NewPage (upval), SafetyService (upval), ExperienceStateCaptureService (upval), reportSettingsChangeForAnalytics (upval)
					if FeedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not NewPage.FeedbackEntryPointEnabled then return end
					NewPage.HubRef:PopMenu(false, true)
					
					if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
						SafetyService.IsCaptureModeForReport = false
					end
					if ExperienceStateCaptureService ~= nil then
						ExperienceStateCaptureService:ToggleCaptureMode()
					end
					reportSettingsChangeForAnalytics("translation_feedback", "", "pressed")
				end
				local ToggleFeedbackModeButton = nil
				local ToggleFeedbackModeButton2 = nil
				
				if FeedbackEntryPointButtonSizeAdjustment2 then
					ToggleFeedbackModeButton, ToggleFeedbackModeButton2 = UtilityModule:MakeStyledButton("toggleFeedbackModeButton", CoreScriptsFeedbackEntryPointButtonText, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, NewPage)
					ToggleFeedbackModeButton.Size = UDim2.new(0.6, 0, 0, 40)
					ToggleFeedbackModeButton.Position = UDim2.new(0.4, 0, 0.5, 0)
					ToggleFeedbackModeButton.AnchorPoint = Vector2.new(0, 0.5)
				else
					ToggleFeedbackModeButton, ToggleFeedbackModeButton2 = UtilityModule:MakeStyledButton("toggleFeedbackModeButton", CoreScriptsFeedbackEntryPointButtonText, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, NewPage)
					ToggleFeedbackModeButton.Size = UDim2.new(0, 300, 0, 30)
					ToggleFeedbackModeButton.Position = UDim2.new(0.4, 0, 0.5, 0)
					ToggleFeedbackModeButton.AnchorPoint = Vector2.new(0, 0.5)
				end
				ToggleFeedbackModeButton.ZIndex = 2
				ToggleFeedbackModeButton.Selectable = true
				ToggleFeedbackModeButton2.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					NewPage.toggleFeedbackModeButton = ToggleFeedbackModeButton
					NewPage.toggleFeedbackModeText = ToggleFeedbackModeButton2
				end
				if FeedbackEntryPointButtonSizeAdjustment2 then
					UtilityModule:AddNewRowObject(NewPage, RobloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), ToggleFeedbackModeButton, nil, true).LayoutOrder = SETTINGSMENULAYOUTORDER.FeedbackModeButton
					
					return
				end
				UtilityModule:AddNewRowObject(NewPage, RobloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), ToggleFeedbackModeButton).LayoutOrder = SETTINGSMENULAYOUTORDER.FeedbackModeButton
			end
		end
		
		if DisableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		else
			RequestInternalResult:Start(function(p1, p2)
				-- upvalues: HttpService (upval), NewResult1 (upval), Text (copy), rolesCheckCallback (copy)
				local Flag = false
				local v1 = false
				local v2 = nil
				
				if p1 then
					if p2.StatusCode == 401 then
						v2 = "Roles Api Request: Unauthorized"
					elseif p2.StatusCode < 200 or p2.StatusCode >= 400 then
						v2 = "Roles Api Status code: " .. p2.StatusCode
					else
						v1, v390 = pcall(function()
							-- upvalues: HttpService (upval), p2 (copy), Flag (ref)
							for _, role in pairs(HttpService:JSONDecode(p2.Body).roles) do
								if role == "Soothsayer" then
									Flag = true
								end
							end
						end)
					end
				else
					v2 = "Roles Api Request: Connection error"
				end
				if not v1 then
					NewResult1:warning("Feedback Mode initialization api call failed with url: " .. Text .. " and with error message: " .. v2)
				end
				rolesCheckCallback(Flag)
			end)
		end
	end
	
	local function createTranslationOptions()
		-- upvalues: Players (upval), Url (upval), HttpService (upval), NewResult1 (upval), NewPage (copy), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval), LocalPlayer (upval), reportSettingsChangeForAnalytics (upval), RunService (upval)
		local v1 = 1
		local v2 = 1
		local Flag = false
		local LanguageCode = nil
		local LocaleCode = nil
		local LocaleId = Players.LocalPlayer.LocaleId
		local LanguageCode1 = nil
		local v3 = nil
		local LanguageCodes = {}
		local LanguageCodes1 = {}
		local t = {}
		local LanguageCodes2 = {}
		local List = {}
		local Text = Url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", Players.LocalPlayer.LocaleId:gsub("-", "_"))
		local Text1 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local RequestInternalResult = HttpService:RequestInternal({ Method = "GET", Url = Text1 })
		local Text2 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local RequestInternalResult1 = HttpService:RequestInternal({ Method = "GET", Url = Text2 })
		local Text3 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local RequestInternalResult2 = HttpService:RequestInternal({ Method = "GET", Url = Text3 })
		
		local function userExperienceLanguageSettingsCallback(p1, Text: string)
			-- upvalues: NewResult1 (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval), List (copy), t (copy), LanguageCode (ref), LanguageCodes (copy), v3 (ref), LanguageCodes1 (copy), v1 (ref), v2 (ref), LocalPlayer (upval), LocaleCode (ref), reportSettingsChangeForAnalytics (upval), Url (upval), HttpService (upval), Flag (ref), RunService (upval)
			if p1 then
				local Enabled = false
				table.insert(List, t[LanguageCode].languageName .. " (Original)")
				
				for i, languageCode in pairs(LanguageCodes) do
					if languageCode == v3 then
						Enabled = true
					end
					if languageCode ~= LanguageCode then
						table.insert(List, t[languageCode].languageName)
					end
				end
				if Enabled == true then
					for i, value in pairs(List) do
						if i ~= 1 and LanguageCodes1[value] == v3 then
							v1 = i
							v2 = i
						end
					end
				end
				NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", List, v1)
				NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
				
				if v1 == 1 then
					LocalPlayer:SetExperienceSettingsLocaleId(LocaleCode)
				else
					LocalPlayer:SetExperienceSettingsLocaleId(t[LanguageCodes1[List[v1]]].localeCode)
				end
				NewPage.LanguageSelectorMode.CurrentLanguage = NewPage.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				NewPage.LanguageSelectorMode.IndexChanged:connect(function(p2)
					-- upvalues: NewPage (upval), t (upval), LanguageCode (upval), LanguageCodes1 (upval), List (upval), reportSettingsChangeForAnalytics (upval), Url (upval), HttpService (upval), v2 (upval), LocalPlayer (upval), LocaleCode (upval), NewResult1 (upval), Flag (upval), RunService (upval)
					NewPage.LanguageSelectorMode:SetInteractable(false)
					local Id = if p2 == 1 then t[LanguageCode].id else t[LanguageCodes1[List[p2]]].id
					local CurrentLanguage = NewPage.LanguageSelectorMode.CurrentLanguage
					local Entry = List[p2]
					
					if CurrentLanguage ~= Entry then
						NewPage.LanguageSelectorMode.CurrentLanguage = Entry
						reportSettingsChangeForAnalytics("experience_language", CurrentLanguage, Entry)
					end
					local Text = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local RequestInternalResult = HttpService:RequestInternal({
						Method = "POST",
						Url = Text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = HttpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = Id }
						})
					})
					
					local function callback(p3, Text)
						-- upvalues: v2 (upval), p2 (copy), LocalPlayer (upval), LocaleCode (upval), LanguageCodes1 (upval), List (upval), t (upval), NewResult1 (upval), Flag (upval), NewPage (upval)
						if p3 then
							v2 = p2
							
							if p2 == 1 then
								LocalPlayer:SetExperienceSettingsLocaleId(LocaleCode)
							else
								LocalPlayer:SetExperienceSettingsLocaleId(t[LanguageCodes1[List[p2]]].localeCode)
							end
						else
							NewResult1:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. Text)
							Flag = true
							NewPage.LanguageSelectorMode:SetSelectionIndex(v2)
						end
						NewPage.LanguageSelectorMode:SetInteractable(true)
					end
					
					if RunService:IsStudio() then
						v2 = p2
						
						if p2 == 1 then
							LocalPlayer:SetExperienceSettingsLocaleId(LocaleCode)
						else
							LocalPlayer:SetExperienceSettingsLocaleId(t[LanguageCodes1[List[p2]]].localeCode)
						end
						NewPage.LanguageSelectorMode:SetInteractable(true)
						
						return
					else
						if not Flag then
							RequestInternalResult:Start(function(p3, p4)
								-- upvalues: NewResult1 (upval), Text (copy), callback (copy)
								local Flag = false
								local v4: string? = nil
								
								if p3 then
									if p4.StatusCode == 401 then
										v4 = "User Experience Language Settings Update Request: Unauthorized"
									elseif p4.StatusCode < 200 or p4.StatusCode >= 400 then
										v4 = "User Experience Language Settings Update Request Status Code: " .. p4.StatusCode
									else
										NewResult1:info("User Experience Language Settings Update Request succeeded with code: " .. p4.StatusCode)
										Flag = true
									end
								else
									v4 = "User Experience Language Settings Update Request: Connection error"
								end
								if not Flag then
									NewResult1:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. Text .. " with error message: " .. v4)
								end
								callback(Flag, v4)
							end)
							
							return
						end
						Flag = false
						v2 = p2
						
						if p2 == 1 then
							LocalPlayer:SetExperienceSettingsLocaleId(LocaleCode)
						else
							LocalPlayer:SetExperienceSettingsLocaleId(t[LanguageCodes1[List[p2]]].localeCode)
						end
						NewPage.LanguageSelectorMode:SetInteractable(true)
					end
				end)
				
				return
			else
				if Text == nil then
					Text = "Execution path did not set earliest error to non-nil value."
				end
				NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. Text)
				NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
				NewPage.LanguageSelectorMode:SetInteractable(false)
				NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
			end
		end
		
		local function _(p2, p3)
			-- upvalues: RequestInternalResult2 (copy), HttpService (upval), v3 (ref), LanguageCode1 (ref), LanguageCode (ref), LanguageCodes2 (copy), NewResult1 (upval), Text3 (copy), userExperienceLanguageSettingsCallback (copy), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
			if p2 then
				RequestInternalResult2:Start(function(p4, p5)
					-- upvalues: HttpService (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), NewResult1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
					local v4 = false
					local v5 = nil
					
					if p4 then
						if p5.StatusCode == 401 then
							v5 = "User Experience Language Setting Request: Unauthorized"
						elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
							v5 = "User Experience Language Setting Request Status code: " .. p5.StatusCode
						else
							v4, v425 = pcall(function()
								-- upvalues: HttpService (upval), p5 (copy), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval)
								local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p5.Body).userUniverseLocalizationSettingValue
								
								if UserUniverseLocalizationSettingValue == nil then
									v3 = LanguageCode1
									
									return
								end
								if UserUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
									v3 = if UserUniverseLocalizationSettingValue.settingTargetId == 1 then LanguageCode else LanguageCode1
								end
								if UserUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
									if LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId] == nil then
										v3 = LanguageCode1
										
										return
									end
									v3 = LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId]
								end
							end)
						end
					else
						v5 = "User Experience Language Setting Request: Connection error"
					end
					if not v4 then
						NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. v5)
					end
					userExperienceLanguageSettingsCallback(v4, v5)
				end)
				
				return
			end
			local v4: string = p3
			
			if v4 == nil then
				v4 = "Execution path did not set earliest error to non-nil value."
			end
			NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v4)
			NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
			NewPage.LanguageSelectorMode:SetInteractable(false)
			NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
		end
		
		local _ = function(p2, p3)
			-- upvalues: RequestInternalResult1 (copy), HttpService (upval), LanguageCodes (copy), NewResult1 (upval), Text2 (copy), RequestInternalResult2 (copy), v3 (ref), LanguageCode1 (ref), LanguageCode (ref), LanguageCodes2 (copy), Text3 (copy), userExperienceLanguageSettingsCallback (copy), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
			if p2 then
				RequestInternalResult1:Start(function(p4, p5)
					-- upvalues: HttpService (upval), LanguageCodes (upval), NewResult1 (upval), Text2 (upval), p3 (ref), p2 (copy), RequestInternalResult2 (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
					local v4 = false
					local v5 = nil
					
					if p4 then
						if p5.StatusCode == 401 then
							v5 = "Experience Supported Language Request: Unauthorized"
						elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
							v5 = "Experience Supported Language Request Status code: " .. p5.StatusCode
						else
							v4, v429 = pcall(function()
								-- upvalues: HttpService (upval), p5 (copy), LanguageCodes (upval)
								for i, entry in pairs(HttpService:JSONDecode(p5.Body).data) do
									LanguageCodes[i] = entry.languageCode
								end
							end)
						end
					else
						v5 = "Experience Supported Language Request: Connection error"
					end
					if not v4 then
						NewResult1:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text2 .. " with error message: " .. v5)
					end
					if p3 == nil then
						p3 = v5
					end
					local v6: string = p3
					
					if v4 and p2 then
						RequestInternalResult2:Start(function(p6, p7)
							-- upvalues: HttpService (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), NewResult1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
							local v7 = false
							local v8 = nil
							
							if p6 then
								if p7.StatusCode == 401 then
									v8 = "User Experience Language Setting Request: Unauthorized"
								elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
									v8 = "User Experience Language Setting Request Status code: " .. p7.StatusCode
								else
									v7, v425 = pcall(function()
										-- upvalues: HttpService (upval), p7 (copy), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval)
										local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p7.Body).userUniverseLocalizationSettingValue
										
										if UserUniverseLocalizationSettingValue == nil then
											v3 = LanguageCode1
											
											return
										end
										if UserUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
											v3 = if UserUniverseLocalizationSettingValue.settingTargetId == 1 then LanguageCode else LanguageCode1
										end
										if UserUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
											if LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId] == nil then
												v3 = LanguageCode1
												
												return
											end
											v3 = LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId]
										end
									end)
								end
							else
								v8 = "User Experience Language Setting Request: Connection error"
							end
							if not v7 then
								NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. v8)
							end
							userExperienceLanguageSettingsCallback(v7, v8)
						end)
						
						return
					end
					local v7: string = v6
					
					if v7 == nil then
						v7 = "Execution path did not set earliest error to non-nil value."
					end
					NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v7)
					NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
					NewPage.LanguageSelectorMode:SetInteractable(false)
					NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
				end)
			else
				local v8: string = p3
				
				if v8 == nil then
					v8 = "Execution path did not set earliest error to non-nil value."
				end
				NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v8)
				NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
				NewPage.LanguageSelectorMode:SetInteractable(false)
				NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p4, p5)
			-- upvalues: RequestInternalResult (copy), HttpService (upval), LanguageCode (ref), LocaleCode (ref), t (copy), NewResult1 (upval), Text1 (copy), RequestInternalResult1 (copy), LanguageCodes (copy), Text2 (copy), RequestInternalResult2 (copy), v3 (ref), LanguageCode1 (ref), LanguageCodes2 (copy), Text3 (copy), userExperienceLanguageSettingsCallback (copy), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
			if p4 then
				RequestInternalResult:Start(function(p6, p7)
					-- upvalues: HttpService (upval), LanguageCode (upval), LocaleCode (upval), t (upval), NewResult1 (upval), Text1 (upval), p5 (ref), p4 (copy), RequestInternalResult1 (upval), LanguageCodes (upval), Text2 (upval), RequestInternalResult2 (upval), v3 (upval), LanguageCode1 (upval), LanguageCodes2 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
					local v4 = false
					local v5 = nil
					
					if p6 then
						if p7.StatusCode == 401 then
							v5 = "Experience Source Language Request: Unauthorized"
						elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
							v5 = "Experience Source Language Status code: " .. p7.StatusCode
						else
							v4, v434 = pcall(function()
								-- upvalues: HttpService (upval), p7 (copy), LanguageCode (upval), LocaleCode (upval), t (upval)
								LanguageCode = HttpService:JSONDecode(p7.Body).languageCode
								LocaleCode = t[LanguageCode].localeCode
							end)
						end
					else
						v5 = "Experience Source Language Request: Connection error"
					end
					if not v4 then
						NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text1 .. " with error message: " .. v5)
					end
					if p5 == nil then
						p5 = v5
					end
					local v6 = v4 and p4
					local v7: string = p5
					
					if v6 then
						RequestInternalResult1:Start(function(p8, p9)
							-- upvalues: HttpService (upval), LanguageCodes (upval), NewResult1 (upval), Text2 (upval), v7 (ref), v6 (copy), RequestInternalResult2 (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
							local v8 = false
							local v9 = nil
							
							if p8 then
								if p9.StatusCode == 401 then
									v9 = "Experience Supported Language Request: Unauthorized"
								elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then
									v9 = "Experience Supported Language Request Status code: " .. p9.StatusCode
								else
									v8, v429 = pcall(function()
										-- upvalues: HttpService (upval), p9 (copy), LanguageCodes (upval)
										for i, entry in pairs(HttpService:JSONDecode(p9.Body).data) do
											LanguageCodes[i] = entry.languageCode
										end
									end)
								end
							else
								v9 = "Experience Supported Language Request: Connection error"
							end
							if not v8 then
								NewResult1:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text2 .. " with error message: " .. v9)
							end
							if v7 == nil then
								v7 = v9
							end
							local v10: string = v7
							
							if v8 and v6 then
								RequestInternalResult2:Start(function(p10, p11)
									-- upvalues: HttpService (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), NewResult1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
									local v11 = false
									local v12 = nil
									
									if p10 then
										if p11.StatusCode == 401 then
											v12 = "User Experience Language Setting Request: Unauthorized"
										elseif p11.StatusCode < 200 or p11.StatusCode >= 400 then
											v12 = "User Experience Language Setting Request Status code: " .. p11.StatusCode
										else
											v11, v425 = pcall(function()
												-- upvalues: HttpService (upval), p11 (copy), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval)
												local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p11.Body).userUniverseLocalizationSettingValue
												
												if UserUniverseLocalizationSettingValue == nil then
													v3 = LanguageCode1
													
													return
												end
												if UserUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
													v3 = if UserUniverseLocalizationSettingValue.settingTargetId == 1 then LanguageCode else LanguageCode1
												end
												if UserUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
													if LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId] == nil then
														v3 = LanguageCode1
														
														return
													end
													v3 = LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId]
												end
											end)
										end
									else
										v12 = "User Experience Language Setting Request: Connection error"
									end
									if not v11 then
										NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. v12)
									end
									userExperienceLanguageSettingsCallback(v11, v12)
								end)
								
								return
							end
							local v11: string = v10
							
							if v11 == nil then
								v11 = "Execution path did not set earliest error to non-nil value."
							end
							NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v11)
							NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
							NewPage.LanguageSelectorMode:SetInteractable(false)
							NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
						end)
					else
						local v12: string = v7
						
						if v12 == nil then
							v12 = "Execution path did not set earliest error to non-nil value."
						end
						NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v12)
						NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
						NewPage.LanguageSelectorMode:SetInteractable(false)
						NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
					end
				end)
			else
				local v8: string = p5
				
				if v8 == nil then
					v8 = "Execution path did not set earliest error to non-nil value."
				end
				NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v8)
				NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
				NewPage.LanguageSelectorMode:SetInteractable(false)
				NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
			end
		end
		
		HttpService:RequestInternal({ Method = "GET", Url = Text }):Start(function(p6, p7)
			-- upvalues: HttpService (upval), t (copy), LanguageCodes2 (copy), LanguageCodes1 (copy), LocaleId (copy), LanguageCode1 (ref), NewResult1 (upval), Text (copy), RequestInternalResult (copy), LanguageCode (ref), LocaleCode (ref), Text1 (copy), RequestInternalResult1 (copy), LanguageCodes (copy), Text2 (copy), RequestInternalResult2 (copy), v3 (ref), Text3 (copy), userExperienceLanguageSettingsCallback (copy), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
			local v4 = false
			local v5 = nil
			
			if p6 then
				if p7.StatusCode == 401 then
					v5 = "Locale Code to Language Code Mapping Request: Unauthorized"
				elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
					v5 = "Locale Code to Language Code Mapping Request Status code: " .. p7.StatusCode
				else
					v4, v439 = pcall(function()
						-- upvalues: HttpService (upval), p7 (copy), t (upval), LanguageCodes2 (upval), LanguageCodes1 (upval), LocaleId (upval), LanguageCode1 (upval)
						for _, entry in pairs(HttpService:JSONDecode(p7.Body).data) do
							local LanguageCode = entry.locale.language.languageCode
							local Name = entry.locale.language.name
							local Id = entry.locale.language.id
							t[LanguageCode] = {
								localeCode = entry.locale.locale,
								languageName = Name,
								id = Id
							}
							LanguageCodes2[Id] = LanguageCode
							LanguageCodes1[Name] = LanguageCode
							
							if entry.locale.locale == LocaleId:gsub("-", "_") then
								LanguageCode1 = entry.locale.language.languageCode
							end
						end
					end)
				end
			else
				v5 = "Locale Code to Language Code Mapping Request: Connection error"
			end
			if not v4 then
				NewResult1:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text .. " with error message: " .. v5)
			end
			local v6: boolean = v4
			local v7: string = v5
			
			if v6 then
				RequestInternalResult:Start(function(p8, p9)
					-- upvalues: HttpService (upval), LanguageCode (upval), LocaleCode (upval), t (upval), NewResult1 (upval), Text1 (upval), v7 (ref), v6 (copy), RequestInternalResult1 (upval), LanguageCodes (upval), Text2 (upval), RequestInternalResult2 (upval), v3 (upval), LanguageCode1 (upval), LanguageCodes2 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
					local v8 = false
					local v9 = nil
					
					if p8 then
						if p9.StatusCode == 401 then
							v9 = "Experience Source Language Request: Unauthorized"
						elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then
							v9 = "Experience Source Language Status code: " .. p9.StatusCode
						else
							v8, v434 = pcall(function()
								-- upvalues: HttpService (upval), p9 (copy), LanguageCode (upval), LocaleCode (upval), t (upval)
								LanguageCode = HttpService:JSONDecode(p9.Body).languageCode
								LocaleCode = t[LanguageCode].localeCode
							end)
						end
					else
						v9 = "Experience Source Language Request: Connection error"
					end
					if not v8 then
						NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text1 .. " with error message: " .. v9)
					end
					if v7 == nil then
						v7 = v9
					end
					local v10 = v8 and v6
					local v11: string = v7
					
					if v10 then
						RequestInternalResult1:Start(function(p10, p11)
							-- upvalues: HttpService (upval), LanguageCodes (upval), NewResult1 (upval), Text2 (upval), v11 (ref), v10 (copy), RequestInternalResult2 (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval), NewPage (upval), UtilityModule (upval), RobloxTranslatorModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), SETTINGSMENULAYOUTORDER (upval)
							local v12 = false
							local v13 = nil
							
							if p10 then
								if p11.StatusCode == 401 then
									v13 = "Experience Supported Language Request: Unauthorized"
								elseif p11.StatusCode < 200 or p11.StatusCode >= 400 then
									v13 = "Experience Supported Language Request Status code: " .. p11.StatusCode
								else
									v12, v429 = pcall(function()
										-- upvalues: HttpService (upval), p11 (copy), LanguageCodes (upval)
										for i, entry in pairs(HttpService:JSONDecode(p11.Body).data) do
											LanguageCodes[i] = entry.languageCode
										end
									end)
								end
							else
								v13 = "Experience Supported Language Request: Connection error"
							end
							if not v12 then
								NewResult1:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. Text2 .. " with error message: " .. v13)
							end
							if v11 == nil then
								v11 = v13
							end
							local v14: string = v11
							
							if v12 and v10 then
								RequestInternalResult2:Start(function(p12, p13)
									-- upvalues: HttpService (upval), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval), NewResult1 (upval), Text3 (upval), userExperienceLanguageSettingsCallback (upval)
									local v15 = false
									local v16 = nil
									
									if p12 then
										if p13.StatusCode == 401 then
											v16 = "User Experience Language Setting Request: Unauthorized"
										elseif p13.StatusCode < 200 or p13.StatusCode >= 400 then
											v16 = "User Experience Language Setting Request Status code: " .. p13.StatusCode
										else
											v15, v425 = pcall(function()
												-- upvalues: HttpService (upval), p13 (copy), v3 (upval), LanguageCode1 (upval), LanguageCode (upval), LanguageCodes2 (upval)
												local UserUniverseLocalizationSettingValue = HttpService:JSONDecode(p13.Body).userUniverseLocalizationSettingValue
												
												if UserUniverseLocalizationSettingValue == nil then
													v3 = LanguageCode1
													
													return
												end
												if UserUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
													v3 = if UserUniverseLocalizationSettingValue.settingTargetId == 1 then LanguageCode else LanguageCode1
												end
												if UserUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
													if LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId] == nil then
														v3 = LanguageCode1
														
														return
													end
													v3 = LanguageCodes2[UserUniverseLocalizationSettingValue.settingTargetId]
												end
											end)
										end
									else
										v16 = "User Experience Language Setting Request: Connection error"
									end
									if not v15 then
										NewResult1:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. Text3 .. " with error message: " .. v16)
									end
									userExperienceLanguageSettingsCallback(v15, v16)
								end)
								
								return
							end
							local v15: string = v14
							
							if v15 == nil then
								v15 = "Execution path did not set earliest error to non-nil value."
							end
							NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v15)
							NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
							NewPage.LanguageSelectorMode:SetInteractable(false)
							NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
						end)
					else
						local v16: string = v11
						
						if v16 == nil then
							v16 = "Execution path did not set earliest error to non-nil value."
						end
						NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v16)
						NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
						NewPage.LanguageSelectorMode:SetInteractable(false)
						NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
					end
				end)
			else
				local v12: string = v7
				
				if v12 == nil then
					v12 = "Execution path did not set earliest error to non-nil value."
				end
				NewResult1:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v12)
				NewPage.LanguageSelectorFrame, NewPage.LanguageSelectorLabel, NewPage.LanguageSelectorMode = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { FeatureSettingsHubLanguageSelectionUnavailable }, 1)
				NewPage.LanguageSelectorMode:SetInteractable(false)
				NewPage.LanguageSelectorFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.LanguageSelectorFrame
			end
		end)
	end
	
	local function getChatTranslationLayerData(p8)
		-- upvalues: GetFFlagChatTranslationWaitForIXPModule (upval), IXPServiceWrapper (upval), GetFFlagChatTranslationNewDefaultsModule (upval)
		local config = {
			ChatTranslationEnabled = false,
			ChatTranslationToggleEnabled = false
		}
		
		if not p8 or p8 == "" then
			return config
		end
		if p8 == "override" then
			config.ChatTranslationEnabled = true
			
			return config
		end
		if GetFFlagChatTranslationWaitForIXPModule() then
			IXPServiceWrapper:WaitForInitialization()
		end
		local Success, Result = pcall(function()
			-- upvalues: IXPServiceWrapper (upval), p8 (copy)
			return IXPServiceWrapper:GetLayerData(p8)
		end)
		
		if Success then
			if GetFFlagChatTranslationNewDefaultsModule() then
				config.ChatTranslationEnabled = Result.ChatTranslationEnabled or true
				config.ChatTranslationToggleEnabled = Result.ChatTranslationToggleEnabled or false
				
				return config
			end
			config.ChatTranslationEnabled = Result.chatTranslationEnabled or false
			config.ChatTranslationToggleEnabled = Result.chatTranslationToggleEnabled or false
		end
		return config
	end
	
	local function createVolumeOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), FFlagRenameVolumeToMainVolumeModule (upval), RobloxTranslatorModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		NewPage.VolumeFrame, NewPage.VolumeLabel, NewPage.VolumeSlider = UtilityModule:AddNewRow(NewPage, if FFlagRenameVolumeToMainVolumeModule then RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume") else "Volume", "Slider", 10, (math.floor(GameSettings.MasterVolume * 10)))
		NewPage.VolumeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VolumeFrame
		local VolumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		VolumeChangeSound.Name = "VolumeChangeSound"
		VolumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		NewPage.VolumeSlider.ValueChanged:connect(function(p8: number)
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), VolumeChangeSound (copy), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local Floored = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(GameSettings.MasterVolume * 10 + 0.5) else nil
			local MasterVolume = p8 / 10
			VolumeChangeSound.Volume = MasterVolume
			VolumeChangeSound:Play()
			GameSettings.MasterVolume = MasterVolume
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", Floored, (math.floor(GameSettings.MasterVolume * 10 + 0.5)))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction (upval), Default3 (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local Floored = math.floor(GameSettings.PartyVoiceVolume * 10)
		NewPage.PartyVoiceVolumeFrame, NewPage.PartyVoiceVolumeLabel, NewPage.PartyVoiceVolumeSlider = UtilityModule:AddNewRow(NewPage, "Party Voice Volume", "Slider", 10, Floored)
		NewPage.PartyVoiceVolumeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.PartyVoiceVolumeFrame
		
		if GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction() then
			NewPage.PartyVoiceVolumeFrame.Visible = Default3.hasExperienceStarted
			Default3.ExperienceJoined.Event:Connect(function()
				-- upvalues: NewPage (upval)
				NewPage.PartyVoiceVolumeFrame.Visible = true
			end)
			Default3.ExperienceLeft.Event:Connect(function()
				-- upvalues: NewPage (upval)
				NewPage.PartyVoiceVolumeFrame.Visible = false
			end)
		end
		NewPage.PartyVoiceVolumeSlider.ValueChanged:connect(function(p8: number)
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), Floored (copy), GameSettings (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local Floored1 = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then if Floored == nil then 0 else math.floor(Floored * 10 + 0.5) else nil
			GameSettings.PartyVoiceVolume = p8 / 10
			
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", Floored1, (math.floor(p8 * 10 + 0.5)))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createVoiceChatVolumeOptions()
		-- upvalues: GameSettings (upval), NewResult (upval), NewResult1 (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), VoiceVolumeControlsDisableInteractionWhenNoMasterVolume (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local Floored = math.floor(GameSettings.VoiceChatVolume * 5 + 0.5)
		local Success, Result = pcall(function()
			-- upvalues: NewResult (upval)
			return NewResult:Format("CoreScripts.InGameMenu.GameSettings.VoiceChatVolume")
		end)
		
		if not Success then
			Result = "Voice Chat Volume"
			NewResult1:debug("[GameSettings] createVoiceChatVolumeOptions failed to get translation for Voice Chat Volume label, using placeholder text instead")
		end
		NewPage.VoiceChatVolumeFrame, NewPage.VoiceChatVolumeLabel, NewPage.VoiceChatVolumeSlider = UtilityModule:AddNewRow(NewPage, Result, "Slider", 10, Floored)
		NewPage.VoiceChatVolumeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VoiceChatVolumeFrame
		NewPage.VoiceChatVolumeFrame.Visible = false
		
		if VoiceVolumeControlsDisableInteractionWhenNoMasterVolume then
			local function updateVoiceChatVolumeSliderInteractable(p8)
				-- upvalues: GameSettings (upval), NewPage (upval)
				if if p8 == nil then GameSettings.MasterVolume == 0 else p8 == 0 then
					NewPage.VoiceChatVolumeSlider:SetZIndex(1)
					NewPage.VoiceChatVolumeLabel.ZIndex = 1
					NewPage.VoiceChatVolumeSlider:SetInteractable(false)
					
					return
				else
					NewPage.VoiceChatVolumeSlider:SetZIndex(2)
					NewPage.VoiceChatVolumeLabel.ZIndex = 2
					NewPage.VoiceChatVolumeSlider:SetInteractable(true)
				end
			end
			
			updateVoiceChatVolumeSliderInteractable()
			NewPage.VolumeSlider.ValueChanged:connect(updateVoiceChatVolumeSliderInteractable)
		end
		NewPage.VoiceChatVolumeSlider.ValueChanged:connect(function(p8: number)
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), NewPage (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local Floored = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(GameSettings.VoiceChatVolume * 5 + 0.5) else nil
			GameSettings.VoiceChatVolume = p8 / 5
			
			if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and NewPage.maxVoiceChatVolumeDuringSession ~= nil then
				NewPage.maxVoiceChatVolumeDuringSession = math.max(NewPage.maxVoiceChatVolumeDuringSession, GameSettings.VoiceChatVolume)
			end
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("voice_chat_volume", Floored, (math.floor(GameSettings.VoiceChatVolume * 5 + 0.5)))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle()
		-- upvalues: GameSettings (upval), GetAppFeaturePoliciesFunction (upval), NewResult (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		NewPage.HapticsFrame, _, NewPage.HapticsSelector = UtilityModule:AddNewRow(NewPage, if GetAppFeaturePoliciesFunction().getShouldUseVibrationInsteadOfHaptics() then NewResult:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if GameSettings.HapticStrength == 0 then 1 else 2)
		NewPage.HapticsFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.HapticsFrame
		NewPage.HapticsSelector.IndexChanged:connect(function(p8)
			-- upvalues: GameSettings (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
			local HapticStrength = GameSettings.HapticStrength
			
			if p8 == 2 then
				GameSettings.HapticStrength = 1
			else
				GameSettings.HapticStrength = 0
			end
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("haptics_toggle", HapticStrength, GameSettings.HapticStrength)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createCameraInvertedOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), t (copy), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local v8 = 1
		
		if pcall(function()
			-- upvalues: GameSettings (upval), v8 (ref)
			if GameSettings.CameraYInverted == true then
				v8 = 2
			end
		end) ~= false then
			NewPage.CameraInvertedFrame, _, NewPage.CameraInvertedSelector = UtilityModule:AddNewRow(NewPage, "Camera Inverted", "Selector", { "Off", "On" }, v8)
			NewPage.CameraInvertedFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.CameraInvertedFrame
			t[NewPage.CameraInvertedFrame] = true
			NewPage.CameraInvertedSelector.IndexChanged:connect(function(p8)
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), GameSettings (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
				local CameraYInverted = if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then GameSettings.CameraYInverted else nil
				
				if p8 == 2 then
					GameSettings.CameraYInverted = true
				else
					GameSettings.CameraYInverted = false
				end
				if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("camera_y_inverted", CameraYInverted, GameSettings.CameraYInverted)
				end
				reportSettingsForAnalytics()
			end)
			
			return
		end
	end
	
	local function setCameraSensitivity(X)
		-- upvalues: UserInputService (upval), GameSettings (upval), GetFFlagEnableExplicitSettingsChangeAnalyticsModule (upval), reportSettingsChangeForAnalytics (upval), reportSettingsForAnalytics (upval)
		local Sensitivity_type: string? = nil
		local GamepadCameraSensitivity = nil
		
		if UserInputService.GamepadEnabled and GameSettings.IsUsingGamepadCameraSensitivity then
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				Sensitivity_type = "gamepad"
				GamepadCameraSensitivity = GameSettings.GamepadCameraSensitivity
			end
			GameSettings.GamepadCameraSensitivity = X
		end
		if UserInputService.MouseEnabled then
			if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				Sensitivity_type = "mouse"
				GamepadCameraSensitivity = GameSettings.MouseSensitivityFirstPerson.X
			end
			local _Vector2 = Vector2.new(X, X)
			GameSettings.MouseSensitivityFirstPerson = _Vector2
			GameSettings.MouseSensitivityThirdPerson = _Vector2
		end
		if GetFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(GamepadCameraSensitivity) == "number" and typeof(X) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", GamepadCameraSensitivity)), tonumber(string.format("%.2f", X)), { sensitivity_type = Sensitivity_type })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), t (copy), CreateFunction (upval), ThemeModule (upval), setCameraSensitivity (copy)
		local function _(p8: number): number
			local Floored: number = p8 <= 1 and math.floor((p8 - 0.2) / 0.16 + 0.5) or math.floor((p8 + 2) / 0.6 + 0.5)
			
			return if p8 <= 0.2 then 0 else Floored
		end
		
		local _ = function(p8: number): number
			local v8: number = p8 <= 5 and 0.16 * p8 + 0.2 or 0.6 * p8 - 2
			
			return if v8 <= 0.2 then 0.2 else v8
		end
		
		local MouseSensitivity: number = GameSettings.MouseSensitivity
		local Floored: number = MouseSensitivity <= 1 and math.floor((MouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((MouseSensitivity + 2) / 0.6 + 0.5)
		local Floored1: number = if MouseSensitivity <= 0.2 then 0 else Floored
		local Flag = true
		local _ = tostring(GameSettings.MouseSensitivityFirstPerson.X)
		NewPage.MouseAdvancedFrame, NewPage.MouseAdvancedLabel, NewPage.MouseAdvancedEntry = UtilityModule:AddNewRow(NewPage, "Camera Sensitivity", "Slider", 10, Floored1)
		NewPage.MouseAdvancedFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.MouseAdvancedFrame
		t[NewPage.MouseAdvancedFrame] = true
		NewPage.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(NewPage.MouseAdvancedEntry.SliderFrame.Size.X.Scale, NewPage.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, NewPage.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, NewPage.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		NewPage.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(NewPage.MouseAdvancedEntry.SliderFrame.Position.X.Scale, NewPage.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, NewPage.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, NewPage.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		NewPage.MouseAdvancedLabel.ZIndex = 2
		NewPage.MouseAdvancedEntry:SetInteractable(true)
		local TextBox = CreateFunction("TextBox")({
			Name = "CameraSensitivityTextBox",
			ZIndex = 3,
			Selectable = false,
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0.8, 0.8, 0.8),
			BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
			Font = ThemeModule.font(Enum.Font.SourceSans),
			TextSize = ThemeModule.textSize(18),
			Size = UDim2.new(0, 60, 0.8, 0),
			Position = UDim2.new(1, 10, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Parent = NewPage.MouseAdvancedEntry.SliderFrame
		})
		CreateFunction("UICorner")({
			CornerRadius = ThemeModule.DefaultCornerRadius,
			Parent = TextBox
		})
		
		local _ = function(p8: number)
			-- upvalues: TextBox (copy)
			TextBox.Text = tostring((tonumber((string.format("%.3f", math.floor(p8 * 1000 + 0.5) / 1000)))))
		end
		
		TextBox.Text = tostring((tonumber((string.format("%.3f", math.floor(GameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))))
		local X: number = GameSettings.MouseSensitivityFirstPerson.X
		local Floored2: number = X <= 1 and math.floor((X - 0.2) / 0.16 + 0.5) or math.floor((X + 2) / 0.6 + 0.5)
		NewPage.MouseAdvancedEntry:SetValue(if X <= 0.2 then 0 else Floored2)
		
		function clampMouseSensitivity(p8: number): number
			if p8 < 0 then
				p8 = -p8
			end
			if p8 > 100 then
				p8 = 100
				
				return p8
			end
			if p8 < 0.001 then
				p8 = 0.001
			end
			return p8
		end
		
		function setMouseSensitivity(GamepadCameraSensitivity: number, MouseAdvancedEntry)
			-- upvalues: Flag (ref), setCameraSensitivity (upval), NewPage (upval), TextBox (copy)
			if not Flag then return end
			setCameraSensitivity(GamepadCameraSensitivity)
			Flag = false
			
			if MouseAdvancedEntry ~= NewPage.MouseAdvancedEntry then
				local Floored: number = GamepadCameraSensitivity <= 1 and math.floor((GamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((GamepadCameraSensitivity + 2) / 0.6 + 0.5)
				NewPage.MouseAdvancedEntry:SetValue(if GamepadCameraSensitivity <= 0.2 then 0 else Floored)
			end
			TextBox.Text = tostring((tonumber((string.format("%.3f", math.floor(GamepadCameraSensitivity * 1000 + 0.5) / 1000)))))
			Flag = true
		end
		
		TextBox.FocusLost:connect(function()
			-- upvalues: NewPage (upval), TextBox (copy), GameSettings (upval)
			NewPage.MouseAdvancedEntry:SetInteractable(true)
			local Number: number? = tonumber((string.match(TextBox.Text, "([%d%.]+)")))
			
			if Number then
				setMouseSensitivity(clampMouseSensitivity(Number), TextBox)
				
				return
			else
				setMouseSensitivity(GameSettings.MouseSensitivityFirstPerson.X, TextBox)
			end
		end)
		TextBox.Focused:connect(function()
			-- upvalues: NewPage (upval)
			NewPage.MouseAdvancedEntry:SetInteractable(false)
		end)
		NewPage.MouseAdvancedEntry.ValueChanged:connect(function(p8)
			-- upvalues: NewPage (upval)
			local ClampMouseSensitivityResult: number = clampMouseSensitivity(p8)
			local NewClampMouseSensitivityResult: number = ClampMouseSensitivityResult <= 5 and 0.16 * ClampMouseSensitivityResult + 0.2 or 0.6 * ClampMouseSensitivityResult - 2
			setMouseSensitivity(if NewClampMouseSensitivityResult <= 0.2 then 0.2 else NewClampMouseSensitivityResult, NewPage.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions()
		-- upvalues: GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), setCameraSensitivity (copy)
		local function _(p8: number): number
			local Floored: number = p8 <= 1 and math.floor((p8 - 0.2) / 0.16 + 0.5) or math.floor((p8 + 2) / 0.6 + 0.5)
			
			return if p8 <= 0.2 then 0 else Floored
		end
		
		local _ = function(p8: number): number
			local v8: number = p8 <= 5 and 0.16 * p8 + 0.2 or 0.6 * p8 - 2
			
			return if v8 <= 0.2 then 0.2 else v8
		end
		
		local GamepadCameraSensitivity: number = GameSettings.GamepadCameraSensitivity
		local Floored: number = GamepadCameraSensitivity <= 1 and math.floor((GamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((GamepadCameraSensitivity + 2) / 0.6 + 0.5)
		NewPage.GamepadSensitivityFrame, NewPage.GamepadSensitivityLabel, NewPage.GamepadSensitivitySlider = UtilityModule:AddNewRow(NewPage, "Camera Sensitivity", "Slider", 10, if GamepadCameraSensitivity <= 0.2 then 0 else Floored)
		NewPage.GamepadSensitivityFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.GamepadSensitivityFrame
		NewPage.GamepadSensitivitySlider.ValueChanged:connect(function(p8: number)
			-- upvalues: setCameraSensitivity (upval)
			local v8: number = p8 <= 5 and 0.16 * p8 + 0.2 or 0.6 * p8 - 2
			setCameraSensitivity(if v8 <= 0.2 then 0.2 else v8)
		end)
	end
	
	local function createOverscanOption()
		-- upvalues: RobloxGui (upval), CorePackages (upval), ContextActionService (upval), UtilityModule (upval), NewPage (copy), ThemeModule (upval), RunService (upval), SETTINGSMENULAYOUTORDER (upval)
		local AdjustButton, AdjustButton2, AdjustButton3 = UtilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function()
			-- upvalues: RobloxGui (upval), CorePackages (upval), ContextActionService (upval)
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			local v8 = require(RobloxGui.Modules.Settings.Components.OverscanWrapper)((require(RobloxGui.Modules.Shell.Components.Overscan10ft.Overscan)))
			local RoactModule = require(CorePackages.Packages.Roact)
			local MountResult = nil
			local config = {
				onUnmount = function()
					-- upvalues: MountResult (ref), RoactModule (copy), ContextActionService (upval), SettingsHubModule (copy)
					if MountResult then
						RoactModule.unmount(MountResult)
						ContextActionService:UnbindCoreAction("RbxStopOverscanMovement")
						SettingsHubModule:SetVisibility(true, true)
					end
				end,
				ImageVisible = false,
				BackgroundTransparency = 0.2
			}
			SettingsHubModule:SetVisibility(false, true)
			ContextActionService:BindCoreAction("RbxStopOverscanMovement", function() end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			MountResult = RoactModule.mount(RoactModule.createElement(v8, config), RobloxGui, (tostring(v8)))
		end, NewPage)
		AdjustButton2.Font = ThemeModule.font(Enum.Font.SourceSans)
		AdjustButton.Position = UDim2.new(1, -400, 0, 12)
		AdjustButton.Size = UDim2.new(0, 300, 0, 40)
		AdjustButton.Position = UDim2.new(1, -400, 0.5, 0)
		AdjustButton.AnchorPoint = Vector2.new(0, 0.5)
		
		if RunService:IsStudio() then
			AdjustButton.Selectable = false
			AdjustButton.Active = false
			AdjustButton.Enabled.Value = false
			AdjustButton2.TextColor3 = Color3.fromRGB(100, 100, 100)
		end
		local SafeZone = UtilityModule:AddNewRowObject(NewPage, "Safe Zone", AdjustButton)
		SafeZone.LayoutOrder = SETTINGSMENULAYOUTORDER.OverscanAdjustButton
		AdjustButton3(SafeZone)
	end
	
	local function createDeveloperConsoleOption()
		-- upvalues: reportSettingsChangeForAnalytics (upval), FixDeveloperConsoleButtonSizeAndPositioning (upval), UtilityModule (upval), NewPage (copy), ThemeModule (upval), SETTINGSMENULAYOUTORDER (upval), RunService (upval), PlayerPermissionsModule (upval), Players (upval)
		local function makeDevConsoleOption()
			-- upvalues: reportSettingsChangeForAnalytics (upval), FixDeveloperConsoleButtonSizeAndPositioning (upval), UtilityModule (upval), NewPage (upval), ThemeModule (upval), SETTINGSMENULAYOUTORDER (upval)
			local function onOpenDevConsole()
				-- upvalues: reportSettingsChangeForAnalytics (upval)
				local DevConsoleMasterModule = require(script.Parent.Parent.Parent.DevConsoleMaster)
				
				if DevConsoleMasterModule then
					DevConsoleMasterModule:SetVisibility(true)
					local SettingsHubModule = require(script.Parent.Parent.SettingsHub)
					
					if SettingsHubModule then
						SettingsHubModule:SetVisibility(false)
					end
					reportSettingsChangeForAnalytics("dev_console", "", "pressed")
				end
			end
			
			if FixDeveloperConsoleButtonSizeAndPositioning then
				local DevConsoleButton, DevConsoleButton2, DevConsoleButton3 = UtilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), onOpenDevConsole, NewPage)
				DevConsoleButton2.Font = ThemeModule.font(Enum.Font.SourceSans)
				DevConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
				DevConsoleButton.Position = UDim2.new(0.4, 10, 0.5, 0)
				DevConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
				local DeveloperConsole = UtilityModule:AddNewRowObject(NewPage, "Developer Console", DevConsoleButton, nil, true)
				DeveloperConsole.LayoutOrder = SETTINGSMENULAYOUTORDER.DeveloperConsoleButton
				DevConsoleButton3(DeveloperConsole)
				
				return
			else
				local DevConsoleButton1, DevConsoleButton2_1, DevConsoleButton3_1 = UtilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, NewPage)
				DevConsoleButton2_1.Font = ThemeModule.font(Enum.Font.SourceSans)
				DevConsoleButton1.Size = UDim2.new(0.6, -10, 0, 35)
				DevConsoleButton1.Position = UDim2.new(1, -400, 0.5, 0)
				DevConsoleButton1.AnchorPoint = Vector2.new(0, 0.5)
				local DeveloperConsole = UtilityModule:AddNewRowObject(NewPage, "Developer Console", DevConsoleButton1)
				DeveloperConsole.LayoutOrder = SETTINGSMENULAYOUTORDER.DeveloperConsoleButton
				DevConsoleButton3_1(DeveloperConsole)
			end
		end
		
		if RunService:IsStudio() then
			makeDevConsoleOption()
			
			return
		else
			spawn(function()
				-- upvalues: PlayerPermissionsModule (upval), Players (upval), makeDevConsoleOption (copy)
				if PlayerPermissionsModule.CanPlayerManagePlaceAsync(Players.LocalPlayer) then
					makeDevConsoleOption()
				end
			end)
		end
	end
	
	local function createUiToggleOptions()
		-- upvalues: UserFreecamGuiDestabilization (upval), UserShowGuiHideToggles (upval), RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GuiService (upval), LocalPlayer (upval)
		if not UserFreecamGuiDestabilization and not UserShowGuiHideToggles then
			NewPage.uiToggleRow, NewPage.uiToggleFrame, NewPage.uiToggleSelector = UtilityModule:AddNewRow(NewPage, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			NewPage.uiToggleRow.LayoutOrder = SETTINGSMENULAYOUTORDER.UiToggleRow
			NewPage.uiToggleSelector.IndexChanged:connect(function(_)
				-- upvalues: GuiService (upval)
				GuiService:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates)
			end)
			
			return
		end
		local InGameCommonUILabelOn = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local InGameCommonUILabelOff = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		NewPage.uiToggleSelectors = {}
		
		for _, value in {
			{
				label = "Custom",
				layoutOrderKey = "UiToggleRowCustom",
				type = Enum.GuiType.Custom
			},
			{
				label = "CustomBillboards",
				layoutOrderKey = "UiToggleRowBillboards",
				type = Enum.GuiType.CustomBillboards
			},
			{
				label = "PlayerNameplates",
				layoutOrderKey = "UiToggleRowNameplates",
				type = Enum.GuiType.PlayerNameplates
			}
		} do
			local FeatureSettingsHubGameSettingsGuiVisibilityShowGuiType = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = value.label })
			local Selector, Selector2, Selector3 = UtilityModule:AddNewRow(NewPage, FeatureSettingsHubGameSettingsGuiVisibilityShowGuiType, "Selector", { InGameCommonUILabelOn, InGameCommonUILabelOff }, 1)
			Selector.LayoutOrder = SETTINGSMENULAYOUTORDER[value.layoutOrderKey]
			Selector3.IndexChanged:Connect(function(p8)
				-- upvalues: GuiService (upval), value (copy)
				if (if GuiService:GetGuiIsVisible(value.type) then 1 else 2) ~= p8 then
					GuiService:ToggleGuiIsVisibleIfAllowed(value.type)
				end
			end)
			NewPage.uiToggleSelectors[value.label] = {
				label = FeatureSettingsHubGameSettingsGuiVisibilityShowGuiType,
				type = value.type,
				row = Selector,
				frame = Selector2,
				selector = Selector3
			}
		end
		NewPage.freecamRow, NewPage.freecamFrame, NewPage.freecamSelector = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { InGameCommonUILabelOff, InGameCommonUILabelOn }, 1)
		NewPage.freecamRow.LayoutOrder = SETTINGSMENULAYOUTORDER.FreecamToggleRow
		NewPage.freecamSelector.IndexChanged:Connect(function(p8)
			-- upvalues: LocalPlayer (upval)
			local Value = p8 == 2
			local FreecamScript = LocalPlayer:FindFirstChild("FreecamScript", true)
			
			if FreecamScript then
				FreecamScript:SetAttribute("FreecamEnabled", Value)
				
				return
			else
				warn("Freecam not present")
			end
		end)
	end
	
	local function updateUiToggleSelection()
		-- upvalues: UserFreecamGuiDestabilization (upval), UserShowGuiHideToggles (upval), NewPage (copy), GuiService (upval), LocalPlayer (upval)
		if UserFreecamGuiDestabilization or UserShowGuiHideToggles then
			if not NewPage.uiToggleSelectors then return end
			for _, uiToggleSelector in NewPage.uiToggleSelectors do
				local SelectedIndex: number = if GuiService:GetGuiIsVisible(uiToggleSelector.type) then 1 else 2
				
				if SelectedIndex ~= uiToggleSelector.selector:GetSelectedIndex() then
					uiToggleSelector.selector:SetSelectionIndex(SelectedIndex)
				end
			end
			local FreecamScript = LocalPlayer:FindFirstChild("FreecamScript", true)
			
			if FreecamScript then
				NewPage.freecamSelector:SetSelectionIndex(if FreecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not NewPage.uiToggleSelector then return end
		local SelectedIndex: number = if GuiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if SelectedIndex == NewPage.uiToggleSelector:GetSelectedIndex() then return end
		NewPage.uiToggleSelector:SetSelectionIndex(SelectedIndex)
	end
	
	local _ = function(p8, p9, p10: number): boolean
		return p8 and (p9 and (p10 and (#p8 > 0 and (p10 > 0 and p10 <= #p8) and #p8 == #p9)))
	end
	
	local _ = function(Name, Guid)
		-- upvalues: SoundService (upval), NewResult1 (upval)
		SoundService:SetOutputDevice(Name, Guid)
		NewResult1:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", Name, Guid)
	end
	
	local function createDeviceOptions(Text)
		-- upvalues: NewPage (copy), RobloxTranslatorModule (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GetFIntVoiceChatDeviceChangeDebounceDelayModule (upval), Default2 (upval), SoundService (upval), NewResult1 (upval), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), reportSettingsChangeForAnalytics (upval)
		local NewPageEntry = NewPage[Text .. "DeviceIndex"] or 0
		local NewPageEntry1 = NewPage[Text .. "DeviceNames"] or {}
		local NewPageEntry2 = NewPage[Text .. "DeviceGuids"] or {}
		NewPage[Text .. "DeviceFrame"], _, NewPage[Text .. "DeviceSelector"] = UtilityModule:AddNewRow(NewPage, Text == "Input" and RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice"), "Selector", NewPageEntry1, NewPageEntry)
		NewPage[Text .. "DeviceFrame"].LayoutOrder = Text == "Input" and SETTINGSMENULAYOUTORDER.DeviceFrameInput or SETTINGSMENULAYOUTORDER.DeviceFrameOutput
		NewPage[Text .. "DeviceInfo"] = {
			Name = NewPageEntry > 0 and NewPageEntry1[NewPageEntry] or nil,
			Guid = NewPageEntry > 0 and NewPageEntry2[NewPageEntry] or nil
		}
		NewPage[Text .. "PrevDeviceName"] = NewPage[Text .. "DeviceInfo"].Name
		local v8 = 0
		local FIntVoiceChatDeviceChangeDebounceDelayModule = GetFIntVoiceChatDeviceChangeDebounceDelayModule()
		NewPage[Text .. "DeviceSelector"].IndexChanged:connect(function(p8)
			-- upvalues: NewPage (upval), Text (copy), v8 (ref), FIntVoiceChatDeviceChangeDebounceDelayModule (copy), Default2 (upval), SoundService (upval), NewResult1 (upval), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), reportSettingsChangeForAnalytics (upval)
			if NewPage[Text .. "DeviceInfo"].Name == NewPage[Text .. "DeviceNames"][p8] and NewPage[Text .. "DeviceInfo"].Guid == NewPage[Text .. "DeviceGuids"][p8] then return end
			local v9 = v8 + 1
			v8 = v9
			wait(FIntVoiceChatDeviceChangeDebounceDelayModule)
			
			if v9 == v8 then
				v8 = 0
				NewPage[Text .. "DeviceInfo"] = {
					Name = NewPage[Text .. "DeviceNames"][p8],
					Guid = NewPage[Text .. "DeviceGuids"][p8]
				}
				local Name = NewPage[Text .. "DeviceInfo"].Name
				local Guid = NewPage[Text .. "DeviceInfo"].Guid
				
				if NewPage.VoiceChatOptionsEnabled then
					Default2:SwitchDevice(Text, Name, Guid)
				else
					SoundService:SetOutputDevice(Name, Guid)
					NewResult1:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", Name, Guid)
				end
				if GetFFlagEnableCrossExpVoiceFunction() then
					NewResult1:debug("[GameSettings] Changing {} device to {} {} ", Text, Name, Guid)
					
					if Text == "Input" then
						Default3:changeInputDevice(Name, Guid)
					else
						Default3:changeOutputDevice(Name, Guid)
					end
				end
				reportSettingsChangeForAnalytics(Text, NewPage[Text .. "PrevDeviceName"], Name)
				NewPage[Text .. "PrevDeviceName"] = Name
			end
		end)
	end
	
	local _ = function()
		-- upvalues: PlayerPermissionsModule (upval), LocalPlayer (upval), RobloxTranslatorModule (upval), UpdateVisibilitySettingsCopy (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GameSettings (upval)
		spawn(function()
			-- upvalues: PlayerPermissionsModule (upval), LocalPlayer (upval), RobloxTranslatorModule (upval), UpdateVisibilitySettingsCopy (upval), NewPage (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GameSettings (upval)
			NewPage.badgeVisibleRow, NewPage.badgeVisibleFrame, NewPage.badgeVisibleSelector = UtilityModule:AddNewRow(NewPage, if UpdateVisibilitySettingsCopy then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				(RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show"))
			}, if PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(LocalPlayer) then 1 else 2, nil, (RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames")))
			NewPage.badgeVisibleRow.LayoutOrder = SETTINGSMENULAYOUTORDER.BadgeVisibilityFrame
			NewPage.badgeVisibleSelector.IndexChanged:connect(function(p8)
				-- upvalues: GameSettings (upval), PlayerPermissionsModule (upval), LocalPlayer (upval)
				GameSettings.BadgeVisible = p8 == 2
				PlayerPermissionsModule.SetPlayerInExperienceNameEnabled(LocalPlayer, p8 == 1)
			end)
		end)
	end
	
	local function createChatModerationOptions()
		-- upvalues: NewPage (copy), UtilityModule (upval), NewResult (upval), SETTINGSMENULAYOUTORDER (upval), CorePackages (upval), SignalsModule (upval), reportSettingsChangeForAnalytics (upval)
		NewPage.ChatModerationFrame, _, NewPage.ChatModerationSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			NewResult:Format("InGame.CommonUI.Label.Off"),
			NewResult:Format("InGame.CommonUI.Label.On")
		}, 1, nil, NewResult:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		NewPage.ChatModerationFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.ChatModerationFrame
		NewPage.ChatModerationFrame.Visible = false
		local ChatModerationStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		NewPage.ChatModerationDisposeEffect = SignalsModule.createEffect(function(p8)
			-- upvalues: NewPage (upval), ChatModerationStore (copy)
			NewPage.ChatModerationFrame.Visible = ChatModerationStore.getIsSettingVisible(p8)
			local SelectedIndex: number = if ChatModerationStore.getIsSettingEnabled(p8) then 2 else 1
			
			if NewPage.ChatModerationSelector:GetSelectedIndex() ~= SelectedIndex then
				NewPage.ChatModerationSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		NewPage.ChatModerationSelector.IndexChanged:connect(function(p8)
			-- upvalues: ChatModerationStore (copy), reportSettingsChangeForAnalytics (upval)
			local v8 = p8 == 2
			ChatModerationStore.setIsSettingEnabled(v8)
			reportSettingsChangeForAnalytics("moderate_chat", not v8, v8)
		end)
		ChatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions()
		-- upvalues: RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), CorePackages (upval), GetFIntDebounceAIRephraseSettingDelayModule (upval), SignalsModule (upval), TextChatService (upval), reportSettingsChangeForAnalytics (upval), ExpChatDebounceRephraseIndexSelection (upval), ThrottleFunctionCallModule (upval)
		NewPage.AIRephraseFrame, _, NewPage.AIRephraseSelector = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			(RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"))
		}, 1, nil, (RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription")))
		NewPage.AIRephraseFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.AIRephraseFrame
		NewPage.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local FIntDebounceAIRephraseSettingDelayModule: number = GetFIntDebounceAIRephraseSettingDelayModule()
		local IsFIntDebounceAIRephraseSettingDelayModuleAbove = FIntDebounceAIRephraseSettingDelayModule > 0
		local v8: number = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		NewPage.AIRephraseDisposeEffect = SignalsModule.createEffect(function(p8)
			-- upvalues: NewPage (upval), AIRephraseSettingStore (copy), v8 (ref)
			NewPage.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p8)
			local SelectedIndex: number = if AIRephraseSettingStore.getIsSettingEnabled(p8) then 2 else 1
			
			if NewPage.AIRephraseSelector:GetSelectedIndex() ~= SelectedIndex then
				v8 = SelectedIndex
				NewPage.AIRephraseSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		
		local function v536(p8)
			-- upvalues: v8 (ref), TextChatService (upval), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
			if p8 ~= v8 then
				local v9 = p8 == 2
				task.spawn(function()
					-- upvalues: TextChatService (upval), v9 (copy), AIRephraseSettingStore (upval), v8 (upval), p8 (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
					if TextChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if v9 then "Enabled" else "Disabled") then
						AIRephraseSettingStore.setIsSettingEnabled(v9)
						v8 = p8
						reportSettingsChangeForAnalytics("ai_rephrase", not v9, v9)
						
						return
					else
						NewPage.AIRephraseSelector:SetSelectionIndex(v8)
					end
				end)
				
				return
			end
		end
		
		if not ExpChatDebounceRephraseIndexSelection then
			NewPage.AIRephraseSelector.IndexChanged:connect(if IsFIntDebounceAIRephraseSettingDelayModuleAbove then ThrottleFunctionCallModule(FIntDebounceAIRephraseSettingDelayModule, v536) else v536)
		elseif IsFIntDebounceAIRephraseSettingDelayModuleAbove then
			local DelayedThread = nil
			NewPage.AIRephraseSelector.IndexChanged:connect(function(p8)
				-- upvalues: DelayedThread (ref), FIntDebounceAIRephraseSettingDelayModule (copy), v8 (ref), TextChatService (upval), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
				if DelayedThread then
					task.cancel(DelayedThread)
				end
				DelayedThread = task.delay(FIntDebounceAIRephraseSettingDelayModule, function()
					-- upvalues: DelayedThread (upval), p8 (copy), v8 (upval), TextChatService (upval), AIRephraseSettingStore (upval), reportSettingsChangeForAnalytics (upval), NewPage (upval)
					DelayedThread = nil
					
					if p8 ~= v8 then
						local v9 = p8 == 2
						task.spawn(function()
							-- upvalues: TextChatService (upval), v9 (copy), AIRephraseSettingStore (upval), v8 (upval), p8 (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
							if TextChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if v9 then "Enabled" else "Disabled") then
								AIRephraseSettingStore.setIsSettingEnabled(v9)
								v8 = p8
								reportSettingsChangeForAnalytics("ai_rephrase", not v9, v9)
								
								return
							else
								NewPage.AIRephraseSelector:SetSelectionIndex(v8)
							end
						end)
						
						return
					end
				end)
			end)
		else
			NewPage.AIRephraseSelector.IndexChanged:connect(v536)
		end
	end
	
	local function createChatSummariesSettingOptions()
		-- upvalues: RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), CorePackages (upval), GetFIntDebounceChatSummariesSettingDelayModule (upval), SignalsModule (upval), TextChatService (upval), reportSettingsChangeForAnalytics (upval)
		NewPage.ChatSummariesFrame, _, NewPage.ChatSummariesSelector = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			(RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"))
		}, 1, nil, (RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription")))
		NewPage.ChatSummariesFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.ChatSummariesFrame
		NewPage.ChatSummariesFrame.Visible = false
		local ChatSummariesSettingStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local FIntDebounceChatSummariesSettingDelayModule: number = GetFIntDebounceChatSummariesSettingDelayModule()
		local IsFIntDebounceChatSummariesSettingDelayModuleAbove = FIntDebounceChatSummariesSettingDelayModule > 0
		local v8: number = if ChatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		NewPage.ChatSummariesDisposeEffect = SignalsModule.createEffect(function(p8)
			-- upvalues: NewPage (upval), ChatSummariesSettingStore (copy), v8 (ref)
			NewPage.ChatSummariesFrame.Visible = ChatSummariesSettingStore.getIsSettingVisible(p8)
			local SelectedIndex: number = if ChatSummariesSettingStore.getIsSettingEnabled(p8) then 2 else 1
			
			if NewPage.ChatSummariesSelector:GetSelectedIndex() ~= SelectedIndex then
				v8 = SelectedIndex
				NewPage.ChatSummariesSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		
		local function v545(p8)
			-- upvalues: v8 (ref), TextChatService (upval), ChatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
			if p8 ~= v8 then
				local v9 = p8 == 2
				task.spawn(function()
					-- upvalues: TextChatService (upval), v9 (copy), ChatSummariesSettingStore (upval), v8 (upval), p8 (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
					if TextChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if v9 then "Enabled" else "Disabled") then
						ChatSummariesSettingStore.setIsSettingEnabled(v9)
						v8 = p8
						reportSettingsChangeForAnalytics("chat_summaries", not v9, v9)
						
						return
					else
						NewPage.ChatSummariesSelector:SetSelectionIndex(v8)
					end
				end)
				
				return
			end
		end
		
		if IsFIntDebounceChatSummariesSettingDelayModuleAbove then
			local DelayedThread = nil
			NewPage.ChatSummariesSelector.IndexChanged:connect(function(p8)
				-- upvalues: DelayedThread (ref), FIntDebounceChatSummariesSettingDelayModule (copy), v8 (ref), TextChatService (upval), ChatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
				if DelayedThread then
					task.cancel(DelayedThread)
				end
				DelayedThread = task.delay(FIntDebounceChatSummariesSettingDelayModule, function()
					-- upvalues: DelayedThread (upval), p8 (copy), v8 (upval), TextChatService (upval), ChatSummariesSettingStore (upval), reportSettingsChangeForAnalytics (upval), NewPage (upval)
					DelayedThread = nil
					
					if p8 ~= v8 then
						local v9 = p8 == 2
						task.spawn(function()
							-- upvalues: TextChatService (upval), v9 (copy), ChatSummariesSettingStore (upval), v8 (upval), p8 (copy), reportSettingsChangeForAnalytics (upval), NewPage (upval)
							if TextChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if v9 then "Enabled" else "Disabled") then
								ChatSummariesSettingStore.setIsSettingEnabled(v9)
								v8 = p8
								reportSettingsChangeForAnalytics("chat_summaries", not v9, v9)
								
								return
							else
								NewPage.ChatSummariesSelector:SetSelectionIndex(v8)
							end
						end)
						
						return
					end
				end)
			end)
		else
			NewPage.ChatSummariesSelector.IndexChanged:connect(v545)
		end
	end
	
	local function createVoiceTypingModeSettingOptions()
		-- upvalues: NewResult (upval), NewResult1 (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), CorePackages (upval), SignalsModule (upval), reportSettingsChangeForAnalytics (upval)
		local List = { "standard", "continuous" }
		
		local function _(p8, p9)
			-- upvalues: NewResult (upval), NewResult1 (upval)
			local Success, Result = pcall(function()
				-- upvalues: NewResult (upval), p8 (copy)
				return NewResult:Format(p8)
			end)
			
			if Success then
				return Result
			else
				NewResult1:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", p8)
				
				return p9
			end
		end
		
		local v8 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingMode"
		local Success, Result = pcall(function()
			-- upvalues: NewResult (upval), v8 (copy)
			return NewResult:Format(v8)
		end)
		local v9 = nil
		
		if Success then
			v9 = Result
		else
			NewResult1:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingMode")
			v9 = "Voice typing mode"
		end
		local v10 = "Selector"
		local t = {}
		local v11 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeStandard"
		local Success1, Result1 = pcall(function()
			-- upvalues: NewResult (upval), v11 (copy)
			return NewResult:Format(v11)
		end)
		local v12 = nil
		
		if Success1 then
			v12 = Result1
		else
			NewResult1:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeStandard")
			v12 = "Manual Send"
		end
		local v13 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeContinuous"
		local Success2, Result2 = pcall(function()
			-- upvalues: NewResult (upval), v13 (copy)
			return NewResult:Format(v13)
		end)
		local v14 = nil
		
		if Success2 then
			v14 = Result2
		else
			NewResult1:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeContinuous")
			v14 = "Auto Send"
		end
		t[1] = v12
		t[2] = v14
		NewPage.VoiceTypingModeFrame, _, NewPage.VoiceTypingModeSelector = UtilityModule:AddNewRow(NewPage, v9, v10, t, 1)
		NewPage.VoiceTypingModeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VoiceTypingModeFrame
		local DictationModeSettingStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetDictationModeSettingStore(false)
		NewPage.VoiceTypingModeDisposeEffect = SignalsModule.createEffect(function(p8)
			-- upvalues: List (copy), DictationModeSettingStore (copy), NewPage (upval)
			local FoundIndex: number = table.find(List, DictationModeSettingStore.getMode(p8)) or 1
			
			if NewPage.VoiceTypingModeSelector:GetSelectedIndex() ~= FoundIndex then
				NewPage.VoiceTypingModeSelector:SetSelectionIndex(FoundIndex)
			end
		end)
		NewPage.VoiceTypingModeSelector.IndexChanged:connect(function(p8)
			-- upvalues: DictationModeSettingStore (copy), List (copy), reportSettingsChangeForAnalytics (upval)
			local Mode = DictationModeSettingStore.getMode(false)
			local Entry = List[p8]
			
			if Entry ~= nil and Entry ~= Mode then
				DictationModeSettingStore.setMode(Entry)
				reportSettingsChangeForAnalytics("voice_typing_mode", Mode, Entry)
				
				return
			end
		end)
	end
	
	local function createChatNotificationsSettingOptions()
		-- upvalues: CorePackages (upval), RobloxTranslatorModule (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval)
		local ToastNotificationModule = require(CorePackages.Workspace.Packages.ToastNotification)
		local Default = ToastNotificationModule.ToastNotificationSnoozeManager.default
		local NotificationGroups = ToastNotificationModule.NotificationGroups
		local ToastNotificationTypeModule = ToastNotificationModule.ToastNotificationTypeModule
		local NotificationSnoozedSignal = ToastNotificationModule.Signals.NotificationSnoozedSignal
		local NotificationTypeEnum = ToastNotificationTypeModule.NotificationTypeEnum
		local SnoozeActionEnum = ToastNotificationTypeModule.SnoozeActionEnum
		local config = { Off = 1, On = 2 }
		
		local function _(): number
			-- upvalues: Default (copy), NotificationTypeEnum (copy)
			return if Default:isSnoozedNotificationType(NotificationTypeEnum.ChatNewMessage) then 1 else 2
		end
		
		local Off = if Default:isSnoozedNotificationType(NotificationTypeEnum.ChatNewMessage) then config.Off else config.On
		NewPage.ChatNotificationsFrame, _, NewPage.ChatNotificationsSelector = UtilityModule:AddNewRow(NewPage, RobloxTranslatorModule:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications"), "Selector", {
			RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			(RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"))
		}, Off)
		NewPage.ChatNotificationsFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.ChatNotificationsFrame
		NewPage.ChatNotificationsSelector.IndexChanged:connect(function(Off1)
			-- upvalues: Off (ref), Default (copy), NotificationGroups (copy), reportSettingsChangeForAnalytics (upval)
			if Off1 == Off then return end
			local IsOffMatch = Off == 2
			local IsOffMatch1 = Off1 == 2
			Off = Off1
			
			if IsOffMatch1 then
				Default:unmuteNotification({
					context = "InGameSettings",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup
				})
			else
				Default:snoozeNotification({
					durationMinutes = -1,
					context = "InGameSettings",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup
				})
			end
			reportSettingsChangeForAnalytics("chat_notifications", IsOffMatch, IsOffMatch1)
		end)
		NotificationSnoozedSignal:connect(function(p8)
			-- upvalues: NotificationTypeEnum (copy), SnoozeActionEnum (copy), NewPage (upval), Off (ref)
			if p8.notificationType ~= NotificationTypeEnum.ChatNewMessage then return end
			local SelectedIndex: number = if p8.actionType == SnoozeActionEnum.Mute then 1 else 2
			
			if NewPage.ChatNotificationsSelector:GetSelectedIndex() ~= SelectedIndex then
				Off = SelectedIndex
				NewPage.ChatNotificationsSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		NewPage.Displayed.Event:Connect(function()
			-- upvalues: Default (copy), NotificationTypeEnum (copy), config (copy), NewPage (upval), Off (ref)
			local Off1 = if Default:isSnoozedNotificationType(NotificationTypeEnum.ChatNewMessage) then config.Off else config.On
			
			if NewPage.ChatNotificationsSelector:GetSelectedIndex() ~= Off1 then
				Off = Off1
				NewPage.ChatNotificationsSelector:SetSelectionIndex(Off1)
			end
		end)
	end
	
	local function createCameraDeviceOptions()
		-- upvalues: NewPage (copy), FeatureSettingsHubVideoVideoCamera (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), NewResult1 (upval), UserGameSettings (upval), reportSettingsChangeForAnalytics (upval)
		local CameraDeviceIndex = NewPage.CameraDeviceIndex or 1
		local CameraDeviceNames = NewPage.CameraDeviceNames or {}
		local CameraDeviceGuids = NewPage.CameraDeviceGuids or {}
		NewPage.CameraDeviceFrame, _, NewPage.CameraDeviceSelector = UtilityModule:AddNewRow(NewPage, FeatureSettingsHubVideoVideoCamera, "Selector", CameraDeviceNames, CameraDeviceIndex)
		NewPage.CameraDeviceFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.CameraDeviceFrame
		NewPage.CameraDeviceInfo = {
			Name = CameraDeviceIndex > 0 and CameraDeviceNames[CameraDeviceIndex] or nil,
			Guid = CameraDeviceIndex > 0 and CameraDeviceGuids[CameraDeviceIndex] or nil
		}
		NewPage.prevCameraDeviceName = NewPage.CameraDeviceInfo.Name
		NewPage.CameraDeviceSelector.IndexChanged:connect(function(p8)
			-- upvalues: NewPage (upval), NewResult1 (upval), UserGameSettings (upval), reportSettingsChangeForAnalytics (upval)
			if NewPage.CameraDeviceInfo.Name ~= NewPage.CameraDeviceNames[p8] or NewPage.CameraDeviceInfo.Guid ~= NewPage.CameraDeviceGuids[p8] then
				NewPage.CameraDeviceInfo = {
					Name = NewPage.CameraDeviceNames[p8],
					Guid = NewPage.CameraDeviceGuids[p8]
				}
				local Guid = NewPage.CameraDeviceInfo.Guid
				NewResult1:info("Changed webcam to: {}", Guid)
				UserGameSettings.DefaultCameraID = Guid
				reportSettingsChangeForAnalytics("video_camera", NewPage.prevCameraDeviceName or "None", NewPage.CameraDeviceInfo.Name)
				NewPage.prevCameraDeviceName = NewPage.CameraDeviceInfo.Name
				
				return
			end
		end)
	end
	
	local function updateAudioDevices(Text)
		-- upvalues: SoundService (upval), NewResult (upval), NewPage (copy), GetFFlagVoiceChatUILoggingModule (upval), NewResult1 (upval), createDeviceOptions (copy)
		local Success, Result, Result3, Result4 = pcall(function()
			-- upvalues: Text (copy), SoundService (upval)
			return if Text == "Input" then SoundService:GetInputDevices() else SoundService:GetOutputDevices()
		end)
		
		if Success and (Result and (Result3 and (Result4 and (#Result > 0 and (Result4 > 0 and (Result4 <= #Result and #Result == #Result3)))))) then
			if Result3[1] == "" then
				Result[1] = NewResult:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. Result[1] .. ")"
			end
			NewPage[Text .. "DeviceNames"] = Result
			NewPage[Text .. "DeviceGuids"] = Result3
			NewPage[Text .. "DeviceIndex"] = Result4
		else
			if GetFFlagVoiceChatUILoggingModule() then
				NewResult1:warning("Errors in get {} device info", Text)
			end
			NewPage[Text .. "DeviceNames"] = {}
			NewPage[Text .. "DeviceGuids"] = {}
			NewPage[Text .. "DeviceIndex"] = 0
		end
		if NewPage[Text .. "DeviceSelector"] then
			NewPage[Text .. "DeviceSelector"]:UpdateOptions(Result)
			NewPage[Text .. "DeviceSelector"]:SetSelectionIndex(Result4)
			
			return
		else
			createDeviceOptions(Text)
		end
	end
	
	local function updateVoiceChatDevices(Text)
		-- upvalues: GetFFlagVoiceChatUILoggingModule (upval), NewResult1 (upval), SoundService (upval), NewResult (upval), NewPage (copy), createDeviceOptions (copy)
		if Text ~= "Input" and Text ~= "Output" and GetFFlagVoiceChatUILoggingModule() then
			NewResult1:warning("{} is not supported in VoiceChat devices", Text)
		end
		local Success, Result, Result3, Result4 = pcall(function()
			-- upvalues: Text (copy), SoundService (upval)
			return if Text == "Input" then SoundService:GetInputDevices() else SoundService:GetOutputDevices()
		end)
		
		if Success and (Result and (Result3 and (Result4 and (#Result > 0 and (Result4 > 0 and (Result4 <= #Result and #Result == #Result3)))))) then
			if Result3[1] == "" then
				Result[1] = NewResult:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. Result[1] .. ")"
			end
			NewPage[Text .. "DeviceNames"] = Result
			NewPage[Text .. "DeviceGuids"] = Result3
			NewPage[Text .. "DeviceIndex"] = Result4
		else
			if GetFFlagVoiceChatUILoggingModule() then
				if #Result > 0 then
					NewResult1:warning("Errors in get {} device info success: {}", Text, Success)
				else
					NewResult1:warning("Empty deviceNames list for {}", Text)
				end
			end
			NewPage[Text .. "DeviceNames"] = {}
			NewPage[Text .. "DeviceGuids"] = {}
			NewPage[Text .. "DeviceIndex"] = 0
		end
		if NewPage[Text .. "DeviceSelector"] then
			NewPage[Text .. "DeviceSelector"]:UpdateOptions(Result)
			NewPage[Text .. "DeviceSelector"]:SetSelectionIndex(Result4)
		else
			createDeviceOptions(Text)
		end
		if NewPage[Text .. "DeviceFrame"] then
			if #Result > 0 then
				NewPage[Text .. "DeviceFrame"].Visible = true
				
				return
			end
			NewPage[Text .. "DeviceFrame"].Visible = false
		end
	end
	
	local function updateCameraDevices()
		-- upvalues: VideoCaptureService (upval), FeatureSettingsHubVideoSystemDefault (upval), UserGameSettings (upval), NewPage (copy), createCameraDeviceOptions (copy)
		local CameraDevices = VideoCaptureService:GetCameraDevices()
		local List = {}
		local List1 = {}
		local v8 = 1
		table.insert(List, FeatureSettingsHubVideoSystemDefault)
		table.insert(List1, "{DefaultDeviceGuid}")
		
		for i, cameraDevice in pairs(CameraDevices) do
			if i == UserGameSettings.DefaultCameraID then
				v8 = #List + 1
			end
			table.insert(List, cameraDevice)
			table.insert(List1, i)
		end
		NewPage.CameraDeviceNames = List
		NewPage.CameraDeviceGuids = List1
		NewPage.CameraDeviceIndex = 0
		
		if NewPage.CameraDeviceSelector then
			NewPage.CameraDeviceSelector:UpdateOptions(List)
		else
			createCameraDeviceOptions()
		end
		NewPage.CameraDeviceSelector:SetSelectionIndex(v8)
	end
	
	local DeviceListChangedConnection = nil
	local DevicesChangedConnection = nil
	
	local function updateAudioOptions()
		-- upvalues: NewPage (copy), updateVoiceChatDevices (copy), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), updateAudioDevices (copy)
		if NewPage.VoiceChatOptionsEnabled then
			updateVoiceChatDevices("Input")
			updateVoiceChatDevices("Output")
			
			return
		end
		if GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected() then
			updateAudioDevices("Input")
		end
		updateAudioDevices("Output")
	end
	
	local _ = function()
		-- upvalues: SoundService (upval), DeviceListChangedConnection (ref), NewPage (copy), updateAudioOptions (copy)
		if SoundService.DeviceListChanged then
			DeviceListChangedConnection = SoundService.DeviceListChanged:Connect(function()
				-- upvalues: NewPage (upval), updateAudioOptions (upval)
				if NewPage.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: VideoCaptureService (upval), DevicesChangedConnection (ref), NewPage (copy), updateCameraDevices (copy)
		if VideoCaptureService.DevicesChanged then
			DevicesChangedConnection = VideoCaptureService.DevicesChanged:Connect(function()
				-- upvalues: NewPage (upval), updateCameraDevices (upval)
				if NewPage.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: SoundService (upval), DeviceListChangedConnection (ref)
		if SoundService.DeviceListChanged and DeviceListChangedConnection then
			DeviceListChangedConnection:Disconnect()
		end
	end
	
	local _ = function()
		-- upvalues: VideoCaptureService (upval), DevicesChangedConnection (ref)
		if VideoCaptureService.DevicesChanged and DevicesChangedConnection then
			DevicesChangedConnection:Disconnect()
			DevicesChangedConnection = nil
		end
	end
	
	local Connection = nil
	local Connection1 = nil
	
	local _ = function()
		-- upvalues: RUUserScalePreferenceAPIEngineFeature (upval), Connection (ref), NewPage (copy), createUIScaleOptionsImpl (copy), Connection1 (ref)
		if RUUserScalePreferenceAPIEngineFeature then
			local function rebindToCurrentCamera()
				-- upvalues: Connection (upval), NewPage (upval), createUIScaleOptionsImpl (upval)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				local CurrentCamera = workspace.CurrentCamera
				
				if CurrentCamera then
					Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: NewPage (upval), createUIScaleOptionsImpl (upval)
						if NewPage.PageOpen then
							local Success, Result = pcall(createUIScaleOptionsImpl)
							
							if not Success then
								warn("createUIScaleOptions failed: " .. tostring(Result))
							end
						end
					end)
					
					return
				end
			end
			
			rebindToCurrentCamera()
			Connection1 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(rebindToCurrentCamera)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: Connection (ref), Connection1 (ref), ScaledCeiled (ref), ScaledFloored (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		if Connection1 then
			Connection1:Disconnect()
			Connection1 = nil
		end
		ScaledCeiled = nil
		ScaledFloored = nil
	end
	
	local _ = function()
		-- upvalues: Default2 (upval), NewPage (copy)
		if Default2:VoiceChatAvailable() then
			NewPage.VoiceChatOptionsEnabled = true
		end
	end
	
	local _ = function()
		-- upvalues: NewPage (copy), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval)
		local VoiceChatOptionsEnabled = NewPage.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected()
		
		if NewPage.InputDeviceFrame then
			NewPage.InputDeviceFrame.Visible = VoiceChatOptionsEnabled
		end
	end
	
	local Flag1 = false
	local Flag2 = not DifferentiateVoiceSelectorSystemAndUser and nil
	
	local function createVoiceChatSelector()
		-- upvalues: VoiceSelectorAvailableAfterFae (upval), NewPage (copy), NewResult (upval), Default2 (upval), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), DifferentiateVoiceSelectorSystemAndUser (upval), GetFIntDebounceDisconnectButtonDelayModule (upval), Flag2 (ref), FFlagVoiceRewarmTelemetry (upval), ConstantsModule1 (upval), VoiceSelectorIgnoreFailedStateDisconnect (upval), Flag1 (ref), VoiceConnectSelectorDebounce (upval), DebounceModule (upval), ThrottleFunctionCallModule (upval), VoiceChatSelectorReconnectFocus2AEGIS2 (upval), GuiService (upval), DebounceVoiceSelectorIndexChange (upval), DeferProgrammaticChange (upval)
		if VoiceSelectorAvailableAfterFae and NewPage.VoiceConnectDisconnectFrame and NewPage.VoiceConnectDisconnectSelector then return end
		local FeatureGameDetailsLabelVoiceChat = NewResult:Format("Feature.GameDetails.Label.VoiceChat")
		local v9: number = if Default2:VoiceChatEnded() then 1 else 2
		NewPage.VoiceConnectDisconnectFrame, _, NewPage.VoiceConnectDisconnectSelector = UtilityModule:AddNewRow(NewPage, FeatureGameDetailsLabelVoiceChat, "Selector", {
			NewResult:Format("Feature.SettingsHub.Label.Disconnected"),
			(NewResult:Format("Feature.SettingsHub.Label.Connected"))
		}, v9)
		NewPage.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VoiceConnectDisconnectSelector
		local Service = Default2:getService()
		
		if Service and not DifferentiateVoiceSelectorSystemAndUser then
			Service.StateChanged:Connect(function(OldState, NewState)
				-- upvalues: VoiceSelectorAvailableAfterFae (upval), NewPage (upval), Default2 (upval)
				if VoiceSelectorAvailableAfterFae then
					if OldState == NewState then return end
					if NewState == Enum.VoiceChatState.Joined and NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						
						return
					end
					if (NewState == Enum.VoiceChatState.Ended or NewState == Enum.VoiceChatState.Failed or NewState == Enum.VoiceChatState.Idle) and NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
						
						return
					end
				elseif OldState == NewState then return end
				if NewState == Enum.VoiceChatState.Joined then
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				end
				if Default2:VoiceChatEnded() then
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			end)
		end
		local v10: number = v9
		local FIntDebounceDisconnectButtonDelayModule: number = GetFIntDebounceDisconnectButtonDelayModule()
		local IsFIntDebounceDisconnectButtonDelayModuleAbove = FIntDebounceDisconnectButtonDelayModule > 0
		
		local function v613(p8)
			-- upvalues: v10 (ref), DifferentiateVoiceSelectorSystemAndUser (upval), Flag2 (upval), FFlagVoiceRewarmTelemetry (upval), Default2 (upval), ConstantsModule1 (upval), VoiceSelectorIgnoreFailedStateDisconnect (upval), Flag1 (upval), NewPage (upval)
			if p8 == v10 then return end
			v10 = p8
			
			if DifferentiateVoiceSelectorSystemAndUser and Flag2 then return end
			if FFlagVoiceRewarmTelemetry then
				local ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4 = Default2:GetConnectDisconnectButtonAnalyticsData(p8 == 2)
				Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4, Default2.joinVoiceButtonContext)
			else
				Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", Default2:GetConnectDisconnectButtonAnalyticsData(p8 == 2))
			end
			if p8 == 2 then
				Default2.pendingConnectionSource = ConstantsModule1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				Default2:JoinVoice()
			elseif VoiceSelectorIgnoreFailedStateDisconnect then
				local Service = Default2:getService()
				local IsVoiceChatStateMatch: boolean = Service ~= nil and Service.VoiceChatState == Enum.VoiceChatState.Failed
				
				if not Default2:VoiceChatEnded() and not IsVoiceChatStateMatch then
					Default2.pendingDisconnectReason = ConstantsModule1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
					Default2:Leave()
				end
			elseif not Default2:VoiceChatEnded() then
				Default2.pendingDisconnectReason = ConstantsModule1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				Default2:Leave()
			end
			if Flag1 then
				task.spawn(function()
					-- upvalues: p8 (copy), NewPage (upval)
					task.wait(0.5)
					
					if p8 ~= 1 then
						NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		if VoiceConnectSelectorDebounce then
			local DebounceModuleResult = if IsFIntDebounceDisconnectButtonDelayModuleAbove then DebounceModule(v613, FIntDebounceDisconnectButtonDelayModule) else v613
			NewPage.VoiceConnectDisconnectSelector.IndexChanged:connect(function(p8)
				-- upvalues: DifferentiateVoiceSelectorSystemAndUser (upval), Flag2 (upval), v613 (copy), DebounceModuleResult (copy)
				if DifferentiateVoiceSelectorSystemAndUser and Flag2 then
					v613(p8)
					
					return
				else
					DebounceModuleResult(p8)
				end
			end)
		else
			NewPage.VoiceConnectDisconnectSelector.IndexChanged:connect(if IsFIntDebounceDisconnectButtonDelayModuleAbove then ThrottleFunctionCallModule(FIntDebounceDisconnectButtonDelayModule, v613) else v613)
		end
		if VoiceChatSelectorReconnectFocus2AEGIS2 then
			NewPage.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, SelectedCoreObject, p8)
				-- upvalues: FeatureGameDetailsLabelVoiceChat (copy), NewPage (upval), GuiService (upval)
				if p8 and SelectedCoreObject and SelectedCoreObject.Parent and SelectedCoreObject.Parent.Name == FeatureGameDetailsLabelVoiceChat .. "Frame" and p8.Name == "ImageButton" and NewPage.Active then
					GuiService.SelectedCoreObject = SelectedCoreObject
				end
			end)
		end
		Default2:subscribe("OnStateChanged", function(_, VoiceChatState)
			-- upvalues: DifferentiateVoiceSelectorSystemAndUser (upval), Flag2 (upval), DebounceVoiceSelectorIndexChange (upval), NewPage (upval), VoiceConnectSelectorDebounce (upval), DeferProgrammaticChange (upval)
			if DifferentiateVoiceSelectorSystemAndUser then
				Flag2 = true
				
				if DebounceVoiceSelectorIndexChange then
					if VoiceChatState == Enum.VoiceChatState.Joined and NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					end
				elseif VoiceChatState == Enum.VoiceChatState.Joined then
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end
			if DebounceVoiceSelectorIndexChange then
				if VoiceChatState == Enum.VoiceChatState.Failed and NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			elseif VoiceChatState == Enum.VoiceChatState.Failed then
				NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end
			if VoiceConnectSelectorDebounce and DifferentiateVoiceSelectorSystemAndUser and (VoiceChatState == Enum.VoiceChatState.Ended or VoiceChatState == Enum.VoiceChatState.Idle) and NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
				NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end
			if DifferentiateVoiceSelectorSystemAndUser then
				if DeferProgrammaticChange then
					task.defer(function()
						-- upvalues: Flag2 (upval)
						Flag2 = false
					end)
					
					return
				end
				Flag2 = false
			end
		end)
		Default2:subscribe("OnRequestMicPermissionRejected", function()
			-- upvalues: Flag1 (upval), DifferentiateVoiceSelectorSystemAndUser (upval), Flag2 (upval), NewPage (upval), DeferProgrammaticChange (upval)
			task.spawn(function()
				-- upvalues: Flag1 (upval), DifferentiateVoiceSelectorSystemAndUser (upval), Flag2 (upval), NewPage (upval), DeferProgrammaticChange (upval)
				task.wait(0.5)
				Flag1 = true
				
				if DifferentiateVoiceSelectorSystemAndUser then
					Flag2 = true
				end
				NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if DifferentiateVoiceSelectorSystemAndUser then
					if DeferProgrammaticChange then
						task.defer(function()
							-- upvalues: Flag2 (upval)
							Flag2 = false
						end)
						
						return
					end
					Flag2 = false
				end
			end)
		end)
	end
	
	local function createVoiceConnectDisconnect()
		-- upvalues: Default2 (upval), NewResult (upval), GetFIntDebounceDisconnectButtonDelayModule (upval), FFlagVoiceRewarmTelemetry (upval), ConstantsModule1 (upval), UtilityModule (upval), ThrottleFunctionCallModule (upval), NewPage (copy), SETTINGSMENULAYOUTORDER (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval)
		if Default2:IsSeamlessVoice() and not Default2.isShowingFTUX then
			local FeatureGameDetailsLabelVoiceChat = NewResult:Format("Feature.GameDetails.Label.VoiceChat")
			local FeatureSettingsHubLabelConnect = NewResult:Format("Feature.SettingsHub.Label.Connect")
			local FeatureSettingsHubLabelDisconnect = NewResult:Format("Feature.SettingsHub.Label.Disconnect")
			local FIntDebounceDisconnectButtonDelayModule: number = GetFIntDebounceDisconnectButtonDelayModule()
			local IsFIntDebounceDisconnectButtonDelayModuleAbove = FIntDebounceDisconnectButtonDelayModule > 0
			
			local function v626()
				-- upvalues: Default2 (upval), FFlagVoiceRewarmTelemetry (upval), ConstantsModule1 (upval)
				if Default2:getService() then
					local Connection = nil
					Connection = Default2:getService().StateChanged:Connect(function(_, NewState)
						-- upvalues: FFlagVoiceRewarmTelemetry (upval), Default2 (upval), Connection (ref)
						if NewState == Enum.VoiceChatState.Joined then
							if FFlagVoiceRewarmTelemetry then
								local ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4 = Default2:GetConnectDisconnectButtonAnalyticsData(true)
								Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4, Default2.joinVoiceButtonContext)
							else
								Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", Default2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							Connection:Disconnect()
						end
					end)
				elseif FFlagVoiceRewarmTelemetry then
					local ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4 = Default2:GetConnectDisconnectButtonAnalyticsData(false)
					Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4, Default2.joinVoiceButtonContext)
				else
					Default2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", Default2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				Default2.pendingConnectionSource = ConstantsModule1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				Default2:JoinVoice()
			end
			
			local function v627()
				-- upvalues: Default2 (upval), ConstantsModule1 (upval)
				Default2.Analytics:reportLeaveVoiceButtonEvent("clicked", Default2:GetConnectDisconnectButtonAnalyticsData(true))
				Default2.pendingDisconnectReason = ConstantsModule1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				Default2:Leave()
			end
			
			local VoiceConnectButton, VoiceConnectButton2, VoiceConnectButton3 = UtilityModule:MakeStyledButton("VoiceConnectButton", FeatureSettingsHubLabelConnect, UDim2.new(1, 0, 1, -20), if IsFIntDebounceDisconnectButtonDelayModuleAbove then ThrottleFunctionCallModule(FIntDebounceDisconnectButtonDelayModule, v626) else v626, NewPage)
			voiceConnectSetRowRef = VoiceConnectButton3
			local VoiceDisconnectButton, VoiceDisconnectButton2, VoiceDisconnectButton3 = UtilityModule:MakeStyledButton("VoiceDisconnectButton", FeatureSettingsHubLabelDisconnect, UDim2.new(1, 0, 1, -20), if IsFIntDebounceDisconnectButtonDelayModuleAbove then ThrottleFunctionCallModule(FIntDebounceDisconnectButtonDelayModule, v627) else v627, NewPage)
			voiceDisconnectSetRowRef = VoiceDisconnectButton3
			VoiceConnectButton.Size = UDim2.new(0.6, 0, 0, 40)
			VoiceConnectButton.Position = UDim2.new(0.4, 0, 0.5, 0)
			VoiceConnectButton.AnchorPoint = Vector2.new(0, 0.5)
			VoiceConnectButton.ZIndex = 2
			VoiceConnectButton.Selectable = true
			VoiceConnectButton2.ZIndex = 2
			VoiceDisconnectButton.Size = UDim2.new(0.6, 0, 0, 40)
			VoiceDisconnectButton.Position = UDim2.new(0.4, 0, 0.5, 0)
			VoiceDisconnectButton.AnchorPoint = Vector2.new(0, 0.5)
			VoiceDisconnectButton.ZIndex = 2
			VoiceDisconnectButton.Selectable = true
			VoiceDisconnectButton2.ZIndex = 2
			local AddNewRowObjectResult = UtilityModule:AddNewRowObject(NewPage, FeatureGameDetailsLabelVoiceChat, VoiceConnectButton, nil, true)
			local AddNewRowObjectResult1 = UtilityModule:AddNewRowObject(NewPage, FeatureGameDetailsLabelVoiceChat, VoiceDisconnectButton, nil, true)
			NewPage.VoiceConnectFrame = AddNewRowObjectResult
			NewPage.VoiceDisconnectFrame = AddNewRowObjectResult1
			AddNewRowObjectResult.LayoutOrder = SETTINGSMENULAYOUTORDER.VoiceConnectFrame
			AddNewRowObjectResult1.LayoutOrder = SETTINGSMENULAYOUTORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(AddNewRowObjectResult)
			voiceDisconnectSetRowRef(AddNewRowObjectResult1)
			
			if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction() then
				AddNewRowObjectResult.Visible = false
				AddNewRowObjectResult1.Visible = false
				
				return
			end
			if Default2:ShouldShowJoinVoice() then
				AddNewRowObjectResult.Visible = true
				AddNewRowObjectResult1.Visible = false
				
				return
			end
			AddNewRowObjectResult.Visible = false
			AddNewRowObjectResult1.Visible = true
		end
	end
	
	local function createVRComfortSettingOptions()
		-- upvalues: NewResult (upval), GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval)
		local EnumItems = Enum.VRComfortSetting:GetEnumItems()
		local config = {
			title = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings",
			description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription",
			["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort",
			["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal",
			["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert",
			["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom",
			vignetteEnabled = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
			steppedRotationEnabled = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
			thirdPersonFixedCamEnabled = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
			on = "InGame.CommonUI.Label.On",
			off = "InGame.CommonUI.Label.Off"
		}
		local FormatResults = {}
		
		for i, enumItem in ipairs(EnumItems) do
			FormatResults[i] = NewResult:Format(config[tostring(enumItem)])
		end
		NewPage.VRComfortSettingFrame, NewPage.VRComfortSettingLabel, NewPage.VRComfortSettingSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", FormatResults, table.find(EnumItems, GameSettings.VRComfortSetting), nil, NewResult:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		NewPage.VRComfortSettingFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VRComfortSettingFrame
		NewPage.VRVignetteEnabledFrame, NewPage.VRVignetteEnabledLabel, NewPage.VRVignetteEnabledSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			NewResult:Format("InGame.CommonUI.Label.On"),
			NewResult:Format("InGame.CommonUI.Label.Off")
		}, if GameSettings.VignetteEnabled then 1 else 2)
		NewPage.VRVignetteEnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VRVignetteEnabledFrame
		NewPage.VRSteppedRotationEnabledFrame, NewPage.VRSteppedRotationEnabledLabel, NewPage.VRSteppedRotationEnabledSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			NewResult:Format("InGame.CommonUI.Label.On"),
			NewResult:Format("InGame.CommonUI.Label.Off")
		}, if GameSettings.VRSmoothRotationEnabled then 2 else 1)
		NewPage.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VRSteppedRotationEnabledFrame
		NewPage.VRThirdPersonFixedCamEnabledFrame, NewPage.VRThirdPersonFixedCamEnabledLabel, NewPage.VRThirdPersonFixedCamEnabledSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			NewResult:Format("InGame.CommonUI.Label.On"),
			NewResult:Format("InGame.CommonUI.Label.Off")
		}, if GameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		NewPage.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VRThirdPersonFixedCamEnabledFrame
		
		local function v648(VRComfortSetting)
			-- upvalues: NewPage (upval)
			if VRComfortSetting == Enum.VRComfortSetting.Custom then
				NewPage.VRVignetteEnabledSelector:SetZIndex(2)
				NewPage.VRVignetteEnabledLabel.ZIndex = 2
				NewPage.VRVignetteEnabledSelector:SetInteractable(true)
				NewPage.VRSteppedRotationEnabledSelector:SetZIndex(2)
				NewPage.VRSteppedRotationEnabledLabel.ZIndex = 2
				NewPage.VRSteppedRotationEnabledSelector:SetInteractable(true)
				NewPage.VRThirdPersonFixedCamEnabledSelector:SetZIndex(2)
				NewPage.VRThirdPersonFixedCamEnabledLabel.ZIndex = 2
				NewPage.VRThirdPersonFixedCamEnabledSelector:SetInteractable(true)
				
				return
			else
				NewPage.VRVignetteEnabledSelector:SetZIndex(1)
				NewPage.VRVignetteEnabledLabel.ZIndex = 1
				NewPage.VRVignetteEnabledSelector:SetInteractable(false)
				NewPage.VRSteppedRotationEnabledSelector:SetZIndex(1)
				NewPage.VRSteppedRotationEnabledLabel.ZIndex = 1
				NewPage.VRSteppedRotationEnabledSelector:SetInteractable(false)
				NewPage.VRThirdPersonFixedCamEnabledSelector:SetZIndex(1)
				NewPage.VRThirdPersonFixedCamEnabledLabel.ZIndex = 1
				NewPage.VRThirdPersonFixedCamEnabledSelector:SetInteractable(false)
			end
		end
		
		NewPage.VRComfortSettingSelector.IndexChanged:connect(function(p8)
			-- upvalues: EnumItems (copy), GameSettings (upval), v648 (copy)
			local EnumItem = EnumItems[p8]
			GameSettings.VRComfortSetting = EnumItem
			v648(EnumItem)
		end)
		v648(GameSettings.VRComfortSetting)
		NewPage.VRVignetteEnabledSelector.IndexChanged:connect(function(p8)
			-- upvalues: GameSettings (upval)
			if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				GameSettings.VignetteEnabledCustomOption = p8 == 1
			end
		end)
		NewPage.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p8)
			-- upvalues: GameSettings (upval)
			if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				GameSettings.VRSmoothRotationEnabledCustomOption = p8 == 2
			end
		end)
		NewPage.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p8)
			-- upvalues: GameSettings (upval)
			if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				GameSettings.VRThirdPersonFollowCamEnabledCustomOption = p8 == 2
			end
		end)
		GameSettings:GetPropertyChangedSignal("VRComfortSetting"):Connect(function()
			-- upvalues: EnumItems (copy), GameSettings (upval), NewPage (upval)
			local FoundIndex: number? = table.find(EnumItems, GameSettings.VRComfortSetting)
			
			if NewPage.VRComfortSettingSelector:GetSelectedIndex() ~= FoundIndex then
				NewPage.VRComfortSettingSelector:SetSelectionIndex(FoundIndex)
			end
		end)
		GameSettings:GetPropertyChangedSignal("VignetteEnabled"):Connect(function()
			-- upvalues: GameSettings (upval), NewPage (upval)
			local SelectedIndex: number = if GameSettings.VignetteEnabled then 1 else 2
			
			if NewPage.VRVignetteEnabledSelector:GetSelectedIndex() ~= SelectedIndex then
				NewPage.VRVignetteEnabledSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		GameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function()
			-- upvalues: GameSettings (upval), NewPage (upval)
			local SelectedIndex: number = if GameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if NewPage.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= SelectedIndex then
				NewPage.VRSteppedRotationEnabledSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
		GameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function()
			-- upvalues: GameSettings (upval), NewPage (upval)
			local SelectedIndex: number = if GameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if NewPage.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= SelectedIndex then
				NewPage.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(SelectedIndex)
			end
		end)
	end
	
	local function createVRSafetyBubbleModeOptions()
		-- upvalues: NewResult (upval), GameSettings (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval)
		local EnumItems = Enum.VRSafetyBubbleMode:GetEnumItems()
		local config = {
			title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
			description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
			["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
			["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
			["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
		}
		local FormatResults = {}
		
		for i, enumItem in ipairs(EnumItems) do
			FormatResults[i] = NewResult:Format(config[tostring(enumItem)])
		end
		local FoundIndex: number? = table.find(EnumItems, GameSettings.VRSafetyBubbleMode)
		task.defer(function()
			-- upvalues: NewPage (upval), UtilityModule (upval), NewResult (upval), FormatResults (copy), FoundIndex (copy), SETTINGSMENULAYOUTORDER (upval), EnumItems (copy), GameSettings (upval)
			NewPage.VRSafetyBubbleModeFrame, NewPage.VRSafetyBubbleModeLabel, NewPage.VRSafetyBubbleModeSelector = UtilityModule:AddNewRow(NewPage, NewResult:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", FormatResults, FoundIndex, nil, NewResult:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			NewPage.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGSMENULAYOUTORDER.VRSafetyBubbleModeFrame
			NewPage.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p8)
				-- upvalues: EnumItems (upval), GameSettings (upval)
				GameSettings.VRSafetyBubbleMode = EnumItems[p8]
			end)
			GameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function()
				-- upvalues: EnumItems (upval), GameSettings (upval), NewPage (upval)
				local FoundIndex: number? = table.find(EnumItems, GameSettings.VRSafetyBubbleMode)
				
				if NewPage.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= FoundIndex then
					NewPage.VRSafetyBubbleModeSelector:SetSelectionIndex(FoundIndex)
				end
			end)
		end)
	end
	
	NewPage.VoiceChatOptionsEnabled = false
	local EventConnection = nil
	local EventConnection1 = nil
	local Callback2: (() -> ())? = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (GetFFlagEnableVrVoiceConnectDisconnectFunction() or (not IsInExperienceUIVREnabled or not IsSpatialFunction())) then
		spawn(function()
			-- upvalues: GetFFlagEnableVoiceUxUpdatesFunction (upval), HideVoiceChatSelectorForFaeAEGIS2 (upval), Default2 (upval), createVoiceChatSelector (copy), IsVoiceFocusedFunction (upval), NewPage (copy), ObserveIsVoiceFocusedFunction (upval), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval), VoiceSelectorAvailableAfterFae (upval), GetFFlagEnableUniveralVoiceToastsModule (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), VoiceConnectSelectorDebounce (upval), DifferentiateVoiceSelectorSystemAndUser (upval), DeferProgrammaticChange (upval), Flag2 (ref), createVoiceConnectDisconnect (copy), Default3 (upval), config4 (upval), GetFFlagVoiceChatUILoggingModule (upval)
			if GetFFlagEnableVoiceUxUpdatesFunction() and (not HideVoiceChatSelectorForFaeAEGIS2 and Default2:EligibleForFaeUpsell() or Default2:IsSeamlessVoice()) and Default2:verifyUniverseAndPlaceCanUseVoice() then
				createVoiceChatSelector()
				
				if IsVoiceFocusedFunction() and NewPage.VoiceConnectDisconnectFrame then
					NewPage.VoiceConnectDisconnectFrame.Visible = false
				end
				ObserveIsVoiceFocusedFunction(function(p8)
					-- upvalues: NewPage (upval)
					if p8 then
						if NewPage.VoiceConnectDisconnectFrame then
							NewPage.VoiceConnectDisconnectFrame.Visible = false
							
							return
						end
					elseif NewPage.VoiceConnectDisconnectFrame then
						NewPage.VoiceConnectDisconnectFrame.Visible = true
					end
				end)
			end
			Default2:asyncInit():andThen(function()
				-- upvalues: Default2 (upval), NewPage (upval), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval), ObserveIsVoiceFocusedFunction (upval), VoiceSelectorAvailableAfterFae (upval), GetFFlagEnableVoiceUxUpdatesFunction (upval), createVoiceChatSelector (upval), GetFFlagEnableUniveralVoiceToastsModule (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), VoiceConnectSelectorDebounce (upval), DifferentiateVoiceSelectorSystemAndUser (upval), DeferProgrammaticChange (upval), Flag2 (upval), createVoiceConnectDisconnect (upval), Default3 (upval), config4 (upval)
				VoiceChatService = Default2:getService()
				
				if Default2:VoiceChatAvailable() then
					NewPage.VoiceChatOptionsEnabled = true
				end
				if FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and NewPage.VoiceChatVolumeFrame then
					local function _(p8)
						-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval)
						local Success, Result = pcall(function()
							-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), p8 (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval)
							local VoiceChatService1 = game:GetService("VoiceChatService")
							local Service = Default2:getService()
							local IsJoinedMatch = (VoiceVolumeControlsFixSliderVisibilityOnEligibleGames and p8 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined
							local UseNewAudioApi = VoiceChatService1 and VoiceChatService1.UseNewAudioApi
							local v9 = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
							NewPage.VoiceChatVolumeFrame.Visible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(IsJoinedMatch, UseNewAudioApi) and not v9
						end)
						
						if not Success then
							NewResult1:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", Result)
						end
					end
					
					local v9 = nil
					local Success, Result = pcall(function()
						-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), v9 (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval)
						local VoiceChatService1 = game:GetService("VoiceChatService")
						local Service = Default2:getService()
						local IsJoinedMatch = (VoiceVolumeControlsFixSliderVisibilityOnEligibleGames and v9 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined
						local UseNewAudioApi = VoiceChatService1 and VoiceChatService1.UseNewAudioApi
						local v10 = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
						NewPage.VoiceChatVolumeFrame.Visible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(IsJoinedMatch, UseNewAudioApi) and not v10
					end)
					
					if not Success then
						NewResult1:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", Result)
					end
					if VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and GetFFlagEnableCrossExpVoiceFunction() and GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then
						ObserveIsVoiceFocusedFunction(function()
							-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval)
							local v10 = nil
							local Success, Result = pcall(function()
								-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), v10 (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval)
								local VoiceChatService1 = game:GetService("VoiceChatService")
								local Service = Default2:getService()
								local IsJoinedMatch = (VoiceVolumeControlsFixSliderVisibilityOnEligibleGames and v10 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined
								local UseNewAudioApi = VoiceChatService1 and VoiceChatService1.UseNewAudioApi
								local v11 = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
								NewPage.VoiceChatVolumeFrame.Visible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(IsJoinedMatch, UseNewAudioApi) and not v11
							end)
							
							if not Success then
								NewResult1:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", Result)
							end
						end)
					end
					if VoiceVolumeControlsFixSliderVisibilityOnEligibleGames then
						Default2:subscribe("OnStateChanged", function(_, p8)
							-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval)
							local Success, Result = pcall(function()
								-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), p8 (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval)
								local VoiceChatService1 = game:GetService("VoiceChatService")
								local Service = Default2:getService()
								local IsJoinedMatch = (VoiceVolumeControlsFixSliderVisibilityOnEligibleGames and p8 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined
								local UseNewAudioApi = VoiceChatService1 and VoiceChatService1.UseNewAudioApi
								local v10 = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
								NewPage.VoiceChatVolumeFrame.Visible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(IsJoinedMatch, UseNewAudioApi) and not v10
							end)
							
							if not Success then
								NewResult1:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", Result)
							end
						end)
					else
						local Service = Default2:getService()
						
						if Service then
							Service.StateChanged:Connect(function()
								-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval), NewResult1 (upval)
								local v10 = nil
								local Success, Result = pcall(function()
									-- upvalues: Default2 (upval), VoiceVolumeControlsFixSliderVisibilityOnEligibleGames (upval), v10 (copy), VoiceVolumeControlsSuppressInExperienceUiForPartyVoice (upval), GetFFlagEnableCrossExpVoiceFunction (upval), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), IsVoiceFocusedFunction (upval), NewPage (upval), VoiceVolumeControlsEligibility (upval)
									local VoiceChatService1 = game:GetService("VoiceChatService")
									local Service = Default2:getService()
									local IsJoinedMatch = (VoiceVolumeControlsFixSliderVisibilityOnEligibleGames and v10 or Service and Service.VoiceChatState) == Enum.VoiceChatState.Joined
									local UseNewAudioApi = VoiceChatService1 and VoiceChatService1.UseNewAudioApi
									local v11 = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
									NewPage.VoiceChatVolumeFrame.Visible = VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(IsJoinedMatch, UseNewAudioApi) and not v11
								end)
								
								if not Success then
									NewResult1:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", Result)
								end
							end)
						end
					end
				end
				if VoiceSelectorAvailableAfterFae and GetFFlagEnableVoiceUxUpdatesFunction() and Default2:UserVoiceEnabled() and Default2:verifyUniverseAndPlaceCanUseVoice() then
					createVoiceChatSelector()
				end
				if not GetFFlagEnableUniveralVoiceToastsModule() then
					Default2:CheckAndShowNotAudiblePrompt()
					local IsVoiceFocused = VoiceVolumeControlsSuppressInExperienceUiForPartyVoice and (GetFFlagEnableCrossExpVoiceFunction() and (GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and IsVoiceFocusedFunction()))
					
					if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and not IsVoiceFocused then
						Default2:ShowNotAudiblePromptVoiceChatVolume()
					end
				end
				if not GetFFlagEnableVoiceUxUpdatesFunction() then
					local v10 = false
					createVoiceConnectDisconnect()
					
					if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then
						v10 = IsVoiceFocusedFunction()
						ObserveIsVoiceFocusedFunction(function(p8)
							-- upvalues: v10 (ref), NewPage (upval), Default2 (upval)
							v10 = p8
							
							if p8 then
								if NewPage.VoiceConnectFrame then
									NewPage.VoiceConnectFrame.Visible = false
								end
								if NewPage.VoiceDisconnectFrame then
									NewPage.VoiceDisconnectFrame.Visible = false
									
									return
								end
							elseif Default2:ShouldShowJoinVoice() then
								if NewPage.VoiceConnectFrame then
									NewPage.VoiceConnectFrame.Visible = true
								end
								if NewPage.VoiceDisconnectFrame then
									NewPage.VoiceDisconnectFrame.Visible = false
								end
							end
						end)
					end
					if NewPage.VoiceConnectFrame then
						NewPage.VoiceConnectFrame.Visible = false
					end
					if NewPage.VoiceDisconnectFrame then
						if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then
							NewPage.VoiceDisconnectFrame.Visible = not v10
						else
							NewPage.VoiceDisconnectFrame.Visible = true
						end
					end
					Default2.showVoiceUI.Event:Connect(function()
						-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), v10 (ref), NewPage (upval), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), config4 (upval)
						if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and v10 then return end
						NewPage.VoiceChatOptionsEnabled = true
						local VoiceChatOptionsEnabled = NewPage.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected()
						
						if NewPage[config4.Input .. "DeviceFrame"] then
							NewPage[config4.Input .. "DeviceFrame"].Visible = VoiceChatOptionsEnabled
						end
						if NewPage.VoiceConnectFrame then
							NewPage.VoiceConnectFrame.Visible = false
						end
						if NewPage.VoiceDisconnectFrame then
							NewPage.VoiceDisconnectFrame.Visible = true
						end
					end)
					Default2.hideVoiceUI.Event:Connect(function()
						-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), v10 (ref), NewPage (upval), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), config4 (upval)
						if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and v10 then return end
						NewPage.VoiceChatOptionsEnabled = false
						local VoiceChatOptionsEnabled = NewPage.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected()
						
						if NewPage[config4.Input .. "DeviceFrame"] then
							NewPage[config4.Input .. "DeviceFrame"].Visible = VoiceChatOptionsEnabled
						end
						if NewPage.VoiceConnectFrame then
							NewPage.VoiceConnectFrame.Visible = true
						end
						if NewPage.VoiceDisconnectFrame then
							NewPage.VoiceDisconnectFrame.Visible = false
						end
					end)
				elseif VoiceConnectSelectorDebounce then
					if NewPage.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						if DifferentiateVoiceSelectorSystemAndUser and DeferProgrammaticChange then
							Flag2 = true
							NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
							task.defer(function()
								-- upvalues: Flag2 (upval)
								Flag2 = false
							end)
							
							return
						else
							NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
							
							return
						end
					end
				elseif DifferentiateVoiceSelectorSystemAndUser and DeferProgrammaticChange then
					Flag2 = true
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					task.defer(function()
						-- upvalues: Flag2 (upval)
						Flag2 = false
					end)
					
					return
				else
					NewPage.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				end
			end):catch(function()
				-- upvalues: GetFFlagVoiceChatUILoggingModule (upval), NewResult1 (upval), GetFFlagEnableUniveralVoiceToastsModule (upval), Default2 (upval)
				if GetFFlagVoiceChatUILoggingModule() then
					NewResult1:warning("Failed to init VoiceChatServiceManager")
				end
				if not GetFFlagEnableUniveralVoiceToastsModule() then
					Default2:CheckAndShowPermissionPrompt()
				end
			end)
		end)
	end
	if GetFFlagEnableCrossExpVoiceFunction() and (not IsInExperienceUIVREnabled or not IsSpatialFunction()) then
		EventConnection = Default3.ExperienceJoined.Event:Connect(function()
			-- upvalues: NewPage (copy), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), config4 (upval)
			local VoiceChatOptionsEnabled = NewPage.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected()
			
			if NewPage[config4.Input .. "DeviceFrame"] then
				NewPage[config4.Input .. "DeviceFrame"].Visible = VoiceChatOptionsEnabled
			end
		end)
		EventConnection1 = Default3.ExperienceLeft.Event:Connect(function()
			-- upvalues: NewPage (copy), GetFFlagEnableCrossExpVoiceFunction (upval), Default3 (upval), config4 (upval)
			local VoiceChatOptionsEnabled = NewPage.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoiceFunction() and Default3:getIsConnected()
			
			if NewPage[config4.Input .. "DeviceFrame"] then
				NewPage[config4.Input .. "DeviceFrame"].Visible = VoiceChatOptionsEnabled
			end
		end)
		
		Callback2 = function()
			-- upvalues: EventConnection (ref), EventConnection1 (ref)
			if EventConnection then
				EventConnection:Disconnect()
				EventConnection = nil
			end
			if EventConnection1 then
				EventConnection1:Disconnect()
				EventConnection1 = nil
			end
		end
	end
	NewPage.VideoOptionsEnabled = false
	local Connection2 = nil
	
	local _ = function()
		-- upvalues: Connection2 (ref)
		if Connection2 then
			Connection2:disconnect()
			Connection2 = nil
		end
	end
	
	if GetFFlagSelfViewCameraSettingsFunction() and (not IsInExperienceUIVREnabled or not IsSpatialFunction()) then
		local function v231(p8)
			-- upvalues: NewPage (copy)
			NewPage.VideoOptionsEnabled = p8.hasCameraPermissions
		end
		
		if IsCamEnabledForUserAndPlaceModule() then
			GetCamMicPermissionsModule(v231, { Default.Permissions.CAMERA_ACCESS }, true)
			
			if Connection2 then
				Connection2:disconnect()
			end
			Connection2 = CameraDevicePermissionGrantedSignalModule:connect(function()
				-- upvalues: NewPage (copy), updateCameraDevices (copy), VideoCaptureService (upval), DevicesChangedConnection (ref)
				NewPage.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if VideoCaptureService.DevicesChanged then
					DevicesChangedConnection = VideoCaptureService.DevicesChanged:Connect(function()
						-- upvalues: NewPage (upval), updateCameraDevices (upval)
						if NewPage.PageOpen then
							updateCameraDevices()
						end
					end)
				end
			end)
		end
	end
	if not IsInExperienceUIVREnabled then
		createCameraModeOptions(not IsEnabled and (UserInputService.TouchEnabled or (UserInputService.MouseEnabled or UserInputService.KeyboardEnabled)))
	end
	local _ = function()
		-- upvalues: GameSettings (upval), createGamepadOptions (copy)
		if GameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		else
			local Connection = nil
			Connection = GameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: GameSettings (upval), Connection (ref), createGamepadOptions (upval)
				if GameSettings.IsUsingGamepadCameraSensitivity then
					if Connection then
						Connection:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end
	end
	
	if UserInputService.MouseEnabled then
		createMouseOptions()
	elseif UserInputService.GamepadEnabled then
		if GameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
		else
			local Connection3 = nil
			Connection3 = GameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: GameSettings (upval), Connection3 (ref), createGamepadOptions (copy)
				if GameSettings.IsUsingGamepadCameraSensitivity then
					if Connection3 then
						Connection3:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end
	else
		local GamepadConnectedConnection = nil
		GamepadConnectedConnection = UserInputService.GamepadConnected:connect(function()
			-- upvalues: GamepadConnectedConnection (ref), GameSettings (upval), createGamepadOptions (copy)
			if GamepadConnectedConnection then
				GamepadConnectedConnection:disconnect()
			end
			if GameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()
				
				return
			else
				local Connection = nil
				Connection = GameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
					-- upvalues: GameSettings (upval), Connection (ref), createGamepadOptions (upval)
					if GameSettings.IsUsingGamepadCameraSensitivity then
						if Connection then
							Connection:disconnect()
						end
						createGamepadOptions()
					end
				end)
			end
		end)
	end
	if not IsInExperienceUIVREnabled then
		if GameSettings.IsUsingCameraYInverted then
			createCameraInvertedOptions()
		else
			local ChangedConnection1 = nil
			ChangedConnection1 = GameSettings.Changed:connect(function(p8)
				-- upvalues: GameSettings (upval), ChangedConnection1 (ref), createCameraInvertedOptions (copy)
				if p8 == "IsUsingCameraYInverted" and GameSettings.IsUsingCameraYInverted then
					ChangedConnection1:disconnect()
					createCameraInvertedOptions()
				end
			end)
		end
	end
	if IsInExperienceUIVREnabled then
		if IsSpatialFunction() then
			createVRComfortSettingOptions()
			createVRSafetyBubbleModeOptions()
		else
			createCameraModeOptions(not IsEnabled and (UserInputService.TouchEnabled or (UserInputService.MouseEnabled or UserInputService.KeyboardEnabled)))
			
			if GameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				local ChangedConnection = nil
				ChangedConnection = GameSettings.Changed:connect(function(p8)
					-- upvalues: GameSettings (upval), ChangedConnection (ref), createCameraInvertedOptions (copy)
					if p8 == "IsUsingCameraYInverted" and GameSettings.IsUsingCameraYInverted then
						ChangedConnection:disconnect()
						createCameraInvertedOptions()
					end
				end)
			end
			createReducedMotionOptions()
			createPreferredTransparencyOptions()
		end
	end
	createVolumeOptions()
	
	if FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		createVoiceChatVolumeOptions()
	end
	if FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry and FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		local Flag3 = false
		NewPage.Displayed.Event:Connect(function()
			-- upvalues: Flag3 (ref), NewPage (copy), Default2 (upval)
			Flag3 = true
			
			if NewPage.VoiceChatVolumeFrame and NewPage.VoiceChatVolumeFrame.Visible then
				Default2:RecordGameSettingsOpened()
			end
		end)
		NewPage.Hidden.Event:Connect(function()
			-- upvalues: Flag3 (ref)
			Flag3 = false
		end)
		NewPage.VoiceChatVolumeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: NewPage (copy), Flag3 (ref), Default2 (upval)
			if NewPage.VoiceChatVolumeFrame.Visible and Flag3 then
				Default2:RecordGameSettingsOpened()
			end
		end)
	end
	if HasPartyVoiceVolume then
		createPartyVoiceVolumeOptions()
	end
	createHapticsToggle()
	createGraphicsOptions()
	
	if ShowAntiHarassmentSettings and GetFFlagEnablePlayerNamesEnabledSettingModule() then
		createPlayerNamesEnabledOptions()
	end
	if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
		PlayerChoiceTranslationSettingInitializerModule(NewPage, SETTINGSMENULAYOUTORDER, reportSettingsChangeForAnalytics)
	end
	if not IsInExperienceUIVREnabled then
		createReducedMotionOptions()
		createPreferredTransparencyOptions()
	end
	createPreferredTextSizeOptions()
	
	if RUUserScalePreferenceAPIEngineFeature then
		local Success, Result = pcall(createUIScaleOptionsImpl)
		
		if not Success then
			warn("createUIScaleOptions failed: " .. tostring(Result))
		end
	end
	createUiNavigationKeyBindOptions()
	
	if not CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
		createPerformanceStatsOptions()
	end
	if Inverted1 then
		createMicroProfilerOptions()
	end
	if IsEnabled and GetAppFeaturePoliciesFunction().getSupportsOverscan() then
		createOverscanOption()
	end
	if ShowAntiHarassmentSettings and FFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: PlayerPermissionsModule (upval), LocalPlayer (upval), RobloxTranslatorModule (upval), UpdateVisibilitySettingsCopy (upval), NewPage (copy), UtilityModule (upval), SETTINGSMENULAYOUTORDER (upval), GameSettings (upval)
			NewPage.badgeVisibleRow, NewPage.badgeVisibleFrame, NewPage.badgeVisibleSelector = UtilityModule:AddNewRow(NewPage, if UpdateVisibilitySettingsCopy then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				(RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show"))
			}, if PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(LocalPlayer) then 1 else 2, nil, (RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames")))
			NewPage.badgeVisibleRow.LayoutOrder = SETTINGSMENULAYOUTORDER.BadgeVisibilityFrame
			NewPage.badgeVisibleSelector.IndexChanged:connect(function(p8)
				-- upvalues: GameSettings (upval), PlayerPermissionsModule (upval), LocalPlayer (upval)
				GameSettings.BadgeVisible = p8 == 2
				PlayerPermissionsModule.SetPlayerInExperienceNameEnabled(LocalPlayer, p8 == 1)
			end)
		end)
	end
	if FFlagEnableModerateChatRemoteEvent then
		createChatModerationOptions()
	end
	if FFlagAIRephraseSettingEnabled then
		createAIRephraseSettingOptions()
	end
	if FFlagChatSummariesSettingEnabled then
		createChatSummariesSettingOptions()
	end
	if FFlagExpChatDictation then
		createVoiceTypingModeSettingOptions()
	end
	if FFlagExpChatEnableFriendsTab then
		createChatNotificationsSettingOptions()
	end
	createDeveloperConsoleOption()
	GetHasGuiHidingPermissionModule(RunService:IsStudio(), LocalPlayer, PlayerPermissionsModule):andThen(function(Result)
		-- upvalues: createUiToggleOptions (copy)
		if Result then
			createUiToggleOptions()
		end
	end):catch(function(Err)
		warn(Err)
	end)
	Flag = true
	
	if VRService.VREnabled then
		local VREnabled = VRService.VREnabled
		
		for i1, _ in pairs(t) do
			i1.Visible = not VREnabled
		end
	end
	if RenderMoreSettingsBannerModule then
		NewPage.MoreSettingsBanner = RenderMoreSettingsBannerModule({
			layoutOrder = SETTINGSMENULAYOUTORDER.MoreSettingsBanner,
			parent = NewPage.Page
		})
	end
	if FFlagIEMSettingsGroupsModule then
		NewPage.AudioHeader = Callback({
			headerText = "CoreScripts.InGameMenu.GameSettings.AudioHeader",
			layoutOrder = SETTINGSMENULAYOUTORDER.AudioHeader,
			parent = NewPage.Page
		})
		NewPage.AudioDivider = Callback1({
			layoutOrder = SETTINGSMENULAYOUTORDER.AudioDivider,
			parent = NewPage.Page
		})
		NewPage.DisplayHeader = Callback({
			headerText = "CoreScripts.InGameMenu.GameSettings.DisplayHeader",
			layoutOrder = SETTINGSMENULAYOUTORDER.DisplayHeader,
			parent = NewPage.Page
		})
		NewPage.DisplayDivider = Callback1({
			layoutOrder = SETTINGSMENULAYOUTORDER.DisplayDivider,
			parent = NewPage.Page
		})
		
		if not IsSpatialFunction() then
			NewPage.LanguageHeader = Callback({
				headerText = "CoreScripts.InGameMenu.GameSettings.LanguageHeader",
				layoutOrder = SETTINGSMENULAYOUTORDER.LanguageHeader,
				parent = NewPage.Page
			})
			NewPage.LanguageDivider = Callback1({
				layoutOrder = SETTINGSMENULAYOUTORDER.LanguageDivider,
				parent = NewPage.Page
			})
		end
		NewPage.ViewAndControlsHeader = Callback({
			headerText = "CoreScripts.InGameMenu.GameSettings.ViewandControlsHeader",
			layoutOrder = SETTINGSMENULAYOUTORDER.ViewAndControlsHeader,
			parent = NewPage.Page
		})
	end
	NewPage.TabHeader.Name = "GameSettingsTab"
	local IconsCommonSettings = Migration.uiblox["icons/common/settings"]
	NewPage.TabHeader.TabLabel.Icon.Text = IconsCommonSettings.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconsCommonSettings.variant]
	NewPage.TabHeader.TabLabel.Title.Text = "Settings"
	NewPage.Page.ZIndex = 5
	
	if NewPage.PageListLayout then
		NewPage.PageListLayout.Padding = UDim.new(0, 0)
	end
	NewPage.PageOpen = false
	
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		NewPage.FeedbackEntryPointEnabled = true
	end
	local _ = function(): boolean
		-- upvalues: RunService (upval), EnableTFFeedbackModeEntryCheck (upval), IsEnabled (upval)
		return not RunService:IsStudio() and (game:GetEngineFeature("CaptureModeEnabled") ~= false and (not EnableTFFeedbackModeEntryCheck or not IsEnabled))
	end
	
	function NewPage.OpenSettingsPage()
		-- upvalues: NewPage (copy), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), RUUserScalePreferenceAPIEngineFeature (upval), createUIScaleOptionsImpl (copy), GetFFlagLazyInitiateExperienceLanguageSwitcherModule (upval), GetFFlagEnableLocalesForExperienceLanguageSwitcherModule (upval), ExperienceLanguageSwitcherInitializerModule (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval), updateAudioOptions (copy), SoundService (upval), DeviceListChangedConnection (ref), Connection (ref), Connection1 (ref), GameSettings (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (upval), GetFFlagSelfViewCameraSettingsFunction (upval), updateCameraDevices (copy), VideoCaptureService (upval), DevicesChangedConnection (ref), updateUiToggleSelection (copy), ExperienceStateCaptureService (upval), CoreScriptsFeedbackEntryPointButtonText (upval), ThemeModule (upval), FeatureSettingsHubLanguageSelectionUnavailable (upval), getLastValueChangerFrame (upval), FFlagIEMTabFocusNav (upval), getFirstValueChangerFrame (upval)
		NewPage.PageOpen = true
		
		if IsInExperienceUIVREnabled and IsSpatialFunction() then return end
		if RUUserScalePreferenceAPIEngineFeature then
			local Success, Result = pcall(createUIScaleOptionsImpl)
			
			if not Success then
				warn("createUIScaleOptions failed: " .. tostring(Result))
			end
		end
		if GetFFlagLazyInitiateExperienceLanguageSwitcherModule() and not NewPage.LanguageSwitcherInitialized and isLangaugeSelectionDropdownEnabled() and GetFFlagEnableLocalesForExperienceLanguageSwitcherModule() then
			NewPage.LanguageSwitcherInitialized = true
			ExperienceLanguageSwitcherInitializerModule(NewPage, SETTINGSMENULAYOUTORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if SoundService.DeviceListChanged then
			DeviceListChangedConnection = SoundService.DeviceListChanged:Connect(function()
				-- upvalues: NewPage (upval), updateAudioOptions (upval)
				if NewPage.PageOpen then
					updateAudioOptions()
				end
			end)
		end
		if RUUserScalePreferenceAPIEngineFeature and RUUserScalePreferenceAPIEngineFeature then
			local function rebindToCurrentCamera()
				-- upvalues: Connection (upval), NewPage (upval), createUIScaleOptionsImpl (upval)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				local CurrentCamera = workspace.CurrentCamera
				
				if CurrentCamera then
					Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: NewPage (upval), createUIScaleOptionsImpl (upval)
						if NewPage.PageOpen then
							local Success, Result = pcall(createUIScaleOptionsImpl)
							
							if not Success then
								warn("createUIScaleOptions failed: " .. tostring(Result))
							end
						end
					end)
					
					return
				end
			end
			
			rebindToCurrentCamera()
			Connection1 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(rebindToCurrentCamera)
		end
		NewPage.startVolume = GameSettings.MasterVolume
		
		if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
			NewPage.maxVoiceChatVolumeDuringSession = GameSettings.VoiceChatVolume
		end
		if GetFFlagSelfViewCameraSettingsFunction() and NewPage.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
			updateCameraDevices()
			
			if VideoCaptureService.DevicesChanged then
				DevicesChangedConnection = VideoCaptureService.DevicesChanged:Connect(function()
					-- upvalues: NewPage (upval), updateCameraDevices (upval)
					if NewPage.PageOpen then
						updateCameraDevices()
					end
				end)
			end
		end
		updateUiToggleSelection()
		
		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and NewPage.toggleFeedbackModeButton and NewPage.toggleFeedbackModeText then
			NewPage.FeedbackEntryPointEnabled = ExperienceStateCaptureService ~= nil and ExperienceStateCaptureService:CanEnterCaptureMode()
			
			if NewPage.FeedbackEntryPointEnabled then
				NewPage.toggleFeedbackModeButton.Active = true
				NewPage.toggleFeedbackModeButton.Enabled.Value = true
				NewPage.toggleFeedbackModeText.Text = CoreScriptsFeedbackEntryPointButtonText
			else
				NewPage.toggleFeedbackModeButton.Active = false
				NewPage.toggleFeedbackModeButton.Enabled.Value = false
				NewPage.toggleFeedbackModeText.TextColor3 = ThemeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				NewPage.toggleFeedbackModeText.Text = FeatureSettingsHubLanguageSelectionUnavailable
			end
		end
		table.insert(NewPage.LastSelectableObjects, (getLastValueChangerFrame(NewPage)))
		
		if FFlagIEMTabFocusNav then
			table.insert(NewPage.FirstSelectableObjects, getFirstValueChangerFrame(NewPage))
			NewPage.FirstSelectableObjectsUpdated:fire()
		end
	end
	
	function NewPage.CloseSettingsPage()
		-- upvalues: NewPage (copy), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), SoundService (upval), DeviceListChangedConnection (ref), RUUserScalePreferenceAPIEngineFeature (upval), Connection (ref), Connection1 (ref), ScaledCeiled (ref), ScaledFloored (ref), GetFFlagEnableCrossExpVoiceFunction (upval), Callback2 (ref), GetFFlagSelfViewCameraSettingsFunction (upval), VideoCaptureService (upval), DevicesChangedConnection (ref), Connection2 (ref), Default2 (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (upval)
		NewPage.PageOpen = false
		
		if IsInExperienceUIVREnabled and IsSpatialFunction() then return end
		if SoundService.DeviceListChanged and DeviceListChangedConnection then
			DeviceListChangedConnection:Disconnect()
		end
		if RUUserScalePreferenceAPIEngineFeature then
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			if Connection1 then
				Connection1:Disconnect()
				Connection1 = nil
			end
			ScaledCeiled = nil
			ScaledFloored = nil
		end
		if GetFFlagEnableCrossExpVoiceFunction() and Callback2 then
			Callback2()
		end
		if GetFFlagSelfViewCameraSettingsFunction() then
			if game:GetEngineFeature("VideoCaptureService") and VideoCaptureService.DevicesChanged and DevicesChangedConnection then
				DevicesChangedConnection:Disconnect()
				DevicesChangedConnection = nil
			end
			if Connection2 then
				Connection2:disconnect()
				Connection2 = nil
			end
		end
		if game:GetEngineFeature("VoiceChatSupported") and NewPage.VoiceChatOptionsEnabled and NewPage.startVolume ~= nil and NewPage.startVolume > 0 then
			Default2:CheckAndShowNotAudiblePrompt()
		end
		if game:GetEngineFeature("VoiceChatSupported") and NewPage.VoiceChatOptionsEnabled and FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and NewPage.maxVoiceChatVolumeDuringSession ~= nil and NewPage.maxVoiceChatVolumeDuringSession > 0 then
			Default2:ShowNotAudiblePromptVoiceChatVolume()
		end
	end
	
	function isLangaugeSelectionDropdownEnabled(): boolean
		-- upvalues: LocalPlayer (upval)
		if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
			return false
		end
		if LocalPlayer.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
			return true
		end
		for i in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
			if tonumber(i) == LocalPlayer.UserId then
				return true
			end
		end
		return false
	end
	
	function NewPage:SetHub(HubRef)
		-- upvalues: NewPage (copy), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), GetFFlagEnableLocalesForExperienceLanguageSwitcherModule (upval), GetFFlagLazyInitiateExperienceLanguageSwitcherModule (upval), ExperienceLanguageSwitcherInitializerModule (upval), SETTINGSMENULAYOUTORDER (upval), reportSettingsChangeForAnalytics (upval), createTranslationOptions (copy), GetFFlagChatTranslationSettingEnabledModule (upval), GetFFlagChatTranslationHoldoutEnabledModule (upval), GetFStringChatTranslationLayerNameModule (upval), getChatTranslationLayerData (copy), TextChatServiceSettingsSavedEngineFeature (upval), GetFFlagChatTranslationNewDefaultsModule (upval), GameSettings (upval), TextChatService (upval), GetFFlagChatTranslationForceSettingModule (upval), ChatTranslationOptionsWithChatLanguageSwitcherInitializerModule (upval), RunService (upval), EnableTFFeedbackModeEntryCheck (upval), IsEnabled (upval), createFeedbackModeOptions (copy)
		NewPage.HubRef = HubRef
		
		if IsInExperienceUIVREnabled and IsSpatialFunction() then return end
		if isLangaugeSelectionDropdownEnabled() then
			if GetFFlagEnableLocalesForExperienceLanguageSwitcherModule() then
				if not GetFFlagLazyInitiateExperienceLanguageSwitcherModule() then
					ExperienceLanguageSwitcherInitializerModule(NewPage, SETTINGSMENULAYOUTORDER, reportSettingsChangeForAnalytics)
				end
			else
				createTranslationOptions()
			end
		end
		if game:GetEngineFeature("EnableTCSChatTranslation") and GetFFlagChatTranslationSettingEnabledModule() then
			if GetFFlagChatTranslationHoldoutEnabledModule() then
				if getChatTranslationLayerData((GetFStringChatTranslationLayerNameModule())).ChatTranslationEnabled then
					if GetFFlagChatTranslationForceSettingModule() then
						GameSettings.ChatTranslationEnabled = true
					end
				elseif TextChatServiceSettingsSavedEngineFeature then
					if GetFFlagChatTranslationNewDefaultsModule() then
						if GameSettings.ChatTranslationLocale == "" then
							GameSettings.ChatTranslationEnabled = false
							GameSettings.ChatTranslationLocale = "en_us"
						end
					else
						GameSettings.ChatTranslationEnabled = false
					end
				else
					pcall(function()
						-- upvalues: TextChatService (upval)
						TextChatService.ChatTranslationEnabled = false
					end)
				end
			end
			ChatTranslationOptionsWithChatLanguageSwitcherInitializerModule(NewPage, SETTINGSMENULAYOUTORDER, reportSettingsChangeForAnalytics)
		end
		if not RunService:IsStudio() and (game:GetEngineFeature("CaptureModeEnabled") ~= false and (not EnableTFFeedbackModeEntryCheck or not IsEnabled)) then
			createFeedbackModeOptions()
		end
	end
	
	return NewPage
end)())