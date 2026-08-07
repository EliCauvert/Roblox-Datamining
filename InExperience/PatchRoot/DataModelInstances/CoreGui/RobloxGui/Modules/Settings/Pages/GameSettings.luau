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
local var91_1
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
local fFlagIEMFocusNavToButtons = sharedFlagsModule.FFlagIEMFocusNavToButtons
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local showAntiHarassmentSettings = game:DefineFastFlag("ShowAntiHarassmentSettings", false)
local getFFlagEnablePlayerNamesEnabledSettingModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local fFlagUpdatePeopleNamesSettingCopyModule = require(robloxGui.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy)
local fFlagBadgeVisibilitySettingEnabled = sharedFlagsModule.FFlagBadgeVisibilitySettingEnabled
local getFFlagEnableVoiceUxUpdates = sharedFlagsModule.GetFFlagEnableVoiceUxUpdates
local getFFlagEnableVrVoiceConnectDisconnect = sharedFlagsModule.GetFFlagEnableVrVoiceConnectDisconnect
local enableVoiceSelectorTranslationsAEGIS2 = game:DefineFastFlag("EnableVoiceSelectorTranslations_AEGIS2", false)
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
local var53 = default_1 and default_1.getHasPartyVoiceVolume()
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

local function _(p0) --[[ line: 143 | named "voiceChatVolumeToSlider" ]]
	return math.floor(p0 * 5 + 0.5)
end

local _ = function(p1) --[[ line: 147 | named "voiceChatVolumeFromSlider" ]]
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
local var61 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local var62 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local var63 = robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local t_6 = { On = 1, Off = 2 }

local _ = function() --[[ line: 190 | named "getDefaultCameraMode" ]]
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then "Default (Follow)" else "Default (Classic)"
end

local _ = function() --[[ line: 199 | named "getDefaultMovementMode" ]]
	-- upvalues: userInputService (ref), robloxTranslatorModule (ref), constantsModule (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else "Default (Keyboard)"
end

local _ = function() --[[ line: 208 | named "getDefaultSelectToMove" ]]
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
local var84 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local _ = nil
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local default_2 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceVolumeControlsEligibility = require(corePackagesService.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local default_3 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local var87 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local var88 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local romarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local var91 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local var92 = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
local var93 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true

if isInExperienceUIVREnabled then
	if not var93 and not var92 then
		var91_1 = isSpatial() and var91
	end
elseif not var93 then
	var91_1 = var92 and var91
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

local function reportSettingsChangeForAnalytics(value, p2, p3, p4) --[[ line: 335 ]]
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

local function reportSettingsForAnalytics() --[[ line: 366 ]]
	-- upvalues: userInputService (ref), gameSettings (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	local t = {}
	local var122 = userInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if var122 then
		t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
	else
		t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
	end
	if var122 then
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

local function getLastValueChangerFrame(p5) --[[ line: 435 ]]
	-- upvalues: fFlagIEMFocusNavToButtons (ref)
	if not fFlagIEMFocusNavToButtons then return end
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

local function getFirstValueChangerFrame(p6) --[[ line: 454 ]]
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

return (function() --[[ line: 473 | named "Initialize" ]]
	-- upvalues: IGMEnableGFXReset (ref), gfxResetModule (ref), robloxGui (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (ref), VRService (ref), gameSettings (ref), utilityModule (ref), SETTINGS_MENU_LAYOUT_ORDER (ref), guiService (ref), getFFlagFixCyclicFullscreenIndexEventModule (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), reportSettingsChangeForAnalytics (ref), reportSettingsForAnalytics (ref), rbxAnalyticsService (ref), constantsModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), eraseFPSFromDefaultSetting (ref), robloxTranslatorModule (ref), romarkStartWithGraphicQualityLevelFastInt (ref), t (ref), updateVisibilitySettingsCopy (ref), fFlagUpdatePeopleNamesSettingCopyModule (ref), t_6 (ref), userInputService (ref), create (ref), themeModule (ref), centerShiftLockOverride (ref), microProfilerReadOnlyInformationLabel (ref), touchEnabled (ref), var93 (ref), var92 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), localPlayer (ref), coreUtilityModule (ref), t_3 (ref), getFFlagAlwaysShowVRToggleModule (ref), getAppFeaturePolicies (ref), t_5 (ref), var61 (ref), t_2 (ref), t_1 (ref), url (ref), httpService (ref), feedbackEntryPointImprovedStrictnessCheck (ref), safetyService (ref), var17 (write), feedbackEntryPointButtonSizeAdjustment2 (ref), var63 (ref), disableFeedbackSoothsayerCheck (ref), name (ref), playersService (ref), var62 (ref), runService (ref), getFFlagChatTranslationWaitForIXPModule (ref), IXPServiceWrapper (ref), getFFlagChatTranslationNewDefaultsModule (ref), fFlagRenameVolumeToMainVolumeModule (ref), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (ref), default_3 (ref), var20 (write), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), corePackagesService (ref), contextActionService (ref), fixDeveloperConsoleButtonSizeAndPositioning (ref), playerPermissionsModule (ref), userFreecamGuiDestabilization (ref), userShowGuiHideToggles (ref), soundService (ref), getFIntVoiceChatDeviceChangeDebounceDelayModule (ref), default_2 (ref), getFFlagEnableCrossExpVoice (ref), signalsModule (ref), getFIntDebounceAIRephraseSettingDelayModule (ref), textChatService (ref), expChatDebounceRephraseIndexSelection (ref), throttleFunctionCallModule (ref), getFIntDebounceChatSummariesSettingDelayModule (ref), var88 (ref), userGameSettingsService (ref), getFFlagVoiceChatUILoggingModule (ref), videoCaptureService (ref), var87 (ref), differentiateVoiceSelectorSystemAndUser (ref), voiceSelectorAvailableAfterFae (ref), enableVoiceSelectorTranslationsAEGIS2 (ref), getFIntDebounceDisconnectButtonDelayModule (ref), fFlagVoiceRewarmTelemetry (ref), constantsModule_1 (ref), voiceSelectorIgnoreFailedStateDisconnect (ref), voiceChatSelectorReconnectFocus2AEGIS2 (ref), debounceVoiceSelectorIndexChange (ref), deferProgrammaticChange (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), isVoiceFocused (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), getFFlagEnableVoiceUxUpdates (ref), hideVoiceChatSelectorForFaeAEGIS2 (ref), observeIsVoiceFocused (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (ref), voiceVolumeControlsEligibility (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), t_4 (ref), getFFlagSelfViewCameraSettings (ref), isCamEnabledForUserAndPlaceModule (ref), getCamMicPermissionsModule (ref), default (ref), cameraDevicePermissionGrantedSignalModule (ref), var84 (ref), fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (ref), var53 (ref), showAntiHarassmentSettings (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), playerChoiceTranslationSettingInitializerModule (ref), cachedPolicyServiceModule (ref), var91_1 (ref), fFlagBadgeVisibilitySettingEnabled (ref), fFlagEnableModerateChatRemoteEvent (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getHasGuiHidingPermissionModule (ref), fFlagIEMSettingsGroupsModule (ref), renderSettingsHeaderModule (write), renderSettingsDividerModule (write), migration (ref), builderIconsModule (ref), enableTFFeedbackModeEntryCheck (ref), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (ref), experienceLanguageSwitcherInitializerModule (ref), fFlagIEMFocusNavToButtons (ref), getLastValueChangerFrame (ref), fFlagIEMTabFocusNav (ref), getFirstValueChangerFrame (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFFlagChatTranslationHoldoutEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), textChatServiceSettingsSavedEngineFeature (ref), getFFlagChatTranslationForceSettingModule (ref), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (ref)
	if IGMEnableGFXReset then
		gfxResetModule.RunGfxReset()
	end
	local gameSettingsTab = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		gameSettingsTab.LanguageSwitcherInitialized = false
	end
	local var126 = false
	local t_7 = {}
	
	local function _() --[[ line: 486 | named "onVRSettingsReady" ]]
		-- upvalues: VRService (copy), t_7 (ref)
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function() --[[ line: 493 | named "onVREnabled" ]]
		-- upvalues: VRService (copy), var126 (write), t_7 (ref)
		if VRService.VREnabled and var126 then
			local VREnabled = VRService.VREnabled
			
			for i, v in pairs(t_7) do
				i.Visible = not VREnabled
			end
		end
	end)
	local function createGraphicsOptions() --[[ line: 505 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), rbxAnalyticsService (copy), constantsModule (copy), gameBasicSettingsFramerateCapEngineFeature (copy), VRService (copy), eraseFPSFromDefaultSetting (copy), robloxTranslatorModule (copy), IGMEnableGFXReset (copy), gfxResetModule (copy), romarkStartWithGraphicQualityLevelFastInt (copy), t (copy)
		local var177, var178, var179 = utilityModule:AddNewRow(gameSettingsTab, "Fullscreen", "Selector", { "On", "Off" }, if not gameSettings:InFullScreen() then 2 else 1)
		gameSettingsTab.FullscreenFrame = var177
		gameSettingsTab.FullscreenLabel = var178
		gameSettingsTab.FullscreenEnabler = var179
		gameSettingsTab.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t_7[gameSettingsTab.FullscreenFrame] = true
		gameSettingsTab.FullscreenEnabler.IndexChanged:connect(function(p7) --[[ line: 518 ]]
			-- upvalues: gameSettings (copy), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), gameSettingsTab (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var193 = gameSettings:InFullScreen()
			
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
			spawn(function() --[[ line: 543 ]]
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), var193 (ref), gameSettings (copy), reportSettingsForAnalytics (copy)
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", var193, gameSettings:InFullScreen())
				end
				reportSettingsForAnalytics()
			end)
		end)
		gameSettings.FullscreenChanged:connect(function(p8) --[[ line: 551 ]]
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
		local var180 = gameSettingsTab
		local var181, var182, var183 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then 2 else 1)
		gameSettingsTab.GraphicsEnablerFrame = var181
		gameSettingsTab.GraphicsEnablerLabel = var182
		var180.GraphicsQualityEnabler = var183
		gameSettingsTab.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame
		local var184 = gameSettingsTab
		local var185, var186, var187 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Quality", "Slider", 10, 1)
		gameSettingsTab.GraphicsQualityFrame = var185
		gameSettingsTab.GraphicsQualityLabel = var186
		var184.GraphicsQualitySlider = var187
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
			task.defer(function() --[[ line: 617 ]]
				-- upvalues: gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), list (ref), cloned (ref), gameSettings (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local var194, var195, var196 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", list, table.find(cloned, gameSettings.FramerateCap), nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				gameSettingsTab.FramerateCapFrame = var194
				gameSettingsTab.FramerateCapLabel = var195
				gameSettingsTab.FramerateCapMode = var196
				gameSettingsTab.FramerateCapFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FramerateCap
				gameSettingsTab.FramerateCapMode.IndexChanged:Connect(function(p9) --[[ line: 629 ]]
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
		
		function SetGraphicsQuality(value, p10) --[[ line: 647 ]]
			-- upvalues: IGMEnableGFXReset (copy), gfxResetModule (copy), gameSettings (copy)
			if IGMEnableGFXReset then
				local var197, var198 = gfxResetModule.TemporaryOverride(value)
				
				if var197 then
					settings().Rendering.QualityLevel = var198
					
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
		
		local function _() --[[ line: 673 | named "setGraphicsToAuto" ]]
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
			gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
			gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		end
		
		local function setGraphicsToManual(value) --[[ line: 681 ]]
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
		
		local var191 = false
		gameSettingsTab.GraphicsQualitySlider.ValueChanged:connect(function(p11) --[[ line: 695 ]]
			-- upvalues: var191 (write), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p11)
			
			if var191 == true then
				reportSettingsForAnalytics()
			end
			var191 = true
		end)
		gameSettingsTab.GraphicsQualityEnabler.IndexChanged:connect(function(p12) --[[ line: 703 ]]
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
		game.GraphicsQualityChangeRequest:Connect(function(p13) --[[ line: 721 ]]
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
			local var192 = tostring(gameSettings.SavedQualityLevel)
			var192 = if t[var192] then t[var192] else 10
			SetGraphicsQuality(var192)
			spawn(function() --[[ line: 754 ]]
				-- upvalues: gameSettingsTab (copy), var192 (write)
				gameSettingsTab.GraphicsQualitySlider:SetValue(var192)
			end)
		end
	end
	
	local function createReducedMotionOptions() --[[ line: 760 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var202, var203, var204 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.ReducedMotion then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion"))
		gameSettingsTab.ReducedMotionFrame = var202
		gameSettingsTab.ReducedMotionLabel = var203
		gameSettingsTab.ReducedMotionMode = var204
		gameSettingsTab.ReducedMotionFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ReducedMotionFrame
		gameSettingsTab.ReducedMotionMode.IndexChanged:connect(function(p14) --[[ line: 782 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local reducedMotion = gameSettings.ReducedMotion
			gameSettings.ReducedMotion = p14 == 1
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("reduced_motion", reducedMotion, gameSettings.ReducedMotion)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPlayerNamesEnabledOptions() --[[ line: 793 ]]
		-- upvalues: updateVisibilitySettingsCopy (copy), robloxTranslatorModule (copy), fFlagUpdatePeopleNamesSettingCopyModule (copy), gameSettings (copy), t_6 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local function _() --[[ line: 801 | named "GetPlayerNamesEnabledStartIndex" ]]
			-- upvalues: gameSettings (copy)
			return if gameSettings.PlayerNamesEnabled then 1 else 2
		end
		
		local var205, var206, var207 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.PlayerNamesEnabled then t_6.On else t_6.Off, nil, if fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		gameSettingsTab.PlayerNamesEnabledFrame = var205
		gameSettingsTab.playerNamesEnabledLabel = var206
		gameSettingsTab.playerNamesEnabledMode = var207
		gameSettingsTab.PlayerNamesEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PlayerNamesEnabledFrame
		gameSettingsTab.playerNamesEnabledMode.IndexChanged:connect(function(p15) --[[ line: 820 ]]
			-- upvalues: gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local playerNamesEnabled = gameSettings.PlayerNamesEnabled
			gameSettings.PlayerNamesEnabled = p15 == 1
			reportSettingsChangeForAnalytics("player_names_enabled", playerNamesEnabled, gameSettings.PlayerNamesEnabled)
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTransparencyOptions() --[[ line: 829 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var208, var209, var210 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(gameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque"))
		gameSettingsTab.PreferredTransparencyFrame = var208
		gameSettingsTab.PreferredTransparencyLabel = var209
		gameSettingsTab.PreferredTransparencySlider = var210
		gameSettingsTab.PreferredTransparencyFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTransparencyFrame
		gameSettingsTab.PreferredTransparencySlider.ValueChanged:connect(function(p16) --[[ line: 855 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTransparency = gameSettings.PreferredTransparency
			gameSettings.PreferredTransparency = (10 - math.clamp(math.floor(p16), 0, 10)) / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_transparency", preferredTransparency, gameSettings.PreferredTransparency)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTextSizeOptions() --[[ line: 867 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local enumItems = Enum.PreferredTextSize:GetEnumItems()
		local var212, var213, var214 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, gameSettings.PreferredTextSize.Value - 1, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest"))
		gameSettingsTab.PreferredTextSizeFrame = var212
		gameSettingsTab.PreferredTextSizeLabel = var213
		gameSettingsTab.PreferredTextSizeSlider = var214
		gameSettingsTab.PreferredTextSizeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTextSizeFrame
		gameSettingsTab.PreferredTextSizeSlider.ValueChanged:connect(function(p17) --[[ line: 892 ]]
			-- upvalues: gameSettings (copy), enumItems (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTextSize = gameSettings.PreferredTextSize
			gameSettings.PreferredTextSize = enumItems[p17 + 1]
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_text_size", preferredTextSize, gameSettings.PreferredTextSize)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createUiNavigationKeyBindOptions() --[[ line: 902 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), userInputService (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t = { On = 1, Off = 2 }
		local var216, var217, var218 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.UiNavigationKeyBindEnabled then t.On else t.Off, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}))
		gameSettingsTab.UiNavigationKeyBindEnabledFrame = var216
		gameSettingsTab.UiNavigationKeyBindEnabledLabel = var217
		gameSettingsTab.UiNavigationKeyBindEnabledMode = var218
		gameSettingsTab.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame
		gameSettingsTab.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p18) --[[ line: 933 ]]
			-- upvalues: gameSettings (copy), t (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local uiNavigationKeyBindEnabled = gameSettings.UiNavigationKeyBindEnabled
			gameSettings.UiNavigationKeyBindEnabled = p18 == t.On
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("ui_navigation_key_bind_enabled", uiNavigationKeyBindEnabled, gameSettings.UiNavigationKeyBindEnabled)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _() --[[ line: 946 | named "updateUiNavigationKeyBindVisibility" ]]
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
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ line: 961 ]]
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
	
	local function createPerformanceStatsOptions() --[[ line: 966 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var219 = nil
		local var220 = nil
		local var221 = nil
		local var222 = nil
		gameSettingsTab.PerformanceStatsFrame = var219
		gameSettingsTab.PerformanceStatsLabel = var220
		gameSettingsTab.PerformanceStatsMode = var221
		gameSettingsTab.PerformanceStatsOverrideText = var222
		
		function GetDesiredPerformanceStatsIndex() --[[ line: 972 ]]
			-- upvalues: gameSettings (copy)
			return if gameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		local var223, var224, var225 = utilityModule:AddNewRow(gameSettingsTab, "Performance Stats", "Selector", { "On", "Off" }, GetDesiredPerformanceStatsIndex())
		gameSettingsTab.PerformanceStatsFrame = var223
		gameSettingsTab.PerformanceStatsLabel = var224
		gameSettingsTab.PerformanceStatsMode = var225
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
		gameSettingsTab.PerformanceStatsMode.IndexChanged:connect(function(p19) --[[ line: 1001 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var226 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.PerformanceStatsVisible else nil
			
			if p19 == 1 then
				gameSettings.PerformanceStatsVisible = true
			else
				gameSettings.PerformanceStatsVisible = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", var226, gameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		gameSettings.PerformanceStatsVisibleChanged:connect(function() --[[ line: 1023 ]]
			-- upvalues: gameSettingsTab (copy)
			local var227 = GetDesiredPerformanceStatsIndex()
			
			if var227 ~= gameSettingsTab.PerformanceStatsMode.CurrentIndex then
				gameSettingsTab.PerformanceStatsMode:SetSelectionIndex(var227)
			end
		end)
	end
	
	local function createWebServerInformationRow() --[[ line: 1033 ]]
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), microProfilerReadOnlyInformationLabel (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), touchEnabled (copy), create (copy), themeModule (copy)
		local var228, var229, var230 = utilityModule:AddNewRow(gameSettingsTab, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, if microProfilerReadOnlyInformationLabel then false else nil)
		gameSettingsTab.InformationFrame = var228
		gameSettingsTab.InformationLabel = var229
		gameSettingsTab.InformationTextBox = var230
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
	
	local function createMicroProfilerOptions() --[[ line: 1073 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), createWebServerInformationRow (ref), var93 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), var92 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local var231 = nil
		local var232 = nil
		local var233 = nil
		local var234 = nil
		gameSettingsTab.MicroProfilerFrame = var231
		gameSettingsTab.MicroProfilerLabel = var232
		gameSettingsTab.MicroProfilerMode = var233
		gameSettingsTab.MicroProfilerOverrideText = var234
		
		local function _() --[[ line: 1078 | named "tryContentLabel" ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), createWebServerInformationRow (copy)
			local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
			
			if microProfilerWebServerPort == 0 then
				return false
			end
			local var243, var244 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var243
			gameSettingsTab.InformationText = var244
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
			
			return true
		end
		
		local function setMicroProfilerIndex(value) --[[ line: 1090 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), var93 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), createWebServerInformationRow (copy), var92 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local function _() --[[ line: 1091 | named "hideContentLabel" ]]
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
			
			local var245 = nil
			local onScreenProfilerEnabled = nil
			local onScreenProfilerEnabled_1 = nil
			
			if var93 then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var245 = "webserver"
					onScreenProfilerEnabled = gameSettings.MicroProfilerWebServerEnabled
				end
				if value == 1 then
					gameSettings.MicroProfilerWebServerEnabled = true
					local var246 = 30
					while var246 >= 1 do
						local var249
						local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
						
						if microProfilerWebServerPort == 0 then
							var249 = false
						else
							local var247, var248 = createWebServerInformationRow()
							gameSettingsTab.InformationFrame = var247
							gameSettingsTab.InformationText = var248
							gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
							var249 = true
						end
						if var249 then break end
						var246 -= 1
						wait(0.1)
					end
					if var246 <= 0 then
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
			elseif var92 or isInExperienceUIVREnabled and isSpatial() then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var245 = "regular"
					onScreenProfilerEnabled = gameSettings.OnScreenProfilerEnabled
				end
				gameSettings.OnScreenProfilerEnabled = value == 1
				
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.OnScreenProfilerEnabled
				end
			end
			rbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", onScreenProfilerEnabled, onScreenProfilerEnabled_1, { microprofiler_type = var245 })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function() --[[ line: 1164 | named "GetDesiredWebServerIndex" ]]
			-- upvalues: var93 (copy), gameSettings (copy), var92 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy)
			return if var93 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif not (not var92 and (not isInExperienceUIVREnabled or not isSpatial())) then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2
		end
		
		local var236 = gameSettingsTab
		local var237, var238, var239 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if var93 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif var92 or isInExperienceUIVREnabled and isSpatial() then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2)
		var236.MicroProfilerFrame = var237
		gameSettingsTab.MicroProfilerLabel = var238
		gameSettingsTab.MicroProfilerMode = var239
		gameSettingsTab.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame
		local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
		
		if microProfilerWebServerPort ~= 0 then
			local var240, var241 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var240
			gameSettingsTab.InformationText = var241
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
		end
		local var242 = false
		gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ line: 1193 ]]
			-- upvalues: var242 (write), gameSettings (copy), gameSettingsTab (copy)
			var242 = true
			
			if gameSettings.OnScreenProfilerEnabled then
				gameSettingsTab.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			end
			gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
		end)
		gameSettingsTab.MicroProfilerMode.IndexChanged:connect(function(...) --[[ line: 1203 | named "onIndexChanged" ]]
			-- upvalues: var242 (write), setMicroProfilerIndex (ref)
			if var242 then
				var242 = false
				
				return
			end
			setMicroProfilerIndex(...)
		end)
	end
	
	local function createCameraModeOptions(p20) --[[ line: 1214 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), localPlayer (copy), userInputService (copy), coreUtilityModule (copy), t_3 (copy), VRService (copy), getFFlagAlwaysShowVRToggleModule (copy), getAppFeaturePolicies (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var61 (copy), t_2 (copy), t_1 (copy)
		local var250 = nil
		local var251 = nil
		local var252 = nil
		local var253 = nil
		gameSettingsTab.ShiftLockFrame = var250
		gameSettingsTab.ShiftLockLabel = var251
		gameSettingsTab.ShiftLockMode = var252
		gameSettingsTab.ShiftLockOverrideText = var253
		local var254, var255, var256 = utilityModule:AddNewRow(gameSettingsTab, "Shift Lock Switch", "Selector", { "On", "Off" }, if gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		gameSettingsTab.ShiftLockFrame = var254
		gameSettingsTab.ShiftLockLabel = var255
		gameSettingsTab.ShiftLockMode = var256
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
		gameSettingsTab.ShiftLockMode.IndexChanged:connect(function(p21) --[[ line: 1245 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var291 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p21 == 1 then
				gameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				gameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", var291, gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _(value) --[[ line: 1267 | named "setShiftLockSelectorVisible" ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local devEnableMouseLock = value and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		
		local _ = function() --[[ line: 1275 | named "applyDevOverrideShiftLockSelector" ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local var293 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var293
				local devEnableMouseLock = not var293 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end
		
		local _ = function() --[[ line: 1283 | named "updateShiftLockVisibility" ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var296 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var296
				local devEnableMouseLock = not var296 and localPlayer.DevEnableMouseLock
				
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
		local var258 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var258
			local devEnableMouseLock = not var258 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		userInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ line: 1293 ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var299 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var299
				local devEnableMouseLock = not var299 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ line: 1297 ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var302 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var302
				local devEnableMouseLock = not var302 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		
		function cameraModeIsUserChoice() --[[ line: 1303 ]]
			-- upvalues: userInputService (copy), localPlayer (copy)
			return if userInputService.PreferredInput == Enum.PreferredInput.Touch then localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		
		function setCameraModeVisible(value) --[[ line: 1312 ]]
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
		
		local function updateCurrentCameraMovementIndex(p22) --[[ line: 1326 ]]
			-- upvalues: t_4 (write), t (write), userInputService (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy)
			local var304 = nil
			
			if not pcall(function() --[[ line: 1328 ]]
				-- upvalues: var304 (write), t_4 (copy), t (copy), p22 (ref)
				var304 = t_4[t[p22]]
			end) or var304 == nil then
				return false
			end
			local var305
			local _ = nil
			local value = nil
			
			if userInputService.PreferredInput == Enum.PreferredInput.Touch then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					value = gameSettings.TouchCameraMovementMode.Value
				end
				var305 = gameSettings.TouchCameraMovementMode.Value ~= var304
				gameSettings.TouchCameraMovementMode = var304
			elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				value = gameSettings.ComputerCameraMovementMode.Value
			end
			var305 = gameSettings.ComputerCameraMovementMode.Value ~= var304
			gameSettings.ComputerCameraMovementMode = var304
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and var305 then
				reportSettingsChangeForAnalytics("camera_mode", value, var304)
			end
			return var305
		end
		
		local function updateCameraMovementModes() --[[ line: 1362 ]]
			-- upvalues: playerScripts (ref), userInputService (copy), t (write), t_4 (write), t_3 (copy), gameSettingsTab (copy), gameSettings (copy), updateCurrentCameraMovementIndex (ref)
			local var306 = if playerScripts then if userInputService.PreferredInput == Enum.PreferredInput.Touch then playerScripts:GetRegisteredTouchCameraMovementModes() else playerScripts:GetRegisteredComputerCameraMovementModes() else {}
			t = {}
			t_4 = {}
			
			if #var306 <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #var306 do
				local var307 = var306[i]
				local name = var307.Name
				
				if name == "Default" then
					name = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_3.DEFAULT_FOLLOW else t_3.DEFAULT_CLASSIC
				end
				t[#t + 1] = name
				t_4[name] = var307.Value
			end
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode:UpdateOptions(t)
			end
			local _ = -1
			local var308 = userInputService.PreferredInput == Enum.PreferredInput.Touch
			local var309 = if var308 then gameSettings.TouchCameraMovementMode.Value else gameSettings.ComputerCameraMovementMode.Value
			
			if var309 > -1 then
				if var308 or gameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					var309 += 1
				end
				updateCurrentCameraMovementIndex(var309)
				gameSettingsTab.CameraMode:SetSelectionIndex(var309)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		local var265 = gameSettingsTab
		local var266 = gameSettingsTab
		local var267 = gameSettingsTab
		local var268, var269, var270 = utilityModule:AddNewRow(gameSettingsTab, "Camera Mode", "Selector", t, 1)
		var265.CameraModeFrame = var268
		var266.CameraModeLabel = var269
		var267.CameraMode = var270
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
			playerScripts.TouchCameraMovementModeRegistered:connect(function(_) --[[ line: 1448 ]]
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.TouchEnabled then
					updateCameraMovementModes()
				end
			end)
			playerScripts.ComputerCameraMovementModeRegistered:connect(function(_) --[[ line: 1454 ]]
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.MouseEnabled then
					updateCameraMovementModes()
				end
			end)
		end
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 1461 ]]
			-- upvalues: updateCameraMovementModes (ref)
			updateCameraMovementModes()
		end)
		local t_6 = false
		gameSettingsTab.CameraMode.IndexChanged:connect(function(p23) --[[ line: 1466 ]]
			-- upvalues: updateCurrentCameraMovementIndex (ref), t_6 (write), reportSettingsForAnalytics (copy)
			if updateCurrentCameraMovementIndex(p23) then
				if t_6 then
					reportSettingsForAnalytics()
				end
				t_6 = true
			end
		end)
		updateCameraMovementModes()
		local var272 = false
		
		t = function() --[[ line: 1482 | named "createVROption" ]]
			-- upvalues: var272 (write), gameSettings (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not var272 then
				var272 = true
				local var310 = if gameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				local var311, var312, var313 = utilityModule:AddNewRow(gameSettingsTab, "VR", "Selector", var310, if gameSettings.VREnabled then 1 else 2)
				gameSettingsTab.VREnabledFrame = var311
				gameSettingsTab.VREnabledLabel = var312
				gameSettingsTab.VREnabledSelector = var313
				gameSettingsTab.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				gameSettingsTab.VREnabledSelector.IndexChanged:connect(function(p24) --[[ line: 1497 ]]
					-- upvalues: gameSettings (copy), var310 (write), reportSettingsChangeForAnalytics (copy)
					local t = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local var315 = p24 == t.On.Value
					
					if gameSettings.VREnabled ~= var315 then
						gameSettings.VREnabled = var315
						local value = var310[t.On.Value]
						local var316 = var310[p24]
						
						if var316 == var310[t.On.Value] then
							value = var310[t.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", value, var316)
					end
				end)
			end
		end
		
		t_4 = function() --[[ line: 1516 | named "onVREnabledChanged" ]]
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
		
		local var276 = function(_) --[[ line: 1541 ]] end
		
		local _ = function(value) --[[ line: 1545 | named "setMovementModeVisible" ]]
			-- upvalues: gameSettingsTab (copy), t_8 (write)
			if gameSettingsTab.MovementMode then
				local var317 = value and #t_8 > 0
				gameSettingsTab.MovementMode.SelectorFrame.Visible = var317
				gameSettingsTab.MovementMode:SetInteractable(var317)
				gameSettingsTab.MovementModeOverrideText.Visible = not var317
			end
		end
		
		if p20 then
			local t_11 = {}
			local playerScripts_1 = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
			
			local _ = function(p25) --[[ line: 1559 | named "getDisplayName" ]]
				-- upvalues: userInputService (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var61 (copy)
				local var318 = p25
				
				if p25 == "Default" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey)
					end
					var318 = t_5.DEFAULT_KEYBOARD
					
					return var318
				elseif p25 == "KeyboardMouse" then
					var318 = "Keyboard + Mouse"
					
					return var318
				elseif p25 == "ClickToMove" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return t_5.TAP_TO_MOVE
					end
					var318 = t_5.CLICK_TO_MOVE
					
					return var318
				elseif p25 == "DynamicThumbstick" then
					var318 = "Dynamic Thumbstick"
					
					return var318
				elseif p25 == "Thumbstick" then
					var318 = var61
				end
				return var318
			end
			
			local var279, var280, var281 = utilityModule:AddNewRow(gameSettingsTab, "Movement Mode", "Selector", t_11, 1)
			gameSettingsTab.MovementModeFrame = var279
			gameSettingsTab.MovementModeLabel = var280
			gameSettingsTab.MovementMode = var281
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
			
			local function setMovementMode(value) --[[ line: 1600 ]]
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
			
			var276 = function(p26) --[[ line: 1617 ]]
				-- upvalues: localPlayer (copy), gameSettingsTab (copy), t_8 (write)
				local var319
				local _ = nil
				
				if p26 then
					var319 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					var319 = nil
				else
					var319 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if gameSettingsTab.MovementMode then
					local var320 = var319 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var320
					gameSettingsTab.MovementMode:SetInteractable(var320)
					gameSettingsTab.MovementModeOverrideText.Visible = not var320
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var319
				end
			end
			
			local function updateMovementModes() --[[ line: 1629 ]]
				-- upvalues: userInputService (copy), playerScripts_1 (ref), t_8 (write), t_9 (write), t_6 (write), t_10 (write), gameSettingsTab (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var61 (copy), gameSettings (copy), setMovementMode (ref), var276 (write)
				local var321 = userInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if playerScripts_1 then
					t_8 = if var321 then playerScripts_1:GetRegisteredTouchMovementModes() else playerScripts_1:GetRegisteredComputerMovementModes()
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
					local var322 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var322
					gameSettingsTab.MovementMode:SetInteractable(var322)
					gameSettingsTab.MovementModeOverrideText.Visible = not var322
				end
				for i, v in t_8 do
					t_6[i] = v
					local var324 = t_10
					local name = v.Name
					local var325 = name
					
					if name == "Default" then
						var325 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else t_5.DEFAULT_KEYBOARD
					elseif name == "KeyboardMouse" then
						var325 = "Keyboard + Mouse"
					elseif name == "ClickToMove" then
						var325 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_5.TAP_TO_MOVE else t_5.CLICK_TO_MOVE
					elseif name == "DynamicThumbstick" then
						var325 = "Dynamic Thumbstick"
					elseif name == "Thumbstick" then
						var325 = var61
					end
					var324[i] = var325
					t_9[v] = i
				end
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode:UpdateOptions(t_10)
				end
				local var323 = if var321 then gameSettings.TouchMovementMode else gameSettings.ComputerMovementMode
				
				if var323 then
					setMovementMode(var323)
					gameSettingsTab.MovementMode:SetSelectionIndex(t_9[var323])
				end
				var276(var321)
			end
			
			updateMovementModes()
			
			if playerScripts_1 then
				playerScripts_1.TouchMovementModeRegistered:connect(function(_) --[[ line: 1673 ]]
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.TouchEnabled then
						updateMovementModes()
					end
				end)
				playerScripts_1.ComputerMovementModeRegistered:connect(function(_) --[[ line: 1679 ]]
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.MouseEnabled then
						updateMovementModes()
					end
				end)
			end
			userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 1686 ]]
				-- upvalues: updateMovementModes (ref)
				updateMovementModes()
			end)
			gameSettingsTab.MovementMode.IndexChanged:connect(function(p27) --[[ line: 1690 ]]
				-- upvalues: setMovementMode (ref), t_6 (write), reportSettingsForAnalytics (copy)
				setMovementMode(t_6[p27])
				reportSettingsForAnalytics()
			end)
		end
		local var285
		local _ = false
		local var284 = userInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if var284 then
			var285 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			var285 = nil
		else
			var285 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if var285 then
			gameSettingsTab.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			gameSettingsTab.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local var286
		local _ = false
		
		if var284 then
			var286 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
			var286 = nil
		else
			var286 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if gameSettingsTab.MovementModeOverrideText then
			if var286 then
				gameSettingsTab.MovementModeOverrideText.Visible = false
				
				if gameSettingsTab.MovementMode then
					local var287 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var287
					gameSettingsTab.MovementMode:SetInteractable(var287)
					gameSettingsTab.MovementModeOverrideText.Visible = not var287
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
		local var288 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var288
			local devEnableMouseLock = not var288 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(value) --[[ line: 1736 ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy), var276 (write), t_8 (write)
			if value == "DevEnableMouseLock" then
				local var326 = not localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockOverrideText then
					gameSettingsTab.ShiftLockOverrideText.Visible = var326
					local devEnableMouseLock = not var326 and localPlayer.DevEnableMouseLock
					
					if gameSettingsTab.ShiftLockMode then
						gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
						gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
						
						return
					end
				end
			elseif value == "DevComputerCameraMode" then
				local var328 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
				setCameraModeVisible(var328)
				gameSettingsTab.CameraModeOverrideText.Visible = not var328
				
				return
			elseif value == "DevComputerMovementMode" then
				if var276 ~= nil then
					var276(false)
					
					return
				end
				local var329 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var330 = var329 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var330
					gameSettingsTab.MovementMode:SetInteractable(var330)
					gameSettingsTab.MovementModeOverrideText.Visible = not var330
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var329
					
					return
				end
			elseif value == "DevTouchMovementMode" then
				if var276 ~= nil then
					var276(true)
					
					return
				end
				local var331 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var332 = var331 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var332
					gameSettingsTab.MovementMode:SetInteractable(var332)
					gameSettingsTab.MovementModeOverrideText.Visible = not var332
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var331
					
					return
				end
			elseif value == "DevTouchCameraMode" then
				local var333 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
				setCameraModeVisible(var333)
				gameSettingsTab.CameraModeOverrideText.Visible = not var333
			end
		end
		
		localPlayer.Changed:connect(function(p28) --[[ line: 1771 ]]
			-- upvalues: t_2 (copy), updateUserSettingsMenu (ref), t_1 (copy)
			if t_2[p28] then
				updateUserSettingsMenu(p28)
			end
			if t_1[p28] then
				updateUserSettingsMenu(p28)
			end
		end)
	end
	
	local function createFeedbackModeOptions() --[[ line: 1784 ]]
		-- upvalues: url (copy), httpService (copy), feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (ref), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var63 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), disableFeedbackSoothsayerCheck (copy), name (copy)
		local text = url.ROLES_URL .. "v1/users/authenticated/roles"
		local var335 = httpService:RequestInternal({ Method = "GET", Url = text })
		
		local function rolesCheckCallback(p29) --[[ line: 1791 ]]
			-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var63 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p29 then
				if not feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
				local var340, var341
				local function onToggleFeedbackMode() --[[ line: 1803 ]]
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
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var63, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var340 = toggleFeedbackModeButton
					var341 = toggleFeedbackModeButton_1
					var340.Size = UDim2.new(0.6, 0, 0, 40)
					var340.Position = UDim2.new(0.4, 0, 0.5, 0)
					var340.AnchorPoint = Vector2.new(0, 0.5)
				else
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var63, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var340 = toggleFeedbackModeButton
					var341 = toggleFeedbackModeButton_1
					var340.Size = UDim2.new(0, 300, 0, 30)
					var340.Position = UDim2.new(0.4, 0, 0.5, 0)
					var340.AnchorPoint = Vector2.new(0, 0.5)
				end
				var340.ZIndex = 2
				var340.Selectable = true
				var341.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					gameSettingsTab.toggleFeedbackModeButton = var340
					gameSettingsTab.toggleFeedbackModeText = var341
				end
				if feedbackEntryPointButtonSizeAdjustment2 then
					utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var340, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
					
					return
				end
				utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var340).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end
		
		if disableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		end
		var335:Start(function(p30, p31) --[[ line: 1887 ]]
			-- upvalues: httpService (copy), name (copy), text (ref), rolesCheckCallback (ref)
			local var346
			local var344 = false
			local var345 = false
			local _ = nil
			
			if not p30 then
				var346 = "Roles Api Request: Connection error"
			elseif p31.StatusCode == 401 then
				var346 = "Roles Api Request: Unauthorized"
			elseif p31.StatusCode < 200 or p31.StatusCode >= 400 then
				var346 = "Roles Api Status code: " .. p31.StatusCode
			else
				local ok, status = pcall(function() --[[ line: 1899 ]]
					-- upvalues: httpService (copy), p31 (ref), var344 (write)
					for i, v in pairs(httpService:JSONDecode(p31.Body).roles) do
						if v == "Soothsayer" then
							var344 = true
						end
					end
				end)
				var345 = ok
				var346 = status
			end
			if not var345 then
				name:warning("Feedback Mode initialization api call failed with url: " .. text .. " and with error message: " .. var346)
			end
			rolesCheckCallback(var344)
		end)
	end
	
	local function createTranslationOptions() --[[ line: 1927 ]]
		-- upvalues: playersService (copy), url (copy), httpService (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), localPlayer (copy), reportSettingsChangeForAnalytics (copy), runService (copy)
		local var347 = 1
		local var348 = 1
		local var349 = false
		local var350 = nil
		local var351 = nil
		local localeId = playersService.LocalPlayer.LocaleId
		local var352 = nil
		local var353 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
		local var360 = httpService:RequestInternal({ Method = "GET", Url = text })
		local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local var362 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
		local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local var364 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
		local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local var366 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
		
		local function userExperienceLanguageSettingsCallback(value, p32) --[[ line: 1992 ]]
			-- upvalues: name (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_4 (ref), t_2 (ref), var350 (write), t (ref), var353 (write), t_1 (ref), var347 (write), var348 (write), localPlayer (copy), var351 (write), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var349 (write), runService (copy)
			if value then
				local var371 = false
				table.insert(t_4, t_2[var350].languageName .. " (Original)")
				
				for i, v in pairs(t) do
					if v == var353 then
						var371 = true
					end
					if v ~= var350 then
						table.insert(t_4, t_2[v].languageName)
					end
				end
				if var371 == true then
					for i_1, v_1 in pairs(t_4) do
						if i_1 ~= 1 and t_1[v_1] == var353 then
							var347 = i_1
							var348 = i_1
						end
					end
				end
				local var372, var373, var374 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_4, var347)
				gameSettingsTab.LanguageSelectorFrame = var372
				gameSettingsTab.LanguageSelectorLabel = var373
				gameSettingsTab.LanguageSelectorMode = var374
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				
				if var347 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var351)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[var347]]].localeCode)
				end
				gameSettingsTab.LanguageSelectorMode.CurrentLanguage = gameSettingsTab.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				gameSettingsTab.LanguageSelectorMode.IndexChanged:connect(function(p33) --[[ line: 2072 | named "toggleTranslation" ]]
					-- upvalues: gameSettingsTab (copy), t_2 (copy), var350 (copy), t_1 (copy), t_4 (copy), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var348 (copy), localPlayer (copy), var351 (copy), name (copy), var349 (copy), runService (copy)
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					local var375 = if p33 == 1 then t_2[var350].id else t_2[t_1[t_4[p33]]].id
					local currentLanguage = gameSettingsTab.LanguageSelectorMode.CurrentLanguage
					local var376 = t_4[p33]
					
					if currentLanguage ~= var376 then
						gameSettingsTab.LanguageSelectorMode.CurrentLanguage = var376
						reportSettingsChangeForAnalytics("experience_language", currentLanguage, var376)
					end
					local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local var378 = httpService:RequestInternal({
						Method = "POST",
						Url = text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = httpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = var375 }
						})
					})
					
					local function callback(p34, p35) --[[ line: 2119 ]]
						-- upvalues: var348 (copy), p33 (ref), localPlayer (copy), var351 (copy), t_1 (copy), t_4 (copy), t_2 (copy), name (copy), var349 (copy), gameSettingsTab (copy)
						if p34 then
							var348 = p33
							
							if p33 == 1 then
								localPlayer:SetExperienceSettingsLocaleId(var351)
							else
								localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p33]]].localeCode)
							end
						else
							name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p35)
							var349 = true
							gameSettingsTab.LanguageSelectorMode:SetSelectionIndex(var348)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
					end
					
					if runService:IsStudio() then
						var348 = p33
						
						if p33 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var351)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p33]]].localeCode)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
						
						return
					elseif not var349 then
						var378:Start(function(p36, p37) --[[ line: 2162 ]]
							-- upvalues: name (copy), text (ref), callback (ref)
							local var380 = false
							local text_1 = nil
							
							if not p36 then
								text_1 = "User Experience Language Settings Update Request: Connection error"
							elseif p37.StatusCode == 401 then
								text_1 = "User Experience Language Settings Update Request: Unauthorized"
							elseif p37.StatusCode < 200 or p37.StatusCode >= 400 then
								text_1 = "User Experience Language Settings Update Request Status Code: " .. p37.StatusCode
							else
								name:info("User Experience Language Settings Update Request succeeded with code: " .. p37.StatusCode)
								var380 = true
							end
							if not var380 then
								name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. text_1)
							end
							callback(var380, text_1)
						end)
						
						return
					end
					var349 = false
					var348 = p33
					
					if p33 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var351)
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
			local var368, var369, var370 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var368
			gameSettingsTab.LanguageSelectorLabel = var369
			gameSettingsTab.LanguageSelectorMode = var370
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local function _(p38, p39) --[[ line: 2197 | named "experienceSupportedLanguagesCallback" ]]
			-- upvalues: var366 (ref), httpService (copy), var353 (write), var352 (write), var350 (write), t_3 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p38 then
				var366:Start(function(p40, p41) --[[ line: 2199 ]]
					-- upvalues: httpService (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
					local var387
					local var386 = false
					local _ = nil
					
					if not p40 then
						var387 = "User Experience Language Setting Request: Connection error"
					elseif p41.StatusCode == 401 then
						var387 = "User Experience Language Setting Request: Unauthorized"
					elseif p41.StatusCode < 200 or p41.StatusCode >= 400 then
						var387 = "User Experience Language Setting Request Status code: " .. p41.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2210 ]]
							-- upvalues: httpService (copy), p41 (ref), var353 (copy), var352 (copy), var350 (copy), t_3 (copy)
							local userUniverseLocalizationSettingValue = httpService:JSONDecode(p41.Body).userUniverseLocalizationSettingValue
							
							if userUniverseLocalizationSettingValue == nil then
								var353 = var352
								
								return
							elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
								var353 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var350 else var352
							end
							if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
								if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
									var353 = var352
									
									return
								end
								var353 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
							end
						end)
						var386 = ok
						var387 = status
					end
					if not var386 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var387)
					end
					userExperienceLanguageSettingsCallback(var386, var387)
				end)
				
				return
			end
			local var382 = p39
			
			if var382 == nil then
				var382 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var382)
			local var383, var384, var385 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var383
			gameSettingsTab.LanguageSelectorLabel = var384
			gameSettingsTab.LanguageSelectorMode = var385
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local _ = function(p42, p43) --[[ line: 2259 | named "experienceSourceLanguageCallback" ]]
			-- upvalues: var364 (ref), httpService (copy), t (ref), name (copy), text_2 (ref), var366 (ref), var353 (write), var352 (write), var350 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p42 then
				var364:Start(function(p44, p45) --[[ line: 2261 ]]
					-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p43 (write), p42 (ref), var366 (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var393
					local var392 = false
					local _ = nil
					
					if not p44 then
						var393 = "Experience Supported Language Request: Connection error"
					elseif p45.StatusCode == 401 then
						var393 = "Experience Supported Language Request: Unauthorized"
					elseif p45.StatusCode < 200 or p45.StatusCode >= 400 then
						var393 = "Experience Supported Language Request Status code: " .. p45.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2271 ]]
							-- upvalues: httpService (copy), p45 (ref), t (copy)
							for i, v in pairs(httpService:JSONDecode(p45.Body).data) do
								t[i] = v.languageCode
							end
						end)
						var392 = ok
						var393 = status
					end
					if not var392 then
						name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var393)
					end
					if p43 == nil then
						p43 = var393
					end
					local var394 = p43
					
					if var392 and p42 then
						var366:Start(function(p46, p47) --[[ line: 2199 ]]
							-- upvalues: httpService (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
							local var387
							local var386 = false
							local _ = nil
							
							if not p46 then
								var387 = "User Experience Language Setting Request: Connection error"
							elseif p47.StatusCode == 401 then
								var387 = "User Experience Language Setting Request: Unauthorized"
							elseif p47.StatusCode < 200 or p47.StatusCode >= 400 then
								var387 = "User Experience Language Setting Request Status code: " .. p47.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2210 ]]
									-- upvalues: httpService (copy), p47 (ref), var353 (copy), var352 (copy), var350 (copy), t_3 (copy)
									local userUniverseLocalizationSettingValue = httpService:JSONDecode(p47.Body).userUniverseLocalizationSettingValue
									
									if userUniverseLocalizationSettingValue == nil then
										var353 = var352
										
										return
									elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
										var353 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var350 else var352
									end
									if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
										if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
											var353 = var352
											
											return
										end
										var353 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
									end
								end)
								var386 = ok
								var387 = status
							end
							if not var386 then
								name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var387)
							end
							userExperienceLanguageSettingsCallback(var386, var387)
						end)
						
						return
					end
					local var395 = var394
					
					if var395 == nil then
						var395 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var395)
					local var396, var397, var398 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
					gameSettingsTab.LanguageSelectorFrame = var396
					gameSettingsTab.LanguageSelectorLabel = var397
					gameSettingsTab.LanguageSelectorMode = var398
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				end)
			else
				local var388 = p43
				
				if var388 == nil then
					var388 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var388)
				local var389, var390, var391 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var389
				gameSettingsTab.LanguageSelectorLabel = var390
				gameSettingsTab.LanguageSelectorMode = var391
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p48, p49) --[[ line: 2300 | named "localeCodeToLanguageCodeMappingCallback" ]]
			-- upvalues: var362 (ref), httpService (copy), var350 (write), var351 (write), t_2 (ref), name (copy), text_1 (ref), var364 (ref), t (ref), text_2 (ref), var366 (ref), var353 (write), var352 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p48 then
				var362:Start(function(p50, p51) --[[ line: 2302 ]]
					-- upvalues: httpService (copy), var350 (copy), var351 (copy), t_2 (copy), name (copy), text_1 (copy), p49 (write), p48 (ref), var364 (copy), t (copy), text_2 (copy), var366 (copy), var353 (copy), var352 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var404
					local var403 = false
					local _ = nil
					
					if not p50 then
						var404 = "Experience Source Language Request: Connection error"
					elseif p51.StatusCode == 401 then
						var404 = "Experience Source Language Request: Unauthorized"
					elseif p51.StatusCode < 200 or p51.StatusCode >= 400 then
						var404 = "Experience Source Language Status code: " .. p51.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2313 ]]
							-- upvalues: httpService (copy), p51 (ref), var350 (copy), var351 (copy), t_2 (copy)
							var350 = httpService:JSONDecode(p51.Body).languageCode
							var351 = t_2[var350].localeCode
						end)
						var403 = ok
						var404 = status
					end
					if not var403 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var404)
					end
					if p49 == nil then
						p49 = var404
					end
					local p48_1 = var403 and p48
					local var406 = p49
					
					if p48_1 then
						var364:Start(function(p52, p53) --[[ line: 2261 ]]
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), var406 (write), p48_1 (ref), var366 (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var393
							local var392 = false
							local _ = nil
							
							if not p52 then
								var393 = "Experience Supported Language Request: Connection error"
							elseif p53.StatusCode == 401 then
								var393 = "Experience Supported Language Request: Unauthorized"
							elseif p53.StatusCode < 200 or p53.StatusCode >= 400 then
								var393 = "Experience Supported Language Request Status code: " .. p53.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2271 ]]
									-- upvalues: httpService (copy), p53 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p53.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var392 = ok
								var393 = status
							end
							if not var392 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var393)
							end
							if p43 == nil then
								p43 = var393
							end
							if var392 and p48_1 then
								var366:Start(function(p54, p55) --[[ line: 2199 ]]
									-- upvalues: httpService (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var387
									local var386 = false
									local _ = nil
									
									if not p54 then
										var387 = "User Experience Language Setting Request: Connection error"
									elseif p55.StatusCode == 401 then
										var387 = "User Experience Language Setting Request: Unauthorized"
									elseif p55.StatusCode < 200 or p55.StatusCode >= 400 then
										var387 = "User Experience Language Setting Request Status code: " .. p55.StatusCode
									else
										local ok, status = pcall(function() --[[ line: 2210 ]]
											-- upvalues: httpService (copy), p55 (ref), var353 (copy), var352 (copy), var350 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p55.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var353 = var352
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var353 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var350 else var352
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var353 = var352
													
													return
												end
												var353 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var386 = ok
										var387 = status
									end
									if not var386 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var387)
									end
									userExperienceLanguageSettingsCallback(var386, var387)
								end)
								
								return
							end
							local var395 = p43
							
							if var395 == nil then
								var395 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var395)
							local var396, var397, var398 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var396
							gameSettingsTab.LanguageSelectorLabel = var397
							gameSettingsTab.LanguageSelectorMode = var398
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var407 = var406
						
						if var407 == nil then
							var407 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var407)
						local var408, var409, var410 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var408
						gameSettingsTab.LanguageSelectorLabel = var409
						gameSettingsTab.LanguageSelectorMode = var410
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var399 = p49
				
				if var399 == nil then
					var399 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var399)
				local var400, var401, var402 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var400
				gameSettingsTab.LanguageSelectorLabel = var401
				gameSettingsTab.LanguageSelectorMode = var402
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		var360:Start(function(p56, p57) --[[ line: 2344 ]]
			-- upvalues: httpService (copy), t_2 (ref), t_3 (ref), t_1 (ref), localeId (ref), var352 (write), name (copy), text (ref), var362 (ref), var350 (write), var351 (write), text_1 (ref), var364 (ref), t (ref), text_2 (ref), var366 (ref), var353 (write), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local var412
			local var411 = false
			local _ = nil
			
			if not p56 then
				var412 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p57.StatusCode == 401 then
				var412 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p57.StatusCode < 200 or p57.StatusCode >= 400 then
				var412 = "Locale Code to Language Code Mapping Request Status code: " .. p57.StatusCode
			else
				local ok, status = pcall(function() --[[ line: 2355 ]]
					-- upvalues: httpService (copy), p57 (ref), t_2 (copy), t_3 (copy), t_1 (copy), localeId (copy), var352 (copy)
					for i, v in pairs(httpService:JSONDecode(p57.Body).data) do
						local languageCode = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id
						t_2[languageCode] = { localeCode = locale, languageName = name, id = id }
						t_3[id] = languageCode
						t_1[name] = languageCode
						
						if v.locale.locale == localeId:gsub("-", "_") then
							var352 = v.locale.language.languageCode
						end
					end
				end)
				var411 = ok
				var412 = status
			end
			if not var411 then
				name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var412)
			end
			local var413 = var412
			
			if var411 then
				var362:Start(function(p58, p59) --[[ line: 2302 ]]
					-- upvalues: httpService (copy), var350 (copy), var351 (copy), t_2 (copy), name (copy), text_1 (copy), var413 (write), var411 (ref), var364 (copy), t (copy), text_2 (copy), var366 (copy), var353 (copy), var352 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var404
					local var403 = false
					local _ = nil
					
					if not p58 then
						var404 = "Experience Source Language Request: Connection error"
					elseif p59.StatusCode == 401 then
						var404 = "Experience Source Language Request: Unauthorized"
					elseif p59.StatusCode < 200 or p59.StatusCode >= 400 then
						var404 = "Experience Source Language Status code: " .. p59.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2313 ]]
							-- upvalues: httpService (copy), p59 (ref), var350 (copy), var351 (copy), t_2 (copy)
							var350 = httpService:JSONDecode(p59.Body).languageCode
							var351 = t_2[var350].localeCode
						end)
						var403 = ok
						var404 = status
					end
					if not var403 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var404)
					end
					if p49 == nil then
						p49 = var404
					end
					local p48_1 = var403 and var411
					
					if p48_1 then
						var364:Start(function(p60, p61) --[[ line: 2261 ]]
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p49 (write), p48_1 (ref), var366 (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var62 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var393
							local var392 = false
							local _ = nil
							
							if not p60 then
								var393 = "Experience Supported Language Request: Connection error"
							elseif p61.StatusCode == 401 then
								var393 = "Experience Supported Language Request: Unauthorized"
							elseif p61.StatusCode < 200 or p61.StatusCode >= 400 then
								var393 = "Experience Supported Language Request Status code: " .. p61.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2271 ]]
									-- upvalues: httpService (copy), p61 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p61.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var392 = ok
								var393 = status
							end
							if not var392 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var393)
							end
							if p43 == nil then
								p43 = var393
							end
							if var392 and p48_1 then
								var366:Start(function(p62, p63) --[[ line: 2199 ]]
									-- upvalues: httpService (copy), var353 (copy), var352 (copy), var350 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var387
									local var386 = false
									local _ = nil
									
									if not p62 then
										var387 = "User Experience Language Setting Request: Connection error"
									elseif p63.StatusCode == 401 then
										var387 = "User Experience Language Setting Request: Unauthorized"
									elseif p63.StatusCode < 200 or p63.StatusCode >= 400 then
										var387 = "User Experience Language Setting Request Status code: " .. p63.StatusCode
									else
										local ok, status = pcall(function() --[[ line: 2210 ]]
											-- upvalues: httpService (copy), p63 (ref), var353 (copy), var352 (copy), var350 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p63.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var353 = var352
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var353 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var350 else var352
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var353 = var352
													
													return
												end
												var353 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var386 = ok
										var387 = status
									end
									if not var386 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var387)
									end
									userExperienceLanguageSettingsCallback(var386, var387)
								end)
								
								return
							end
							local var395 = p43
							
							if var395 == nil then
								var395 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var395)
							local var396, var397, var398 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var396
							gameSettingsTab.LanguageSelectorLabel = var397
							gameSettingsTab.LanguageSelectorMode = var398
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var407 = p49
						
						if var407 == nil then
							var407 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var407)
						local var408, var409, var410 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var408
						gameSettingsTab.LanguageSelectorLabel = var409
						gameSettingsTab.LanguageSelectorMode = var410
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var414 = var413
				
				if var414 == nil then
					var414 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var414)
				local var415, var416, var417 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var62 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var415
				gameSettingsTab.LanguageSelectorLabel = var416
				gameSettingsTab.LanguageSelectorMode = var417
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end)
	end
	
	local function getChatTranslationLayerData(p64) --[[ line: 2394 ]]
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
		local ok, status = pcall(function() --[[ line: 2416 ]]
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
	
	local function createVolumeOptions() --[[ line: 2434 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), fFlagRenameVolumeToMainVolumeModule (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var419, var420, var421 = utilityModule:AddNewRow(gameSettingsTab, if fFlagRenameVolumeToMainVolumeModule then robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume") else "Volume", "Slider", 10, math.floor(gameSettings.MasterVolume * 10))
		gameSettingsTab.VolumeFrame = var419
		gameSettingsTab.VolumeLabel = var420
		gameSettingsTab.VolumeSlider = var421
		gameSettingsTab.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame
		local volumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		volumeChangeSound.Name = "VolumeChangeSound"
		volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		gameSettingsTab.VolumeSlider.ValueChanged:connect(function(p65) --[[ line: 2447 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), volumeChangeSound (ref), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var423 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.MasterVolume * 10 + 0.5) else nil
			local var424 = p65 / 10
			volumeChangeSound.Volume = var424
			volumeChangeSound:Play()
			gameSettings.MasterVolume = var424
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", var423, math.floor(gameSettings.MasterVolume * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions() --[[ line: 2465 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default_3 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.PartyVoiceVolume * 10)
		local var426, var427, var428 = utilityModule:AddNewRow(gameSettingsTab, "Party Voice Volume", "Slider", 10, floored)
		gameSettingsTab.PartyVoiceVolumeFrame = var426
		gameSettingsTab.PartyVoiceVolumeLabel = var427
		gameSettingsTab.PartyVoiceVolumeSlider = var428
		gameSettingsTab.PartyVoiceVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PartyVoiceVolumeFrame
		
		if getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty() then
			gameSettingsTab.PartyVoiceVolumeFrame.Visible = default_3.hasExperienceStarted
			default_3.ExperienceJoined.Event:Connect(function() --[[ line: 2474 ]]
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = true
			end)
			default_3.ExperienceLeft.Event:Connect(function() --[[ line: 2477 ]]
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = false
			end)
		end
		gameSettingsTab.PartyVoiceVolumeSlider.ValueChanged:connect(function(p66) --[[ line: 2482 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), floored (ref), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var429 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then if floored ~= nil then 0 else math.floor(floored * 10 + 0.5) else nil
			gameSettings.PartyVoiceVolume = p66 / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", var429, math.floor(p66 * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createVoiceChatVolumeOptions() --[[ line: 2498 ]]
		-- upvalues: gameSettings (copy), var20 (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.VoiceChatVolume * 5 + 0.5)
		local ok, status = pcall(function() --[[ line: 2500 ]]
			-- upvalues: var20 (copy)
			return var20:Format("CoreScripts.InGameMenu.GameSettings.VoiceChatVolume")
		end)
		
		if not ok then
			status = "Voice Chat Volume"
			name:debug("[GameSettings] createVoiceChatVolumeOptions failed to get translation for Voice Chat Volume label, using placeholder text instead")
		end
		local var431, var432, var433 = utilityModule:AddNewRow(gameSettingsTab, status, "Slider", 10, floored)
		gameSettingsTab.VoiceChatVolumeFrame = var431
		gameSettingsTab.VoiceChatVolumeLabel = var432
		gameSettingsTab.VoiceChatVolumeSlider = var433
		gameSettingsTab.VoiceChatVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceChatVolumeFrame
		gameSettingsTab.VoiceChatVolumeFrame.Visible = false
		
		if voiceVolumeControlsDisableInteractionWhenNoMasterVolume then
			local function updateVoiceChatVolumeSliderInteractable(p67) --[[ line: 2515 ]]
				-- upvalues: gameSettings (copy), gameSettingsTab (copy)
				local var435
				if p67 == nil then
					var435 = gameSettings.MasterVolume == 0
				else
					var435 = p67 == 0
					var435 = nil
				end
				if var435 then
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
		gameSettingsTab.VoiceChatVolumeSlider.ValueChanged:connect(function(p68) --[[ line: 2535 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), gameSettingsTab (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var436 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.VoiceChatVolume * 5 + 0.5) else nil
			gameSettings.VoiceChatVolume = p68 / 5
			
			if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil then
				gameSettingsTab.maxVoiceChatVolumeDuringSession = math.max(gameSettingsTab.maxVoiceChatVolumeDuringSession, gameSettings.VoiceChatVolume)
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("voice_chat_volume", var436, math.floor(gameSettings.VoiceChatVolume * 5 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle() --[[ line: 2560 ]]
		-- upvalues: gameSettings (copy), getAppFeaturePolicies (copy), var20 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var437, var438, var439 = utilityModule:AddNewRow(gameSettingsTab, if getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() then var20:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if gameSettings.HapticStrength == 0 then 1 else 2)
		gameSettingsTab.HapticsFrame = var437
		_ = var438
		gameSettingsTab.HapticsSelector = var439
		gameSettingsTab.HapticsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.HapticsFrame
		gameSettingsTab.HapticsSelector.IndexChanged:connect(function(p69) --[[ line: 2569 ]]
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
	
	local function createCameraInvertedOptions() --[[ line: 2585 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var440 = 1
		
		if pcall(function() --[[ line: 2587 ]]
			-- upvalues: gameSettings (copy), var440 (write)
			if gameSettings.CameraYInverted == true then
				var440 = 2
			end
		end) == false then
			return
		end
		local var441, var442, var443 = utilityModule:AddNewRow(gameSettingsTab, "Camera Inverted", "Selector", { "Off", "On" }, var440)
		gameSettingsTab.CameraInvertedFrame = var441
		_ = var442
		gameSettingsTab.CameraInvertedSelector = var443
		gameSettingsTab.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t_7[gameSettingsTab.CameraInvertedFrame] = true
		gameSettingsTab.CameraInvertedSelector.IndexChanged:connect(function(p70) --[[ line: 2602 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var444 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.CameraYInverted else nil
			
			if p70 == 2 then
				gameSettings.CameraYInverted = true
			else
				gameSettings.CameraYInverted = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("camera_y_inverted", var444, gameSettings.CameraYInverted)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function setCameraSensitivity(value) --[[ line: 2621 ]]
		-- upvalues: userInputService (copy), gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var445 = nil
		local x = nil
		
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var445 = "gamepad"
				x = gameSettings.GamepadCameraSensitivity
			end
			gameSettings.GamepadCameraSensitivity = value
		end
		if userInputService.MouseEnabled then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var445 = "mouse"
				x = gameSettings.MouseSensitivityFirstPerson.X
			end
			local vector2 = Vector2.new(value, value)
			gameSettings.MouseSensitivityFirstPerson = vector2
			gameSettings.MouseSensitivityThirdPerson = vector2
		end
		if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(x) == "number" and typeof(value) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", x)), tonumber(string.format("%.2f", value)), { sensitivity_type = var445 })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions() --[[ line: 2659 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), setCameraSensitivity (ref)
		local function _(p71) --[[ line: 2664 | named "translateEngineMouseSensitivityToGui" ]]
			return if p71 <= 0.2 then 0 else p71 <= 1 and math.floor((p71 - 0.2) / 0.16 + 0.5) or math.floor((p71 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p72) --[[ line: 2672 | named "translateGuiMouseSensitivityToEngine" ]]
			local var453 = if p72 <= 5 then 0.16 * p72 + 0.2 else 0.6 * p72 - 2
			
			return if var453 <= 0.2 then 0.2 else var453
		end
		
		local mouseSensitivity = gameSettings.MouseSensitivity
		local var447 = if mouseSensitivity <= 0.2 then 0 else mouseSensitivity <= 1 and math.floor((mouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((mouseSensitivity + 2) / 0.6 + 0.5)
		local var448 = true
		local _ = tostring(gameSettings.MouseSensitivityFirstPerson.X)
		local var449, var450, var451 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, var447)
		gameSettingsTab.MouseAdvancedFrame = var449
		gameSettingsTab.MouseAdvancedLabel = var450
		gameSettingsTab.MouseAdvancedEntry = var451
		gameSettingsTab.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
		t_7[gameSettingsTab.MouseAdvancedFrame] = true
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		gameSettingsTab.MouseAdvancedLabel.ZIndex = 2
		gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
		local var452 = create("TextBox")({
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
			Parent = var452
		})
		
		local _ = function(value) --[[ line: 2731 | named "setMouseSensitivityText" ]]
			-- upvalues: var452 (ref)
			var452.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
		end
		
		var452.Text = tostring(tonumber(string.format("%.3f", math.floor(gameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))
		local x = gameSettings.MouseSensitivityFirstPerson.X
		gameSettingsTab.MouseAdvancedEntry:SetValue(if x <= 0.2 then 0 else x <= 1 and math.floor((x - 0.2) / 0.16 + 0.5) or math.floor((x + 2) / 0.6 + 0.5))
		
		function clampMouseSensitivity(value) --[[ line: 2746 ]]
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
		
		function setMouseSensitivity(value, p73) --[[ line: 2764 ]]
			-- upvalues: var448 (write), setCameraSensitivity (copy), gameSettingsTab (copy), var452 (ref)
			if not var448 then return end
			setCameraSensitivity(value)
			var448 = false
			
			if p73 ~= gameSettingsTab.MouseAdvancedEntry then
				gameSettingsTab.MouseAdvancedEntry:SetValue(if value <= 0.2 then 0 else value <= 1 and math.floor((value - 0.2) / 0.16 + 0.5) or math.floor((value + 2) / 0.6 + 0.5))
			end
			var452.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
			var448 = true
		end
		
		var452.FocusLost:connect(function() --[[ line: 2782 ]]
			-- upvalues: gameSettingsTab (copy), var452 (ref), gameSettings (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
			local var454 = tonumber(string.match(var452.Text, "([%d%.]+)"))
			
			if var454 then
				setMouseSensitivity(clampMouseSensitivity(var454), var452)
				
				return
			end
			setMouseSensitivity(gameSettings.MouseSensitivityFirstPerson.X, var452)
		end)
		var452.Focused:connect(function() --[[ line: 2794 ]]
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(false)
		end)
		gameSettingsTab.MouseAdvancedEntry.ValueChanged:connect(function(p74) --[[ line: 2798 ]]
			-- upvalues: gameSettingsTab (copy)
			local var455 = clampMouseSensitivity(p74)
			local var456 = if var455 <= 5 then 0.16 * var455 + 0.2 else 0.6 * var455 - 2
			setMouseSensitivity(if var456 <= 0.2 then 0.2 else var456, gameSettingsTab.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions() --[[ line: 2805 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (ref)
		local function _(p75) --[[ line: 2810 | named "translateEngineGamepadSensitivityToGui" ]]
			return if p75 <= 0.2 then 0 else p75 <= 1 and math.floor((p75 - 0.2) / 0.16 + 0.5) or math.floor((p75 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p76) --[[ line: 2817 | named "translateGuiGamepadSensitivityToEngine" ]]
			local var460 = if p76 <= 5 then 0.16 * p76 + 0.2 else 0.6 * p76 - 2
			
			return if var460 <= 0.2 then 0.2 else var460
		end
		
		local gamepadCameraSensitivity = gameSettings.GamepadCameraSensitivity
		local var457, var458, var459 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, if gamepadCameraSensitivity <= 0.2 then 0 else gamepadCameraSensitivity <= 1 and math.floor((gamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((gamepadCameraSensitivity + 2) / 0.6 + 0.5))
		gameSettingsTab.GamepadSensitivityFrame = var457
		gameSettingsTab.GamepadSensitivityLabel = var458
		gameSettingsTab.GamepadSensitivitySlider = var459
		gameSettingsTab.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		gameSettingsTab.GamepadSensitivitySlider.ValueChanged:connect(function(p77) --[[ line: 2832 ]]
			-- upvalues: setCameraSensitivity (copy)
			local var461 = if p77 <= 5 then 0.16 * p77 + 0.2 else 0.6 * p77 - 2
			setCameraSensitivity(if var461 <= 0.2 then 0.2 else var461)
		end)
	end
	
	local function createOverscanOption() --[[ line: 2837 ]]
		-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), runService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local adjustButton, adjustButton_1, adjustButton_2 = utilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function() --[[ line: 2838 ]]
			-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			local _ = nil
			local var467 = require(robloxGui.Modules.Settings.Components.OverscanWrapper)(require(robloxGui.Modules.Shell.Components.Overscan10ft.Overscan))
			local roactModule = require(corePackagesService.Packages.Roact)
			local var469 = nil
			local t = {
				onUnmount = function() --[[ line: 2849 ]]
					-- upvalues: var469 (write), roactModule (ref), contextActionService (copy), settingsHubModule (ref)
					if var469 then
						roactModule.unmount(var469)
						contextActionService:UnbindCoreAction("RbxStopOverscanMovement")
						settingsHubModule:SetVisibility(true, true)
					end
				end,
				ImageVisible = false,
				BackgroundTransparency = 0.2
			}
			settingsHubModule:SetVisibility(false, true)
			contextActionService:BindCoreAction("RbxStopOverscanMovement", function() --[[ line: 2865 ]] end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			local _ = nil
			var469 = roactModule.mount(roactModule.createElement(var467, t), robloxGui, tostring(var467))
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
		local var465 = utilityModule:AddNewRowObject(gameSettingsTab, "Safe Zone", adjustButton)
		var465.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
		adjustButton_2(var465)
	end
	
	local function createDeveloperConsoleOption() --[[ line: 2904 ]]
		-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), runService (copy), playerPermissionsModule (copy), playersService (copy)
		local function makeDevConsoleOption() --[[ line: 2906 ]]
			-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (copy), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local function onOpenDevConsole() --[[ line: 2907 ]]
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
				local var476 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton, nil, true)
				var476.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				devConsoleButton_2(var476)
				
				return
			end
			local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, gameSettingsTab)
			devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
			devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
			devConsoleButton.Position = UDim2.new(1, -400, 0.5, 0)
			devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
			local var480 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton)
			var480.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			devConsoleButton_2(var480)
		end
		
		if runService:IsStudio() then
			makeDevConsoleOption()
			
			return
		end
		spawn(function() --[[ line: 2959 ]]
			-- upvalues: playerPermissionsModule (copy), playersService (copy), makeDevConsoleOption (ref)
			if playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer) then
				makeDevConsoleOption()
			end
		end)
	end
	
	local function createUiToggleOptions() --[[ line: 2968 ]]
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), guiService (copy), localPlayer (copy)
		if not userFreecamGuiDestabilization and not userShowGuiHideToggles then
			local var493, var494, var495 = utilityModule:AddNewRow(gameSettingsTab, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			gameSettingsTab.uiToggleRow = var493
			gameSettingsTab.uiToggleFrame = var494
			gameSettingsTab.uiToggleSelector = var495
			gameSettingsTab.uiToggleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiToggleRow
			gameSettingsTab.uiToggleSelector.IndexChanged:connect(function(_) --[[ line: 3037 ]]
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
		local var484 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var485 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		gameSettingsTab.uiToggleSelectors = {}
		
		for i, v in list do
			local var489 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = v.label })
			local var490, var491, var492 = utilityModule:AddNewRow(gameSettingsTab, var489, "Selector", { var484, var485 }, 1)
			var490.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v.layoutOrderKey]
			var492.IndexChanged:Connect(function(p78) --[[ line: 2996 ]]
				-- upvalues: guiService (copy), v (ref)
				if (if guiService:GetGuiIsVisible(v.type) then 1 else 2) ~= p78 then
					guiService:ToggleGuiIsVisibleIfAllowed(v.type)
				end
			end)
			gameSettingsTab.uiToggleSelectors[v.label] = {
				label = var489,
				type = v.type,
				row = var490,
				frame = var491,
				selector = var492
			}
		end
		local var486, var487, var488 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { var485, var484 }, 1)
		gameSettingsTab.freecamRow = var486
		gameSettingsTab.freecamFrame = var487
		gameSettingsTab.freecamSelector = var488
		gameSettingsTab.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
		gameSettingsTab.freecamSelector.IndexChanged:Connect(function(p79) --[[ line: 3018 ]]
			-- upvalues: localPlayer (copy)
			local var496 = p79 == 2
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				freecamScript:SetAttribute("FreecamEnabled", var496)
				
				return
			end
			warn("Freecam not present")
		end)
	end
	
	local function updateUiToggleSelection() --[[ line: 3043 ]]
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), gameSettingsTab (ref), guiService (copy), localPlayer (copy)
		if userFreecamGuiDestabilization or userShowGuiHideToggles then
			if not gameSettingsTab.uiToggleSelectors then return end
			for i, v in gameSettingsTab.uiToggleSelectors do
				local var499 = if guiService:GetGuiIsVisible(v.type) then 1 else 2
				
				if var499 ~= v.selector:GetSelectedIndex() then
					v.selector:SetSelectionIndex(var499)
				end
			end
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				gameSettingsTab.freecamSelector:SetSelectionIndex(if freecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not gameSettingsTab.uiToggleSelector then return end
		local var500 = if guiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if var500 == gameSettingsTab.uiToggleSelector:GetSelectedIndex() then return end
		gameSettingsTab.uiToggleSelector:SetSelectionIndex(var500)
	end
	
	local _ = function(p80, p81, p82) --[[ line: 3085 | named "isValidDeviceList" ]]
		return p80 and (p81 and (p82 and (#p80 > 0 and (p82 > 0 and (p82 <= #p80 and #p80 == #p81)))))
	end
	
	local _ = function(p83, p84) --[[ line: 3098 | named "SwitchOutputDevice" ]]
		-- upvalues: soundService (copy), name (copy)
		soundService:SetOutputDevice(p83, p84)
		name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", p83, p84)
	end
	
	local function createDeviceOptions(p85) --[[ line: 3103 ]]
		-- upvalues: gameSettingsTab (ref), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFIntVoiceChatDeviceChangeDebounceDelayModule (copy), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
		local var501 = gameSettingsTab[p85 .. "DeviceIndex"] or 0
		local var502 = gameSettingsTab[p85 .. "DeviceNames"] or {}
		local var503 = gameSettingsTab[p85 .. "DeviceGuids"] or {}
		local var504 = p85 == "Input" and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local var505 = gameSettingsTab
		local text = p85 .. "DeviceFrame"
		local text_1 = p85 .. "DeviceSelector"
		local var508, var509, var510 = utilityModule:AddNewRow(gameSettingsTab, var504, "Selector", var502, var501)
		var505[text] = var508
		_ = var509
		gameSettingsTab[text_1] = var510
		gameSettingsTab[p85 .. "DeviceFrame"].LayoutOrder = if p85 == "Input" then SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput else SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		gameSettingsTab[p85 .. "DeviceInfo"] = {
			Name = if var501 > 0 then var502[var501] else nil,
			Guid = if var501 > 0 then var503[var501] else nil
		}
		gameSettingsTab[p85 .. "PrevDeviceName"] = gameSettingsTab[p85 .. "DeviceInfo"].Name
		local var511 = 0
		local var512 = getFIntVoiceChatDeviceChangeDebounceDelayModule()
		gameSettingsTab[p85 .. "DeviceSelector"].IndexChanged:connect(function(p86) --[[ line: 3126 ]]
			-- upvalues: gameSettingsTab (copy), p85 (ref), var511 (write), var512 (ref), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab[p85 .. "DeviceInfo"].Name == gameSettingsTab[p85 .. "DeviceNames"][p86] and gameSettingsTab[p85 .. "DeviceInfo"].Guid == gameSettingsTab[p85 .. "DeviceGuids"][p86] then return end
			local var513 = var511 + 1
			var511 = var513
			wait(var512)
			
			if var513 == var511 then
				var511 = 0
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
	
	local _ = function() --[[ line: 3168 | named "createBadgeVisibilityOptions" ]]
		-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
		spawn(function() --[[ line: 3169 ]]
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var514, var515, var516 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var514
			gameSettingsTab.badgeVisibleFrame = var515
			gameSettingsTab.badgeVisibleSelector = var516
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p87) --[[ line: 3183 ]]
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p87 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p87 == 1)
			end)
		end)
	end
	
	local function createChatModerationOptions() --[[ line: 3190 ]]
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), var20 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), signalsModule (copy), reportSettingsChangeForAnalytics (copy)
		local _ = {
			title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView",
			description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription",
			on = "InGame.CommonUI.Label.On",
			off = "InGame.CommonUI.Label.Off"
		}
		local var517, var518, var519 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			var20:Format("InGame.CommonUI.Label.Off"),
			var20:Format("InGame.CommonUI.Label.On")
		}, 1, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		gameSettingsTab.ChatModerationFrame = var517
		_ = var518
		gameSettingsTab.ChatModerationSelector = var519
		gameSettingsTab.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
		gameSettingsTab.ChatModerationFrame.Visible = false
		local chatModerationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		gameSettingsTab.ChatModerationDisposeEffect = signalsModule.createEffect(function(p88) --[[ line: 3214 ]]
			-- upvalues: gameSettingsTab (copy), chatModerationStore (ref)
			gameSettingsTab.ChatModerationFrame.Visible = chatModerationStore.getIsSettingVisible(p88)
			local var521 = if chatModerationStore.getIsSettingEnabled(p88) then 2 else 1
			
			if gameSettingsTab.ChatModerationSelector:GetSelectedIndex() ~= var521 then
				gameSettingsTab.ChatModerationSelector:SetSelectionIndex(var521)
			end
		end)
		gameSettingsTab.ChatModerationSelector.IndexChanged:connect(function(p89) --[[ line: 3223 ]]
			-- upvalues: chatModerationStore (ref), reportSettingsChangeForAnalytics (copy)
			local var522 = p89 == 2
			chatModerationStore.setIsSettingEnabled(var522)
			reportSettingsChangeForAnalytics("moderate_chat", not var522, var522)
		end)
		chatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions() --[[ line: 3232 ]]
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceAIRephraseSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy), expChatDebounceRephraseIndexSelection (copy), throttleFunctionCallModule (copy)
		local var523, var524, var525 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription"))
		gameSettingsTab.AIRephraseFrame = var523
		_ = var524
		gameSettingsTab.AIRephraseSelector = var525
		gameSettingsTab.AIRephraseFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AIRephraseFrame
		gameSettingsTab.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local var527 = getFIntDebounceAIRephraseSettingDelayModule()
		local var528 = var527 > 0
		local var529 = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.AIRephraseDisposeEffect = signalsModule.createEffect(function(p90) --[[ line: 3258 ]]
			-- upvalues: gameSettingsTab (copy), AIRephraseSettingStore (ref), var529 (write)
			gameSettingsTab.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p90)
			local var532 = if AIRephraseSettingStore.getIsSettingEnabled(p90) then 2 else 1
			
			if gameSettingsTab.AIRephraseSelector:GetSelectedIndex() ~= var532 then
				var529 = var532
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var532)
			end
		end)
		
		local var530 = function(p91) --[[ line: 3269 ]]
			-- upvalues: var529 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p91 == var529 then
				return
			end
			local var533 = p91 == 2
			task.spawn(function() --[[ line: 3275 ]]
				-- upvalues: textChatService (copy), var533 (ref), AIRephraseSettingStore (copy), var529 (copy), p91 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var533 then "Enabled" else "Disabled") then
					AIRephraseSettingStore.setIsSettingEnabled(var533)
					var529 = p91
					reportSettingsChangeForAnalytics("ai_rephrase", not var533, var533)
					
					return
				end
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var529)
			end)
		end
		
		if not expChatDebounceRephraseIndexSelection then
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(if var528 then throttleFunctionCallModule(var527, var530) else var530)
		elseif var528 then
			local var531 = nil
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(function(p92) --[[ line: 3292 ]]
				-- upvalues: var531 (write), var527 (ref), var529 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var531 then
					task.cancel(var531)
				end
				var531 = task.delay(var527, function() --[[ line: 3296 ]]
					-- upvalues: var531 (copy), p92 (ref), var529 (copy), textChatService (copy), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var531 = nil
					
					if p92 == var529 then
						return
					end
					local var534 = p92 == 2
					task.spawn(function() --[[ line: 3275 ]]
						-- upvalues: textChatService (copy), var534 (ref), AIRephraseSettingStore (copy), var529 (copy), p92 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var534 then "Enabled" else "Disabled") then
							AIRephraseSettingStore.setIsSettingEnabled(var534)
							var529 = p92
							reportSettingsChangeForAnalytics("ai_rephrase", not var534, var534)
							
							return
						end
						gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var529)
					end)
				end)
			end)
		else
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(var530)
		end
	end
	
	local function createChatSummariesSettingOptions() --[[ line: 3309 ]]
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceChatSummariesSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy)
		local var535, var536, var537 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription"))
		gameSettingsTab.ChatSummariesFrame = var535
		_ = var536
		gameSettingsTab.ChatSummariesSelector = var537
		gameSettingsTab.ChatSummariesFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatSummariesFrame
		gameSettingsTab.ChatSummariesFrame.Visible = false
		local chatSummariesSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local var539 = getFIntDebounceChatSummariesSettingDelayModule()
		local var540 = var539 > 0
		local var541 = if chatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.ChatSummariesDisposeEffect = signalsModule.createEffect(function(p93) --[[ line: 3335 ]]
			-- upvalues: gameSettingsTab (copy), chatSummariesSettingStore (ref), var541 (write)
			gameSettingsTab.ChatSummariesFrame.Visible = chatSummariesSettingStore.getIsSettingVisible(p93)
			local var544 = if chatSummariesSettingStore.getIsSettingEnabled(p93) then 2 else 1
			
			if gameSettingsTab.ChatSummariesSelector:GetSelectedIndex() ~= var544 then
				var541 = var544
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var544)
			end
		end)
		
		local var542 = function(p94) --[[ line: 3346 ]]
			-- upvalues: var541 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p94 == var541 then
				return
			end
			local var545 = p94 == 2
			task.spawn(function() --[[ line: 3352 ]]
				-- upvalues: textChatService (copy), var545 (ref), chatSummariesSettingStore (copy), var541 (copy), p94 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var545 then "Enabled" else "Disabled") then
					chatSummariesSettingStore.setIsSettingEnabled(var545)
					var541 = p94
					reportSettingsChangeForAnalytics("chat_summaries", not var545, var545)
					
					return
				end
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var541)
			end)
		end
		
		if var540 then
			local var543 = nil
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(function(p95) --[[ line: 3368 ]]
				-- upvalues: var543 (write), var539 (ref), var541 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var543 then
					task.cancel(var543)
				end
				var543 = task.delay(var539, function() --[[ line: 3372 ]]
					-- upvalues: var543 (copy), p95 (ref), var541 (copy), textChatService (copy), chatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var543 = nil
					
					if p95 == var541 then
						return
					end
					local var546 = p95 == 2
					task.spawn(function() --[[ line: 3352 ]]
						-- upvalues: textChatService (copy), var546 (ref), chatSummariesSettingStore (copy), var541 (copy), p95 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var546 then "Enabled" else "Disabled") then
							chatSummariesSettingStore.setIsSettingEnabled(var546)
							var541 = p95
							reportSettingsChangeForAnalytics("chat_summaries", not var546, var546)
							
							return
						end
						gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var541)
					end)
				end)
			end)
		else
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(var542)
		end
	end
	
	local function createChatNotificationsSettingOptions() --[[ line: 3382 ]]
		-- upvalues: corePackagesService (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
		local toastNotificationModule = require(corePackagesService.Workspace.Packages.ToastNotification)
		local default = toastNotificationModule.ToastNotificationSnoozeManager.default
		local notificationGroups = toastNotificationModule.NotificationGroups
		local toastNotificationTypeModule = toastNotificationModule.ToastNotificationTypeModule
		local notificationSnoozedSignal = toastNotificationModule.Signals.NotificationSnoozedSignal
		local notificationTypeEnum = toastNotificationTypeModule.NotificationTypeEnum
		local snoozeActionEnum = toastNotificationTypeModule.SnoozeActionEnum
		local t = { Off = 1, On = 2 }
		local var549 = robloxTranslatorModule:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications")
		local var550 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var551 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		
		local function _() --[[ line: 3400 | named "getSelectorIndex" ]]
			-- upvalues: default (ref), notificationTypeEnum (ref)
			return if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then 1 else 2
		end
		
		local var552 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
		local var553, var554, var555 = utilityModule:AddNewRow(gameSettingsTab, var549, "Selector", { var551, var550 }, var552)
		gameSettingsTab.ChatNotificationsFrame = var553
		_ = var554
		gameSettingsTab.ChatNotificationsSelector = var555
		gameSettingsTab.ChatNotificationsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatNotificationsFrame
		gameSettingsTab.ChatNotificationsSelector.IndexChanged:connect(function(p96) --[[ line: 3415 ]]
			-- upvalues: var552 (write), default (ref), notificationGroups (ref), reportSettingsChangeForAnalytics (copy)
			if p96 == var552 then return end
			local var556 = var552 == 2
			local var557 = p96 == 2
			var552 = p96
			
			if var557 then
				default:unmuteNotification({
					context = "InGameSettingsChatNotifications",
					notificationType = notificationGroups.ChatLandingNotificationsGroup
				})
			else
				default:snoozeNotification({
					durationMinutes = -1,
					context = "InGameSettingsChatNotifications",
					notificationType = notificationGroups.ChatLandingNotificationsGroup
				})
			end
			reportSettingsChangeForAnalytics("chat_notifications", var556, var557)
		end)
		notificationSnoozedSignal:connect(function(p97) --[[ line: 3441 ]]
			-- upvalues: notificationTypeEnum (ref), snoozeActionEnum (ref), gameSettingsTab (copy), var552 (write)
			if p97.notificationType ~= notificationTypeEnum.ChatNewMessage then return end
			local var558 = if p97.actionType == snoozeActionEnum.Mute then 1 else 2
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var558 then
				var552 = var558
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var558)
			end
		end)
		gameSettingsTab.Displayed.Event:Connect(function() --[[ line: 3456 ]]
			-- upvalues: default (ref), notificationTypeEnum (ref), t (ref), gameSettingsTab (copy), var552 (write)
			local var559 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var559 then
				var552 = var559
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var559)
			end
		end)
	end
	
	local function createCameraDeviceOptions() --[[ line: 3468 ]]
		-- upvalues: gameSettingsTab (ref), var88 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
		local cameraDeviceIndex = gameSettingsTab.CameraDeviceIndex or 1
		local cameraDeviceNames = gameSettingsTab.CameraDeviceNames or {}
		local cameraDeviceGuids = gameSettingsTab.CameraDeviceGuids or {}
		local var563, var564, var565 = utilityModule:AddNewRow(gameSettingsTab, var88, "Selector", cameraDeviceNames, cameraDeviceIndex)
		gameSettingsTab.CameraDeviceFrame = var563
		_ = var564
		gameSettingsTab.CameraDeviceSelector = var565
		gameSettingsTab.CameraDeviceFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraDeviceFrame
		gameSettingsTab.CameraDeviceInfo = {
			Name = if cameraDeviceIndex > 0 then cameraDeviceNames[cameraDeviceIndex] else nil,
			Guid = if cameraDeviceIndex > 0 then cameraDeviceGuids[cameraDeviceIndex] else nil
		}
		gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		gameSettingsTab.CameraDeviceSelector.IndexChanged:connect(function(p98) --[[ line: 3485 ]]
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
	
	local function updateAudioDevices(p99) --[[ line: 3510 ]]
		-- upvalues: soundService (copy), var20 (copy), gameSettingsTab (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy), createDeviceOptions (ref)
		local ok, status, var566, var567 = pcall(function() --[[ line: 3511 ]]
			-- upvalues: p99 (ref), soundService (copy)
			return if p99 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var566 and (var567 and (#status > 0 and (var567 > 0 and (var567 <= #status and #status == #var566)))))) then
			if var566[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p99 .. "DeviceNames"] = status
			gameSettingsTab[p99 .. "DeviceGuids"] = var566
			gameSettingsTab[p99 .. "DeviceIndex"] = var567
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} device info", p99)
		end
		gameSettingsTab[p99 .. "DeviceNames"] = {}
		gameSettingsTab[p99 .. "DeviceGuids"] = {}
		gameSettingsTab[p99 .. "DeviceIndex"] = 0
		if gameSettingsTab[p99 .. "DeviceSelector"] then
			gameSettingsTab[p99 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p99 .. "DeviceSelector"]:SetSelectionIndex(var567)
			
			return
		end
		createDeviceOptions(p99)
	end
	
	local function updateVoiceChatDevices(p100) --[[ line: 3543 ]]
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), soundService (copy), var20 (copy), gameSettingsTab (ref), createDeviceOptions (ref)
		if p100 ~= "Input" and p100 ~= "Output" and getFFlagVoiceChatUILoggingModule() then
			name:warning("{} is not supported in VoiceChat devices", p100)
		end
		local ok, status, var568, var569 = pcall(function() --[[ line: 3550 ]]
			-- upvalues: p100 (ref), soundService (copy)
			return if p100 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var568 and (var569 and (#status > 0 and (var569 > 0 and (var569 <= #status and #status == #var568)))))) then
			if var568[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p100 .. "DeviceNames"] = status
			gameSettingsTab[p100 .. "DeviceGuids"] = var568
			gameSettingsTab[p100 .. "DeviceIndex"] = var569
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
			gameSettingsTab[p100 .. "DeviceSelector"]:SetSelectionIndex(var569)
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
	
	local function updateCameraDevices() --[[ line: 3602 ]]
		-- upvalues: videoCaptureService (copy), var87 (copy), userGameSettingsService (copy), gameSettingsTab (ref), createCameraDeviceOptions (ref)
		local cameraDevices = videoCaptureService:GetCameraDevices()
		local t = {}
		local t_1 = {}
		local var573 = 1
		table.insert(t, var87)
		table.insert(t_1, "{DefaultDeviceGuid}")
		
		for i, v in pairs(cameraDevices) do
			if i == userGameSettingsService.DefaultCameraID then
				var573 = #t + 1
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
		gameSettingsTab.CameraDeviceSelector:SetSelectionIndex(var573)
	end
	
	local var162 = nil
	local var163 = nil
	
	local function updateAudioOptions() --[[ line: 3632 ]]
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
	
	local _ = function() --[[ line: 3644 | named "setupDeviceChangedListener" ]]
		-- upvalues: soundService (copy), var162 (write), gameSettingsTab (ref), updateAudioOptions (ref)
		if soundService.DeviceListChanged then
			var162 = soundService.DeviceListChanged:Connect(function() --[[ line: 3646 ]]
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function() --[[ line: 3654 | named "setupVideoCameraDeviceChangedListener" ]]
		-- upvalues: videoCaptureService (copy), var163 (write), gameSettingsTab (ref), updateCameraDevices (ref)
		if videoCaptureService.DevicesChanged then
			var163 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3656 ]]
				-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
				if gameSettingsTab.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function() --[[ line: 3664 | named "teardownDeviceChangedListener" ]]
		-- upvalues: soundService (copy), var162 (write)
		if soundService.DeviceListChanged and var162 then
			var162:Disconnect()
		end
	end
	
	local _ = function() --[[ line: 3670 | named "teardownVideoCameraDeviceChangedListener" ]]
		-- upvalues: videoCaptureService (copy), var163 (write)
		if videoCaptureService.DevicesChanged and var163 then
			var163:Disconnect()
			var163 = nil
		end
	end
	
	local _ = function() --[[ line: 3678 | named "checkVoiceChatOptions" ]]
		-- upvalues: default_2 (copy), gameSettingsTab (ref)
		if default_2:VoiceChatAvailable() then
			gameSettingsTab.VoiceChatOptionsEnabled = true
		end
	end
	
	local _ = function() --[[ line: 3684 | named "updateInputDeviceVisibility" ]]
		-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy)
		local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
		
		if gameSettingsTab.InputDeviceFrame then
			gameSettingsTab.InputDeviceFrame.Visible = voiceChatOptionsEnabled
		end
	end
	
	local var165 = false
	local var166 = if differentiateVoiceSelectorSystemAndUser then false else nil
	
	local function createVoiceChatSelector() --[[ line: 3697 ]]
		-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (ref), enableVoiceSelectorTranslationsAEGIS2 (copy), var20 (copy), default_2 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), differentiateVoiceSelectorSystemAndUser (copy), getFIntDebounceDisconnectButtonDelayModule (copy), var166 (write), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var165 (write), throttleFunctionCallModule (copy), voiceChatSelectorReconnectFocus2AEGIS2 (copy), guiService (copy), debounceVoiceSelectorIndexChange (copy), deferProgrammaticChange (copy)
		if voiceSelectorAvailableAfterFae and gameSettingsTab.VoiceConnectDisconnectFrame and gameSettingsTab.VoiceConnectDisconnectSelector then return end
		local var575 = "Voice Chat"
		local var576 = "Disconnected"
		local var577 = "Connected"
		
		if enableVoiceSelectorTranslationsAEGIS2 then
			var575 = var20:Format("Feature.GameDetails.Label.VoiceChat")
			var576 = var20:Format("Feature.SettingsHub.Label.Disconnected")
			var577 = var20:Format("Feature.SettingsHub.Label.Connected")
		end
		local var578 = if default_2:VoiceChatEnded() then 1 else 2
		local var579 = gameSettingsTab
		local var580, var581, var582 = utilityModule:AddNewRow(gameSettingsTab, var575, "Selector", { var576, var577 }, var578)
		gameSettingsTab.VoiceConnectDisconnectFrame = var580
		_ = var581
		var579.VoiceConnectDisconnectSelector = var582
		gameSettingsTab.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectDisconnectSelector
		local service = default_2:getService()
		
		if service and not differentiateVoiceSelectorSystemAndUser then
			service.StateChanged:Connect(function(p101, p102) --[[ line: 3722 ]]
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
		local var584 = var578
		local var585 = getFIntDebounceDisconnectButtonDelayModule()
		
		local var586 = function(p103) --[[ line: 3756 ]]
			-- upvalues: var584 (write), differentiateVoiceSelectorSystemAndUser (copy), var166 (copy), fFlagVoiceRewarmTelemetry (copy), default_2 (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var165 (copy), gameSettingsTab (copy)
			if p103 == var584 then return end
			var584 = p103
			
			if differentiateVoiceSelectorSystemAndUser and var166 then return end
			if fFlagVoiceRewarmTelemetry then
				local var587, var588, var589, var590 = default_2:GetConnectDisconnectButtonAnalyticsData(p103 == 2)
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var587, var588, var589, var590, default_2.joinVoiceButtonContext)
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
			if var165 then
				task.spawn(function() --[[ line: 3800 ]]
					-- upvalues: p103 (ref), gameSettingsTab (copy)
					task.wait(0.5)
					
					if p103 ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		gameSettingsTab.VoiceConnectDisconnectSelector.IndexChanged:connect(if var585 > 0 then throttleFunctionCallModule(var585, var586) else var586)
		
		if voiceChatSelectorReconnectFocus2AEGIS2 then
			gameSettingsTab.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p104, p105) --[[ line: 3814 ]]
				-- upvalues: var575 (write), gameSettingsTab (copy), guiService (copy)
				if p105 and p104 and (p104.Parent and p104.Parent.Name == var575 .. "Frame") and (p105.Name == "ImageButton" and gameSettingsTab.Active) then
					guiService.SelectedCoreObject = p104
				end
			end)
		end
		default_2:subscribe("OnStateChanged", function(_, p106) --[[ line: 3821 ]]
			-- upvalues: differentiateVoiceSelectorSystemAndUser (copy), var166 (copy), debounceVoiceSelectorIndexChange (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			if differentiateVoiceSelectorSystemAndUser then
				var166 = true
				
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
					task.defer(function() --[[ line: 3853 ]]
						-- upvalues: var166 (copy)
						var166 = false
					end)
					
					return
				end
				var166 = false
			end
		end)
		default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ line: 3862 ]]
			-- upvalues: var165 (copy), differentiateVoiceSelectorSystemAndUser (copy), var166 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			task.spawn(function() --[[ line: 3863 ]]
				-- upvalues: var165 (copy), differentiateVoiceSelectorSystemAndUser (copy), var166 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
				task.wait(0.5)
				var165 = true
				
				if differentiateVoiceSelectorSystemAndUser then
					var166 = true
				end
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if differentiateVoiceSelectorSystemAndUser then
					if deferProgrammaticChange then
						task.defer(function() --[[ line: 3872 ]]
							-- upvalues: var166 (copy)
							var166 = false
						end)
						
						return
					end
					var166 = false
				end
			end)
		end)
	end
	
	local function createVoiceConnectDisconnect() --[[ line: 3883 ]]
		-- upvalues: default_2 (copy), var20 (copy), getFIntDebounceDisconnectButtonDelayModule (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), utilityModule (copy), throttleFunctionCallModule (copy), gameSettingsTab (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy)
		if default_2:IsSeamlessVoice() and not default_2.isShowingFTUX then
			local _ = nil
			local _ = nil
			local _ = nil
			local _ = nil
			local var592 = var20:Format("Feature.GameDetails.Label.VoiceChat")
			local var593 = var20:Format("Feature.SettingsHub.Label.Connect")
			local var594 = var20:Format("Feature.SettingsHub.Label.Disconnect")
			local var595 = getFIntDebounceDisconnectButtonDelayModule()
			local var596 = var595 > 0
			
			local var597 = function() --[[ line: 3893 ]]
				-- upvalues: default_2 (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy)
				local var611
				if default_2:getService() then
					var611 = nil
					var611 = default_2:getService().StateChanged:Connect(function(_, p107) --[[ line: 3897 ]]
						-- upvalues: fFlagVoiceRewarmTelemetry (copy), default_2 (copy), var611 (write)
						if p107 == Enum.VoiceChatState.Joined then
							if fFlagVoiceRewarmTelemetry then
								local var615, var616, var617, var618 = default_2:GetConnectDisconnectButtonAnalyticsData(true)
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var615, var616, var617, var618, default_2.joinVoiceButtonContext)
							else
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							var611:Disconnect()
						end
					end)
				elseif fFlagVoiceRewarmTelemetry then
					var611, var612, var613, var614 = default_2:GetConnectDisconnectButtonAnalyticsData(false)
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var611, var612, var613, var614, default_2.joinVoiceButtonContext)
				else
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			end
			
			local var598 = function() --[[ line: 3930 ]]
				-- upvalues: default_2 (copy), constantsModule_1 (copy)
				default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			
			local voiceConnectButton, voiceConnectButton_1, voiceConnectButton_2 = utilityModule:MakeStyledButton("VoiceConnectButton", var593, UDim2.new(1, 0, 1, -20), if var596 then throttleFunctionCallModule(var595, var597) else var597, gameSettingsTab)
			voiceConnectSetRowRef = voiceConnectButton_2
			local var602 = voiceConnectButton
			local var603 = voiceConnectButton_1
			local voiceDisconnectButton, voiceDisconnectButton_1, voiceDisconnectButton_2 = utilityModule:MakeStyledButton("VoiceDisconnectButton", var594, UDim2.new(1, 0, 1, -20), if var596 then throttleFunctionCallModule(var595, var598) else var598, gameSettingsTab)
			voiceDisconnectSetRowRef = voiceDisconnectButton_2
			local var607 = voiceDisconnectButton
			local var608 = voiceDisconnectButton_1
			var602.Size = UDim2.new(0.6, 0, 0, 40)
			var602.Position = UDim2.new(0.4, 0, 0.5, 0)
			var602.AnchorPoint = Vector2.new(0, 0.5)
			var602.ZIndex = 2
			var602.Selectable = true
			var603.ZIndex = 2
			var607.Size = UDim2.new(0.6, 0, 0, 40)
			var607.Position = UDim2.new(0.4, 0, 0.5, 0)
			var607.AnchorPoint = Vector2.new(0, 0.5)
			var607.ZIndex = 2
			var607.Selectable = true
			var608.ZIndex = 2
			local var609 = utilityModule:AddNewRowObject(gameSettingsTab, var592, var602, nil, true)
			local var610 = utilityModule:AddNewRowObject(gameSettingsTab, var592, var607, nil, true)
			gameSettingsTab.VoiceConnectFrame = var609
			gameSettingsTab.VoiceDisconnectFrame = var610
			var609.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			var610.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(var609)
			voiceDisconnectSetRowRef(var610)
			
			if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				var609.Visible = false
				var610.Visible = false
				
				return
			elseif default_2:ShouldShowJoinVoice() then
				var609.Visible = true
				var610.Visible = false
				
				return
			end
			var609.Visible = false
			var610.Visible = true
		end
	end
	
	local function createVRComfortSettingOptions() --[[ line: 3993 ]]
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
		local var622, var623, var624 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", t_1, table.find(enumItems, gameSettings.VRComfortSetting), nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		gameSettingsTab.VRComfortSettingFrame = var622
		gameSettingsTab.VRComfortSettingLabel = var623
		gameSettingsTab.VRComfortSettingSelector = var624
		gameSettingsTab.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame
		local var625, var626, var627 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VignetteEnabled then 1 else 2)
		gameSettingsTab.VRVignetteEnabledFrame = var625
		gameSettingsTab.VRVignetteEnabledLabel = var626
		gameSettingsTab.VRVignetteEnabledSelector = var627
		gameSettingsTab.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame
		local var628, var629, var630 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRSmoothRotationEnabled then 2 else 1)
		gameSettingsTab.VRSteppedRotationEnabledFrame = var628
		gameSettingsTab.VRSteppedRotationEnabledLabel = var629
		gameSettingsTab.VRSteppedRotationEnabledSelector = var630
		gameSettingsTab.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame
		local var631, var632, var633 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame = var631
		gameSettingsTab.VRThirdPersonFixedCamEnabledLabel = var632
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector = var633
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame
		
		local var634 = function(p108) --[[ line: 4059 ]]
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
		
		gameSettingsTab.VRComfortSettingSelector.IndexChanged:connect(function(p109) --[[ line: 4083 ]]
			-- upvalues: enumItems (ref), gameSettings (copy), var634 (ref)
			local var635 = enumItems[p109]
			gameSettings.VRComfortSetting = var635
			var634(var635)
		end)
		var634(gameSettings.VRComfortSetting)
		gameSettingsTab.VRVignetteEnabledSelector.IndexChanged:connect(function(p110) --[[ line: 4090 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VignetteEnabledCustomOption = p110 == 1
			end
		end)
		gameSettingsTab.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p111) --[[ line: 4096 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRSmoothRotationEnabledCustomOption = p111 == 2
			end
		end)
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p112) --[[ line: 4102 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRThirdPersonFollowCamEnabledCustomOption = p112 == 2
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ line: 4108 ]]
			-- upvalues: enumItems (ref), gameSettings (copy), gameSettingsTab (copy)
			local index = table.find(enumItems, gameSettings.VRComfortSetting)
			
			if gameSettingsTab.VRComfortSettingSelector:GetSelectedIndex() ~= index then
				gameSettingsTab.VRComfortSettingSelector:SetSelectionIndex(index)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ line: 4115 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var637 = if gameSettings.VignetteEnabled then 1 else 2
			
			if gameSettingsTab.VRVignetteEnabledSelector:GetSelectedIndex() ~= var637 then
				gameSettingsTab.VRVignetteEnabledSelector:SetSelectionIndex(var637)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ line: 4122 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var638 = if gameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if gameSettingsTab.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= var638 then
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetSelectionIndex(var638)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ line: 4129 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var639 = if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= var639 then
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(var639)
			end
		end)
	end
	
	local function createVRSafetyBubbleModeOptions() --[[ line: 4137 ]]
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
		task.defer(function() --[[ line: 4153 ]]
			-- upvalues: gameSettingsTab (copy), utilityModule (copy), var20 (copy), t_1 (ref), index (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), enumItems (ref), gameSettings (copy)
			local var644, var645, var646 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", t_1, index, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			gameSettingsTab.VRSafetyBubbleModeFrame = var644
			gameSettingsTab.VRSafetyBubbleModeLabel = var645
			gameSettingsTab.VRSafetyBubbleModeSelector = var646
			gameSettingsTab.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSafetyBubbleModeFrame
			gameSettingsTab.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p113) --[[ line: 4166 ]]
				-- upvalues: enumItems (copy), gameSettings (copy)
				gameSettings.VRSafetyBubbleMode = enumItems[p113]
			end)
			gameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ line: 4171 ]]
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
	local var171 = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (getFFlagEnableVrVoiceConnectDisconnect() or (if isInExperienceUIVREnabled then not isSpatial() else true)) then
		spawn(function() --[[ line: 4185 ]]
			-- upvalues: getFFlagEnableVoiceUxUpdates (copy), hideVoiceChatSelectorForFaeAEGIS2 (copy), default_2 (copy), createVoiceChatSelector (ref), isVoiceFocused (copy), gameSettingsTab (ref), observeIsVoiceFocused (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), voiceVolumeControlsEligibility (copy), name (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var166 (write), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (ref), default_3 (copy), t_4 (copy), getFFlagVoiceChatUILoggingModule (copy)
			if getFFlagEnableVoiceUxUpdates() and (not hideVoiceChatSelectorForFaeAEGIS2 and default_2:EligibleForFaeUpsell() or default_2:IsSeamlessVoice()) and default_2:verifyUniverseAndPlaceCanUseVoice() then
				createVoiceChatSelector()
				
				if isVoiceFocused() and gameSettingsTab.VoiceConnectDisconnectFrame then
					gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
				end
				observeIsVoiceFocused(function(p114) --[[ line: 4195 ]]
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
			default_2:asyncInit():andThen(function() --[[ line: 4208 ]]
				-- upvalues: default_2 (copy), gameSettingsTab (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), voiceVolumeControlsEligibility (copy), name (copy), observeIsVoiceFocused (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableVoiceUxUpdates (copy), createVoiceChatSelector (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var166 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (copy), default_3 (copy), t_4 (copy)
				VoiceChatService = default_2:getService()
				
				if default_2:VoiceChatAvailable() then
					gameSettingsTab.VoiceChatOptionsEnabled = true
				end
				if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and gameSettingsTab.VoiceChatVolumeFrame then
					local function _(p115) --[[ line: 4212 | named "updateVoiceChatVolumeVisibility" ]]
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
						local ok, status = pcall(function() --[[ line: 4213 ]]
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), p115 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
							local voiceChatService = game:GetService("VoiceChatService")
							local service = default_2:getService()
							gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then p115 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
						end)
						
						if not ok then
							name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
						end
					end
					
					local var648 = nil
					local ok, status = pcall(function() --[[ line: 4213 ]]
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var648 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
						local voiceChatService = game:GetService("VoiceChatService")
						local service = default_2:getService()
						gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var648 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
					end)
					
					if not ok then
						name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
					end
					if voiceVolumeControlsSuppressInExperienceUiForPartyVoice and getFFlagEnableCrossExpVoice() and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						observeIsVoiceFocused(function() --[[ line: 4241 ]]
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local var653 = nil
							local ok, status = pcall(function() --[[ line: 4213 ]]
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
					if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then
						default_2:subscribe("OnStateChanged", function(_, p116) --[[ line: 4246 ]]
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local ok, status = pcall(function() --[[ line: 4213 ]]
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
							service.StateChanged:Connect(function() --[[ line: 4252 ]]
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
								local var654 = nil
								local ok, status = pcall(function() --[[ line: 4213 ]]
									-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var654 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
									local voiceChatService = game:GetService("VoiceChatService")
									local service = default_2:getService()
									gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var654 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
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
						var166 = true
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function() --[[ line: 4290 ]]
							-- upvalues: var166 (copy)
							var166 = false
						end)
						
						return
					end
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				else
					local var650 = false
					
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
						createVoiceConnectDisconnect()
						
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							var650 = isVoiceFocused()
							observeIsVoiceFocused(function(p117) --[[ line: 4305 ]]
								-- upvalues: var650 (write), gameSettingsTab (copy), default_2 (copy)
								var650 = p117
								
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
							gameSettingsTab.VoiceDisconnectFrame.Visible = not var650
						else
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end
					default_2.showVoiceUI.Event:Connect(function() --[[ line: 4338 ]]
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var650 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var650 then return end
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
					default_2.hideVoiceUI.Event:Connect(function() --[[ line: 4356 ]]
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var650 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var650 then return end
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
			end):catch(function() --[[ line: 4376 ]]
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
		local eventConnection = default_3.ExperienceJoined.Event:Connect(function() --[[ line: 4389 ]]
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		local eventConnection_1 = default_3.ExperienceLeft.Event:Connect(function() --[[ line: 4392 ]]
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		
		var171 = function() --[[ line: 4395 ]]
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
	local var174 = nil
	
	local _ = function() --[[ line: 4409 ]]
		-- upvalues: var174 (write)
		if var174 then
			var174:disconnect()
			var174 = nil
		end
	end
	
	if getFFlagSelfViewCameraSettings() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local var175 = function(p118) --[[ line: 4417 ]]
			-- upvalues: gameSettingsTab (ref)
			gameSettingsTab.VideoOptionsEnabled = p118.hasCameraPermissions
		end
		
		if isCamEnabledForUserAndPlaceModule() then
			getCamMicPermissionsModule(var175, { default.Permissions.CAMERA_ACCESS }, true)
			var174 = cameraDevicePermissionGrantedSignalModule:connect(function() --[[ line: 4433 ]]
				-- upvalues: gameSettingsTab (ref), updateCameraDevices (ref), videoCaptureService (copy), var163 (write)
				gameSettingsTab.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if videoCaptureService.DevicesChanged then
					var163 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3656 ]]
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
		createCameraModeOptions(not var84 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
	end
	local changedConnection
	local _ = function() --[[ line: 4449 ]]
		-- upvalues: gameSettings (copy), createGamepadOptions (ref)
		if gameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		end
		local var659 = nil
		var659 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4455 ]]
			-- upvalues: gameSettings (copy), var659 (write), createGamepadOptions (copy)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if var659 then
					var659:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	
	if userInputService.MouseEnabled then
		createMouseOptions()
	elseif not userInputService.GamepadEnabled then
		changedConnection = nil
		changedConnection = userInputService.GamepadConnected:connect(function() --[[ line: 4473 ]]
			-- upvalues: changedConnection (write), gameSettings (copy), createGamepadOptions (ref)
			if changedConnection then
				changedConnection:disconnect()
			end
			if gameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()
				
				return
			end
			local var660 = nil
			var660 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4455 ]]
				-- upvalues: gameSettings (copy), var660 (write), createGamepadOptions (copy)
				if gameSettings.IsUsingGamepadCameraSensitivity then
					if var660 then
						var660:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end)
	elseif gameSettings.IsUsingGamepadCameraSensitivity then
		createGamepadOptions()
	else
		changedConnection = nil
		changedConnection = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4455 ]]
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
			changedConnection = gameSettings.Changed:connect(function(p119) --[[ line: 4487 ]]
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
			createCameraModeOptions(not var84 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
			
			if gameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				changedConnection = nil
				changedConnection = gameSettings.Changed:connect(function(p120) --[[ line: 4516 ]]
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
		gameSettingsTab.Displayed.Event:Connect(function() --[[ line: 4539 ]]
			-- upvalues: changedConnection (write), gameSettingsTab (ref), default_2 (copy)
			changedConnection = true
			
			if gameSettingsTab.VoiceChatVolumeFrame and gameSettingsTab.VoiceChatVolumeFrame.Visible then
				default_2:RecordGameSettingsOpened()
			end
		end)
		gameSettingsTab.Hidden.Event:Connect(function() --[[ line: 4546 ]]
			-- upvalues: changedConnection (write)
			changedConnection = false
		end)
		gameSettingsTab.VoiceChatVolumeFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ line: 4550 ]]
			-- upvalues: gameSettingsTab (ref), changedConnection (write), default_2 (copy)
			if gameSettingsTab.VoiceChatVolumeFrame.Visible and changedConnection then
				default_2:RecordGameSettingsOpened()
			end
		end)
	end
	if var53 then
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
	if var91_1 then
		createMicroProfilerOptions()
	end
	if var84 and getAppFeaturePolicies().getSupportsOverscan() then
		createOverscanOption()
	end
	if showAntiHarassmentSettings and fFlagBadgeVisibilitySettingEnabled then
		spawn(function() --[[ line: 3169 ]]
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var514, var515, var516 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var514
			gameSettingsTab.badgeVisibleFrame = var515
			gameSettingsTab.badgeVisibleSelector = var516
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p121) --[[ line: 3183 ]]
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
	getHasGuiHidingPermissionModule(runService:IsStudio(), localPlayer, playerPermissionsModule):andThen(function(p123) --[[ line: 4615 ]]
		-- upvalues: createUiToggleOptions (ref)
		if p123 then
			createUiToggleOptions()
		end
	end):catch(function(p122) --[[ line: 4620 ]]
		warn(p122)
	end)
	var126 = true
	
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
	local _ = function() --[[ line: 4689 | named "staticFeedbackEntryPointChecksPassed" ]]
		-- upvalues: runService (copy), enableTFFeedbackModeEntryCheck (copy), var84 (copy)
		return if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false else enableTFFeedbackModeEntryCheck and var84
	end
	
	function gameSettingsTab.OpenSettingsPage() --[[ line: 4705 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), updateAudioOptions (ref), soundService (copy), var162 (write), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), getFFlagSelfViewCameraSettings (copy), updateCameraDevices (ref), videoCaptureService (copy), var163 (write), updateUiToggleSelection (ref), var17 (copy), var63 (copy), themeModule (copy), var62 (copy), fFlagIEMFocusNavToButtons (copy), getLastValueChangerFrame (copy), fFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		gameSettingsTab.PageOpen = true
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if getFFlagLazyInitiateExperienceLanguageSwitcherModule() and not gameSettingsTab.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and getFFlagEnableLocalesForExperienceLanguageSwitcherModule()) then
			gameSettingsTab.LanguageSwitcherInitialized = true
			experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if soundService.DeviceListChanged then
			var162 = soundService.DeviceListChanged:Connect(function() --[[ line: 3646 ]]
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
				var163 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3656 ]]
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
				gameSettingsTab.toggleFeedbackModeText.Text = var63
			else
				gameSettingsTab.toggleFeedbackModeButton.Active = false
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = false
				gameSettingsTab.toggleFeedbackModeText.TextColor3 = themeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				gameSettingsTab.toggleFeedbackModeText.Text = var62
			end
		end
		if fFlagIEMFocusNavToButtons then
			table.insert(gameSettingsTab.LastSelectableObjects, getLastValueChangerFrame(gameSettingsTab))
		end
		if fFlagIEMTabFocusNav then
			table.insert(gameSettingsTab.FirstSelectableObjects, getFirstValueChangerFrame(gameSettingsTab))
			gameSettingsTab.FirstSelectableObjectsUpdated:fire()
		end
	end
	
	function gameSettingsTab.CloseSettingsPage() --[[ line: 4776 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), soundService (copy), var162 (write), getFFlagEnableCrossExpVoice (copy), var171 (write), getFFlagSelfViewCameraSettings (copy), videoCaptureService (copy), var163 (write), var174 (write), default_2 (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy)
		gameSettingsTab.PageOpen = false
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if soundService.DeviceListChanged and var162 then
			var162:Disconnect()
		end
		if getFFlagEnableCrossExpVoice() and var171 then
			var171()
		end
		if getFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and videoCaptureService.DevicesChanged and var163 then
				var163:Disconnect()
				var163 = nil
			end
			if var174 then
				var174:disconnect()
				var174 = nil
			end
		end
		if game:GetEngineFeature("VoiceChatSupported") and gameSettingsTab.VoiceChatOptionsEnabled and (gameSettingsTab.startVolume ~= nil and gameSettingsTab.startVolume > 0) then
			default_2:CheckAndShowNotAudiblePrompt()
		end
		if game:GetEngineFeature("VoiceChatSupported") and gameSettingsTab.VoiceChatOptionsEnabled and (fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule) and (gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil and gameSettingsTab.maxVoiceChatVolumeDuringSession > 0) then
			default_2:ShowNotAudiblePromptVoiceChatVolume()
		end
	end
	
	function isLangaugeSelectionDropdownEnabled() --[[ line: 4820 ]]
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
	
	function gameSettingsTab.SetHub(_, p124) --[[ line: 4843 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (ref), getFFlagChatTranslationSettingEnabledModule (copy), getFFlagChatTranslationHoldoutEnabledModule (copy), getFStringChatTranslationLayerNameModule (copy), getChatTranslationLayerData (ref), textChatServiceSettingsSavedEngineFeature (copy), getFFlagChatTranslationNewDefaultsModule (copy), gameSettings (copy), textChatService (copy), getFFlagChatTranslationForceSettingModule (copy), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy), runService (copy), enableTFFeedbackModeEntryCheck (copy), var84 (copy), createFeedbackModeOptions (ref)
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
					pcall(function() --[[ line: 4881 ]]
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
		if if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false elseif enableTFFeedbackModeEntryCheck and var84 then false else true then
			createFeedbackModeOptions()
		end
	end
	
	return gameSettingsTab
end)()