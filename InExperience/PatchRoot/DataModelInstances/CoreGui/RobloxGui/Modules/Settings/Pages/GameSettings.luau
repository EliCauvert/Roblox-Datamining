local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local contextActionService = game:GetService("ContextActionService")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local soundService = game:GetService("SoundService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local var12 = UserSettings()
local gameSettings = var12.GameSettings
local videoCaptureService = game:GetService("VideoCaptureService")
local userGameSettingsService = var12:GetService("UserGameSettings")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local textChatService = game:GetService("TextChatService")
local safetyService = game:GetService("SafetyService")
local var17 = if game:GetEngineFeature("CaptureModeEnabled") then game:GetService("ExperienceStateCaptureService") else nil
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagIEMSettingsGroupsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMSettingsGroups)
local var20 = if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() or isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil
local getCamMicPermissionsModule = require(robloxGui.Modules.Settings.getCamMicPermissions)
local isCamEnabledForUserAndPlaceModule = require(robloxGui.Modules.Settings.isCamEnabledForUserAndPlace)
local renderSettingsHeaderModule = nil
local renderSettingsDividerModule = nil

if fFlagIEMSettingsGroupsModule then
	renderSettingsHeaderModule = require(robloxGui.Modules.Settings.Components.renderSettingsHeader)
	renderSettingsDividerModule = require(robloxGui.Modules.Settings.Components.renderSettingsDivider)
end
local var90_1
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local isVoiceFocused = require(corePackagesService.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local observeIsVoiceFocused = require(corePackagesService.Workspace.Packages.CrossExperience).Utils.observeIsVoiceFocused
local cameraDevicePermissionGrantedSignalModule = require(coreGuiService.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty = sharedFlagsModule.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagSelfViewCameraSettings = sharedFlagsModule.GetFFlagSelfViewCameraSettings
local getFFlagAlwaysShowVRToggleModule = require(robloxGui.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local getFIntDebounceDisconnectButtonDelayModule = require(robloxGui.Modules.Flags.GetFIntDebounceDisconnectButtonDelay)
local getFIntDebounceAIRephraseSettingDelayModule = require(robloxGui.Modules.Flags.GetFIntDebounceAIRephraseSettingDelay)
local getFIntDebounceChatSummariesSettingDelayModule = require(robloxGui.Modules.Flags.GetFIntDebounceChatSummariesSettingDelay)
local touchEnabled = userInputService.TouchEnabled
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local showAntiHarassmentSettings = game:DefineFastFlag("ShowAntiHarassmentSettings", false)
local getFFlagEnablePlayerNamesEnabledSettingModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local fFlagUpdatePeopleNamesSettingCopyModule = require(robloxGui.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy)
local fFlagBadgeVisibilitySettingEnabled = sharedFlagsModule.FFlagBadgeVisibilitySettingEnabled
local getFFlagEnableVoiceUxUpdates = sharedFlagsModule.GetFFlagEnableVoiceUxUpdates
local getFFlagEnableVrVoiceConnectDisconnect = sharedFlagsModule.GetFFlagEnableVrVoiceConnectDisconnect
local hideVoiceChatSelectorForFaeAEGIS2 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false)
local centerShiftLockOverride = game:DefineFastFlag("CenterShiftLockOverride", true)
local voiceChatSelectorReconnectFocus2AEGIS2 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false)
local microProfilerReadOnlyInformationLabel = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false)
local fFlagEnableModerateChatRemoteEvent = sharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local voiceSelectorAvailableAfterFae = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false)
local differentiateVoiceSelectorSystemAndUser = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false)
local deferProgrammaticChange = game:DefineFastFlag("DeferProgrammaticChange", false)
local fFlagRenameVolumeToMainVolumeModule = require(robloxGui.Modules.Flags.FFlagRenameVolumeToMainVolume)
local fFlagAIRephraseSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagVoiceRewarmTelemetry = sharedFlagsModule.FFlagVoiceRewarmTelemetry
local debounceVoiceSelectorIndexChange = game:DefineFastFlag("DebounceVoiceSelectorIndexChange", false)
local voiceSelectorIgnoreFailedStateDisconnect = game:DefineFastFlag("VoiceSelectorIgnoreFailedStateDisconnect", false)
local fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(robloxGui.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local voiceVolumeControlsFixSliderVisibilityOnEligibleGames = game:DefineFastFlag("VoiceVolumeControlsFixSliderVisibilityOnEligibleGames", false)
local voiceVolumeControlsDisableInteractionWhenNoMasterVolume = game:DefineFastFlag("VoiceVolumeControlsDisableInteractionWhenNoMasterVolume", false)
local fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(corePackagesService.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(robloxGui.Modules.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local voiceVolumeControlsSuppressInExperienceUiForPartyVoice = game:DefineFastFlag("VoiceVolumeControlsSuppressInExperienceUiForPartyVoice", false)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local default_1 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local gameSettingsConstantsModule = require(robloxGui.Modules.Settings.Resources.GameSettingsConstants)
local var52 = default_1 and default_1.getHasPartyVoiceVolume()
local constantsModule = require(robloxGui:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local t = {
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

local function _(p0)
	return math.floor(p0 * 5 + 0.5)
end

local _ = function(p1)
	return p1 / 5
end

local t_1 = {
	DevComputerMovementMode = true,
	DevComputerCameraMode = true,
	DevEnableMouseLock = true
}
local t_2 = { DevTouchMovementMode = true, DevTouchCameraMode = true }
local t_3 = {
	DEFAULT_FOLLOW = "Default (Follow)",
	DEFAULT_CLASSIC = "Default (Classic)"
}
local t_4 = { Input = "Input", Output = "Output" }
local t_5 = {
	DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)",
	DEFAULT_KEYBOARD = "Default (Keyboard)",
	TAP_TO_MOVE = "Tap to Move",
	CLICK_TO_MOVE = "Click to Move"
}
local var60 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local var61 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local var62 = robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local t_6 = { On = 1, Off = 2 }

local _ = function()
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then "Default (Follow)" else "Default (Classic)"
end

local _ = function()
	-- upvalues: userInputService (ref), robloxTranslatorModule (ref), constantsModule (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else "Default (Keyboard)"
end

local _ = function()
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then "Tap to Move" else "Click to Move"
end

local SETTINGS_MENU_LAYOUT_ORDER = gameSettingsConstantsModule.SETTINGS_MENU_LAYOUT_ORDER
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local getFFlagChatTranslationSettingEnabledModule = require(robloxGui.Modules.Flags.GetFFlagChatTranslationSettingEnabled)
local getFStringChatTranslationLayerNameModule = require(robloxGui.Modules.Flags.GetFStringChatTranslationLayerName)
local getFFlagChatTranslationHoldoutEnabledModule = require(robloxGui.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled)
local getFFlagChatTranslationWaitForIXPModule = require(robloxGui.Modules.Flags.GetFFlagChatTranslationWaitForIXP)
local getFFlagChatTranslationForceSettingModule = require(robloxGui.Modules.Flags.GetFFlagChatTranslationForceSetting)
local getFFlagChatTranslationNewDefaultsModule = require(robloxGui.Modules.Flags.GetFFlagChatTranslationNewDefaults)
local textChatServiceSettingsSavedEngineFeature = game:GetEngineFeature("TextChatServiceSettingsSaved")
local chatTranslationOptionsWithChatLanguageSwitcherInitializerModule = require(robloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer)
local gameBasicSettingsFramerateCapEngineFeature = game:GetEngineFeature("GameBasicSettingsFramerateCap")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local coreUtilityModule = require(robloxGui.Modules.CoreUtility)
local playerPermissionsModule = require(robloxGui.Modules.PlayerPermissionsModule)
local getHasGuiHidingPermissionModule = require(robloxGui.Modules.Common.GetHasGuiHidingPermission)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local cryoModule = require(corePackagesService.Packages.Cryo)
local gfxResetModule = require(script.Parent.Parent.GfxReset)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local throttleFunctionCallModule = require(coreGuiService.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall)
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local signalsModule = require(corePackagesService.Packages.Signals)
local migration = builderIconsModule.Migration
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
robloxGui:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub")
local var83 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local _ = nil
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local default_2 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceVolumeControlsEligibility = require(corePackagesService.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local default_3 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local var86 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local var87 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local romarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local var90 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local var91 = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
local var92 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true

if isInExperienceUIVREnabled then
	if not var92 and not var91 then
		var90_1 = isSpatial() and var90
	end
elseif not var92 then
	var90_1 = var91 and var90
end
local getFIntVoiceChatDeviceChangeDebounceDelayModule = require(robloxGui.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay)
local getFFlagVoiceChatUILoggingModule = require(robloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local getFFlagEnableUniveralVoiceToastsModule = require(robloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local getFFlagEnableExplicitSettingsChangeAnalyticsModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics)
local getFFlagFixCyclicFullscreenIndexEventModule = require(robloxGui.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent)
local disableFeedbackSoothsayerCheck = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false)
local userShowGuiHideToggles = game:DefineFastFlag("UserShowGuiHideToggles", false)
local userFreecamGuiDestabilization = game:DefineFastFlag("UserFreecamGuiDestabilization", false)
local fixDeveloperConsoleButtonSizeAndPositioning = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false)
local enableTFFeedbackModeEntryCheck = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false)
local feedbackEntryPointButtonSizeAdjustment2 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false)
local feedbackEntryPointImprovedStrictnessCheck = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false)
local getFFlagEnableLocalesForExperienceLanguageSwitcherModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher)
local getFFlagLazyInitiateExperienceLanguageSwitcherModule = require(robloxGui.Modules.Settings.Flags.GetFFlagLazyInitiateExperienceLanguageSwitcher)
local experienceLanguageSwitcherInitializerModule = require(robloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer)
local playerChoiceTranslationSettingInitializerModule = require(robloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer)
local updateVisibilitySettingsCopy = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false)
local expChatDebounceRephraseIndexSelection = game:DefineFastFlag("ExpChatDebounceRephraseIndexSelection", false)
local eraseFPSFromDefaultSetting = game:DefineFastFlag("EraseFPSFromDefaultSetting", false)

local function reportSettingsChangeForAnalytics(value, p2, p3, p4)
	-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), userInputService (ref), cryoModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	if not getFFlagEnableExplicitSettingsChangeAnalyticsModule() or p2 == p3 or (p2 == nil or p3 == nil) then return end
	local t = {
		universe_id = tostring(game.GameId),
		name = value,
		old_value = tostring(p2),
		new_value = tostring(p3),
		has_touch = userInputService.TouchEnabled,
		has_mouse = userInputService.MouseEnabled,
		has_gamepad = userInputService.GamepadEnabled
	}
	
	if p4 then
		t = cryoModule.Dictionary.join(t, p4)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsExplicitSettingsChangeName, t)
end

local function reportSettingsForAnalytics()
	-- upvalues: userInputService (ref), gameSettings (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	local t = {}
	local var121 = userInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if var121 then
		t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
	else
		t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
	end
	if var121 then
		t.movement_mode_touch = tostring(gameSettings.TouchMovementMode)
	else
		t.movement_mode_desktop = tostring(gameSettings.ComputerMovementMode)
	end
	if userInputService.MouseEnabled then
		t.shift_lock_enabled = tostring(gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
	end
	if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
		t.camera_sensitivity_gamepad = tostring(tonumber(string.format("%.2f", gameSettings.GamepadCameraSensitivity)))
	end
	if userInputService.MouseEnabled then
		t.camera_sensitivity_mouse = tostring(tonumber(string.format("%.2f", gameSettings.MouseSensitivityFirstPerson.X)))
	end
	t.camera_y_inverted = tostring(gameSettings.CameraYInverted)
	t.show_performance_stats = tostring(gameSettings.PerformanceStatsVisible)
	t.volume = tostring(math.floor(gameSettings.MasterVolume * 10 + 0.5))
	
	if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		t.voice_chat_volume = tostring(math.floor(gameSettings.VoiceChatVolume * 5 + 0.5))
	end
	t.gfx_quality_level = tostring(settings().Rendering.QualityLevel)
	
	if gameBasicSettingsFramerateCapEngineFeature then
		t.framerate_cap = tostring(gameSettings.FramerateCap)
	end
	t.fullscreen_enabled = tostring(gameSettings:InFullScreen())
	t.microprofiler_enabled = tostring(gameSettings.OnScreenProfilerEnabled)
	t.microprofiler_webserver_enabled = tostring(gameSettings.MicroProfilerWebServerEnabled)
	t.reduced_motion = tostring(gameSettings.ReducedMotion)
	t.preferred_transparency = tostring(gameSettings.PreferredTransparency)
	t.preferred_text_size = tostring(gameSettings.PreferredTextSize)
	t.ui_navigation_key_bind_enabled = tostring(gameSettings.UiNavigationKeyBindEnabled)
	t.universeid = tostring(game.GameId)
	
	if getFFlagEnablePlayerNamesEnabledSettingModule() then
		t.player_names_enabled = tostring(gameSettings.PlayerNamesEnabled)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsSettingsChangeName, t)
end

game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0)
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "")
local IGMEnableGFXReset = game:DefineFastFlag("IGMEnableGFXReset", false)

local function getLastValueChangerFrame(p5)
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p5:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or layoutOrder <= selectionFrame.LayoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p5:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

local function getFirstValueChangerFrame(p6)
	-- upvalues: fFlagIEMTabFocusNav (ref)
	if not fFlagIEMTabFocusNav then return end
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p6:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or selectionFrame.LayoutOrder < layoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p6:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

return (function()
	-- upvalues: IGMEnableGFXReset (ref), gfxResetModule (ref), robloxGui (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (ref), VRService (ref), gameSettings (ref), utilityModule (ref), SETTINGS_MENU_LAYOUT_ORDER (ref), guiService (ref), getFFlagFixCyclicFullscreenIndexEventModule (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), reportSettingsChangeForAnalytics (ref), reportSettingsForAnalytics (ref), rbxAnalyticsService (ref), constantsModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), eraseFPSFromDefaultSetting (ref), robloxTranslatorModule (ref), romarkStartWithGraphicQualityLevelFastInt (ref), t (ref), updateVisibilitySettingsCopy (ref), fFlagUpdatePeopleNamesSettingCopyModule (ref), t_6 (ref), userInputService (ref), create (ref), themeModule (ref), centerShiftLockOverride (ref), microProfilerReadOnlyInformationLabel (ref), touchEnabled (ref), var92 (ref), var91 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), localPlayer (ref), coreUtilityModule (ref), t_3 (ref), getFFlagAlwaysShowVRToggleModule (ref), getAppFeaturePolicies (ref), t_5 (ref), var60 (ref), t_2 (ref), t_1 (ref), url (ref), httpService (ref), feedbackEntryPointImprovedStrictnessCheck (ref), safetyService (ref), var17 (write), feedbackEntryPointButtonSizeAdjustment2 (ref), var62 (ref), disableFeedbackSoothsayerCheck (ref), name (ref), playersService (ref), var61 (ref), runService (ref), getFFlagChatTranslationWaitForIXPModule (ref), IXPServiceWrapper (ref), getFFlagChatTranslationNewDefaultsModule (ref), fFlagRenameVolumeToMainVolumeModule (ref), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (ref), default_3 (ref), var20 (write), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), corePackagesService (ref), contextActionService (ref), fixDeveloperConsoleButtonSizeAndPositioning (ref), playerPermissionsModule (ref), userFreecamGuiDestabilization (ref), userShowGuiHideToggles (ref), soundService (ref), getFIntVoiceChatDeviceChangeDebounceDelayModule (ref), default_2 (ref), getFFlagEnableCrossExpVoice (ref), signalsModule (ref), getFIntDebounceAIRephraseSettingDelayModule (ref), textChatService (ref), expChatDebounceRephraseIndexSelection (ref), throttleFunctionCallModule (ref), getFIntDebounceChatSummariesSettingDelayModule (ref), var87 (ref), userGameSettingsService (ref), getFFlagVoiceChatUILoggingModule (ref), videoCaptureService (ref), var86 (ref), differentiateVoiceSelectorSystemAndUser (ref), voiceSelectorAvailableAfterFae (ref), getFIntDebounceDisconnectButtonDelayModule (ref), fFlagVoiceRewarmTelemetry (ref), constantsModule_1 (ref), voiceSelectorIgnoreFailedStateDisconnect (ref), voiceChatSelectorReconnectFocus2AEGIS2 (ref), debounceVoiceSelectorIndexChange (ref), deferProgrammaticChange (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), isVoiceFocused (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), getFFlagEnableVoiceUxUpdates (ref), hideVoiceChatSelectorForFaeAEGIS2 (ref), observeIsVoiceFocused (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (ref), voiceVolumeControlsEligibility (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), t_4 (ref), getFFlagSelfViewCameraSettings (ref), isCamEnabledForUserAndPlaceModule (ref), getCamMicPermissionsModule (ref), default (ref), cameraDevicePermissionGrantedSignalModule (ref), var83 (ref), fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (ref), var52 (ref), showAntiHarassmentSettings (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), playerChoiceTranslationSettingInitializerModule (ref), cachedPolicyServiceModule (ref), var90_1 (ref), fFlagBadgeVisibilitySettingEnabled (ref), fFlagEnableModerateChatRemoteEvent (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getHasGuiHidingPermissionModule (ref), fFlagIEMSettingsGroupsModule (ref), renderSettingsHeaderModule (write), renderSettingsDividerModule (write), migration (ref), builderIconsModule (ref), enableTFFeedbackModeEntryCheck (ref), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (ref), experienceLanguageSwitcherInitializerModule (ref), getLastValueChangerFrame (ref), fFlagIEMTabFocusNav (ref), getFirstValueChangerFrame (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFFlagChatTranslationHoldoutEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), textChatServiceSettingsSavedEngineFeature (ref), getFFlagChatTranslationForceSettingModule (ref), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (ref)
	if IGMEnableGFXReset then
		gfxResetModule.RunGfxReset()
	end
	local gameSettingsTab = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		gameSettingsTab.LanguageSwitcherInitialized = false
	end
	local var125 = false
	local t_7 = {}
	
	local function _()
		-- upvalues: VRService (copy), t_7 (ref)
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function()
		-- upvalues: VRService (copy), var125 (write), t_7 (ref)
		if VRService.VREnabled and var125 then
			local VREnabled = VRService.VREnabled
			
			for i, v in pairs(t_7) do
				i.Visible = not VREnabled
			end
		end
	end)
	local function createGraphicsOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), rbxAnalyticsService (copy), constantsModule (copy), gameBasicSettingsFramerateCapEngineFeature (copy), VRService (copy), eraseFPSFromDefaultSetting (copy), robloxTranslatorModule (copy), IGMEnableGFXReset (copy), gfxResetModule (copy), romarkStartWithGraphicQualityLevelFastInt (copy), t (copy)
		local var176, var177, var178 = utilityModule:AddNewRow(gameSettingsTab, "Fullscreen", "Selector", { "On", "Off" }, if not gameSettings:InFullScreen() then 2 else 1)
		gameSettingsTab.FullscreenFrame = var176
		gameSettingsTab.FullscreenLabel = var177
		gameSettingsTab.FullscreenEnabler = var178
		gameSettingsTab.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t_7[gameSettingsTab.FullscreenFrame] = true
		gameSettingsTab.FullscreenEnabler.IndexChanged:connect(function(p7)
			-- upvalues: gameSettings (copy), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), gameSettingsTab (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var192 = gameSettings:InFullScreen()
			
			if p7 == 1 then
				if not gameSettings:InFullScreen() then
					guiService:ToggleFullscreen()
					
					if not getFFlagFixCyclicFullscreenIndexEventModule() then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 1 then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p7 == 2 and gameSettings:InFullScreen() then
				guiService:ToggleFullscreen()
				
				if not getFFlagFixCyclicFullscreenIndexEventModule() then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 2 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				end
			end
			spawn(function()
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), var192 (ref), gameSettings (copy), reportSettingsForAnalytics (copy)
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", var192, gameSettings:InFullScreen())
				end
				reportSettingsForAnalytics()
			end)
		end)
		gameSettings.FullscreenChanged:connect(function(p8)
			-- upvalues: gameSettingsTab (copy), rbxAnalyticsService (copy), constantsModule (copy)
			if p8 then
				if gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
			end
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsFullscreenModeName, { enabled = p8 })
		end)
		local var179 = gameSettingsTab
		local var180, var181, var182 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then 2 else 1)
		gameSettingsTab.GraphicsEnablerFrame = var180
		gameSettingsTab.GraphicsEnablerLabel = var181
		var179.GraphicsQualityEnabler = var182
		gameSettingsTab.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame
		local var183 = gameSettingsTab
		local var184, var185, var186 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Quality", "Slider", 10, 1)
		gameSettingsTab.GraphicsQualityFrame = var184
		gameSettingsTab.GraphicsQualityLabel = var185
		var183.GraphicsQualitySlider = var186
		gameSettingsTab.GraphicsQualityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsQualityFrame
		gameSettingsTab.GraphicsQualitySlider:SetMinStep(1)
		
		if gameBasicSettingsFramerateCapEngineFeature and not VRService.VREnabled then
			local cloned = table.clone(constantsModule.FramerateCaps)
			local list = {
				if eraseFPSFromDefaultSetting then robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.Default") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", { Frames = gameSettings:GetDefaultFramerateCap() })
			}
			
			for i, v in cloned do
				table.insert(list, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", { Frames = v }))
			end
			table.insert(cloned, 1, -1)
			task.defer(function()
				-- upvalues: gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), list (ref), cloned (ref), gameSettings (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local var193, var194, var195 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", list, table.find(cloned, gameSettings.FramerateCap), nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				gameSettingsTab.FramerateCapFrame = var193
				gameSettingsTab.FramerateCapLabel = var194
				gameSettingsTab.FramerateCapMode = var195
				gameSettingsTab.FramerateCapFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FramerateCap
				gameSettingsTab.FramerateCapMode.IndexChanged:Connect(function(p9)
					-- upvalues: gameSettings (copy), cloned (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
					local framerateCap = gameSettings.FramerateCap
					gameSettings.FramerateCap = cloned[p9]
					
					if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						reportSettingsChangeForAnalytics("framerate_cap", framerateCap, gameSettings.FramerateCap)
					end
					reportSettingsForAnalytics()
				end)
			end)
		end
		settings().Rendering.EnableFRM = true
		
		function SetGraphicsQuality(value, p10)
			-- upvalues: IGMEnableGFXReset (copy), gfxResetModule (copy), gameSettings (copy)
			if IGMEnableGFXReset then
				local var196, var197 = gfxResetModule.TemporaryOverride(value)
				
				if var196 then
					settings().Rendering.QualityLevel = var197
					
					return
				end
			end
			local floored = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * (value / 10))
			
			if floored == 20 then
				floored = 21
			elseif value == 1 then
				floored = 1
			elseif value < 1 and not p10 then
				value = 1
				floored = 1
			elseif settings().Rendering:GetMaxQualityLevel() < floored then
				floored = settings().Rendering:GetMaxQualityLevel() - 1
			end
			gameSettings.SavedQualityLevel = value
			settings().Rendering.QualityLevel = floored
		end
		
		local function _()
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
			gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
			gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		end
		
		local function setGraphicsToManual(value)
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.GraphicsQualitySlider:SetZIndex(2)
			gameSettingsTab.GraphicsQualityLabel.ZIndex = 2
			gameSettingsTab.GraphicsQualitySlider:SetInteractable(true)
			
			if gameSettingsTab.GraphicsQualitySlider:GetValue() == value then
				SetGraphicsQuality(value)
				
				return
			end
			gameSettingsTab.GraphicsQualitySlider:SetValue(value)
		end
		
		local var190 = false
		gameSettingsTab.GraphicsQualitySlider.ValueChanged:connect(function(p11)
			-- upvalues: var190 (write), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p11)
			
			if var190 == true then
				reportSettingsForAnalytics()
			end
			var190 = true
		end)
		gameSettingsTab.GraphicsQualityEnabler.IndexChanged:connect(function(p12)
			-- upvalues: gameSettingsTab (copy), setGraphicsToManual (ref), reportSettingsForAnalytics (copy), reportSettingsChangeForAnalytics (copy)
			local t = {
				Automatic = { Name = "Automatic", Value = 1 },
				Manual = { Name = "Manual", Value = 2 }
			}
			local name = t.Automatic.Name
			local name_1 = t.Manual.Name
			
			if p12 == t.Automatic.Value then
				name = t.Manual.Name
				name_1 = t.Automatic.Name
				gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
				gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
				gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p12 == t.Manual.Value then
				setGraphicsToManual(gameSettingsTab.GraphicsQualitySlider:GetValue())
			end
			reportSettingsForAnalytics()
			reportSettingsChangeForAnalytics("gfx_mode", name, name_1)
		end)
		game.GraphicsQualityChangeRequest:Connect(function(p13)
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local value = gameSettingsTab.GraphicsQualitySlider:GetValue()
				gameSettingsTab.GraphicsQualitySlider:SetValue(if p13 then value + 1 else value - 1)
			end
		end)
		
		if romarkStartWithGraphicQualityLevelFastInt >= 0 then
			if romarkStartWithGraphicQualityLevelFastInt == 0 then
				gameSettingsTab.GraphicsQualityEnabler:SetSelectionIndex(1)
				gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
				gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
				gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			else
				gameSettingsTab.GraphicsQualityEnabler:SetSelectionIndex(2)
				setGraphicsToManual(romarkStartWithGraphicQualityLevelFastInt)
			end
		elseif gameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			gameSettingsTab.GraphicsQualitySlider:SetValue(5)
			gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
			gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
			gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		else
			local var191 = tostring(gameSettings.SavedQualityLevel)
			var191 = if t[var191] then t[var191] else 10
			SetGraphicsQuality(var191)
			spawn(function()
				-- upvalues: gameSettingsTab (copy), var191 (write)
				gameSettingsTab.GraphicsQualitySlider:SetValue(var191)
			end)
		end
	end
	
	local function createReducedMotionOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var201, var202, var203 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.ReducedMotion then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion"))
		gameSettingsTab.ReducedMotionFrame = var201
		gameSettingsTab.ReducedMotionLabel = var202
		gameSettingsTab.ReducedMotionMode = var203
		gameSettingsTab.ReducedMotionFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ReducedMotionFrame
		gameSettingsTab.ReducedMotionMode.IndexChanged:connect(function(p14)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local reducedMotion = gameSettings.ReducedMotion
			gameSettings.ReducedMotion = p14 == 1
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("reduced_motion", reducedMotion, gameSettings.ReducedMotion)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPlayerNamesEnabledOptions()
		-- upvalues: updateVisibilitySettingsCopy (copy), robloxTranslatorModule (copy), fFlagUpdatePeopleNamesSettingCopyModule (copy), gameSettings (copy), t_6 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local function _()
			-- upvalues: gameSettings (copy)
			return if gameSettings.PlayerNamesEnabled then 1 else 2
		end
		
		local var204, var205, var206 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.PlayerNamesEnabled then t_6.On else t_6.Off, nil, if fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		gameSettingsTab.PlayerNamesEnabledFrame = var204
		gameSettingsTab.playerNamesEnabledLabel = var205
		gameSettingsTab.playerNamesEnabledMode = var206
		gameSettingsTab.PlayerNamesEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PlayerNamesEnabledFrame
		gameSettingsTab.playerNamesEnabledMode.IndexChanged:connect(function(p15)
			-- upvalues: gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local playerNamesEnabled = gameSettings.PlayerNamesEnabled
			gameSettings.PlayerNamesEnabled = p15 == 1
			reportSettingsChangeForAnalytics("player_names_enabled", playerNamesEnabled, gameSettings.PlayerNamesEnabled)
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTransparencyOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var207, var208, var209 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(gameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque"))
		gameSettingsTab.PreferredTransparencyFrame = var207
		gameSettingsTab.PreferredTransparencyLabel = var208
		gameSettingsTab.PreferredTransparencySlider = var209
		gameSettingsTab.PreferredTransparencyFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTransparencyFrame
		gameSettingsTab.PreferredTransparencySlider.ValueChanged:connect(function(p16)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTransparency = gameSettings.PreferredTransparency
			gameSettings.PreferredTransparency = (10 - math.clamp(math.floor(p16), 0, 10)) / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_transparency", preferredTransparency, gameSettings.PreferredTransparency)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTextSizeOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local enumItems = Enum.PreferredTextSize:GetEnumItems()
		local var211, var212, var213 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, gameSettings.PreferredTextSize.Value - 1, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest"))
		gameSettingsTab.PreferredTextSizeFrame = var211
		gameSettingsTab.PreferredTextSizeLabel = var212
		gameSettingsTab.PreferredTextSizeSlider = var213
		gameSettingsTab.PreferredTextSizeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTextSizeFrame
		gameSettingsTab.PreferredTextSizeSlider.ValueChanged:connect(function(p17)
			-- upvalues: gameSettings (copy), enumItems (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTextSize = gameSettings.PreferredTextSize
			gameSettings.PreferredTextSize = enumItems[p17 + 1]
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_text_size", preferredTextSize, gameSettings.PreferredTextSize)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createUiNavigationKeyBindOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), userInputService (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t = { On = 1, Off = 2 }
		local var215, var216, var217 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.UiNavigationKeyBindEnabled then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}))
		gameSettingsTab.UiNavigationKeyBindEnabledFrame = var215
		gameSettingsTab.UiNavigationKeyBindEnabledLabel = var216
		gameSettingsTab.UiNavigationKeyBindEnabledMode = var217
		gameSettingsTab.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame
		gameSettingsTab.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p18)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local uiNavigationKeyBindEnabled = gameSettings.UiNavigationKeyBindEnabled
			gameSettings.UiNavigationKeyBindEnabled = p18 == 1
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("ui_navigation_key_bind_enabled", uiNavigationKeyBindEnabled, gameSettings.UiNavigationKeyBindEnabled)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _()
			-- upvalues: userInputService (copy), gameSettingsTab (copy), gameSettings (copy)
			local keyboardEnabled = userInputService.KeyboardEnabled
			
			if gameSettingsTab.UiNavigationKeyBindEnabledFrame then
				gameSettingsTab.UiNavigationKeyBindEnabledFrame.Visible = keyboardEnabled
				
				if keyboardEnabled then
					gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(if gameSettings.UiNavigationKeyBindEnabled then 1 else 2)
					
					return
				end
				gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(2)
				gameSettings.UiNavigationKeyBindEnabled = false
			end
		end
		
		local keyboardEnabled = userInputService.KeyboardEnabled
		
		if gameSettingsTab.UiNavigationKeyBindEnabledFrame then
			gameSettingsTab.UiNavigationKeyBindEnabledFrame.Visible = keyboardEnabled
			
			if keyboardEnabled then
				gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(if gameSettings.UiNavigationKeyBindEnabled then t.On else t.Off)
			else
				gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(t.Off)
				gameSettings.UiNavigationKeyBindEnabled = false
			end
		end
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: userInputService (copy), gameSettingsTab (copy), gameSettings (copy), t (ref)
			local keyboardEnabled = userInputService.KeyboardEnabled
			
			if gameSettingsTab.UiNavigationKeyBindEnabledFrame then
				gameSettingsTab.UiNavigationKeyBindEnabledFrame.Visible = keyboardEnabled
				
				if keyboardEnabled then
					gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(if gameSettings.UiNavigationKeyBindEnabled then t.On else t.Off)
					
					return
				end
				gameSettingsTab.UiNavigationKeyBindEnabledMode:SetSelectionIndex(t.Off)
				gameSettings.UiNavigationKeyBindEnabled = false
			end
		end)
	end
	
	local function createPerformanceStatsOptions()
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var218 = nil
		local var219 = nil
		local var220 = nil
		local var221 = nil
		gameSettingsTab.PerformanceStatsFrame = var218
		gameSettingsTab.PerformanceStatsLabel = var219
		gameSettingsTab.PerformanceStatsMode = var220
		gameSettingsTab.PerformanceStatsOverrideText = var221
		
		function GetDesiredPerformanceStatsIndex()
			-- upvalues: gameSettings (copy)
			return if gameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		local var222, var223, var224 = utilityModule:AddNewRow(gameSettingsTab, "Performance Stats", "Selector", { "On", "Off" }, GetDesiredPerformanceStatsIndex())
		gameSettingsTab.PerformanceStatsFrame = var222
		gameSettingsTab.PerformanceStatsLabel = var223
		gameSettingsTab.PerformanceStatsMode = var224
		gameSettingsTab.PerformanceStatsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PerformanceStatsFrame
		gameSettingsTab.PerformanceStatsOverrideText = create("TextLabel")({
			Name = "PerformanceStatsLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = themeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = themeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = if centerShiftLockOverride then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0),
			Position = if centerShiftLockOverride then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0),
			AnchorPoint = if centerShiftLockOverride then Vector2.new(1, 0.5) else nil,
			Parent = gameSettingsTab.PerformanceStatsFrame
		})
		gameSettingsTab.PerformanceStatsMode.IndexChanged:connect(function(p19)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var225 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.PerformanceStatsVisible else nil
			
			if p19 == 1 then
				gameSettings.PerformanceStatsVisible = true
			else
				gameSettings.PerformanceStatsVisible = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", var225, gameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		gameSettings.PerformanceStatsVisibleChanged:connect(function()
			-- upvalues: gameSettingsTab (copy)
			local var226 = GetDesiredPerformanceStatsIndex()
			
			if var226 ~= gameSettingsTab.PerformanceStatsMode.CurrentIndex then
				gameSettingsTab.PerformanceStatsMode:SetSelectionIndex(var226)
			end
		end)
	end
	
	local function createWebServerInformationRow()
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), microProfilerReadOnlyInformationLabel (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), touchEnabled (copy), create (copy), themeModule (copy)
		local var227, var228, var229 = utilityModule:AddNewRow(gameSettingsTab, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, if microProfilerReadOnlyInformationLabel then false else nil)
		gameSettingsTab.InformationFrame = var227
		gameSettingsTab.InformationLabel = var228
		gameSettingsTab.InformationTextBox = var229
		gameSettingsTab.InformationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.InformationFrame
		gameSettingsTab.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		
		if touchEnabled then
			gameSettingsTab.InformationText = create("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				BackgroundTransparency = 1,
				Visible = true,
				ZIndex = 2,
				Font = themeModule.font(Enum.Font.SourceSans),
				FontSize = themeModule.fontSize(Enum.FontSize.Size18),
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(0, 5, 0, 0),
				Parent = gameSettingsTab.InformationFrame
			})
		else
			gameSettingsTab.InformationText = create("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				BackgroundTransparency = 1,
				Visible = true,
				ZIndex = 2,
				Font = themeModule.font(Enum.Font.SourceSans),
				FontSize = themeModule.fontSize(Enum.FontSize.Size14),
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(1, -650, 0, 20),
				Parent = gameSettingsTab.InformationFrame
			})
		end
		return gameSettingsTab.InformationFrame, gameSettingsTab.InformationText
	end
	
	local function createMicroProfilerOptions()
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), createWebServerInformationRow (ref), var92 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), var91 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local var230 = nil
		local var231 = nil
		local var232 = nil
		local var233 = nil
		gameSettingsTab.MicroProfilerFrame = var230
		gameSettingsTab.MicroProfilerLabel = var231
		gameSettingsTab.MicroProfilerMode = var232
		gameSettingsTab.MicroProfilerOverrideText = var233
		
		local function _()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), createWebServerInformationRow (copy)
			local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
			
			if microProfilerWebServerPort == 0 then
				return false
			end
			local var242, var243 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var242
			gameSettingsTab.InformationText = var243
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
			
			return true
		end
		
		local function setMicroProfilerIndex(value)
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), var92 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), createWebServerInformationRow (copy), var91 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local function _()
				-- upvalues: gameSettings (copy), gameSettingsTab (copy)
				gameSettings.MicroProfilerWebServerEnabled = false
				
				if gameSettingsTab.InformationFrame or gameSettingsTab.InformationText then
					gameSettingsTab.InformationFrame.Visible = false
					gameSettingsTab.InformationFrame.Parent = nil
					gameSettingsTab.InformationText.Parent = nil
					gameSettingsTab.InformationFrame = nil
					gameSettingsTab.InformationText = nil
				end
			end
			
			local var244 = nil
			local onScreenProfilerEnabled = nil
			local onScreenProfilerEnabled_1 = nil
			
			if var92 then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var244 = "webserver"
					onScreenProfilerEnabled = gameSettings.MicroProfilerWebServerEnabled
				end
				if value == 1 then
					gameSettings.MicroProfilerWebServerEnabled = true
					local var245 = 30
					while var245 >= 1 do
						local var248
						local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
						
						if microProfilerWebServerPort == 0 then
							var248 = false
						else
							local var246, var247 = createWebServerInformationRow()
							gameSettingsTab.InformationFrame = var246
							gameSettingsTab.InformationText = var247
							gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
							var248 = true
						end
						if var248 then break end
						var245 -= 1
						wait(0.1)
					end
					if var245 <= 0 then
						gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
						gameSettings.MicroProfilerWebServerEnabled = false
						
						if gameSettingsTab.InformationFrame or gameSettingsTab.InformationText then
							gameSettingsTab.InformationFrame.Visible = false
							gameSettingsTab.InformationFrame.Parent = nil
							gameSettingsTab.InformationText.Parent = nil
							gameSettingsTab.InformationFrame = nil
							gameSettingsTab.InformationText = nil
						end
					end
				else
					gameSettings.MicroProfilerWebServerEnabled = false
					
					if gameSettingsTab.InformationFrame or gameSettingsTab.InformationText then
						gameSettingsTab.InformationFrame.Visible = false
						gameSettingsTab.InformationFrame.Parent = nil
						gameSettingsTab.InformationText.Parent = nil
						gameSettingsTab.InformationFrame = nil
						gameSettingsTab.InformationText = nil
					end
				end
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.MicroProfilerWebServerEnabled
				end
			elseif var91 or isInExperienceUIVREnabled and isSpatial() then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var244 = "regular"
					onScreenProfilerEnabled = gameSettings.OnScreenProfilerEnabled
				end
				gameSettings.OnScreenProfilerEnabled = value == 1
				
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.OnScreenProfilerEnabled
				end
			end
			rbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", onScreenProfilerEnabled, onScreenProfilerEnabled_1, { microprofiler_type = var244 })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function()
			-- upvalues: var92 (copy), gameSettings (copy), var91 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy)
			return if var92 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif not (not var91 and (not isInExperienceUIVREnabled or not isSpatial())) then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2
		end
		
		local var235 = gameSettingsTab
		local var236, var237, var238 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if var92 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif var91 or isInExperienceUIVREnabled and isSpatial() then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2)
		var235.MicroProfilerFrame = var236
		gameSettingsTab.MicroProfilerLabel = var237
		gameSettingsTab.MicroProfilerMode = var238
		gameSettingsTab.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame
		local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
		
		if microProfilerWebServerPort ~= 0 then
			local var239, var240 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var239
			gameSettingsTab.InformationText = var240
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
		end
		local var241 = false
		gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
			-- upvalues: var241 (write), gameSettings (copy), gameSettingsTab (copy)
			var241 = true
			
			if gameSettings.OnScreenProfilerEnabled then
				gameSettingsTab.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			end
			gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
		end)
		gameSettingsTab.MicroProfilerMode.IndexChanged:connect(function(...)
			-- upvalues: var241 (write), setMicroProfilerIndex (ref)
			if var241 then
				var241 = false
				
				return
			end
			setMicroProfilerIndex(...)
		end)
	end
	
	local function createCameraModeOptions(p20)
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), localPlayer (copy), userInputService (copy), coreUtilityModule (copy), t_3 (copy), VRService (copy), getFFlagAlwaysShowVRToggleModule (copy), getAppFeaturePolicies (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var60 (copy), t_2 (copy), t_1 (copy)
		local var249 = nil
		local var250 = nil
		local var251 = nil
		local var252 = nil
		gameSettingsTab.ShiftLockFrame = var249
		gameSettingsTab.ShiftLockLabel = var250
		gameSettingsTab.ShiftLockMode = var251
		gameSettingsTab.ShiftLockOverrideText = var252
		local var253, var254, var255 = utilityModule:AddNewRow(gameSettingsTab, "Shift Lock Switch", "Selector", { "On", "Off" }, if gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		gameSettingsTab.ShiftLockFrame = var253
		gameSettingsTab.ShiftLockLabel = var254
		gameSettingsTab.ShiftLockMode = var255
		gameSettingsTab.ShiftLockFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ShiftLockFrame
		t_7[gameSettingsTab.ShiftLockFrame] = true
		gameSettingsTab.ShiftLockOverrideText = create("TextLabel")({
			Name = "ShiftLockOverrideLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = themeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = themeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = if centerShiftLockOverride then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0),
			Position = if centerShiftLockOverride then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0),
			AnchorPoint = if centerShiftLockOverride then Vector2.new(1, 0.5) else nil,
			Parent = gameSettingsTab.ShiftLockFrame
		})
		gameSettingsTab.ShiftLockMode.IndexChanged:connect(function(p21)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var290 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p21 == 1 then
				gameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				gameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", var290, gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _(value)
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local devEnableMouseLock = value and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		
		local _ = function()
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local var292 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var292
				local devEnableMouseLock = not var292 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end
		
		local _ = function()
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var295 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var295
				local devEnableMouseLock = not var295 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end
		
		local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
		
		if gameSettingsTab.ShiftLockFrame then
			gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
		end
		local var257 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var257
			local devEnableMouseLock = not var257 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		userInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(function()
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var298 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var298
				local devEnableMouseLock = not var298 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var301 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var301
				local devEnableMouseLock = not var301 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		
		function cameraModeIsUserChoice()
			-- upvalues: userInputService (copy), localPlayer (copy)
			return if userInputService.PreferredInput == Enum.PreferredInput.Touch then localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		
		function setCameraModeVisible(value)
			-- upvalues: gameSettingsTab (copy)
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode.SelectorFrame.Visible = value
				gameSettingsTab.CameraMode:SetInteractable(value)
				gameSettingsTab.CameraModeOverrideText.Visible = not value
			end
		end
		
		local playerScripts = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
		local t = {}
		local t_4 = {}
		
		local function updateCurrentCameraMovementIndex(p22)
			-- upvalues: t_4 (write), t (write), userInputService (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy)
			local var303 = nil
			
			if not pcall(function()
				-- upvalues: var303 (write), t_4 (copy), t (copy), p22 (ref)
				var303 = t_4[t[p22]]
			end) or var303 == nil then
				return false
			end
			local var304
			local _ = nil
			local value = nil
			
			if userInputService.PreferredInput == Enum.PreferredInput.Touch then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					value = gameSettings.TouchCameraMovementMode.Value
				end
				var304 = gameSettings.TouchCameraMovementMode.Value ~= var303
				gameSettings.TouchCameraMovementMode = var303
			elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				value = gameSettings.ComputerCameraMovementMode.Value
			end
			var304 = gameSettings.ComputerCameraMovementMode.Value ~= var303
			gameSettings.ComputerCameraMovementMode = var303
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and var304 then
				reportSettingsChangeForAnalytics("camera_mode", value, var303)
			end
			return var304
		end
		
		local function updateCameraMovementModes()
			-- upvalues: playerScripts (ref), userInputService (copy), t (write), t_4 (write), t_3 (copy), gameSettingsTab (copy), gameSettings (copy), updateCurrentCameraMovementIndex (ref)
			local var305 = if playerScripts then if userInputService.PreferredInput == Enum.PreferredInput.Touch then playerScripts:GetRegisteredTouchCameraMovementModes() else playerScripts:GetRegisteredComputerCameraMovementModes() else {}
			t = {}
			t_4 = {}
			
			if #var305 <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #var305 do
				local var306 = var305[i]
				local name = var306.Name
				
				if name == "Default" then
					name = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_3.DEFAULT_FOLLOW else t_3.DEFAULT_CLASSIC
				end
				t[#t + 1] = name
				t_4[name] = var306.Value
			end
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode:UpdateOptions(t)
			end
			local _ = -1
			local var307 = userInputService.PreferredInput == Enum.PreferredInput.Touch
			local var308 = if var307 then gameSettings.TouchCameraMovementMode.Value else gameSettings.ComputerCameraMovementMode.Value
			
			if var308 > -1 then
				if var307 or gameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					var308 += 1
				end
				updateCurrentCameraMovementIndex(var308)
				gameSettingsTab.CameraMode:SetSelectionIndex(var308)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		local var264 = gameSettingsTab
		local var265 = gameSettingsTab
		local var266 = gameSettingsTab
		local var267, var268, var269 = utilityModule:AddNewRow(gameSettingsTab, "Camera Mode", "Selector", t, 1)
		var264.CameraModeFrame = var267
		var265.CameraModeLabel = var268
		var266.CameraMode = var269
		gameSettingsTab.CameraModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraModeFrame
		t_7[gameSettingsTab.CameraMode] = true
		gameSettingsTab.CameraModeOverrideText = create("TextLabel")({
			Name = "CameraDevOverrideLabel",
			Text = "Set by Developer",
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
			TextColor3 = Color3.new(1, 1, 1),
			Font = themeModule.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = themeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
			Size = UDim2.new(0.6, 0, 1, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Parent = gameSettingsTab.CameraModeFrame
		})
		
		if playerScripts then
			playerScripts.TouchCameraMovementModeRegistered:connect(function(_)
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.TouchEnabled then
					updateCameraMovementModes()
				end
			end)
			playerScripts.ComputerCameraMovementModeRegistered:connect(function(_)
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.MouseEnabled then
					updateCameraMovementModes()
				end
			end)
		end
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: updateCameraMovementModes (ref)
			updateCameraMovementModes()
		end)
		local t_6 = false
		gameSettingsTab.CameraMode.IndexChanged:connect(function(p23)
			-- upvalues: updateCurrentCameraMovementIndex (ref), t_6 (write), reportSettingsForAnalytics (copy)
			if updateCurrentCameraMovementIndex(p23) then
				if t_6 then
					reportSettingsForAnalytics()
				end
				t_6 = true
			end
		end)
		updateCameraMovementModes()
		local var271 = false
		
		t = function()
			-- upvalues: var271 (write), gameSettings (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not var271 then
				var271 = true
				local var309 = if gameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				local var310, var311, var312 = utilityModule:AddNewRow(gameSettingsTab, "VR", "Selector", var309, if gameSettings.VREnabled then 1 else 2)
				gameSettingsTab.VREnabledFrame = var310
				gameSettingsTab.VREnabledLabel = var311
				gameSettingsTab.VREnabledSelector = var312
				gameSettingsTab.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				gameSettingsTab.VREnabledSelector.IndexChanged:connect(function(p24)
					-- upvalues: gameSettings (copy), var309 (write), reportSettingsChangeForAnalytics (copy)
					local t = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local var314 = p24 == t.On.Value
					
					if gameSettings.VREnabled ~= var314 then
						gameSettings.VREnabled = var314
						local value = var309[t.On.Value]
						local var315 = var309[p24]
						
						if var315 == var309[t.On.Value] then
							value = var309[t.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", value, var315)
					end
				end)
			end
		end
		
		t_4 = function()
			-- upvalues: VRService (copy), gameSettings (copy), t (ref)
			if VRService.VREnabled then
				gameSettings.HasEverUsedVR = true
				t()
				
				return
			elseif gameSettings.HasEverUsedVR then
				t()
			end
		end
		
		if getFFlagAlwaysShowVRToggleModule() and getAppFeaturePolicies().getIsLinkedVRModeAvailable() then
			t()
		elseif VRService.VREnabled then
			gameSettings.HasEverUsedVR = true
			t()
		elseif gameSettings.HasEverUsedVR then
			t()
		end
		VRService:GetPropertyChangedSignal("VREnabled"):connect(t_4)
		local t_8 = {}
		local t_9 = {}
		t_6 = {}
		local t_10 = {}
		
		local var275 = function(_) end
		
		local _ = function(value)
			-- upvalues: gameSettingsTab (copy), t_8 (write)
			if gameSettingsTab.MovementMode then
				local var316 = value and #t_8 > 0
				gameSettingsTab.MovementMode.SelectorFrame.Visible = var316
				gameSettingsTab.MovementMode:SetInteractable(var316)
				gameSettingsTab.MovementModeOverrideText.Visible = not var316
			end
		end
		
		if p20 then
			local t_11 = {}
			local playerScripts_1 = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
			
			local _ = function(p25)
				-- upvalues: userInputService (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var60 (copy)
				local var317 = p25
				
				if p25 == "Default" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey)
					end
					var317 = t_5.DEFAULT_KEYBOARD
					
					return var317
				elseif p25 == "KeyboardMouse" then
					var317 = "Keyboard + Mouse"
					
					return var317
				elseif p25 == "ClickToMove" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return t_5.TAP_TO_MOVE
					end
					var317 = t_5.CLICK_TO_MOVE
					
					return var317
				elseif p25 == "DynamicThumbstick" then
					var317 = "Dynamic Thumbstick"
					
					return var317
				elseif p25 == "Thumbstick" then
					var317 = var60
				end
				return var317
			end
			
			local var278, var279, var280 = utilityModule:AddNewRow(gameSettingsTab, "Movement Mode", "Selector", t_11, 1)
			gameSettingsTab.MovementModeFrame = var278
			gameSettingsTab.MovementModeLabel = var279
			gameSettingsTab.MovementMode = var280
			gameSettingsTab.MovementModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MovementModeFrame
			t_7[gameSettingsTab.MovementMode] = true
			gameSettingsTab.MovementModeOverrideText = create("TextLabel")({
				Name = "MovementDevOverrideLabel",
				Text = "Set by Developer",
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 2,
				TextColor3 = Color3.new(1, 1, 1),
				Font = themeModule.font(Enum.Font.SourceSans, "GameSettings"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size24, "GameSettings"),
				Size = UDim2.new(0.6, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Parent = gameSettingsTab.MovementModeFrame
			})
			
			local function setMovementMode(value)
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy)
				local computerMovementMode = nil
				
				if value.EnumType == Enum.TouchMovementMode then
					if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						computerMovementMode = gameSettings.TouchMovementMode
					end
					gameSettings.TouchMovementMode = value
				elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					computerMovementMode = gameSettings.ComputerMovementMode
				end
				gameSettings.ComputerMovementMode = value
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("movement_mode", computerMovementMode, value)
				end
			end
			
			var275 = function(p26)
				-- upvalues: localPlayer (copy), gameSettingsTab (copy), t_8 (write)
				local var318
				local _ = nil
				
				if p26 then
					var318 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					var318 = nil
				else
					var318 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if gameSettingsTab.MovementMode then
					local var319 = var318 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var319
					gameSettingsTab.MovementMode:SetInteractable(var319)
					gameSettingsTab.MovementModeOverrideText.Visible = not var319
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var318
				end
			end
			
			local function updateMovementModes()
				-- upvalues: userInputService (copy), playerScripts_1 (ref), t_8 (write), t_9 (write), t_6 (write), t_10 (write), gameSettingsTab (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var60 (copy), gameSettings (copy), setMovementMode (ref), var275 (write)
				local var320 = userInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if playerScripts_1 then
					t_8 = if var320 then playerScripts_1:GetRegisteredTouchMovementModes() else playerScripts_1:GetRegisteredComputerMovementModes()
				end
				t_9 = {}
				t_6 = {}
				t_10 = {}
				
				if #t_8 <= 0 then
					if gameSettingsTab.MovementMode then
						gameSettingsTab.MovementMode.SelectorFrame.Visible = false
						gameSettingsTab.MovementMode:SetInteractable(false)
						gameSettingsTab.MovementModeOverrideText.Visible = true
					end
					return
				elseif gameSettingsTab.MovementMode then
					local var321 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var321
					gameSettingsTab.MovementMode:SetInteractable(var321)
					gameSettingsTab.MovementModeOverrideText.Visible = not var321
				end
				for i, v in t_8 do
					t_6[i] = v
					local var323 = t_10
					local name = v.Name
					local var324 = name
					
					if name == "Default" then
						var324 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else t_5.DEFAULT_KEYBOARD
					elseif name == "KeyboardMouse" then
						var324 = "Keyboard + Mouse"
					elseif name == "ClickToMove" then
						var324 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_5.TAP_TO_MOVE else t_5.CLICK_TO_MOVE
					elseif name == "DynamicThumbstick" then
						var324 = "Dynamic Thumbstick"
					elseif name == "Thumbstick" then
						var324 = var60
					end
					var323[i] = var324
					t_9[v] = i
				end
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode:UpdateOptions(t_10)
				end
				local var322 = if var320 then gameSettings.TouchMovementMode else gameSettings.ComputerMovementMode
				
				if var322 then
					setMovementMode(var322)
					gameSettingsTab.MovementMode:SetSelectionIndex(t_9[var322])
				end
				var275(var320)
			end
			
			updateMovementModes()
			
			if playerScripts_1 then
				playerScripts_1.TouchMovementModeRegistered:connect(function(_)
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.TouchEnabled then
						updateMovementModes()
					end
				end)
				playerScripts_1.ComputerMovementModeRegistered:connect(function(_)
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.MouseEnabled then
						updateMovementModes()
					end
				end)
			end
			userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
				-- upvalues: updateMovementModes (ref)
				updateMovementModes()
			end)
			gameSettingsTab.MovementMode.IndexChanged:connect(function(p27)
				-- upvalues: setMovementMode (ref), t_6 (write), reportSettingsForAnalytics (copy)
				setMovementMode(t_6[p27])
				reportSettingsForAnalytics()
			end)
		end
		local var284
		local _ = false
		local var283 = userInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if var283 then
			var284 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			var284 = nil
		else
			var284 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if var284 then
			gameSettingsTab.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			gameSettingsTab.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local var285
		local _ = false
		
		if var283 then
			var285 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
			var285 = nil
		else
			var285 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if gameSettingsTab.MovementModeOverrideText then
			if var285 then
				gameSettingsTab.MovementModeOverrideText.Visible = false
				
				if gameSettingsTab.MovementMode then
					local var286 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var286
					gameSettingsTab.MovementMode:SetInteractable(var286)
					gameSettingsTab.MovementModeOverrideText.Visible = not var286
				end
			else
				gameSettingsTab.MovementModeOverrideText.Visible = true
				
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode.SelectorFrame.Visible = false
					gameSettingsTab.MovementMode:SetInteractable(false)
					gameSettingsTab.MovementModeOverrideText.Visible = true
				end
			end
		end
		local var287 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var287
			local devEnableMouseLock = not var287 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(value)
			-- upvalues: localPlayer (copy), gameSettingsTab (copy), var275 (write), t_8 (write)
			if value == "DevEnableMouseLock" then
				local var325 = not localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockOverrideText then
					gameSettingsTab.ShiftLockOverrideText.Visible = var325
					local devEnableMouseLock = not var325 and localPlayer.DevEnableMouseLock
					
					if gameSettingsTab.ShiftLockMode then
						gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
						gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
						
						return
					end
				end
			elseif value == "DevComputerCameraMode" then
				local var327 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
				setCameraModeVisible(var327)
				gameSettingsTab.CameraModeOverrideText.Visible = not var327
				
				return
			elseif value == "DevComputerMovementMode" then
				if var275 ~= nil then
					var275(false)
					
					return
				end
				local var328 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var329 = var328 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var329
					gameSettingsTab.MovementMode:SetInteractable(var329)
					gameSettingsTab.MovementModeOverrideText.Visible = not var329
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var328
					
					return
				end
			elseif value == "DevTouchMovementMode" then
				if var275 ~= nil then
					var275(true)
					
					return
				end
				local var330 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var331 = var330 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var331
					gameSettingsTab.MovementMode:SetInteractable(var331)
					gameSettingsTab.MovementModeOverrideText.Visible = not var331
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var330
					
					return
				end
			elseif value == "DevTouchCameraMode" then
				local var332 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
				setCameraModeVisible(var332)
				gameSettingsTab.CameraModeOverrideText.Visible = not var332
			end
		end
		
		localPlayer.Changed:connect(function(p28)
			-- upvalues: t_2 (copy), updateUserSettingsMenu (ref), t_1 (copy)
			if t_2[p28] then
				updateUserSettingsMenu(p28)
			end
			if t_1[p28] then
				updateUserSettingsMenu(p28)
			end
		end)
	end
	
	local function createFeedbackModeOptions()
		-- upvalues: url (copy), httpService (copy), feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (ref), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var62 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), disableFeedbackSoothsayerCheck (copy), name (copy)
		local text = url.ROLES_URL .. "v1/users/authenticated/roles"
		local var334 = httpService:RequestInternal({ Method = "GET", Url = text })
		
		local function rolesCheckCallback(p29)
			-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var62 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p29 then
				if not feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
				local var339, var340
				local function onToggleFeedbackMode()
					-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy)
					if feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
					gameSettingsTab.HubRef:PopMenu(false, true)
					
					if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
						safetyService.IsCaptureModeForReport = false
					end
					if var17 ~= nil then
						var17:ToggleCaptureMode()
					end
					reportSettingsChangeForAnalytics("translation_feedback", "", "pressed")
				end
				
				local _ = nil
				local _ = nil
				
				if feedbackEntryPointButtonSizeAdjustment2 then
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var62, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var339 = toggleFeedbackModeButton
					var340 = toggleFeedbackModeButton_1
					var339.Size = UDim2.new(0.6, 0, 0, 40)
					var339.Position = UDim2.new(0.4, 0, 0.5, 0)
					var339.AnchorPoint = Vector2.new(0, 0.5)
				else
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var62, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var339 = toggleFeedbackModeButton
					var340 = toggleFeedbackModeButton_1
					var339.Size = UDim2.new(0, 300, 0, 30)
					var339.Position = UDim2.new(0.4, 0, 0.5, 0)
					var339.AnchorPoint = Vector2.new(0, 0.5)
				end
				var339.ZIndex = 2
				var339.Selectable = true
				var340.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					gameSettingsTab.toggleFeedbackModeButton = var339
					gameSettingsTab.toggleFeedbackModeText = var340
				end
				if feedbackEntryPointButtonSizeAdjustment2 then
					utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var339, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
					
					return
				end
				utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var339).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end
		
		if disableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		end
		var334:Start(function(p30, p31)
			-- upvalues: httpService (copy), name (copy), text (ref), rolesCheckCallback (ref)
			local var345
			local var343 = false
			local var344 = false
			local _ = nil
			
			if not p30 then
				var345 = "Roles Api Request: Connection error"
			elseif p31.StatusCode == 401 then
				var345 = "Roles Api Request: Unauthorized"
			elseif p31.StatusCode < 200 or p31.StatusCode >= 400 then
				var345 = "Roles Api Status code: " .. p31.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p31 (ref), var343 (write)
					for i, v in pairs(httpService:JSONDecode(p31.Body).roles) do
						if v == "Soothsayer" then
							var343 = true
						end
					end
				end)
				var344 = ok
				var345 = status
			end
			if not var344 then
				name:warning("Feedback Mode initialization api call failed with url: " .. text .. " and with error message: " .. var345)
			end
			rolesCheckCallback(var343)
		end)
	end
	
	local function createTranslationOptions()
		-- upvalues: playersService (copy), url (copy), httpService (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), localPlayer (copy), reportSettingsChangeForAnalytics (copy), runService (copy)
		local var346 = 1
		local var347 = 1
		local var348 = false
		local var349 = nil
		local var350 = nil
		local localeId = playersService.LocalPlayer.LocaleId
		local var351 = nil
		local var352 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
		local var359 = httpService:RequestInternal({ Method = "GET", Url = text })
		local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local var361 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
		local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local var363 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
		local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local var365 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
		
		local function userExperienceLanguageSettingsCallback(value, p32)
			-- upvalues: name (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_4 (ref), t_2 (ref), var349 (write), t (ref), var352 (write), t_1 (ref), var346 (write), var347 (write), localPlayer (copy), var350 (write), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var348 (write), runService (copy)
			if value then
				local var370 = false
				table.insert(t_4, t_2[var349].languageName .. " (Original)")
				
				for i, v in pairs(t) do
					if v == var352 then
						var370 = true
					end
					if v ~= var349 then
						table.insert(t_4, t_2[v].languageName)
					end
				end
				if var370 == true then
					for i_1, v_1 in pairs(t_4) do
						if i_1 ~= 1 and t_1[v_1] == var352 then
							var346 = i_1
							var347 = i_1
						end
					end
				end
				local var371, var372, var373 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_4, var346)
				gameSettingsTab.LanguageSelectorFrame = var371
				gameSettingsTab.LanguageSelectorLabel = var372
				gameSettingsTab.LanguageSelectorMode = var373
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				
				if var346 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var350)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[var346]]].localeCode)
				end
				gameSettingsTab.LanguageSelectorMode.CurrentLanguage = gameSettingsTab.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				gameSettingsTab.LanguageSelectorMode.IndexChanged:connect(function(p33)
					-- upvalues: gameSettingsTab (copy), t_2 (copy), var349 (copy), t_1 (copy), t_4 (copy), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var347 (copy), localPlayer (copy), var350 (copy), name (copy), var348 (copy), runService (copy)
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					local var374 = if p33 == 1 then t_2[var349].id else t_2[t_1[t_4[p33]]].id
					local currentLanguage = gameSettingsTab.LanguageSelectorMode.CurrentLanguage
					local var375 = t_4[p33]
					
					if currentLanguage ~= var375 then
						gameSettingsTab.LanguageSelectorMode.CurrentLanguage = var375
						reportSettingsChangeForAnalytics("experience_language", currentLanguage, var375)
					end
					local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local var377 = httpService:RequestInternal({
						Method = "POST",
						Url = text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = httpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = var374 }
						})
					})
					
					local function callback(p34, p35)
						-- upvalues: var347 (copy), p33 (ref), localPlayer (copy), var350 (copy), t_1 (copy), t_4 (copy), t_2 (copy), name (copy), var348 (copy), gameSettingsTab (copy)
						if p34 then
							var347 = p33
							
							if p33 == 1 then
								localPlayer:SetExperienceSettingsLocaleId(var350)
							else
								localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p33]]].localeCode)
							end
						else
							name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p35)
							var348 = true
							gameSettingsTab.LanguageSelectorMode:SetSelectionIndex(var347)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
					end
					
					if runService:IsStudio() then
						var347 = p33
						
						if p33 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var350)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p33]]].localeCode)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
						
						return
					elseif not var348 then
						var377:Start(function(p36, p37)
							-- upvalues: name (copy), text (ref), callback (ref)
							local var379 = false
							local text_1 = nil
							
							if not p36 then
								text_1 = "User Experience Language Settings Update Request: Connection error"
							elseif p37.StatusCode == 401 then
								text_1 = "User Experience Language Settings Update Request: Unauthorized"
							elseif p37.StatusCode < 200 or p37.StatusCode >= 400 then
								text_1 = "User Experience Language Settings Update Request Status Code: " .. p37.StatusCode
							else
								name:info("User Experience Language Settings Update Request succeeded with code: " .. p37.StatusCode)
								var379 = true
							end
							if not var379 then
								name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. text_1)
							end
							callback(var379, text_1)
						end)
						
						return
					end
					var348 = false
					var347 = p33
					
					if p33 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var350)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p33]]].localeCode)
					end
					gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
				end)
				
				return
			elseif p32 == nil then
				p32 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p32)
			local var367, var368, var369 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var367
			gameSettingsTab.LanguageSelectorLabel = var368
			gameSettingsTab.LanguageSelectorMode = var369
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local function _(p38, p39)
			-- upvalues: var365 (ref), httpService (copy), var352 (write), var351 (write), var349 (write), t_3 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p38 then
				var365:Start(function(p40, p41)
					-- upvalues: httpService (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
					local var386
					local var385 = false
					local _ = nil
					
					if not p40 then
						var386 = "User Experience Language Setting Request: Connection error"
					elseif p41.StatusCode == 401 then
						var386 = "User Experience Language Setting Request: Unauthorized"
					elseif p41.StatusCode < 200 or p41.StatusCode >= 400 then
						var386 = "User Experience Language Setting Request Status code: " .. p41.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p41 (ref), var352 (copy), var351 (copy), var349 (copy), t_3 (copy)
							local userUniverseLocalizationSettingValue = httpService:JSONDecode(p41.Body).userUniverseLocalizationSettingValue
							
							if userUniverseLocalizationSettingValue == nil then
								var352 = var351
								
								return
							elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
								var352 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var349 else var351
							end
							if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
								if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
									var352 = var351
									
									return
								end
								var352 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
							end
						end)
						var385 = ok
						var386 = status
					end
					if not var385 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
					end
					userExperienceLanguageSettingsCallback(var385, var386)
				end)
				
				return
			end
			local var381 = p39
			
			if var381 == nil then
				var381 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var381)
			local var382, var383, var384 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var382
			gameSettingsTab.LanguageSelectorLabel = var383
			gameSettingsTab.LanguageSelectorMode = var384
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local _ = function(p42, p43)
			-- upvalues: var363 (ref), httpService (copy), t (ref), name (copy), text_2 (ref), var365 (ref), var352 (write), var351 (write), var349 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p42 then
				var363:Start(function(p44, p45)
					-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p43 (write), p42 (ref), var365 (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var392
					local var391 = false
					local _ = nil
					
					if not p44 then
						var392 = "Experience Supported Language Request: Connection error"
					elseif p45.StatusCode == 401 then
						var392 = "Experience Supported Language Request: Unauthorized"
					elseif p45.StatusCode < 200 or p45.StatusCode >= 400 then
						var392 = "Experience Supported Language Request Status code: " .. p45.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p45 (ref), t (copy)
							for i, v in pairs(httpService:JSONDecode(p45.Body).data) do
								t[i] = v.languageCode
							end
						end)
						var391 = ok
						var392 = status
					end
					if not var391 then
						name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
					end
					if p43 == nil then
						p43 = var392
					end
					local var393 = p43
					
					if var391 and p42 then
						var365:Start(function(p46, p47)
							-- upvalues: httpService (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
							local var386
							local var385 = false
							local _ = nil
							
							if not p46 then
								var386 = "User Experience Language Setting Request: Connection error"
							elseif p47.StatusCode == 401 then
								var386 = "User Experience Language Setting Request: Unauthorized"
							elseif p47.StatusCode < 200 or p47.StatusCode >= 400 then
								var386 = "User Experience Language Setting Request Status code: " .. p47.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p47 (ref), var352 (copy), var351 (copy), var349 (copy), t_3 (copy)
									local userUniverseLocalizationSettingValue = httpService:JSONDecode(p47.Body).userUniverseLocalizationSettingValue
									
									if userUniverseLocalizationSettingValue == nil then
										var352 = var351
										
										return
									elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
										var352 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var349 else var351
									end
									if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
										if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
											var352 = var351
											
											return
										end
										var352 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
									end
								end)
								var385 = ok
								var386 = status
							end
							if not var385 then
								name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
							end
							userExperienceLanguageSettingsCallback(var385, var386)
						end)
						
						return
					end
					local var394 = var393
					
					if var394 == nil then
						var394 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
					local var395, var396, var397 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
					gameSettingsTab.LanguageSelectorFrame = var395
					gameSettingsTab.LanguageSelectorLabel = var396
					gameSettingsTab.LanguageSelectorMode = var397
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				end)
			else
				local var387 = p43
				
				if var387 == nil then
					var387 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var387)
				local var388, var389, var390 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var388
				gameSettingsTab.LanguageSelectorLabel = var389
				gameSettingsTab.LanguageSelectorMode = var390
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p48, p49)
			-- upvalues: var361 (ref), httpService (copy), var349 (write), var350 (write), t_2 (ref), name (copy), text_1 (ref), var363 (ref), t (ref), text_2 (ref), var365 (ref), var352 (write), var351 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p48 then
				var361:Start(function(p50, p51)
					-- upvalues: httpService (copy), var349 (copy), var350 (copy), t_2 (copy), name (copy), text_1 (copy), p49 (write), p48 (ref), var363 (copy), t (copy), text_2 (copy), var365 (copy), var352 (copy), var351 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var403
					local var402 = false
					local _ = nil
					
					if not p50 then
						var403 = "Experience Source Language Request: Connection error"
					elseif p51.StatusCode == 401 then
						var403 = "Experience Source Language Request: Unauthorized"
					elseif p51.StatusCode < 200 or p51.StatusCode >= 400 then
						var403 = "Experience Source Language Status code: " .. p51.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p51 (ref), var349 (copy), var350 (copy), t_2 (copy)
							var349 = httpService:JSONDecode(p51.Body).languageCode
							var350 = t_2[var349].localeCode
						end)
						var402 = ok
						var403 = status
					end
					if not var402 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var403)
					end
					if p49 == nil then
						p49 = var403
					end
					local p48_1 = var402 and p48
					local var405 = p49
					
					if p48_1 then
						var363:Start(function(p52, p53)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), var405 (write), p48_1 (ref), var365 (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var392
							local var391 = false
							local _ = nil
							
							if not p52 then
								var392 = "Experience Supported Language Request: Connection error"
							elseif p53.StatusCode == 401 then
								var392 = "Experience Supported Language Request: Unauthorized"
							elseif p53.StatusCode < 200 or p53.StatusCode >= 400 then
								var392 = "Experience Supported Language Request Status code: " .. p53.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p53 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p53.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var391 = ok
								var392 = status
							end
							if not var391 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
							end
							if p43 == nil then
								p43 = var392
							end
							if var391 and p48_1 then
								var365:Start(function(p54, p55)
									-- upvalues: httpService (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var386
									local var385 = false
									local _ = nil
									
									if not p54 then
										var386 = "User Experience Language Setting Request: Connection error"
									elseif p55.StatusCode == 401 then
										var386 = "User Experience Language Setting Request: Unauthorized"
									elseif p55.StatusCode < 200 or p55.StatusCode >= 400 then
										var386 = "User Experience Language Setting Request Status code: " .. p55.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p55 (ref), var352 (copy), var351 (copy), var349 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p55.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var352 = var351
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var352 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var349 else var351
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var352 = var351
													
													return
												end
												var352 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var385 = ok
										var386 = status
									end
									if not var385 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
									end
									userExperienceLanguageSettingsCallback(var385, var386)
								end)
								
								return
							end
							local var394 = p43
							
							if var394 == nil then
								var394 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
							local var395, var396, var397 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var395
							gameSettingsTab.LanguageSelectorLabel = var396
							gameSettingsTab.LanguageSelectorMode = var397
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var406 = var405
						
						if var406 == nil then
							var406 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var406)
						local var407, var408, var409 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var407
						gameSettingsTab.LanguageSelectorLabel = var408
						gameSettingsTab.LanguageSelectorMode = var409
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var398 = p49
				
				if var398 == nil then
					var398 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var398)
				local var399, var400, var401 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var399
				gameSettingsTab.LanguageSelectorLabel = var400
				gameSettingsTab.LanguageSelectorMode = var401
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		var359:Start(function(p56, p57)
			-- upvalues: httpService (copy), t_2 (ref), t_3 (ref), t_1 (ref), localeId (ref), var351 (write), name (copy), text (ref), var361 (ref), var349 (write), var350 (write), text_1 (ref), var363 (ref), t (ref), text_2 (ref), var365 (ref), var352 (write), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local var411
			local var410 = false
			local _ = nil
			
			if not p56 then
				var411 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p57.StatusCode == 401 then
				var411 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p57.StatusCode < 200 or p57.StatusCode >= 400 then
				var411 = "Locale Code to Language Code Mapping Request Status code: " .. p57.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p57 (ref), t_2 (copy), t_3 (copy), t_1 (copy), localeId (copy), var351 (copy)
					for i, v in pairs(httpService:JSONDecode(p57.Body).data) do
						local languageCode = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id
						t_2[languageCode] = { localeCode = locale, languageName = name, id = id }
						t_3[id] = languageCode
						t_1[name] = languageCode
						
						if v.locale.locale == localeId:gsub("-", "_") then
							var351 = v.locale.language.languageCode
						end
					end
				end)
				var410 = ok
				var411 = status
			end
			if not var410 then
				name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var411)
			end
			local var412 = var411
			
			if var410 then
				var361:Start(function(p58, p59)
					-- upvalues: httpService (copy), var349 (copy), var350 (copy), t_2 (copy), name (copy), text_1 (copy), var412 (write), var410 (ref), var363 (copy), t (copy), text_2 (copy), var365 (copy), var352 (copy), var351 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var403
					local var402 = false
					local _ = nil
					
					if not p58 then
						var403 = "Experience Source Language Request: Connection error"
					elseif p59.StatusCode == 401 then
						var403 = "Experience Source Language Request: Unauthorized"
					elseif p59.StatusCode < 200 or p59.StatusCode >= 400 then
						var403 = "Experience Source Language Status code: " .. p59.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p59 (ref), var349 (copy), var350 (copy), t_2 (copy)
							var349 = httpService:JSONDecode(p59.Body).languageCode
							var350 = t_2[var349].localeCode
						end)
						var402 = ok
						var403 = status
					end
					if not var402 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var403)
					end
					if p49 == nil then
						p49 = var403
					end
					local p48_1 = var402 and var410
					
					if p48_1 then
						var363:Start(function(p60, p61)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p49 (write), p48_1 (ref), var365 (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var61 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var392
							local var391 = false
							local _ = nil
							
							if not p60 then
								var392 = "Experience Supported Language Request: Connection error"
							elseif p61.StatusCode == 401 then
								var392 = "Experience Supported Language Request: Unauthorized"
							elseif p61.StatusCode < 200 or p61.StatusCode >= 400 then
								var392 = "Experience Supported Language Request Status code: " .. p61.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p61 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p61.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var391 = ok
								var392 = status
							end
							if not var391 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
							end
							if p43 == nil then
								p43 = var392
							end
							if var391 and p48_1 then
								var365:Start(function(p62, p63)
									-- upvalues: httpService (copy), var352 (copy), var351 (copy), var349 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var386
									local var385 = false
									local _ = nil
									
									if not p62 then
										var386 = "User Experience Language Setting Request: Connection error"
									elseif p63.StatusCode == 401 then
										var386 = "User Experience Language Setting Request: Unauthorized"
									elseif p63.StatusCode < 200 or p63.StatusCode >= 400 then
										var386 = "User Experience Language Setting Request Status code: " .. p63.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p63 (ref), var352 (copy), var351 (copy), var349 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p63.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var352 = var351
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var352 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var349 else var351
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var352 = var351
													
													return
												end
												var352 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var385 = ok
										var386 = status
									end
									if not var385 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
									end
									userExperienceLanguageSettingsCallback(var385, var386)
								end)
								
								return
							end
							local var394 = p43
							
							if var394 == nil then
								var394 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
							local var395, var396, var397 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var395
							gameSettingsTab.LanguageSelectorLabel = var396
							gameSettingsTab.LanguageSelectorMode = var397
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var406 = p49
						
						if var406 == nil then
							var406 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var406)
						local var407, var408, var409 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var407
						gameSettingsTab.LanguageSelectorLabel = var408
						gameSettingsTab.LanguageSelectorMode = var409
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var413 = var412
				
				if var413 == nil then
					var413 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var413)
				local var414, var415, var416 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var61 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var414
				gameSettingsTab.LanguageSelectorLabel = var415
				gameSettingsTab.LanguageSelectorMode = var416
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end)
	end
	
	local function getChatTranslationLayerData(p64)
		-- upvalues: getFFlagChatTranslationWaitForIXPModule (copy), IXPServiceWrapper (copy), getFFlagChatTranslationNewDefaultsModule (copy)
		local t = {
			ChatTranslationEnabled = false,
			ChatTranslationToggleEnabled = false
		}
		
		if not p64 or p64 == "" then
			return t
		elseif p64 == "override" then
			t.ChatTranslationEnabled = true
			
			return t
		elseif getFFlagChatTranslationWaitForIXPModule() then
			IXPServiceWrapper:WaitForInitialization()
		end
		local ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), p64 (ref)
			return IXPServiceWrapper:GetLayerData(p64)
		end)
		
		if ok then
			if getFFlagChatTranslationNewDefaultsModule() then
				t.ChatTranslationEnabled = status.ChatTranslationEnabled or true
				t.ChatTranslationToggleEnabled = status.ChatTranslationToggleEnabled or false
				
				return t
			end
			t.ChatTranslationEnabled = status.chatTranslationEnabled or false
			t.ChatTranslationToggleEnabled = status.chatTranslationToggleEnabled or false
		end
		return t
	end
	
	local function createVolumeOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), fFlagRenameVolumeToMainVolumeModule (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var418, var419, var420 = utilityModule:AddNewRow(gameSettingsTab, if fFlagRenameVolumeToMainVolumeModule then robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume") else "Volume", "Slider", 10, math.floor(gameSettings.MasterVolume * 10))
		gameSettingsTab.VolumeFrame = var418
		gameSettingsTab.VolumeLabel = var419
		gameSettingsTab.VolumeSlider = var420
		gameSettingsTab.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame
		local volumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		volumeChangeSound.Name = "VolumeChangeSound"
		volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		gameSettingsTab.VolumeSlider.ValueChanged:connect(function(p65)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), volumeChangeSound (ref), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var422 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.MasterVolume * 10 + 0.5) else nil
			local var423 = p65 / 10
			volumeChangeSound.Volume = var423
			volumeChangeSound:Play()
			gameSettings.MasterVolume = var423
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", var422, math.floor(gameSettings.MasterVolume * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default_3 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.PartyVoiceVolume * 10)
		local var425, var426, var427 = utilityModule:AddNewRow(gameSettingsTab, "Party Voice Volume", "Slider", 10, floored)
		gameSettingsTab.PartyVoiceVolumeFrame = var425
		gameSettingsTab.PartyVoiceVolumeLabel = var426
		gameSettingsTab.PartyVoiceVolumeSlider = var427
		gameSettingsTab.PartyVoiceVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PartyVoiceVolumeFrame
		
		if getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty() then
			gameSettingsTab.PartyVoiceVolumeFrame.Visible = default_3.hasExperienceStarted
			default_3.ExperienceJoined.Event:Connect(function()
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = true
			end)
			default_3.ExperienceLeft.Event:Connect(function()
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = false
			end)
		end
		gameSettingsTab.PartyVoiceVolumeSlider.ValueChanged:connect(function(p66)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), floored (ref), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var428 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then if floored ~= nil then 0 else math.floor(floored * 10 + 0.5) else nil
			gameSettings.PartyVoiceVolume = p66 / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", var428, math.floor(p66 * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createVoiceChatVolumeOptions()
		-- upvalues: gameSettings (copy), var20 (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.VoiceChatVolume * 5 + 0.5)
		local ok, status = pcall(function()
			-- upvalues: var20 (copy)
			return var20:Format("CoreScripts.InGameMenu.GameSettings.VoiceChatVolume")
		end)
		
		if not ok then
			status = "Voice Chat Volume"
			name:debug("[GameSettings] createVoiceChatVolumeOptions failed to get translation for Voice Chat Volume label, using placeholder text instead")
		end
		local var430, var431, var432 = utilityModule:AddNewRow(gameSettingsTab, status, "Slider", 10, floored)
		gameSettingsTab.VoiceChatVolumeFrame = var430
		gameSettingsTab.VoiceChatVolumeLabel = var431
		gameSettingsTab.VoiceChatVolumeSlider = var432
		gameSettingsTab.VoiceChatVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceChatVolumeFrame
		gameSettingsTab.VoiceChatVolumeFrame.Visible = false
		
		if voiceVolumeControlsDisableInteractionWhenNoMasterVolume then
			local function updateVoiceChatVolumeSliderInteractable(p67)
				-- upvalues: gameSettings (copy), gameSettingsTab (copy)
				local var434
				if p67 == nil then
					var434 = gameSettings.MasterVolume == 0
				else
					var434 = p67 == 0
					var434 = nil
				end
				if var434 then
					gameSettingsTab.VoiceChatVolumeSlider:SetZIndex(1)
					gameSettingsTab.VoiceChatVolumeLabel.ZIndex = 1
					gameSettingsTab.VoiceChatVolumeSlider:SetInteractable(false)
					
					return
				end
				gameSettingsTab.VoiceChatVolumeSlider:SetZIndex(2)
				gameSettingsTab.VoiceChatVolumeLabel.ZIndex = 2
				gameSettingsTab.VoiceChatVolumeSlider:SetInteractable(true)
			end
			
			updateVoiceChatVolumeSliderInteractable()
			gameSettingsTab.VolumeSlider.ValueChanged:connect(updateVoiceChatVolumeSliderInteractable)
		end
		gameSettingsTab.VoiceChatVolumeSlider.ValueChanged:connect(function(p68)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), gameSettingsTab (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var435 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.VoiceChatVolume * 5 + 0.5) else nil
			gameSettings.VoiceChatVolume = p68 / 5
			
			if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil then
				gameSettingsTab.maxVoiceChatVolumeDuringSession = math.max(gameSettingsTab.maxVoiceChatVolumeDuringSession, gameSettings.VoiceChatVolume)
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("voice_chat_volume", var435, math.floor(gameSettings.VoiceChatVolume * 5 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle()
		-- upvalues: gameSettings (copy), getAppFeaturePolicies (copy), var20 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var436, var437, var438 = utilityModule:AddNewRow(gameSettingsTab, if getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() then var20:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if gameSettings.HapticStrength == 0 then 1 else 2)
		gameSettingsTab.HapticsFrame = var436
		_ = var437
		gameSettingsTab.HapticsSelector = var438
		gameSettingsTab.HapticsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.HapticsFrame
		gameSettingsTab.HapticsSelector.IndexChanged:connect(function(p69)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local hapticStrength = gameSettings.HapticStrength
			
			if p69 == 2 then
				gameSettings.HapticStrength = 1
			else
				gameSettings.HapticStrength = 0
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("haptics_toggle", hapticStrength, gameSettings.HapticStrength)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createCameraInvertedOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var439 = 1
		
		if pcall(function()
			-- upvalues: gameSettings (copy), var439 (write)
			if gameSettings.CameraYInverted == true then
				var439 = 2
			end
		end) == false then
			return
		end
		local var440, var441, var442 = utilityModule:AddNewRow(gameSettingsTab, "Camera Inverted", "Selector", { "Off", "On" }, var439)
		gameSettingsTab.CameraInvertedFrame = var440
		_ = var441
		gameSettingsTab.CameraInvertedSelector = var442
		gameSettingsTab.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t_7[gameSettingsTab.CameraInvertedFrame] = true
		gameSettingsTab.CameraInvertedSelector.IndexChanged:connect(function(p70)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var443 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.CameraYInverted else nil
			
			if p70 == 2 then
				gameSettings.CameraYInverted = true
			else
				gameSettings.CameraYInverted = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("camera_y_inverted", var443, gameSettings.CameraYInverted)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function setCameraSensitivity(value)
		-- upvalues: userInputService (copy), gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var444 = nil
		local x = nil
		
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var444 = "gamepad"
				x = gameSettings.GamepadCameraSensitivity
			end
			gameSettings.GamepadCameraSensitivity = value
		end
		if userInputService.MouseEnabled then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var444 = "mouse"
				x = gameSettings.MouseSensitivityFirstPerson.X
			end
			local vector2 = Vector2.new(value, value)
			gameSettings.MouseSensitivityFirstPerson = vector2
			gameSettings.MouseSensitivityThirdPerson = vector2
		end
		if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(x) == "number" and typeof(value) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", x)), tonumber(string.format("%.2f", value)), { sensitivity_type = var444 })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), setCameraSensitivity (ref)
		local function _(p71)
			return if p71 <= 0.2 then 0 else p71 <= 1 and math.floor((p71 - 0.2) / 0.16 + 0.5) or math.floor((p71 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p72)
			local var452 = if p72 <= 5 then 0.16 * p72 + 0.2 else 0.6 * p72 - 2
			
			return if var452 <= 0.2 then 0.2 else var452
		end
		
		local mouseSensitivity = gameSettings.MouseSensitivity
		local var446 = if mouseSensitivity <= 0.2 then 0 else mouseSensitivity <= 1 and math.floor((mouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((mouseSensitivity + 2) / 0.6 + 0.5)
		local var447 = true
		local _ = tostring(gameSettings.MouseSensitivityFirstPerson.X)
		local var448, var449, var450 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, var446)
		gameSettingsTab.MouseAdvancedFrame = var448
		gameSettingsTab.MouseAdvancedLabel = var449
		gameSettingsTab.MouseAdvancedEntry = var450
		gameSettingsTab.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
		t_7[gameSettingsTab.MouseAdvancedFrame] = true
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		gameSettingsTab.MouseAdvancedLabel.ZIndex = 2
		gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
		local var451 = create("TextBox")({
			Name = "CameraSensitivityTextBox",
			ZIndex = 3,
			Selectable = false,
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			BorderColor3 = Color3.new(0.8, 0.8, 0.8),
			BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
			Font = themeModule.font(Enum.Font.SourceSans),
			TextSize = themeModule.textSize(18),
			Size = UDim2.new(0, 60, 0.8, 0),
			Position = UDim2.new(1, 10, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Parent = gameSettingsTab.MouseAdvancedEntry.SliderFrame
		})
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var451
		})
		
		local _ = function(value)
			-- upvalues: var451 (ref)
			var451.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
		end
		
		var451.Text = tostring(tonumber(string.format("%.3f", math.floor(gameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))
		local x = gameSettings.MouseSensitivityFirstPerson.X
		gameSettingsTab.MouseAdvancedEntry:SetValue(if x <= 0.2 then 0 else x <= 1 and math.floor((x - 0.2) / 0.16 + 0.5) or math.floor((x + 2) / 0.6 + 0.5))
		
		function clampMouseSensitivity(value)
			if value < 0 then
				value = -value
			end
			if value > 100 then
				value = 100
				
				return value
			elseif value < 0.001 then
				value = 0.001
			end
			return value
		end
		
		function setMouseSensitivity(value, p73)
			-- upvalues: var447 (write), setCameraSensitivity (copy), gameSettingsTab (copy), var451 (ref)
			if not var447 then return end
			setCameraSensitivity(value)
			var447 = false
			
			if p73 ~= gameSettingsTab.MouseAdvancedEntry then
				gameSettingsTab.MouseAdvancedEntry:SetValue(if value <= 0.2 then 0 else value <= 1 and math.floor((value - 0.2) / 0.16 + 0.5) or math.floor((value + 2) / 0.6 + 0.5))
			end
			var451.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
			var447 = true
		end
		
		var451.FocusLost:connect(function()
			-- upvalues: gameSettingsTab (copy), var451 (ref), gameSettings (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
			local var453 = tonumber(string.match(var451.Text, "([%d%.]+)"))
			
			if var453 then
				setMouseSensitivity(clampMouseSensitivity(var453), var451)
				
				return
			end
			setMouseSensitivity(gameSettings.MouseSensitivityFirstPerson.X, var451)
		end)
		var451.Focused:connect(function()
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(false)
		end)
		gameSettingsTab.MouseAdvancedEntry.ValueChanged:connect(function(p74)
			-- upvalues: gameSettingsTab (copy)
			local var454 = clampMouseSensitivity(p74)
			local var455 = if var454 <= 5 then 0.16 * var454 + 0.2 else 0.6 * var454 - 2
			setMouseSensitivity(if var455 <= 0.2 then 0.2 else var455, gameSettingsTab.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (ref)
		local function _(p75)
			return if p75 <= 0.2 then 0 else p75 <= 1 and math.floor((p75 - 0.2) / 0.16 + 0.5) or math.floor((p75 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p76)
			local var459 = if p76 <= 5 then 0.16 * p76 + 0.2 else 0.6 * p76 - 2
			
			return if var459 <= 0.2 then 0.2 else var459
		end
		
		local gamepadCameraSensitivity = gameSettings.GamepadCameraSensitivity
		local var456, var457, var458 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, if gamepadCameraSensitivity <= 0.2 then 0 else gamepadCameraSensitivity <= 1 and math.floor((gamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((gamepadCameraSensitivity + 2) / 0.6 + 0.5))
		gameSettingsTab.GamepadSensitivityFrame = var456
		gameSettingsTab.GamepadSensitivityLabel = var457
		gameSettingsTab.GamepadSensitivitySlider = var458
		gameSettingsTab.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		gameSettingsTab.GamepadSensitivitySlider.ValueChanged:connect(function(p77)
			-- upvalues: setCameraSensitivity (copy)
			local var460 = if p77 <= 5 then 0.16 * p77 + 0.2 else 0.6 * p77 - 2
			setCameraSensitivity(if var460 <= 0.2 then 0.2 else var460)
		end)
	end
	
	local function createOverscanOption()
		-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), runService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local adjustButton, adjustButton_1, adjustButton_2 = utilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function()
			-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			local _ = nil
			local var466 = require(robloxGui.Modules.Settings.Components.OverscanWrapper)(require(robloxGui.Modules.Shell.Components.Overscan10ft.Overscan))
			local roactModule = require(corePackagesService.Packages.Roact)
			local var468 = nil
			local t = {
				onUnmount = function()
					-- upvalues: var468 (write), roactModule (ref), contextActionService (copy), settingsHubModule (ref)
					if var468 then
						roactModule.unmount(var468)
						contextActionService:UnbindCoreAction("RbxStopOverscanMovement")
						settingsHubModule:SetVisibility(true, true)
					end
				end,
				ImageVisible = false,
				BackgroundTransparency = 0.2
			}
			settingsHubModule:SetVisibility(false, true)
			contextActionService:BindCoreAction("RbxStopOverscanMovement", function() end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			local _ = nil
			var468 = roactModule.mount(roactModule.createElement(var466, t), robloxGui, tostring(var466))
		end, gameSettingsTab)
		adjustButton_1.Font = themeModule.font(Enum.Font.SourceSans)
		adjustButton.Position = UDim2.new(1, -400, 0, 12)
		adjustButton.Size = UDim2.new(0, 300, 0, 40)
		adjustButton.Position = UDim2.new(1, -400, 0.5, 0)
		adjustButton.AnchorPoint = Vector2.new(0, 0.5)
		
		if runService:IsStudio() then
			adjustButton.Selectable = false
			adjustButton.Active = false
			adjustButton.Enabled.Value = false
			adjustButton_1.TextColor3 = Color3.fromRGB(100, 100, 100)
		end
		local var464 = utilityModule:AddNewRowObject(gameSettingsTab, "Safe Zone", adjustButton)
		var464.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
		adjustButton_2(var464)
	end
	
	local function createDeveloperConsoleOption()
		-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), runService (copy), playerPermissionsModule (copy), playersService (copy)
		local function makeDevConsoleOption()
			-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (copy), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local function onOpenDevConsole()
				-- upvalues: reportSettingsChangeForAnalytics (copy)
				local devConsoleMasterModule = require(script.Parent.Parent.Parent.DevConsoleMaster)
				
				if devConsoleMasterModule then
					devConsoleMasterModule:SetVisibility(true)
					local settingsHubModule = require(script.Parent.Parent.SettingsHub)
					
					if settingsHubModule then
						settingsHubModule:SetVisibility(false)
					end
					reportSettingsChangeForAnalytics("dev_console", "", "pressed")
				end
			end
			
			if fixDeveloperConsoleButtonSizeAndPositioning then
				local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), onOpenDevConsole, gameSettingsTab)
				devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
				devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
				devConsoleButton.Position = UDim2.new(0.4, 10, 0.5, 0)
				devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
				local var475 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton, nil, true)
				var475.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				devConsoleButton_2(var475)
				
				return
			end
			local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, gameSettingsTab)
			devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
			devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
			devConsoleButton.Position = UDim2.new(1, -400, 0.5, 0)
			devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
			local var479 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton)
			var479.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			devConsoleButton_2(var479)
		end
		
		if runService:IsStudio() then
			makeDevConsoleOption()
			
			return
		end
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), playersService (copy), makeDevConsoleOption (ref)
			if playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer) then
				makeDevConsoleOption()
			end
		end)
	end
	
	local function createUiToggleOptions()
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), guiService (copy), localPlayer (copy)
		if not userFreecamGuiDestabilization and not userShowGuiHideToggles then
			local var492, var493, var494 = utilityModule:AddNewRow(gameSettingsTab, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			gameSettingsTab.uiToggleRow = var492
			gameSettingsTab.uiToggleFrame = var493
			gameSettingsTab.uiToggleSelector = var494
			gameSettingsTab.uiToggleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiToggleRow
			gameSettingsTab.uiToggleSelector.IndexChanged:connect(function(_)
				-- upvalues: guiService (copy)
				guiService:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates)
			end)
			
			return
		end
		local list = {
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
		}
		local var483 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var484 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		gameSettingsTab.uiToggleSelectors = {}
		
		for i, v in list do
			local var488 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = v.label })
			local var489, var490, var491 = utilityModule:AddNewRow(gameSettingsTab, var488, "Selector", { var483, var484 }, 1)
			var489.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v.layoutOrderKey]
			var491.IndexChanged:Connect(function(p78)
				-- upvalues: guiService (copy), v (ref)
				if (if guiService:GetGuiIsVisible(v.type) then 1 else 2) ~= p78 then
					guiService:ToggleGuiIsVisibleIfAllowed(v.type)
				end
			end)
			gameSettingsTab.uiToggleSelectors[v.label] = {
				label = var488,
				type = v.type,
				row = var489,
				frame = var490,
				selector = var491
			}
		end
		local var485, var486, var487 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { var484, var483 }, 1)
		gameSettingsTab.freecamRow = var485
		gameSettingsTab.freecamFrame = var486
		gameSettingsTab.freecamSelector = var487
		gameSettingsTab.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
		gameSettingsTab.freecamSelector.IndexChanged:Connect(function(p79)
			-- upvalues: localPlayer (copy)
			local var495 = p79 == 2
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				freecamScript:SetAttribute("FreecamEnabled", var495)
				
				return
			end
			warn("Freecam not present")
		end)
	end
	
	local function updateUiToggleSelection()
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), gameSettingsTab (ref), guiService (copy), localPlayer (copy)
		if userFreecamGuiDestabilization or userShowGuiHideToggles then
			if not gameSettingsTab.uiToggleSelectors then return end
			for i, v in gameSettingsTab.uiToggleSelectors do
				local var498 = if guiService:GetGuiIsVisible(v.type) then 1 else 2
				
				if var498 ~= v.selector:GetSelectedIndex() then
					v.selector:SetSelectionIndex(var498)
				end
			end
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				gameSettingsTab.freecamSelector:SetSelectionIndex(if freecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not gameSettingsTab.uiToggleSelector then return end
		local var499 = if guiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if var499 == gameSettingsTab.uiToggleSelector:GetSelectedIndex() then return end
		gameSettingsTab.uiToggleSelector:SetSelectionIndex(var499)
	end
	
	local _ = function(p80, p81, p82)
		return p80 and (p81 and (p82 and (#p80 > 0 and (p82 > 0 and (p82 <= #p80 and #p80 == #p81)))))
	end
	
	local _ = function(p83, p84)
		-- upvalues: soundService (copy), name (copy)
		soundService:SetOutputDevice(p83, p84)
		name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", p83, p84)
	end
	
	local function createDeviceOptions(p85)
		-- upvalues: gameSettingsTab (ref), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFIntVoiceChatDeviceChangeDebounceDelayModule (copy), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
		local var500 = gameSettingsTab[p85 .. "DeviceIndex"] or 0
		local var501 = gameSettingsTab[p85 .. "DeviceNames"] or {}
		local var502 = gameSettingsTab[p85 .. "DeviceGuids"] or {}
		local var503 = p85 == "Input" and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local var504 = gameSettingsTab
		local text = p85 .. "DeviceFrame"
		local text_1 = p85 .. "DeviceSelector"
		local var507, var508, var509 = utilityModule:AddNewRow(gameSettingsTab, var503, "Selector", var501, var500)
		var504[text] = var507
		_ = var508
		gameSettingsTab[text_1] = var509
		gameSettingsTab[p85 .. "DeviceFrame"].LayoutOrder = if p85 == "Input" then SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput else SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		gameSettingsTab[p85 .. "DeviceInfo"] = {
			Name = if var500 > 0 then var501[var500] else nil,
			Guid = if var500 > 0 then var502[var500] else nil
		}
		gameSettingsTab[p85 .. "PrevDeviceName"] = gameSettingsTab[p85 .. "DeviceInfo"].Name
		local var510 = 0
		local var511 = getFIntVoiceChatDeviceChangeDebounceDelayModule()
		gameSettingsTab[p85 .. "DeviceSelector"].IndexChanged:connect(function(p86)
			-- upvalues: gameSettingsTab (copy), p85 (ref), var510 (write), var511 (ref), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab[p85 .. "DeviceInfo"].Name == gameSettingsTab[p85 .. "DeviceNames"][p86] and gameSettingsTab[p85 .. "DeviceInfo"].Guid == gameSettingsTab[p85 .. "DeviceGuids"][p86] then return end
			local var512 = var510 + 1
			var510 = var512
			wait(var511)
			
			if var512 == var510 then
				var510 = 0
				gameSettingsTab[p85 .. "DeviceInfo"] = {
					Name = gameSettingsTab[p85 .. "DeviceNames"][p86],
					Guid = gameSettingsTab[p85 .. "DeviceGuids"][p86]
				}
				local name_1 = gameSettingsTab[p85 .. "DeviceInfo"].Name
				local guid = gameSettingsTab[p85 .. "DeviceInfo"].Guid
				
				if gameSettingsTab.VoiceChatOptionsEnabled then
					default_2:SwitchDevice(p85, name_1, guid)
				else
					soundService:SetOutputDevice(name_1, guid)
					name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", name_1, guid)
				end
				if getFFlagEnableCrossExpVoice() then
					name:debug("[GameSettings] Changing {} device to {} {} ", p85, name_1, guid)
					
					if p85 == "Input" then
						default_3:changeInputDevice(name_1, guid)
					else
						default_3:changeOutputDevice(name_1, guid)
					end
				end
				reportSettingsChangeForAnalytics(p85, gameSettingsTab[p85 .. "PrevDeviceName"], name_1)
				gameSettingsTab[p85 .. "PrevDeviceName"] = name_1
			end
		end)
	end
	
	local _ = function()
		-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var513, var514, var515 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var513
			gameSettingsTab.badgeVisibleFrame = var514
			gameSettingsTab.badgeVisibleSelector = var515
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p87)
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p87 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p87 == 1)
			end)
		end)
	end
	
	local function createChatModerationOptions()
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), var20 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), signalsModule (copy), reportSettingsChangeForAnalytics (copy)
		local _ = {
			title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView",
			description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription",
			on = "InGame.CommonUI.Label.On",
			off = "InGame.CommonUI.Label.Off"
		}
		local var516, var517, var518 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			var20:Format("InGame.CommonUI.Label.Off"),
			var20:Format("InGame.CommonUI.Label.On")
		}, 1, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		gameSettingsTab.ChatModerationFrame = var516
		_ = var517
		gameSettingsTab.ChatModerationSelector = var518
		gameSettingsTab.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
		gameSettingsTab.ChatModerationFrame.Visible = false
		local chatModerationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		gameSettingsTab.ChatModerationDisposeEffect = signalsModule.createEffect(function(p88)
			-- upvalues: gameSettingsTab (copy), chatModerationStore (ref)
			gameSettingsTab.ChatModerationFrame.Visible = chatModerationStore.getIsSettingVisible(p88)
			local var520 = if chatModerationStore.getIsSettingEnabled(p88) then 2 else 1
			
			if gameSettingsTab.ChatModerationSelector:GetSelectedIndex() ~= var520 then
				gameSettingsTab.ChatModerationSelector:SetSelectionIndex(var520)
			end
		end)
		gameSettingsTab.ChatModerationSelector.IndexChanged:connect(function(p89)
			-- upvalues: chatModerationStore (ref), reportSettingsChangeForAnalytics (copy)
			local var521 = p89 == 2
			chatModerationStore.setIsSettingEnabled(var521)
			reportSettingsChangeForAnalytics("moderate_chat", not var521, var521)
		end)
		chatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceAIRephraseSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy), expChatDebounceRephraseIndexSelection (copy), throttleFunctionCallModule (copy)
		local var522, var523, var524 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription"))
		gameSettingsTab.AIRephraseFrame = var522
		_ = var523
		gameSettingsTab.AIRephraseSelector = var524
		gameSettingsTab.AIRephraseFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AIRephraseFrame
		gameSettingsTab.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local var526 = getFIntDebounceAIRephraseSettingDelayModule()
		local var527 = var526 > 0
		local var528 = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.AIRephraseDisposeEffect = signalsModule.createEffect(function(p90)
			-- upvalues: gameSettingsTab (copy), AIRephraseSettingStore (ref), var528 (write)
			gameSettingsTab.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p90)
			local var531 = if AIRephraseSettingStore.getIsSettingEnabled(p90) then 2 else 1
			
			if gameSettingsTab.AIRephraseSelector:GetSelectedIndex() ~= var531 then
				var528 = var531
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var531)
			end
		end)
		
		local var529 = function(p91)
			-- upvalues: var528 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p91 == var528 then
				return
			end
			local var532 = p91 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var532 (ref), AIRephraseSettingStore (copy), var528 (copy), p91 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var532 then "Enabled" else "Disabled") then
					AIRephraseSettingStore.setIsSettingEnabled(var532)
					var528 = p91
					reportSettingsChangeForAnalytics("ai_rephrase", not var532, var532)
					
					return
				end
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var528)
			end)
		end
		
		if not expChatDebounceRephraseIndexSelection then
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(if var527 then throttleFunctionCallModule(var526, var529) else var529)
		elseif var527 then
			local var530 = nil
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(function(p92)
				-- upvalues: var530 (write), var526 (ref), var528 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var530 then
					task.cancel(var530)
				end
				var530 = task.delay(var526, function()
					-- upvalues: var530 (copy), p92 (ref), var528 (copy), textChatService (copy), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var530 = nil
					
					if p92 == var528 then
						return
					end
					local var533 = p92 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var533 (ref), AIRephraseSettingStore (copy), var528 (copy), p92 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var533 then "Enabled" else "Disabled") then
							AIRephraseSettingStore.setIsSettingEnabled(var533)
							var528 = p92
							reportSettingsChangeForAnalytics("ai_rephrase", not var533, var533)
							
							return
						end
						gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var528)
					end)
				end)
			end)
		else
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(var529)
		end
	end
	
	local function createChatSummariesSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceChatSummariesSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy)
		local var534, var535, var536 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription"))
		gameSettingsTab.ChatSummariesFrame = var534
		_ = var535
		gameSettingsTab.ChatSummariesSelector = var536
		gameSettingsTab.ChatSummariesFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatSummariesFrame
		gameSettingsTab.ChatSummariesFrame.Visible = false
		local chatSummariesSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local var538 = getFIntDebounceChatSummariesSettingDelayModule()
		local var539 = var538 > 0
		local var540 = if chatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.ChatSummariesDisposeEffect = signalsModule.createEffect(function(p93)
			-- upvalues: gameSettingsTab (copy), chatSummariesSettingStore (ref), var540 (write)
			gameSettingsTab.ChatSummariesFrame.Visible = chatSummariesSettingStore.getIsSettingVisible(p93)
			local var543 = if chatSummariesSettingStore.getIsSettingEnabled(p93) then 2 else 1
			
			if gameSettingsTab.ChatSummariesSelector:GetSelectedIndex() ~= var543 then
				var540 = var543
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var543)
			end
		end)
		
		local var541 = function(p94)
			-- upvalues: var540 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p94 == var540 then
				return
			end
			local var544 = p94 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var544 (ref), chatSummariesSettingStore (copy), var540 (copy), p94 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var544 then "Enabled" else "Disabled") then
					chatSummariesSettingStore.setIsSettingEnabled(var544)
					var540 = p94
					reportSettingsChangeForAnalytics("chat_summaries", not var544, var544)
					
					return
				end
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var540)
			end)
		end
		
		if var539 then
			local var542 = nil
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(function(p95)
				-- upvalues: var542 (write), var538 (ref), var540 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var542 then
					task.cancel(var542)
				end
				var542 = task.delay(var538, function()
					-- upvalues: var542 (copy), p95 (ref), var540 (copy), textChatService (copy), chatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var542 = nil
					
					if p95 == var540 then
						return
					end
					local var545 = p95 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var545 (ref), chatSummariesSettingStore (copy), var540 (copy), p95 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var545 then "Enabled" else "Disabled") then
							chatSummariesSettingStore.setIsSettingEnabled(var545)
							var540 = p95
							reportSettingsChangeForAnalytics("chat_summaries", not var545, var545)
							
							return
						end
						gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var540)
					end)
				end)
			end)
		else
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(var541)
		end
	end
	
	local function createChatNotificationsSettingOptions()
		-- upvalues: corePackagesService (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
		local toastNotificationModule = require(corePackagesService.Workspace.Packages.ToastNotification)
		local default = toastNotificationModule.ToastNotificationSnoozeManager.default
		local notificationGroups = toastNotificationModule.NotificationGroups
		local toastNotificationTypeModule = toastNotificationModule.ToastNotificationTypeModule
		local notificationSnoozedSignal = toastNotificationModule.Signals.NotificationSnoozedSignal
		local notificationTypeEnum = toastNotificationTypeModule.NotificationTypeEnum
		local snoozeActionEnum = toastNotificationTypeModule.SnoozeActionEnum
		local t = { Off = 1, On = 2 }
		local var548 = robloxTranslatorModule:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications")
		local var549 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var550 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		
		local function _()
			-- upvalues: default (ref), notificationTypeEnum (ref)
			return if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then 1 else 2
		end
		
		local var551 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
		local var552, var553, var554 = utilityModule:AddNewRow(gameSettingsTab, var548, "Selector", { var550, var549 }, var551)
		gameSettingsTab.ChatNotificationsFrame = var552
		_ = var553
		gameSettingsTab.ChatNotificationsSelector = var554
		gameSettingsTab.ChatNotificationsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatNotificationsFrame
		gameSettingsTab.ChatNotificationsSelector.IndexChanged:connect(function(p96)
			-- upvalues: var551 (write), default (ref), notificationGroups (ref), reportSettingsChangeForAnalytics (copy)
			if p96 == var551 then return end
			local var555 = var551 == 2
			local var556 = p96 == 2
			var551 = p96
			
			if var556 then
				default:unmuteNotification({
					context = "InGameSettings",
					notificationType = notificationGroups.ChatLandingNotificationsGroup
				})
			else
				default:snoozeNotification({
					durationMinutes = -1,
					context = "InGameSettings",
					notificationType = notificationGroups.ChatLandingNotificationsGroup
				})
			end
			reportSettingsChangeForAnalytics("chat_notifications", var555, var556)
		end)
		notificationSnoozedSignal:connect(function(p97)
			-- upvalues: notificationTypeEnum (ref), snoozeActionEnum (ref), gameSettingsTab (copy), var551 (write)
			if p97.notificationType ~= notificationTypeEnum.ChatNewMessage then return end
			local var557 = if p97.actionType == snoozeActionEnum.Mute then 1 else 2
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var557 then
				var551 = var557
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var557)
			end
		end)
		gameSettingsTab.Displayed.Event:Connect(function()
			-- upvalues: default (ref), notificationTypeEnum (ref), t (ref), gameSettingsTab (copy), var551 (write)
			local var558 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var558 then
				var551 = var558
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var558)
			end
		end)
	end
	
	local function createCameraDeviceOptions()
		-- upvalues: gameSettingsTab (ref), var87 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
		local cameraDeviceIndex = gameSettingsTab.CameraDeviceIndex or 1
		local cameraDeviceNames = gameSettingsTab.CameraDeviceNames or {}
		local cameraDeviceGuids = gameSettingsTab.CameraDeviceGuids or {}
		local var562, var563, var564 = utilityModule:AddNewRow(gameSettingsTab, var87, "Selector", cameraDeviceNames, cameraDeviceIndex)
		gameSettingsTab.CameraDeviceFrame = var562
		_ = var563
		gameSettingsTab.CameraDeviceSelector = var564
		gameSettingsTab.CameraDeviceFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraDeviceFrame
		gameSettingsTab.CameraDeviceInfo = {
			Name = if cameraDeviceIndex > 0 then cameraDeviceNames[cameraDeviceIndex] else nil,
			Guid = if cameraDeviceIndex > 0 then cameraDeviceGuids[cameraDeviceIndex] else nil
		}
		gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		gameSettingsTab.CameraDeviceSelector.IndexChanged:connect(function(p98)
			-- upvalues: gameSettingsTab (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab.CameraDeviceInfo.Name == gameSettingsTab.CameraDeviceNames[p98] and gameSettingsTab.CameraDeviceInfo.Guid == gameSettingsTab.CameraDeviceGuids[p98] then
				return
			end
			gameSettingsTab.CameraDeviceInfo = {
				Name = gameSettingsTab.CameraDeviceNames[p98],
				Guid = gameSettingsTab.CameraDeviceGuids[p98]
			}
			local guid = gameSettingsTab.CameraDeviceInfo.Guid
			name:info("Changed webcam to: {}", guid)
			userGameSettingsService.DefaultCameraID = guid
			reportSettingsChangeForAnalytics("video_camera", gameSettingsTab.prevCameraDeviceName or "None", gameSettingsTab.CameraDeviceInfo.Name)
			gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		end)
	end
	
	local function updateAudioDevices(p99)
		-- upvalues: soundService (copy), var20 (copy), gameSettingsTab (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy), createDeviceOptions (ref)
		local ok, status, var565, var566 = pcall(function()
			-- upvalues: p99 (ref), soundService (copy)
			return if p99 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var565 and (var566 and (#status > 0 and (var566 > 0 and (var566 <= #status and #status == #var565)))))) then
			if var565[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p99 .. "DeviceNames"] = status
			gameSettingsTab[p99 .. "DeviceGuids"] = var565
			gameSettingsTab[p99 .. "DeviceIndex"] = var566
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} device info", p99)
		end
		gameSettingsTab[p99 .. "DeviceNames"] = {}
		gameSettingsTab[p99 .. "DeviceGuids"] = {}
		gameSettingsTab[p99 .. "DeviceIndex"] = 0
		if gameSettingsTab[p99 .. "DeviceSelector"] then
			gameSettingsTab[p99 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p99 .. "DeviceSelector"]:SetSelectionIndex(var566)
			
			return
		end
		createDeviceOptions(p99)
	end
	
	local function updateVoiceChatDevices(p100)
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), soundService (copy), var20 (copy), gameSettingsTab (ref), createDeviceOptions (ref)
		if p100 ~= "Input" and p100 ~= "Output" and getFFlagVoiceChatUILoggingModule() then
			name:warning("{} is not supported in VoiceChat devices", p100)
		end
		local ok, status, var567, var568 = pcall(function()
			-- upvalues: p100 (ref), soundService (copy)
			return if p100 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var567 and (var568 and (#status > 0 and (var568 > 0 and (var568 <= #status and #status == #var567)))))) then
			if var567[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p100 .. "DeviceNames"] = status
			gameSettingsTab[p100 .. "DeviceGuids"] = var567
			gameSettingsTab[p100 .. "DeviceIndex"] = var568
		elseif getFFlagVoiceChatUILoggingModule() then
			if #status > 0 then
				name:warning("Errors in get {} device info success: {}", p100, ok)
			else
				name:warning("Empty deviceNames list for {}", p100)
			end
		end
		gameSettingsTab[p100 .. "DeviceNames"] = {}
		gameSettingsTab[p100 .. "DeviceGuids"] = {}
		gameSettingsTab[p100 .. "DeviceIndex"] = 0
		if gameSettingsTab[p100 .. "DeviceSelector"] then
			gameSettingsTab[p100 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p100 .. "DeviceSelector"]:SetSelectionIndex(var568)
		else
			createDeviceOptions(p100)
		end
		if gameSettingsTab[p100 .. "DeviceFrame"] then
			if #status > 0 then
				gameSettingsTab[p100 .. "DeviceFrame"].Visible = true
				
				return
			end
			gameSettingsTab[p100 .. "DeviceFrame"].Visible = false
		end
	end
	
	local function updateCameraDevices()
		-- upvalues: videoCaptureService (copy), var86 (copy), userGameSettingsService (copy), gameSettingsTab (ref), createCameraDeviceOptions (ref)
		local cameraDevices = videoCaptureService:GetCameraDevices()
		local t = {}
		local t_1 = {}
		local var572 = 1
		table.insert(t, var86)
		table.insert(t_1, "{DefaultDeviceGuid}")
		
		for i, v in pairs(cameraDevices) do
			if i == userGameSettingsService.DefaultCameraID then
				var572 = #t + 1
			end
			table.insert(t, v)
			table.insert(t_1, i)
		end
		gameSettingsTab.CameraDeviceNames = t
		gameSettingsTab.CameraDeviceGuids = t_1
		gameSettingsTab.CameraDeviceIndex = 0
		
		if gameSettingsTab.CameraDeviceSelector then
			gameSettingsTab.CameraDeviceSelector:UpdateOptions(t)
		else
			createCameraDeviceOptions()
		end
		gameSettingsTab.CameraDeviceSelector:SetSelectionIndex(var572)
	end
	
	local var161 = nil
	local var162 = nil
	
	local function updateAudioOptions()
		-- upvalues: gameSettingsTab (ref), updateVoiceChatDevices (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), updateAudioDevices (ref)
		if gameSettingsTab.VoiceChatOptionsEnabled then
			updateVoiceChatDevices("Input")
			updateVoiceChatDevices("Output")
			
			return
		elseif getFFlagEnableCrossExpVoice() and default_3:getIsConnected() then
			updateAudioDevices("Input")
		end
		updateAudioDevices("Output")
	end
	
	local _ = function()
		-- upvalues: soundService (copy), var161 (write), gameSettingsTab (ref), updateAudioOptions (ref)
		if soundService.DeviceListChanged then
			var161 = soundService.DeviceListChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var162 (write), gameSettingsTab (ref), updateCameraDevices (ref)
		if videoCaptureService.DevicesChanged then
			var162 = videoCaptureService.DevicesChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
				if gameSettingsTab.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: soundService (copy), var161 (write)
		if soundService.DeviceListChanged and var161 then
			var161:Disconnect()
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var162 (write)
		if videoCaptureService.DevicesChanged and var162 then
			var162:Disconnect()
			var162 = nil
		end
	end
	
	local _ = function()
		-- upvalues: default_2 (copy), gameSettingsTab (ref)
		if default_2:VoiceChatAvailable() then
			gameSettingsTab.VoiceChatOptionsEnabled = true
		end
	end
	
	local _ = function()
		-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy)
		local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
		
		if gameSettingsTab.InputDeviceFrame then
			gameSettingsTab.InputDeviceFrame.Visible = voiceChatOptionsEnabled
		end
	end
	
	local var164 = false
	local var165 = if differentiateVoiceSelectorSystemAndUser then false else nil
	
	local function createVoiceChatSelector()
		-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (ref), var20 (copy), default_2 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), differentiateVoiceSelectorSystemAndUser (copy), getFIntDebounceDisconnectButtonDelayModule (copy), var165 (write), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var164 (write), throttleFunctionCallModule (copy), voiceChatSelectorReconnectFocus2AEGIS2 (copy), guiService (copy), debounceVoiceSelectorIndexChange (copy), deferProgrammaticChange (copy)
		if voiceSelectorAvailableAfterFae and gameSettingsTab.VoiceConnectDisconnectFrame and gameSettingsTab.VoiceConnectDisconnectSelector then return end
		local var574 = var20:Format("Feature.GameDetails.Label.VoiceChat")
		local var575 = var20:Format("Feature.SettingsHub.Label.Disconnected")
		local var576 = var20:Format("Feature.SettingsHub.Label.Connected")
		local var577 = if default_2:VoiceChatEnded() then 1 else 2
		local var578 = gameSettingsTab
		local var579, var580, var581 = utilityModule:AddNewRow(gameSettingsTab, var574, "Selector", { var575, var576 }, var577)
		gameSettingsTab.VoiceConnectDisconnectFrame = var579
		_ = var580
		var578.VoiceConnectDisconnectSelector = var581
		gameSettingsTab.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectDisconnectSelector
		local service = default_2:getService()
		
		if service and not differentiateVoiceSelectorSystemAndUser then
			service.StateChanged:Connect(function(p101, p102)
				-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (copy), default_2 (copy)
				if voiceSelectorAvailableAfterFae then
					if p101 == p102 then return end
					if p102 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						
						return
					elseif (p102 == Enum.VoiceChatState.Ended or p102 == Enum.VoiceChatState.Failed or p102 == Enum.VoiceChatState.Idle) and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
						
						return
					end
				elseif p101 == p102 then return end
				if p102 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				elseif default_2:VoiceChatEnded() then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			end)
		end
		local var583 = var577
		local var584 = getFIntDebounceDisconnectButtonDelayModule()
		
		local var585 = function(p103)
			-- upvalues: var583 (write), differentiateVoiceSelectorSystemAndUser (copy), var165 (copy), fFlagVoiceRewarmTelemetry (copy), default_2 (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var164 (copy), gameSettingsTab (copy)
			if p103 == var583 then return end
			var583 = p103
			
			if differentiateVoiceSelectorSystemAndUser and var165 then return end
			if fFlagVoiceRewarmTelemetry then
				local var586, var587, var588, var589 = default_2:GetConnectDisconnectButtonAnalyticsData(p103 == 2)
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var586, var587, var588, var589, default_2.joinVoiceButtonContext)
			else
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(p103 == 2))
			end
			if p103 == 2 then
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			elseif voiceSelectorIgnoreFailedStateDisconnect then
				local service = default_2:getService()
				
				if not default_2:VoiceChatEnded() and not (service ~= nil and service.VoiceChatState == Enum.VoiceChatState.Failed) then
					default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
					default_2:Leave()
				end
			elseif not default_2:VoiceChatEnded() then
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			if var164 then
				task.spawn(function()
					-- upvalues: p103 (ref), gameSettingsTab (copy)
					task.wait(0.5)
					
					if p103 ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		gameSettingsTab.VoiceConnectDisconnectSelector.IndexChanged:connect(if var584 > 0 then throttleFunctionCallModule(var584, var585) else var585)
		
		if voiceChatSelectorReconnectFocus2AEGIS2 then
			gameSettingsTab.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p104, p105)
				-- upvalues: var574 (ref), gameSettingsTab (copy), guiService (copy)
				if p105 and p104 and (p104.Parent and p104.Parent.Name == var574 .. "Frame") and (p105.Name == "ImageButton" and gameSettingsTab.Active) then
					guiService.SelectedCoreObject = p104
				end
			end)
		end
		default_2:subscribe("OnStateChanged", function(_, p106)
			-- upvalues: differentiateVoiceSelectorSystemAndUser (copy), var165 (copy), debounceVoiceSelectorIndexChange (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			if differentiateVoiceSelectorSystemAndUser then
				var165 = true
				
				if debounceVoiceSelectorIndexChange then
					if p106 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					end
				elseif p106 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end
			if debounceVoiceSelectorIndexChange then
				if p106 == Enum.VoiceChatState.Failed and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			elseif p106 == Enum.VoiceChatState.Failed then
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end
			if differentiateVoiceSelectorSystemAndUser then
				if deferProgrammaticChange then
					task.defer(function()
						-- upvalues: var165 (copy)
						var165 = false
					end)
					
					return
				end
				var165 = false
			end
		end)
		default_2:subscribe("OnRequestMicPermissionRejected", function()
			-- upvalues: var164 (copy), differentiateVoiceSelectorSystemAndUser (copy), var165 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			task.spawn(function()
				-- upvalues: var164 (copy), differentiateVoiceSelectorSystemAndUser (copy), var165 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
				task.wait(0.5)
				var164 = true
				
				if differentiateVoiceSelectorSystemAndUser then
					var165 = true
				end
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if differentiateVoiceSelectorSystemAndUser then
					if deferProgrammaticChange then
						task.defer(function()
							-- upvalues: var165 (copy)
							var165 = false
						end)
						
						return
					end
					var165 = false
				end
			end)
		end)
	end
	
	local function createVoiceConnectDisconnect()
		-- upvalues: default_2 (copy), var20 (copy), getFIntDebounceDisconnectButtonDelayModule (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), utilityModule (copy), throttleFunctionCallModule (copy), gameSettingsTab (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy)
		if default_2:IsSeamlessVoice() and not default_2.isShowingFTUX then
			local _ = nil
			local _ = nil
			local _ = nil
			local _ = nil
			local var591 = var20:Format("Feature.GameDetails.Label.VoiceChat")
			local var592 = var20:Format("Feature.SettingsHub.Label.Connect")
			local var593 = var20:Format("Feature.SettingsHub.Label.Disconnect")
			local var594 = getFIntDebounceDisconnectButtonDelayModule()
			local var595 = var594 > 0
			
			local var596 = function()
				-- upvalues: default_2 (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy)
				local var610
				if default_2:getService() then
					var610 = nil
					var610 = default_2:getService().StateChanged:Connect(function(_, p107)
						-- upvalues: fFlagVoiceRewarmTelemetry (copy), default_2 (copy), var610 (write)
						if p107 == Enum.VoiceChatState.Joined then
							if fFlagVoiceRewarmTelemetry then
								local var614, var615, var616, var617 = default_2:GetConnectDisconnectButtonAnalyticsData(true)
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var614, var615, var616, var617, default_2.joinVoiceButtonContext)
							else
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							var610:Disconnect()
						end
					end)
				elseif fFlagVoiceRewarmTelemetry then
					var610, var611, var612, var613 = default_2:GetConnectDisconnectButtonAnalyticsData(false)
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var610, var611, var612, var613, default_2.joinVoiceButtonContext)
				else
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			end
			
			local var597 = function()
				-- upvalues: default_2 (copy), constantsModule_1 (copy)
				default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			
			local voiceConnectButton, voiceConnectButton_1, voiceConnectButton_2 = utilityModule:MakeStyledButton("VoiceConnectButton", var592, UDim2.new(1, 0, 1, -20), if var595 then throttleFunctionCallModule(var594, var596) else var596, gameSettingsTab)
			voiceConnectSetRowRef = voiceConnectButton_2
			local var601 = voiceConnectButton
			local var602 = voiceConnectButton_1
			local voiceDisconnectButton, voiceDisconnectButton_1, voiceDisconnectButton_2 = utilityModule:MakeStyledButton("VoiceDisconnectButton", var593, UDim2.new(1, 0, 1, -20), if var595 then throttleFunctionCallModule(var594, var597) else var597, gameSettingsTab)
			voiceDisconnectSetRowRef = voiceDisconnectButton_2
			local var606 = voiceDisconnectButton
			local var607 = voiceDisconnectButton_1
			var601.Size = UDim2.new(0.6, 0, 0, 40)
			var601.Position = UDim2.new(0.4, 0, 0.5, 0)
			var601.AnchorPoint = Vector2.new(0, 0.5)
			var601.ZIndex = 2
			var601.Selectable = true
			var602.ZIndex = 2
			var606.Size = UDim2.new(0.6, 0, 0, 40)
			var606.Position = UDim2.new(0.4, 0, 0.5, 0)
			var606.AnchorPoint = Vector2.new(0, 0.5)
			var606.ZIndex = 2
			var606.Selectable = true
			var607.ZIndex = 2
			local var608 = utilityModule:AddNewRowObject(gameSettingsTab, var591, var601, nil, true)
			local var609 = utilityModule:AddNewRowObject(gameSettingsTab, var591, var606, nil, true)
			gameSettingsTab.VoiceConnectFrame = var608
			gameSettingsTab.VoiceDisconnectFrame = var609
			var608.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			var609.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(var608)
			voiceDisconnectSetRowRef(var609)
			
			if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				var608.Visible = false
				var609.Visible = false
				
				return
			elseif default_2:ShouldShowJoinVoice() then
				var608.Visible = true
				var609.Visible = false
				
				return
			end
			var608.Visible = false
			var609.Visible = true
		end
	end
	
	local function createVRComfortSettingOptions()
		-- upvalues: var20 (copy), gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local enumItems = Enum.VRComfortSetting:GetEnumItems()
		local t = {
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
		local t_1 = {}
		
		for i, v in ipairs(enumItems) do
			t_1[i] = var20:Format(t[tostring(v)])
		end
		local var621, var622, var623 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", t_1, table.find(enumItems, gameSettings.VRComfortSetting), nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		gameSettingsTab.VRComfortSettingFrame = var621
		gameSettingsTab.VRComfortSettingLabel = var622
		gameSettingsTab.VRComfortSettingSelector = var623
		gameSettingsTab.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame
		local var624, var625, var626 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VignetteEnabled then 1 else 2)
		gameSettingsTab.VRVignetteEnabledFrame = var624
		gameSettingsTab.VRVignetteEnabledLabel = var625
		gameSettingsTab.VRVignetteEnabledSelector = var626
		gameSettingsTab.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame
		local var627, var628, var629 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRSmoothRotationEnabled then 2 else 1)
		gameSettingsTab.VRSteppedRotationEnabledFrame = var627
		gameSettingsTab.VRSteppedRotationEnabledLabel = var628
		gameSettingsTab.VRSteppedRotationEnabledSelector = var629
		gameSettingsTab.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame
		local var630, var631, var632 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame = var630
		gameSettingsTab.VRThirdPersonFixedCamEnabledLabel = var631
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector = var632
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame
		
		local var633 = function(p108)
			-- upvalues: gameSettingsTab (copy)
			if p108 == Enum.VRComfortSetting.Custom then
				gameSettingsTab.VRVignetteEnabledSelector:SetZIndex(2)
				gameSettingsTab.VRVignetteEnabledLabel.ZIndex = 2
				gameSettingsTab.VRVignetteEnabledSelector:SetInteractable(true)
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetZIndex(2)
				gameSettingsTab.VRSteppedRotationEnabledLabel.ZIndex = 2
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetInteractable(true)
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetZIndex(2)
				gameSettingsTab.VRThirdPersonFixedCamEnabledLabel.ZIndex = 2
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetInteractable(true)
				
				return
			end
			gameSettingsTab.VRVignetteEnabledSelector:SetZIndex(1)
			gameSettingsTab.VRVignetteEnabledLabel.ZIndex = 1
			gameSettingsTab.VRVignetteEnabledSelector:SetInteractable(false)
			gameSettingsTab.VRSteppedRotationEnabledSelector:SetZIndex(1)
			gameSettingsTab.VRSteppedRotationEnabledLabel.ZIndex = 1
			gameSettingsTab.VRSteppedRotationEnabledSelector:SetInteractable(false)
			gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetZIndex(1)
			gameSettingsTab.VRThirdPersonFixedCamEnabledLabel.ZIndex = 1
			gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetInteractable(false)
		end
		
		gameSettingsTab.VRComfortSettingSelector.IndexChanged:connect(function(p109)
			-- upvalues: enumItems (ref), gameSettings (copy), var633 (ref)
			local var634 = enumItems[p109]
			gameSettings.VRComfortSetting = var634
			var633(var634)
		end)
		var633(gameSettings.VRComfortSetting)
		gameSettingsTab.VRVignetteEnabledSelector.IndexChanged:connect(function(p110)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VignetteEnabledCustomOption = p110 == 1
			end
		end)
		gameSettingsTab.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p111)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRSmoothRotationEnabledCustomOption = p111 == 2
			end
		end)
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p112)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRThirdPersonFollowCamEnabledCustomOption = p112 == 2
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRComfortSetting"):Connect(function()
			-- upvalues: enumItems (ref), gameSettings (copy), gameSettingsTab (copy)
			local index = table.find(enumItems, gameSettings.VRComfortSetting)
			
			if gameSettingsTab.VRComfortSettingSelector:GetSelectedIndex() ~= index then
				gameSettingsTab.VRComfortSettingSelector:SetSelectionIndex(index)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VignetteEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var636 = if gameSettings.VignetteEnabled then 1 else 2
			
			if gameSettingsTab.VRVignetteEnabledSelector:GetSelectedIndex() ~= var636 then
				gameSettingsTab.VRVignetteEnabledSelector:SetSelectionIndex(var636)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var637 = if gameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if gameSettingsTab.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= var637 then
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetSelectionIndex(var637)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var638 = if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= var638 then
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(var638)
			end
		end)
	end
	
	local function createVRSafetyBubbleModeOptions()
		-- upvalues: var20 (copy), gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local enumItems = Enum.VRSafetyBubbleMode:GetEnumItems()
		local t = {
			title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
			description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
			["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
			["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
			["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
		}
		local t_1 = {}
		
		for i, v in ipairs(enumItems) do
			t_1[i] = var20:Format(t[tostring(v)])
		end
		local index = table.find(enumItems, gameSettings.VRSafetyBubbleMode)
		task.defer(function()
			-- upvalues: gameSettingsTab (copy), utilityModule (copy), var20 (copy), t_1 (ref), index (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), enumItems (ref), gameSettings (copy)
			local var643, var644, var645 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", t_1, index, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			gameSettingsTab.VRSafetyBubbleModeFrame = var643
			gameSettingsTab.VRSafetyBubbleModeLabel = var644
			gameSettingsTab.VRSafetyBubbleModeSelector = var645
			gameSettingsTab.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSafetyBubbleModeFrame
			gameSettingsTab.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p113)
				-- upvalues: enumItems (copy), gameSettings (copy)
				gameSettings.VRSafetyBubbleMode = enumItems[p113]
			end)
			gameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function()
				-- upvalues: enumItems (copy), gameSettings (copy), gameSettingsTab (copy)
				local index = table.find(enumItems, gameSettings.VRSafetyBubbleMode)
				
				if gameSettingsTab.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= index then
					gameSettingsTab.VRSafetyBubbleModeSelector:SetSelectionIndex(index)
				end
			end)
		end)
	end
	
	gameSettingsTab.VoiceChatOptionsEnabled = false
	local _ = nil
	local _ = nil
	local var170 = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (getFFlagEnableVrVoiceConnectDisconnect() or (if isInExperienceUIVREnabled then not isSpatial() else true)) then
		spawn(function()
			-- upvalues: getFFlagEnableVoiceUxUpdates (copy), hideVoiceChatSelectorForFaeAEGIS2 (copy), default_2 (copy), createVoiceChatSelector (ref), isVoiceFocused (copy), gameSettingsTab (ref), observeIsVoiceFocused (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), voiceVolumeControlsEligibility (copy), name (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var165 (write), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (ref), default_3 (copy), t_4 (copy), getFFlagVoiceChatUILoggingModule (copy)
			if getFFlagEnableVoiceUxUpdates() and (not hideVoiceChatSelectorForFaeAEGIS2 and default_2:EligibleForFaeUpsell() or default_2:IsSeamlessVoice()) and default_2:verifyUniverseAndPlaceCanUseVoice() then
				createVoiceChatSelector()
				
				if isVoiceFocused() and gameSettingsTab.VoiceConnectDisconnectFrame then
					gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
				end
				observeIsVoiceFocused(function(p114)
					-- upvalues: gameSettingsTab (copy)
					if p114 then
						if gameSettingsTab.VoiceConnectDisconnectFrame then
							gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
							
							return
						end
					elseif gameSettingsTab.VoiceConnectDisconnectFrame then
						gameSettingsTab.VoiceConnectDisconnectFrame.Visible = true
					end
				end)
			end
			default_2:asyncInit():andThen(function()
				-- upvalues: default_2 (copy), gameSettingsTab (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), voiceVolumeControlsEligibility (copy), name (copy), observeIsVoiceFocused (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableVoiceUxUpdates (copy), createVoiceChatSelector (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var165 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (copy), default_3 (copy), t_4 (copy)
				VoiceChatService = default_2:getService()
				
				if default_2:VoiceChatAvailable() then
					gameSettingsTab.VoiceChatOptionsEnabled = true
				end
				if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and gameSettingsTab.VoiceChatVolumeFrame then
					local function _(p115)
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
						local ok, status = pcall(function()
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), p115 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
							local voiceChatService = game:GetService("VoiceChatService")
							local service = default_2:getService()
							gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then p115 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
						end)
						
						if not ok then
							name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
						end
					end
					
					local var647 = nil
					local ok, status = pcall(function()
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var647 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
						local voiceChatService = game:GetService("VoiceChatService")
						local service = default_2:getService()
						gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var647 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
					end)
					
					if not ok then
						name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
					end
					if voiceVolumeControlsSuppressInExperienceUiForPartyVoice and getFFlagEnableCrossExpVoice() and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						observeIsVoiceFocused(function()
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local var652 = nil
							local ok, status = pcall(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var652 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
								local voiceChatService = game:GetService("VoiceChatService")
								local service = default_2:getService()
								gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var652 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
							end)
							
							if not ok then
								name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
							end
						end)
					end
					if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then
						default_2:subscribe("OnStateChanged", function(_, p116)
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local ok, status = pcall(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), p116 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
								local voiceChatService = game:GetService("VoiceChatService")
								local service = default_2:getService()
								gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then p116 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
							end)
							
							if not ok then
								name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
							end
						end)
					else
						local service = default_2:getService()
						
						if service then
							service.StateChanged:Connect(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
								local var653 = nil
								local ok, status = pcall(function()
									-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var653 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
									local voiceChatService = game:GetService("VoiceChatService")
									local service = default_2:getService()
									gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var653 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
								end)
								
								if not ok then
									name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
								end
							end)
						end
					end
				end
				if voiceSelectorAvailableAfterFae and getFFlagEnableVoiceUxUpdates() and (default_2:UserVoiceEnabled() and default_2:verifyUniverseAndPlaceCanUseVoice()) then
					createVoiceChatSelector()
				end
				if not getFFlagEnableUniveralVoiceToastsModule() then
					default_2:CheckAndShowNotAudiblePrompt()
					
					if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused()))) then
						default_2:ShowNotAudiblePromptVoiceChatVolume()
					end
				end
				if getFFlagEnableVoiceUxUpdates() then
					if differentiateVoiceSelectorSystemAndUser and deferProgrammaticChange then
						var165 = true
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function()
							-- upvalues: var165 (copy)
							var165 = false
						end)
						
						return
					end
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				else
					local var649 = false
					
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
						createVoiceConnectDisconnect()
						
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							var649 = isVoiceFocused()
							observeIsVoiceFocused(function(p117)
								-- upvalues: var649 (write), gameSettingsTab (copy), default_2 (copy)
								var649 = p117
								
								if p117 then
									if gameSettingsTab.VoiceConnectFrame then
										gameSettingsTab.VoiceConnectFrame.Visible = false
									end
									if gameSettingsTab.VoiceDisconnectFrame then
										gameSettingsTab.VoiceDisconnectFrame.Visible = false
										
										return
									end
								elseif default_2:ShouldShowJoinVoice() then
									if gameSettingsTab.VoiceConnectFrame then
										gameSettingsTab.VoiceConnectFrame.Visible = true
									end
									if gameSettingsTab.VoiceDisconnectFrame then
										gameSettingsTab.VoiceDisconnectFrame.Visible = false
									end
								end
							end)
						end
					end
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceConnectFrame then
						gameSettingsTab.VoiceConnectFrame.Visible = false
					end
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceDisconnectFrame then
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							gameSettingsTab.VoiceDisconnectFrame.Visible = not var649
						else
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end
					default_2.showVoiceUI.Event:Connect(function()
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var649 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var649 then return end
						gameSettingsTab.VoiceChatOptionsEnabled = true
						local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
						
						if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
							gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
						end
						if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceConnectFrame then
							gameSettingsTab.VoiceConnectFrame.Visible = false
						end
						if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceDisconnectFrame then
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end)
					default_2.hideVoiceUI.Event:Connect(function()
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var649 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var649 then return end
						gameSettingsTab.VoiceChatOptionsEnabled = false
						local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
						
						if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
							gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
						end
						if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceConnectFrame then
							gameSettingsTab.VoiceConnectFrame.Visible = true
						end
						if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and gameSettingsTab.VoiceDisconnectFrame then
							gameSettingsTab.VoiceDisconnectFrame.Visible = false
						end
					end)
				end
			end):catch(function()
				-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), getFFlagEnableUniveralVoiceToastsModule (copy), default_2 (copy)
				if getFFlagVoiceChatUILoggingModule() then
					name:warning("Failed to init VoiceChatServiceManager")
				end
				if not getFFlagEnableUniveralVoiceToastsModule() then
					default_2:CheckAndShowPermissionPrompt()
				end
			end)
		end)
	end
	if getFFlagEnableCrossExpVoice() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local eventConnection = default_3.ExperienceJoined.Event:Connect(function()
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		local eventConnection_1 = default_3.ExperienceLeft.Event:Connect(function()
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		
		var170 = function()
			-- upvalues: eventConnection (write), eventConnection_1 (write)
			if eventConnection then
				eventConnection:Disconnect()
				eventConnection = nil
			end
			if eventConnection_1 then
				eventConnection_1:Disconnect()
				eventConnection_1 = nil
			end
		end
	end
	gameSettingsTab.VideoOptionsEnabled = false
	local var173 = nil
	
	local _ = function()
		-- upvalues: var173 (write)
		if var173 then
			var173:disconnect()
			var173 = nil
		end
	end
	
	if getFFlagSelfViewCameraSettings() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local var174 = function(p118)
			-- upvalues: gameSettingsTab (ref)
			gameSettingsTab.VideoOptionsEnabled = p118.hasCameraPermissions
		end
		
		if isCamEnabledForUserAndPlaceModule() then
			getCamMicPermissionsModule(var174, { default.Permissions.CAMERA_ACCESS }, true)
			var173 = cameraDevicePermissionGrantedSignalModule:connect(function()
				-- upvalues: gameSettingsTab (ref), updateCameraDevices (ref), videoCaptureService (copy), var162 (write)
				gameSettingsTab.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if videoCaptureService.DevicesChanged then
					var162 = videoCaptureService.DevicesChanged:Connect(function()
						-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
						if gameSettingsTab.PageOpen then
							updateCameraDevices()
						end
					end)
				end
			end)
		end
	end
	if not isInExperienceUIVREnabled then
		createCameraModeOptions(not var83 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
	end
	local changedConnection
	local _ = function()
		-- upvalues: gameSettings (copy), createGamepadOptions (ref)
		if gameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		end
		local var658 = nil
		var658 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
			-- upvalues: gameSettings (copy), var658 (write), createGamepadOptions (copy)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if var658 then
					var658:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	
	if userInputService.MouseEnabled then
		createMouseOptions()
	elseif not userInputService.GamepadEnabled then
		changedConnection = nil
		changedConnection = userInputService.GamepadConnected:connect(function()
			-- upvalues: changedConnection (write), gameSettings (copy), createGamepadOptions (ref)
			if changedConnection then
				changedConnection:disconnect()
			end
			if gameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()
				
				return
			end
			local var659 = nil
			var659 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: gameSettings (copy), var659 (write), createGamepadOptions (copy)
				if gameSettings.IsUsingGamepadCameraSensitivity then
					if var659 then
						var659:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end)
	elseif gameSettings.IsUsingGamepadCameraSensitivity then
		createGamepadOptions()
	else
		changedConnection = nil
		changedConnection = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
			-- upvalues: gameSettings (copy), changedConnection (write), createGamepadOptions (ref)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if changedConnection then
					changedConnection:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	if not isInExperienceUIVREnabled then
		if gameSettings.IsUsingCameraYInverted then
			createCameraInvertedOptions()
		else
			changedConnection = nil
			changedConnection = gameSettings.Changed:connect(function(p119)
				-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
				if p119 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
					changedConnection:disconnect()
					createCameraInvertedOptions()
				end
			end)
		end
	end
	if isInExperienceUIVREnabled then
		if isSpatial() then
			createVRComfortSettingOptions()
			createVRSafetyBubbleModeOptions()
		else
			createCameraModeOptions(not var83 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
			
			if gameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				changedConnection = nil
				changedConnection = gameSettings.Changed:connect(function(p120)
					-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
					if p120 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
						changedConnection:disconnect()
						createCameraInvertedOptions()
					end
				end)
			end
			createReducedMotionOptions()
			createPreferredTransparencyOptions()
		end
	end
	createVolumeOptions()
	
	if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		createVoiceChatVolumeOptions()
	end
	if fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
		changedConnection = false
		gameSettingsTab.Displayed.Event:Connect(function()
			-- upvalues: changedConnection (write), gameSettingsTab (ref), default_2 (copy)
			changedConnection = true
			
			if gameSettingsTab.VoiceChatVolumeFrame and gameSettingsTab.VoiceChatVolumeFrame.Visible then
				default_2:RecordGameSettingsOpened()
			end
		end)
		gameSettingsTab.Hidden.Event:Connect(function()
			-- upvalues: changedConnection (write)
			changedConnection = false
		end)
		gameSettingsTab.VoiceChatVolumeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: gameSettingsTab (ref), changedConnection (write), default_2 (copy)
			if gameSettingsTab.VoiceChatVolumeFrame.Visible and changedConnection then
				default_2:RecordGameSettingsOpened()
			end
		end)
	end
	if var52 then
		createPartyVoiceVolumeOptions()
	end
	createHapticsToggle()
	createGraphicsOptions()
	
	if showAntiHarassmentSettings and getFFlagEnablePlayerNamesEnabledSettingModule() then
		createPlayerNamesEnabledOptions()
	end
	if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
		playerChoiceTranslationSettingInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
	end
	if not isInExperienceUIVREnabled then
		createReducedMotionOptions()
		createPreferredTransparencyOptions()
	end
	createPreferredTextSizeOptions()
	createUiNavigationKeyBindOptions()
	
	if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
		createPerformanceStatsOptions()
	end
	if var90_1 then
		createMicroProfilerOptions()
	end
	if var83 and getAppFeaturePolicies().getSupportsOverscan() then
		createOverscanOption()
	end
	if showAntiHarassmentSettings and fFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var513, var514, var515 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var513
			gameSettingsTab.badgeVisibleFrame = var514
			gameSettingsTab.badgeVisibleSelector = var515
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p121)
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p121 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p121 == 1)
			end)
		end)
	end
	if fFlagEnableModerateChatRemoteEvent then
		createChatModerationOptions()
	end
	if fFlagAIRephraseSettingEnabled then
		createAIRephraseSettingOptions()
	end
	if fFlagChatSummariesSettingEnabled then
		createChatSummariesSettingOptions()
	end
	if fFlagExpChatEnableFriendsTab then
		createChatNotificationsSettingOptions()
	end
	createDeveloperConsoleOption()
	getHasGuiHidingPermissionModule(runService:IsStudio(), localPlayer, playerPermissionsModule):andThen(function(p123)
		-- upvalues: createUiToggleOptions (ref)
		if p123 then
			createUiToggleOptions()
		end
	end):catch(function(p122)
		warn(p122)
	end)
	var125 = true
	
	if VRService.VREnabled then
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	if fFlagIEMSettingsGroupsModule then
		gameSettingsTab.AudioHeader = renderSettingsHeaderModule({
			headerText = "CoreScripts.InGameMenu.GameSettings.AudioHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AudioHeader,
			parent = gameSettingsTab.Page
		})
		gameSettingsTab.AudioDivider = renderSettingsDividerModule({
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AudioDivider,
			parent = gameSettingsTab.Page
		})
		gameSettingsTab.DisplayHeader = renderSettingsHeaderModule({
			headerText = "CoreScripts.InGameMenu.GameSettings.DisplayHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DisplayHeader,
			parent = gameSettingsTab.Page
		})
		gameSettingsTab.DisplayDivider = renderSettingsDividerModule({
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DisplayDivider,
			parent = gameSettingsTab.Page
		})
		
		if not isSpatial() then
			gameSettingsTab.LanguageHeader = renderSettingsHeaderModule({
				headerText = "CoreScripts.InGameMenu.GameSettings.LanguageHeader",
				layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageHeader,
				parent = gameSettingsTab.Page
			})
			gameSettingsTab.LanguageDivider = renderSettingsDividerModule({
				layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageDivider,
				parent = gameSettingsTab.Page
			})
		end
		gameSettingsTab.ViewAndControlsHeader = renderSettingsHeaderModule({
			headerText = "CoreScripts.InGameMenu.GameSettings.ViewandControlsHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ViewAndControlsHeader,
			parent = gameSettingsTab.Page
		})
	end
	gameSettingsTab.TabHeader.Name = "GameSettingsTab"
	local settings = migration.uiblox["icons/common/settings"]
	gameSettingsTab.TabHeader.TabLabel.Icon.Text = settings.name
	gameSettingsTab.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[settings.variant]
	gameSettingsTab.TabHeader.TabLabel.Title.Text = "Settings"
	gameSettingsTab.Page.ZIndex = 5
	
	if gameSettingsTab.PageListLayout then
		gameSettingsTab.PageListLayout.Padding = UDim.new(0, 0)
	end
	gameSettingsTab.PageOpen = false
	
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		gameSettingsTab.FeedbackEntryPointEnabled = true
	end
	local _ = function()
		-- upvalues: runService (copy), enableTFFeedbackModeEntryCheck (copy), var83 (copy)
		return if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false else enableTFFeedbackModeEntryCheck and var83
	end
	
	function gameSettingsTab.OpenSettingsPage()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), updateAudioOptions (ref), soundService (copy), var161 (write), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), getFFlagSelfViewCameraSettings (copy), updateCameraDevices (ref), videoCaptureService (copy), var162 (write), updateUiToggleSelection (ref), var17 (copy), var62 (copy), themeModule (copy), var61 (copy), getLastValueChangerFrame (copy), fFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		gameSettingsTab.PageOpen = true
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if getFFlagLazyInitiateExperienceLanguageSwitcherModule() and not gameSettingsTab.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and getFFlagEnableLocalesForExperienceLanguageSwitcherModule()) then
			gameSettingsTab.LanguageSwitcherInitialized = true
			experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if soundService.DeviceListChanged then
			var161 = soundService.DeviceListChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
		gameSettingsTab.startVolume = gameSettings.MasterVolume
		
		if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
			gameSettingsTab.maxVoiceChatVolumeDuringSession = gameSettings.VoiceChatVolume
		end
		if getFFlagSelfViewCameraSettings() and gameSettingsTab.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
			updateCameraDevices()
			
			if videoCaptureService.DevicesChanged then
				var162 = videoCaptureService.DevicesChanged:Connect(function()
					-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
					if gameSettingsTab.PageOpen then
						updateCameraDevices()
					end
				end)
			end
		end
		updateUiToggleSelection()
		
		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and gameSettingsTab.toggleFeedbackModeButton and gameSettingsTab.toggleFeedbackModeText then
			gameSettingsTab.FeedbackEntryPointEnabled = var17 ~= nil and var17:CanEnterCaptureMode()
			
			if gameSettingsTab.FeedbackEntryPointEnabled then
				gameSettingsTab.toggleFeedbackModeButton.Active = true
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = true
				gameSettingsTab.toggleFeedbackModeText.Text = var62
			else
				gameSettingsTab.toggleFeedbackModeButton.Active = false
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = false
				gameSettingsTab.toggleFeedbackModeText.TextColor3 = themeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				gameSettingsTab.toggleFeedbackModeText.Text = var61
			end
		end
		table.insert(gameSettingsTab.LastSelectableObjects, getLastValueChangerFrame(gameSettingsTab))
		
		if fFlagIEMTabFocusNav then
			table.insert(gameSettingsTab.FirstSelectableObjects, getFirstValueChangerFrame(gameSettingsTab))
			gameSettingsTab.FirstSelectableObjectsUpdated:fire()
		end
	end
	
	function gameSettingsTab.CloseSettingsPage()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), soundService (copy), var161 (write), getFFlagEnableCrossExpVoice (copy), var170 (write), getFFlagSelfViewCameraSettings (copy), videoCaptureService (copy), var162 (write), var173 (write), default_2 (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy)
		gameSettingsTab.PageOpen = false
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if soundService.DeviceListChanged and var161 then
			var161:Disconnect()
		end
		if getFFlagEnableCrossExpVoice() and var170 then
			var170()
		end
		if getFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and videoCaptureService.DevicesChanged and var162 then
				var162:Disconnect()
				var162 = nil
			end
			if var173 then
				var173:disconnect()
				var173 = nil
			end
		end
		if game:GetEngineFeature("VoiceChatSupported") and gameSettingsTab.VoiceChatOptionsEnabled and (gameSettingsTab.startVolume ~= nil and gameSettingsTab.startVolume > 0) then
			default_2:CheckAndShowNotAudiblePrompt()
		end
		if game:GetEngineFeature("VoiceChatSupported") and gameSettingsTab.VoiceChatOptionsEnabled and (fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule) and (gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil and gameSettingsTab.maxVoiceChatVolumeDuringSession > 0) then
			default_2:ShowNotAudiblePromptVoiceChatVolume()
		end
	end
	
	function isLangaugeSelectionDropdownEnabled()
		-- upvalues: localPlayer (copy)
		if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
			return false
		elseif localPlayer.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
			return true
		end
		for i in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
			if tonumber(i) == localPlayer.UserId then
				return true
			end
		end
		return false
	end
	
	function gameSettingsTab.SetHub(_, p124)
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (ref), getFFlagChatTranslationSettingEnabledModule (copy), getFFlagChatTranslationHoldoutEnabledModule (copy), getFStringChatTranslationLayerNameModule (copy), getChatTranslationLayerData (ref), textChatServiceSettingsSavedEngineFeature (copy), getFFlagChatTranslationNewDefaultsModule (copy), gameSettings (copy), textChatService (copy), getFFlagChatTranslationForceSettingModule (copy), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy), runService (copy), enableTFFeedbackModeEntryCheck (copy), var83 (copy), createFeedbackModeOptions (ref)
		gameSettingsTab.HubRef = p124
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if isLangaugeSelectionDropdownEnabled() then
			if not getFFlagEnableLocalesForExperienceLanguageSwitcherModule() then
				createTranslationOptions()
			elseif not getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
				experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
			end
		end
		if game:GetEngineFeature("EnableTCSChatTranslation") and getFFlagChatTranslationSettingEnabledModule() then
			if getFFlagChatTranslationHoldoutEnabledModule() then
				if getChatTranslationLayerData(getFStringChatTranslationLayerNameModule()).ChatTranslationEnabled then
					if getFFlagChatTranslationForceSettingModule() then
						gameSettings.ChatTranslationEnabled = true
					end
				elseif not textChatServiceSettingsSavedEngineFeature then
					pcall(function()
						-- upvalues: textChatService (copy)
						textChatService.ChatTranslationEnabled = false
					end)
				elseif not getFFlagChatTranslationNewDefaultsModule() then
					gameSettings.ChatTranslationEnabled = false
				elseif gameSettings.ChatTranslationLocale == "" then
					gameSettings.ChatTranslationEnabled = false
					gameSettings.ChatTranslationLocale = "en_us"
				end
			end
			chatTranslationOptionsWithChatLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		if if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false elseif enableTFFeedbackModeEntryCheck and var83 then false else true then
			createFeedbackModeOptions()
		end
	end
	
	return gameSettingsTab
end)()