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
local var1 = UserSettings()
local gameSettings = var1.GameSettings
local videoCaptureService = game:GetService("VideoCaptureService")
local userGameSettingsService = var1:GetService("UserGameSettings")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local textChatService = game:GetService("TextChatService")
local safetyService = game:GetService("SafetyService")
local var2 = if game:GetEngineFeature("CaptureModeEnabled") then game:GetService("ExperienceStateCaptureService") else nil
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagIEMSettingsGroupsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMSettingsGroups)
local var3 = if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() or isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil
local getCamMicPermissionsModule = require(robloxGui.Modules.Settings.getCamMicPermissions)
local isCamEnabledForUserAndPlaceModule = require(robloxGui.Modules.Settings.isCamEnabledForUserAndPlace)
local renderSettingsHeaderModule = nil
local renderSettingsDividerModule = nil

if fFlagIEMSettingsGroupsModule then
	renderSettingsHeaderModule = require(robloxGui.Modules.Settings.Components.renderSettingsHeader)
	renderSettingsDividerModule = require(robloxGui.Modules.Settings.Components.renderSettingsDivider)
end
local var4
local var5 = if require(robloxGui.Modules.Settings.Flags.FFlagEnablePioneerIGMSettingsBanner) and require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch() then require(robloxGui.Modules.Settings.Components.renderMoreSettingsBanner) else nil
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
local var6 = default_1 and default_1.getHasPartyVoiceVolume()
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

local function _(p1)
	return math.floor(p1 * 5 + 0.5)
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
local var7 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local var8 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local var9 = robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
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
local RUUserScalePreferenceAPIEngineFeature = game:GetEngineFeature("RUUserScalePreferenceAPI")
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
local var10 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local _ = nil
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local default_2 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceVolumeControlsEligibility = require(corePackagesService.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local default_3 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local var12 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local romarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local var13 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local var14 = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
local var15 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true

if isInExperienceUIVREnabled then
	if not var15 and not var14 then
		var4 = isSpatial() and var13
	end
elseif not var15 then
	var4 = var14 and var13
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

local function reportSettingsChangeForAnalytics(value, p1, p2, p3)
	-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), userInputService (ref), cryoModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	if not getFFlagEnableExplicitSettingsChangeAnalyticsModule() or p1 == p2 or (p1 == nil or p2 == nil) then return end
	local t = {
		universe_id = tostring(game.GameId),
		name = value,
		old_value = tostring(p1),
		new_value = tostring(p2),
		has_touch = userInputService.TouchEnabled,
		has_mouse = userInputService.MouseEnabled,
		has_gamepad = userInputService.GamepadEnabled
	}
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsExplicitSettingsChangeName, t)
end

local function reportSettingsForAnalytics()
	-- upvalues: userInputService (ref), gameSettings (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	local t = {}
	local var16 = userInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if var16 then
		t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
	else
		t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
	end
	if var16 then
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

local function getLastValueChangerFrame(p1)
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p1:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or layoutOrder <= selectionFrame.LayoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p1:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

local function getFirstValueChangerFrame(p2)
	-- upvalues: fFlagIEMTabFocusNav (ref)
	if not fFlagIEMTabFocusNav then return end
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p2:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or selectionFrame.LayoutOrder < layoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p2:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

return (function()
	-- upvalues: IGMEnableGFXReset (ref), gfxResetModule (ref), robloxGui (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (ref), VRService (ref), gameSettings (ref), utilityModule (ref), SETTINGS_MENU_LAYOUT_ORDER (ref), guiService (ref), getFFlagFixCyclicFullscreenIndexEventModule (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), reportSettingsChangeForAnalytics (ref), reportSettingsForAnalytics (ref), rbxAnalyticsService (ref), constantsModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), eraseFPSFromDefaultSetting (ref), robloxTranslatorModule (ref), romarkStartWithGraphicQualityLevelFastInt (ref), t (ref), updateVisibilitySettingsCopy (ref), fFlagUpdatePeopleNamesSettingCopyModule (ref), t_6 (ref), userGameSettingsService (ref), var3 (write), userInputService (ref), create (ref), themeModule (ref), centerShiftLockOverride (ref), microProfilerReadOnlyInformationLabel (ref), touchEnabled (ref), var15 (ref), var14 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), localPlayer (ref), coreUtilityModule (ref), t_3 (ref), getFFlagAlwaysShowVRToggleModule (ref), getAppFeaturePolicies (ref), t_5 (ref), var7 (ref), t_2 (ref), t_1 (ref), url (ref), httpService (ref), feedbackEntryPointImprovedStrictnessCheck (ref), safetyService (ref), var2 (write), feedbackEntryPointButtonSizeAdjustment2 (ref), var9 (ref), disableFeedbackSoothsayerCheck (ref), name (ref), playersService (ref), var8 (ref), runService (ref), getFFlagChatTranslationWaitForIXPModule (ref), IXPServiceWrapper (ref), getFFlagChatTranslationNewDefaultsModule (ref), fFlagRenameVolumeToMainVolumeModule (ref), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (ref), default_3 (ref), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), corePackagesService (ref), contextActionService (ref), fixDeveloperConsoleButtonSizeAndPositioning (ref), playerPermissionsModule (ref), userFreecamGuiDestabilization (ref), userShowGuiHideToggles (ref), soundService (ref), getFIntVoiceChatDeviceChangeDebounceDelayModule (ref), default_2 (ref), getFFlagEnableCrossExpVoice (ref), signalsModule (ref), getFIntDebounceAIRephraseSettingDelayModule (ref), textChatService (ref), expChatDebounceRephraseIndexSelection (ref), throttleFunctionCallModule (ref), getFIntDebounceChatSummariesSettingDelayModule (ref), var12 (ref), getFFlagVoiceChatUILoggingModule (ref), videoCaptureService (ref), var11 (ref), RUUserScalePreferenceAPIEngineFeature (ref), differentiateVoiceSelectorSystemAndUser (ref), voiceSelectorAvailableAfterFae (ref), getFIntDebounceDisconnectButtonDelayModule (ref), fFlagVoiceRewarmTelemetry (ref), constantsModule_1 (ref), voiceSelectorIgnoreFailedStateDisconnect (ref), voiceChatSelectorReconnectFocus2AEGIS2 (ref), debounceVoiceSelectorIndexChange (ref), deferProgrammaticChange (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), isVoiceFocused (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), getFFlagEnableVoiceUxUpdates (ref), hideVoiceChatSelectorForFaeAEGIS2 (ref), observeIsVoiceFocused (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (ref), voiceVolumeControlsEligibility (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), t_4 (ref), getFFlagSelfViewCameraSettings (ref), isCamEnabledForUserAndPlaceModule (ref), getCamMicPermissionsModule (ref), default (ref), cameraDevicePermissionGrantedSignalModule (ref), var10 (ref), fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (ref), var6 (ref), showAntiHarassmentSettings (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), playerChoiceTranslationSettingInitializerModule (ref), cachedPolicyServiceModule (ref), var4 (ref), fFlagBadgeVisibilitySettingEnabled (ref), fFlagEnableModerateChatRemoteEvent (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getHasGuiHidingPermissionModule (ref), var5 (write), fFlagIEMSettingsGroupsModule (ref), renderSettingsHeaderModule (write), renderSettingsDividerModule (write), migration (ref), builderIconsModule (ref), enableTFFeedbackModeEntryCheck (ref), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (ref), experienceLanguageSwitcherInitializerModule (ref), getLastValueChangerFrame (ref), fFlagIEMTabFocusNav (ref), getFirstValueChangerFrame (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFFlagChatTranslationHoldoutEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), textChatServiceSettingsSavedEngineFeature (ref), getFFlagChatTranslationForceSettingModule (ref), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (ref)
	if IGMEnableGFXReset then
		gfxResetModule.RunGfxReset()
	end
	local gameSettingsTab = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		gameSettingsTab.LanguageSwitcherInitialized = false
	end
	local var16 = false
	local t_7 = {}
	
	local function _()
		-- upvalues: VRService (copy), t_7 (ref)
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function()
		-- upvalues: VRService (copy), var16 (write), t_7 (ref)
		if VRService.VREnabled and var16 then
			local VREnabled = VRService.VREnabled
			
			for i, v in pairs(t_7) do
				i.Visible = not VREnabled
			end
		end
	end)
	local function createGraphicsOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), rbxAnalyticsService (copy), constantsModule (copy), gameBasicSettingsFramerateCapEngineFeature (copy), VRService (copy), eraseFPSFromDefaultSetting (copy), robloxTranslatorModule (copy), IGMEnableGFXReset (copy), gfxResetModule (copy), romarkStartWithGraphicQualityLevelFastInt (copy), t (copy)
		local var17, var18, var19 = utilityModule:AddNewRow(gameSettingsTab, "Fullscreen", "Selector", { "On", "Off" }, if not gameSettings:InFullScreen() then 2 else 1)
		gameSettingsTab.FullscreenFrame = var17
		gameSettingsTab.FullscreenLabel = var18
		gameSettingsTab.FullscreenEnabler = var19
		gameSettingsTab.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t_7[gameSettingsTab.FullscreenFrame] = true
		gameSettingsTab.FullscreenEnabler.IndexChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), gameSettingsTab (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var20 = gameSettings:InFullScreen()
			
			if p3 == 1 then
				if not gameSettings:InFullScreen() then
					guiService:ToggleFullscreen()
					
					if not getFFlagFixCyclicFullscreenIndexEventModule() then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 1 then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p3 == 2 and gameSettings:InFullScreen() then
				guiService:ToggleFullscreen()
				
				if not getFFlagFixCyclicFullscreenIndexEventModule() then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 2 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				end
			end
			spawn(function()
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), var20 (ref), gameSettings (copy), reportSettingsForAnalytics (copy)
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", var20, gameSettings:InFullScreen())
				end
				reportSettingsForAnalytics()
			end)
		end)
		gameSettings.FullscreenChanged:connect(function(p3)
			-- upvalues: gameSettingsTab (copy), rbxAnalyticsService (copy), constantsModule (copy)
			if p3 then
				if gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
			end
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsFullscreenModeName, { enabled = p3 })
		end)
		local var20 = gameSettingsTab
		local var21, var22, var23 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then 2 else 1)
		gameSettingsTab.GraphicsEnablerFrame = var21
		gameSettingsTab.GraphicsEnablerLabel = var22
		var20.GraphicsQualityEnabler = var23
		gameSettingsTab.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame
		local var24 = gameSettingsTab
		local var25, var26, var27 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Quality", "Slider", 10, 1)
		gameSettingsTab.GraphicsQualityFrame = var25
		gameSettingsTab.GraphicsQualityLabel = var26
		var24.GraphicsQualitySlider = var27
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
				local var28, var29, var30 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", list, table.find(cloned, gameSettings.FramerateCap), nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				gameSettingsTab.FramerateCapFrame = var28
				gameSettingsTab.FramerateCapLabel = var29
				gameSettingsTab.FramerateCapMode = var30
				gameSettingsTab.FramerateCapFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FramerateCap
				gameSettingsTab.FramerateCapMode.IndexChanged:Connect(function(p3)
					-- upvalues: gameSettings (copy), cloned (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
					local framerateCap = gameSettings.FramerateCap
					gameSettings.FramerateCap = cloned[p3]
					
					if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						reportSettingsChangeForAnalytics("framerate_cap", framerateCap, gameSettings.FramerateCap)
					end
					reportSettingsForAnalytics()
				end)
			end)
		end
		settings().Rendering.EnableFRM = true
		
		function SetGraphicsQuality(value, p3)
			-- upvalues: IGMEnableGFXReset (copy), gfxResetModule (copy), gameSettings (copy)
			if IGMEnableGFXReset then
				local var28, var29 = gfxResetModule.TemporaryOverride(value)
				
				if var28 then
					settings().Rendering.QualityLevel = var29
					
					return
				end
			end
			local floored = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * (value / 10))
			
			if floored == 20 then
				floored = 21
			elseif value == 1 then
				floored = 1
			elseif value < 1 and not p3 then
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
		
		local var28 = false
		gameSettingsTab.GraphicsQualitySlider.ValueChanged:connect(function(p3)
			-- upvalues: var28 (write), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p3)
			
			if var28 == true then
				reportSettingsForAnalytics()
			end
			var28 = true
		end)
		gameSettingsTab.GraphicsQualityEnabler.IndexChanged:connect(function(p3)
			-- upvalues: gameSettingsTab (copy), setGraphicsToManual (ref), reportSettingsForAnalytics (copy), reportSettingsChangeForAnalytics (copy)
			local t = {
				Automatic = { Name = "Automatic", Value = 1 },
				Manual = { Name = "Manual", Value = 2 }
			}
			local name = t.Automatic.Name
			local name_1 = t.Manual.Name
			
			if p3 == t.Automatic.Value then
				name = t.Manual.Name
				name_1 = t.Automatic.Name
				gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
				gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
				gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p3 == t.Manual.Value then
				setGraphicsToManual(gameSettingsTab.GraphicsQualitySlider:GetValue())
			end
			reportSettingsForAnalytics()
			reportSettingsChangeForAnalytics("gfx_mode", name, name_1)
		end)
		game.GraphicsQualityChangeRequest:Connect(function(p3)
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local value = gameSettingsTab.GraphicsQualitySlider:GetValue()
				gameSettingsTab.GraphicsQualitySlider:SetValue(if p3 then value + 1 else value - 1)
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
			local var29 = tostring(gameSettings.SavedQualityLevel)
			var29 = if t[var29] then t[var29] else 10
			SetGraphicsQuality(var29)
			spawn(function()
				-- upvalues: gameSettingsTab (copy), var29 (write)
				gameSettingsTab.GraphicsQualitySlider:SetValue(var29)
			end)
		end
	end
	
	local function createReducedMotionOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var30, var31, var32 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.ReducedMotion then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion"))
		gameSettingsTab.ReducedMotionFrame = var30
		gameSettingsTab.ReducedMotionLabel = var31
		gameSettingsTab.ReducedMotionMode = var32
		gameSettingsTab.ReducedMotionFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ReducedMotionFrame
		gameSettingsTab.ReducedMotionMode.IndexChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local reducedMotion = gameSettings.ReducedMotion
			gameSettings.ReducedMotion = p3 == 1
			
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
		
		local var30, var31, var32 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.PlayerNamesEnabled then t_6.On else t_6.Off, nil, if fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		gameSettingsTab.PlayerNamesEnabledFrame = var30
		gameSettingsTab.playerNamesEnabledLabel = var31
		gameSettingsTab.playerNamesEnabledMode = var32
		gameSettingsTab.PlayerNamesEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PlayerNamesEnabledFrame
		gameSettingsTab.playerNamesEnabledMode.IndexChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local playerNamesEnabled = gameSettings.PlayerNamesEnabled
			gameSettings.PlayerNamesEnabled = p3 == 1
			reportSettingsChangeForAnalytics("player_names_enabled", playerNamesEnabled, gameSettings.PlayerNamesEnabled)
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTransparencyOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var33, var34, var35 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(gameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque"))
		gameSettingsTab.PreferredTransparencyFrame = var33
		gameSettingsTab.PreferredTransparencyLabel = var34
		gameSettingsTab.PreferredTransparencySlider = var35
		gameSettingsTab.PreferredTransparencyFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTransparencyFrame
		gameSettingsTab.PreferredTransparencySlider.ValueChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTransparency = gameSettings.PreferredTransparency
			gameSettings.PreferredTransparency = (10 - math.clamp(math.floor(p3), 0, 10)) / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_transparency", preferredTransparency, gameSettings.PreferredTransparency)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTextSizeOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local enumItems = Enum.PreferredTextSize:GetEnumItems()
		local var33, var34, var35 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, gameSettings.PreferredTextSize.Value - 1, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest"))
		gameSettingsTab.PreferredTextSizeFrame = var33
		gameSettingsTab.PreferredTextSizeLabel = var34
		gameSettingsTab.PreferredTextSizeSlider = var35
		gameSettingsTab.PreferredTextSizeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTextSizeFrame
		gameSettingsTab.PreferredTextSizeSlider.ValueChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), enumItems (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTextSize = gameSettings.PreferredTextSize
			gameSettings.PreferredTextSize = enumItems[p3 + 1]
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_text_size", preferredTextSize, gameSettings.PreferredTextSize)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local var33 = nil
	local var34 = nil
	
	local function createUIScaleOptionsImpl()
		-- upvalues: guiService (copy), var33 (write), var34 (write), gameSettingsTab (ref), userGameSettingsService (copy), utilityModule (copy), var3 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local autoUIScaleHundredths = guiService:GetAutoUIScaleHundredths()
		local rawScreenScale = guiService:GetRawScreenScale()
		local currentCamera = workspace.CurrentCamera
		
		if not currentCamera then return end
		local var35 = math.ceil(100 / rawScreenScale / 25) * 25
		local var36 = math.floor(currentCamera.ViewportSize.Y * rawScreenScale * guiService:GetEffectiveUIScaleHundredths() / 100 / (540 * rawScreenScale) * 4) / 4 * 100
		local rounded = math.round((var36 - var35) / 25)
		
		if rounded <= 0 then
			var33 = nil
			var34 = nil
			
			if gameSettingsTab.UIScaleModeFrame then
				gameSettingsTab.UIScaleModeFrame:Destroy()
				gameSettingsTab.UIScaleModeFrame = nil
			end
			if gameSettingsTab.UIScaleFrame then
				gameSettingsTab.UIScaleFrame:Destroy()
				gameSettingsTab.UIScaleFrame = nil
			end
			return
		elseif gameSettingsTab.UIScaleModeFrame and var35 == var33 and var36 == var34 then return end
		var33 = var35
		var34 = var36
		
		if gameSettingsTab.UIScaleModeFrame then
			gameSettingsTab.UIScaleModeFrame:Destroy()
			gameSettingsTab.UIScaleModeFrame = nil
		end
		if gameSettingsTab.UIScaleFrame then
			gameSettingsTab.UIScaleFrame:Destroy()
			gameSettingsTab.UIScaleFrame = nil
		end
		local function _(p3)
			-- upvalues: var35 (ref)
			return var35 + p3 * 25
		end
		
		local _ = function(p3)
			-- upvalues: var35 (ref), rounded (ref)
			return math.clamp(math.round((p3 - var35) / 25), 0, rounded)
		end
		
		local UIScaleMultiplierHundredths = userGameSettingsService.UIScaleMultiplierHundredths
		local var37 = UIScaleMultiplierHundredths ~= 0
		local var38 = if var37 then 2 else 1
		local var39 = if var37 then math.clamp(math.round((UIScaleMultiplierHundredths - var35) / 25), 0, rounded) else 0
		local _ = {
			modeTitle = "CoreScripts.InGameMenu.GameSettings.UIScaleMode",
			modeAuto = "CoreScripts.InGameMenu.GameSettings.UIScaleModeAuto",
			modeManual = "CoreScripts.InGameMenu.GameSettings.UIScaleModeManual",
			sliderTitle = "CoreScripts.InGameMenu.GameSettings.UIScale",
			smallest = "CoreScripts.InGameMenu.GameSettings.UIScaleSmallest",
			largest = "CoreScripts.InGameMenu.GameSettings.UIScaleLargest"
		}
		local var40, var41, var42 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.UIScaleMode"), "Selector", {
			var3:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeAuto"),
			var3:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeManual")
		}, var38)
		gameSettingsTab.UIScaleModeFrame = var40
		gameSettingsTab.UIScaleModeLabel = var41
		gameSettingsTab.UIScaleModeSelector = var42
		gameSettingsTab.UIScaleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UIScaleModeFrame
		local var43, var44, var45 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.UIScale"), "Slider", rounded, var39, nil, nil, var3:Format("CoreScripts.InGameMenu.GameSettings.UIScaleSmallest"), var3:Format("CoreScripts.InGameMenu.GameSettings.UIScaleLargest"))
		gameSettingsTab.UIScaleFrame = var43
		gameSettingsTab.UIScaleLabel = var44
		gameSettingsTab.UIScaleSlider = var45
		gameSettingsTab.UIScaleFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UIScaleFrame
		gameSettingsTab.UIScaleFrame.Visible = var37
		gameSettingsTab.UIScaleModeSelector.IndexChanged:connect(function(p3)
			-- upvalues: gameSettingsTab (copy), autoUIScaleHundredths (ref), var35 (ref), rounded (ref), guiService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var46 = p3 == 2
			gameSettingsTab.UIScaleFrame.Visible = var46
			
			if var46 then
				local clampedValue = math.clamp(math.round(autoUIScaleHundredths / 25) * 25, var35, var35 + rounded * 25)
				gameSettingsTab.UIScaleSlider:SetValue(math.clamp(math.round((clampedValue - var35) / 25), 0, rounded))
				guiService:SetUIScaleMultiplier(clampedValue)
				reportSettingsChangeForAnalytics("ui_scale_mode", "auto", "manual")
			else
				guiService:SetUIScaleMultiplier(0)
				reportSettingsChangeForAnalytics("ui_scale_mode", "manual", "auto")
			end
			reportSettingsForAnalytics()
		end)
		gameSettingsTab.UIScaleSlider.ValueChanged:connect(function(p3)
			-- upvalues: userGameSettingsService (copy), var35 (ref), guiService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local UIScaleMultiplierHundredths = userGameSettingsService.UIScaleMultiplierHundredths
			local var46 = var35 + p3 * 25
			guiService:SetUIScaleMultiplier(var46)
			reportSettingsChangeForAnalytics("ui_scale_value", UIScaleMultiplierHundredths, var46)
			reportSettingsForAnalytics()
		end)
	end
	
	local _ = function()
		-- upvalues: createUIScaleOptionsImpl (ref)
		local ok, status = pcall(createUIScaleOptionsImpl)
		
		if not ok then
			warn("createUIScaleOptions failed: " .. tostring(status))
		end
	end
	
	local function createUiNavigationKeyBindOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), userInputService (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t = { On = 1, Off = 2 }
		local var35, var36, var37 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.UiNavigationKeyBindEnabled then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}))
		gameSettingsTab.UiNavigationKeyBindEnabledFrame = var35
		gameSettingsTab.UiNavigationKeyBindEnabledLabel = var36
		gameSettingsTab.UiNavigationKeyBindEnabledMode = var37
		gameSettingsTab.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame
		gameSettingsTab.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local uiNavigationKeyBindEnabled = gameSettings.UiNavigationKeyBindEnabled
			gameSettings.UiNavigationKeyBindEnabled = p3 == 1
			
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
		local var35 = nil
		local var36 = nil
		local var37 = nil
		local var38 = nil
		gameSettingsTab.PerformanceStatsFrame = var35
		gameSettingsTab.PerformanceStatsLabel = var36
		gameSettingsTab.PerformanceStatsMode = var37
		gameSettingsTab.PerformanceStatsOverrideText = var38
		
		function GetDesiredPerformanceStatsIndex()
			-- upvalues: gameSettings (copy)
			return if gameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		local var39, var40, var41 = utilityModule:AddNewRow(gameSettingsTab, "Performance Stats", "Selector", { "On", "Off" }, GetDesiredPerformanceStatsIndex())
		gameSettingsTab.PerformanceStatsFrame = var39
		gameSettingsTab.PerformanceStatsLabel = var40
		gameSettingsTab.PerformanceStatsMode = var41
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
		gameSettingsTab.PerformanceStatsMode.IndexChanged:connect(function(p3)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var42 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.PerformanceStatsVisible else nil
			
			if p3 == 1 then
				gameSettings.PerformanceStatsVisible = true
			else
				gameSettings.PerformanceStatsVisible = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", var42, gameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		gameSettings.PerformanceStatsVisibleChanged:connect(function()
			-- upvalues: gameSettingsTab (copy)
			local var42 = GetDesiredPerformanceStatsIndex()
			
			if var42 ~= gameSettingsTab.PerformanceStatsMode.CurrentIndex then
				gameSettingsTab.PerformanceStatsMode:SetSelectionIndex(var42)
			end
		end)
	end
	
	local function createWebServerInformationRow()
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), microProfilerReadOnlyInformationLabel (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), touchEnabled (copy), create (copy), themeModule (copy)
		local var35, var36, var37 = utilityModule:AddNewRow(gameSettingsTab, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, if microProfilerReadOnlyInformationLabel then false else nil)
		gameSettingsTab.InformationFrame = var35
		gameSettingsTab.InformationLabel = var36
		gameSettingsTab.InformationTextBox = var37
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
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), createWebServerInformationRow (ref), var15 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), var14 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local var35 = nil
		local var36 = nil
		local var37 = nil
		local var38 = nil
		gameSettingsTab.MicroProfilerFrame = var35
		gameSettingsTab.MicroProfilerLabel = var36
		gameSettingsTab.MicroProfilerMode = var37
		gameSettingsTab.MicroProfilerOverrideText = var38
		
		local function _()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), createWebServerInformationRow (copy)
			local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
			
			if microProfilerWebServerPort == 0 then
				return false
			end
			local var39, var40 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var39
			gameSettingsTab.InformationText = var40
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
			
			return true
		end
		
		local function setMicroProfilerIndex(value)
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), var15 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), createWebServerInformationRow (copy), var14 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
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
			
			local var39 = nil
			local onScreenProfilerEnabled = nil
			local onScreenProfilerEnabled_1 = nil
			
			if var15 then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var39 = "webserver"
					onScreenProfilerEnabled = gameSettings.MicroProfilerWebServerEnabled
				end
				if value == 1 then
					gameSettings.MicroProfilerWebServerEnabled = true
					local var40 = 30
					while var40 >= 1 do
						local var41
						local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
						
						if microProfilerWebServerPort == 0 then
							var41 = false
						else
							local var42, var43 = createWebServerInformationRow()
							gameSettingsTab.InformationFrame = var42
							gameSettingsTab.InformationText = var43
							gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
							var41 = true
						end
						if var41 then break end
						var40 -= 1
						wait(0.1)
					end
					if var40 <= 0 then
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
			elseif var14 or isInExperienceUIVREnabled and isSpatial() then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var39 = "regular"
					onScreenProfilerEnabled = gameSettings.OnScreenProfilerEnabled
				end
				gameSettings.OnScreenProfilerEnabled = value == 1
				
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.OnScreenProfilerEnabled
				end
			end
			rbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", onScreenProfilerEnabled, onScreenProfilerEnabled_1, { microprofiler_type = var39 })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function()
			-- upvalues: var15 (copy), gameSettings (copy), var14 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy)
			return if var15 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif not (not var14 and (not isInExperienceUIVREnabled or not isSpatial())) then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2
		end
		
		local var44 = gameSettingsTab
		local var45, var46, var47 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if var15 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif var14 or isInExperienceUIVREnabled and isSpatial() then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2)
		var44.MicroProfilerFrame = var45
		gameSettingsTab.MicroProfilerLabel = var46
		gameSettingsTab.MicroProfilerMode = var47
		gameSettingsTab.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame
		local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
		
		if microProfilerWebServerPort ~= 0 then
			local var48, var49 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var48
			gameSettingsTab.InformationText = var49
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
		end
		local var50 = false
		gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
			-- upvalues: var50 (write), gameSettings (copy), gameSettingsTab (copy)
			var50 = true
			
			if gameSettings.OnScreenProfilerEnabled then
				gameSettingsTab.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			end
			gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
		end)
		gameSettingsTab.MicroProfilerMode.IndexChanged:connect(function(...)
			-- upvalues: var50 (write), setMicroProfilerIndex (ref)
			if var50 then
				var50 = false
				
				return
			end
			setMicroProfilerIndex(...)
		end)
	end
	
	local function createCameraModeOptions(p3)
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), localPlayer (copy), userInputService (copy), coreUtilityModule (copy), t_3 (copy), VRService (copy), getFFlagAlwaysShowVRToggleModule (copy), getAppFeaturePolicies (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var7 (copy), t_2 (copy), t_1 (copy)
		local var39 = nil
		local var40 = nil
		local var41 = nil
		local var42 = nil
		gameSettingsTab.ShiftLockFrame = var39
		gameSettingsTab.ShiftLockLabel = var40
		gameSettingsTab.ShiftLockMode = var41
		gameSettingsTab.ShiftLockOverrideText = var42
		local var43, var44, var45 = utilityModule:AddNewRow(gameSettingsTab, "Shift Lock Switch", "Selector", { "On", "Off" }, if gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		gameSettingsTab.ShiftLockFrame = var43
		gameSettingsTab.ShiftLockLabel = var44
		gameSettingsTab.ShiftLockMode = var45
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
		gameSettingsTab.ShiftLockMode.IndexChanged:connect(function(p4)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var46 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p4 == 1 then
				gameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				gameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", var46, gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
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
			local var46 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var46
				local devEnableMouseLock = not var46 and localPlayer.DevEnableMouseLock
				
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
			local var46 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var46
				local devEnableMouseLock = not var46 and localPlayer.DevEnableMouseLock
				
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
		local var46 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var46
			local devEnableMouseLock = not var46 and localPlayer.DevEnableMouseLock
			
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
			local var47 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var47
				local devEnableMouseLock = not var47 and localPlayer.DevEnableMouseLock
				
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
			local var47 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var47
				local devEnableMouseLock = not var47 and localPlayer.DevEnableMouseLock
				
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
		
		local function updateCurrentCameraMovementIndex(p4)
			-- upvalues: t_4 (write), t (write), userInputService (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy)
			local var47 = nil
			
			if not pcall(function()
				-- upvalues: var47 (write), t_4 (copy), t (copy), p4 (ref)
				var47 = t_4[t[p4]]
			end) or var47 == nil then
				return false
			end
			local var48
			local _ = nil
			local value = nil
			
			if userInputService.PreferredInput == Enum.PreferredInput.Touch then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					value = gameSettings.TouchCameraMovementMode.Value
				end
				var48 = gameSettings.TouchCameraMovementMode.Value ~= var47
				gameSettings.TouchCameraMovementMode = var47
			elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				value = gameSettings.ComputerCameraMovementMode.Value
			end
			var48 = gameSettings.ComputerCameraMovementMode.Value ~= var47
			gameSettings.ComputerCameraMovementMode = var47
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and var48 then
				reportSettingsChangeForAnalytics("camera_mode", value, var47)
			end
			return var48
		end
		
		local function updateCameraMovementModes()
			-- upvalues: playerScripts (ref), userInputService (copy), t (write), t_4 (write), t_3 (copy), gameSettingsTab (copy), gameSettings (copy), updateCurrentCameraMovementIndex (ref)
			local var47 = if playerScripts then if userInputService.PreferredInput == Enum.PreferredInput.Touch then playerScripts:GetRegisteredTouchCameraMovementModes() else playerScripts:GetRegisteredComputerCameraMovementModes() else {}
			t = {}
			t_4 = {}
			
			if #var47 <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #var47 do
				local var48 = var47[i]
				local name = var48.Name
				
				if name == "Default" then
					name = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_3.DEFAULT_FOLLOW else t_3.DEFAULT_CLASSIC
				end
				t[#t + 1] = name
				t_4[name] = var48.Value
			end
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode:UpdateOptions(t)
			end
			local _ = -1
			local var49 = userInputService.PreferredInput == Enum.PreferredInput.Touch
			local var50 = if var49 then gameSettings.TouchCameraMovementMode.Value else gameSettings.ComputerCameraMovementMode.Value
			
			if var50 > -1 then
				if var49 or gameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					var50 += 1
				end
				updateCurrentCameraMovementIndex(var50)
				gameSettingsTab.CameraMode:SetSelectionIndex(var50)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		local var51 = gameSettingsTab
		local var52 = gameSettingsTab
		local var53 = gameSettingsTab
		local var54, var55, var56 = utilityModule:AddNewRow(gameSettingsTab, "Camera Mode", "Selector", t, 1)
		var51.CameraModeFrame = var54
		var52.CameraModeLabel = var55
		var53.CameraMode = var56
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
		gameSettingsTab.CameraMode.IndexChanged:connect(function(p4)
			-- upvalues: updateCurrentCameraMovementIndex (ref), t_6 (write), reportSettingsForAnalytics (copy)
			if updateCurrentCameraMovementIndex(p4) then
				if t_6 then
					reportSettingsForAnalytics()
				end
				t_6 = true
			end
		end)
		updateCameraMovementModes()
		local var57 = false
		
		t = function()
			-- upvalues: var57 (write), gameSettings (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not var57 then
				var57 = true
				local var58 = if gameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				local var59, var60, var61 = utilityModule:AddNewRow(gameSettingsTab, "VR", "Selector", var58, if gameSettings.VREnabled then 1 else 2)
				gameSettingsTab.VREnabledFrame = var59
				gameSettingsTab.VREnabledLabel = var60
				gameSettingsTab.VREnabledSelector = var61
				gameSettingsTab.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				gameSettingsTab.VREnabledSelector.IndexChanged:connect(function(p4)
					-- upvalues: gameSettings (copy), var58 (write), reportSettingsChangeForAnalytics (copy)
					local t = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local var62 = p4 == t.On.Value
					
					if gameSettings.VREnabled ~= var62 then
						gameSettings.VREnabled = var62
						local value = var58[t.On.Value]
						local var63 = var58[p4]
						
						if var63 == var58[t.On.Value] then
							value = var58[t.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", value, var63)
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
		
		local var58 = function(_) end
		
		local _ = function(value)
			-- upvalues: gameSettingsTab (copy), t_8 (write)
			if gameSettingsTab.MovementMode then
				local var59 = value and #t_8 > 0
				gameSettingsTab.MovementMode.SelectorFrame.Visible = var59
				gameSettingsTab.MovementMode:SetInteractable(var59)
				gameSettingsTab.MovementModeOverrideText.Visible = not var59
			end
		end
		
		if p3 then
			local t_11 = {}
			local playerScripts_1 = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
			
			local _ = function(p4)
				-- upvalues: userInputService (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var7 (copy)
				local var59 = p4
				
				if p4 == "Default" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey)
					end
					var59 = t_5.DEFAULT_KEYBOARD
					
					return var59
				elseif p4 == "KeyboardMouse" then
					var59 = "Keyboard + Mouse"
					
					return var59
				elseif p4 == "ClickToMove" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return t_5.TAP_TO_MOVE
					end
					var59 = t_5.CLICK_TO_MOVE
					
					return var59
				elseif p4 == "DynamicThumbstick" then
					var59 = "Dynamic Thumbstick"
					
					return var59
				elseif p4 == "Thumbstick" then
					var59 = var7
				end
				return var59
			end
			
			local var59, var60, var61 = utilityModule:AddNewRow(gameSettingsTab, "Movement Mode", "Selector", t_11, 1)
			gameSettingsTab.MovementModeFrame = var59
			gameSettingsTab.MovementModeLabel = var60
			gameSettingsTab.MovementMode = var61
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
			
			var58 = function(p4)
				-- upvalues: localPlayer (copy), gameSettingsTab (copy), t_8 (write)
				local var62
				local _ = nil
				
				if p4 then
					var62 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					var62 = nil
				else
					var62 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if gameSettingsTab.MovementMode then
					local var63 = var62 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var63
					gameSettingsTab.MovementMode:SetInteractable(var63)
					gameSettingsTab.MovementModeOverrideText.Visible = not var63
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var62
				end
			end
			
			local function updateMovementModes()
				-- upvalues: userInputService (copy), playerScripts_1 (ref), t_8 (write), t_9 (write), t_6 (write), t_10 (write), gameSettingsTab (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var7 (copy), gameSettings (copy), setMovementMode (ref), var58 (write)
				local var62 = userInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if playerScripts_1 then
					t_8 = if var62 then playerScripts_1:GetRegisteredTouchMovementModes() else playerScripts_1:GetRegisteredComputerMovementModes()
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
					local var63 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var63
					gameSettingsTab.MovementMode:SetInteractable(var63)
					gameSettingsTab.MovementModeOverrideText.Visible = not var63
				end
				for i, v in t_8 do
					t_6[i] = v
					local var64 = t_10
					local name = v.Name
					local var65 = name
					
					if name == "Default" then
						var65 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else t_5.DEFAULT_KEYBOARD
					elseif name == "KeyboardMouse" then
						var65 = "Keyboard + Mouse"
					elseif name == "ClickToMove" then
						var65 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_5.TAP_TO_MOVE else t_5.CLICK_TO_MOVE
					elseif name == "DynamicThumbstick" then
						var65 = "Dynamic Thumbstick"
					elseif name == "Thumbstick" then
						var65 = var7
					end
					var64[i] = var65
					t_9[v] = i
				end
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode:UpdateOptions(t_10)
				end
				local var66 = if var62 then gameSettings.TouchMovementMode else gameSettings.ComputerMovementMode
				
				if var66 then
					setMovementMode(var66)
					gameSettingsTab.MovementMode:SetSelectionIndex(t_9[var66])
				end
				var58(var62)
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
			gameSettingsTab.MovementMode.IndexChanged:connect(function(p4)
				-- upvalues: setMovementMode (ref), t_6 (write), reportSettingsForAnalytics (copy)
				setMovementMode(t_6[p4])
				reportSettingsForAnalytics()
			end)
		end
		local var62
		local _ = false
		local var63 = userInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if var63 then
			var62 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			var62 = nil
		else
			var62 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if var62 then
			gameSettingsTab.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			gameSettingsTab.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local var64
		local _ = false
		
		if var63 then
			var64 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
			var64 = nil
		else
			var64 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if gameSettingsTab.MovementModeOverrideText then
			if var64 then
				gameSettingsTab.MovementModeOverrideText.Visible = false
				
				if gameSettingsTab.MovementMode then
					local var65 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var65
					gameSettingsTab.MovementMode:SetInteractable(var65)
					gameSettingsTab.MovementModeOverrideText.Visible = not var65
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
		local var66 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var66
			local devEnableMouseLock = not var66 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(value)
			-- upvalues: localPlayer (copy), gameSettingsTab (copy), var58 (write), t_8 (write)
			if value == "DevEnableMouseLock" then
				local var67 = not localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockOverrideText then
					gameSettingsTab.ShiftLockOverrideText.Visible = var67
					local devEnableMouseLock = not var67 and localPlayer.DevEnableMouseLock
					
					if gameSettingsTab.ShiftLockMode then
						gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
						gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
						
						return
					end
				end
			elseif value == "DevComputerCameraMode" then
				local var68 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
				setCameraModeVisible(var68)
				gameSettingsTab.CameraModeOverrideText.Visible = not var68
				
				return
			elseif value == "DevComputerMovementMode" then
				if var58 ~= nil then
					var58(false)
					
					return
				end
				local var69 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var70 = var69 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var70
					gameSettingsTab.MovementMode:SetInteractable(var70)
					gameSettingsTab.MovementModeOverrideText.Visible = not var70
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var69
					
					return
				end
			elseif value == "DevTouchMovementMode" then
				if var58 ~= nil then
					var58(true)
					
					return
				end
				local var71 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var72 = var71 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var72
					gameSettingsTab.MovementMode:SetInteractable(var72)
					gameSettingsTab.MovementModeOverrideText.Visible = not var72
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var71
					
					return
				end
			elseif value == "DevTouchCameraMode" then
				local var73 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
				setCameraModeVisible(var73)
				gameSettingsTab.CameraModeOverrideText.Visible = not var73
			end
		end
		
		localPlayer.Changed:connect(function(p4)
			-- upvalues: t_2 (copy), updateUserSettingsMenu (ref), t_1 (copy)
			if t_2[p4] then
				updateUserSettingsMenu(p4)
			end
			if t_1[p4] then
				updateUserSettingsMenu(p4)
			end
		end)
	end
	
	local function createFeedbackModeOptions()
		-- upvalues: url (copy), httpService (copy), feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (ref), safetyService (copy), var2 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var9 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), disableFeedbackSoothsayerCheck (copy), name (copy)
		local text = url.ROLES_URL .. "v1/users/authenticated/roles"
		local var67 = httpService:RequestInternal({ Method = "GET", Url = text })
		
		local function rolesCheckCallback(p4)
			-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var2 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var9 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p4 then
				if not feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
				local var68, var69
				local function onToggleFeedbackMode()
					-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var2 (copy), reportSettingsChangeForAnalytics (copy)
					if feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
					gameSettingsTab.HubRef:PopMenu(false, true)
					
					if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
						safetyService.IsCaptureModeForReport = false
					end
					if var2 ~= nil then
						var2:ToggleCaptureMode()
					end
					reportSettingsChangeForAnalytics("translation_feedback", "", "pressed")
				end
				
				local _ = nil
				local _ = nil
				
				if feedbackEntryPointButtonSizeAdjustment2 then
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var9, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var68 = toggleFeedbackModeButton
					var69 = toggleFeedbackModeButton_1
					var68.Size = UDim2.new(0.6, 0, 0, 40)
					var68.Position = UDim2.new(0.4, 0, 0.5, 0)
					var68.AnchorPoint = Vector2.new(0, 0.5)
				else
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var9, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var68 = toggleFeedbackModeButton
					var69 = toggleFeedbackModeButton_1
					var68.Size = UDim2.new(0, 300, 0, 30)
					var68.Position = UDim2.new(0.4, 0, 0.5, 0)
					var68.AnchorPoint = Vector2.new(0, 0.5)
				end
				var68.ZIndex = 2
				var68.Selectable = true
				var69.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					gameSettingsTab.toggleFeedbackModeButton = var68
					gameSettingsTab.toggleFeedbackModeText = var69
				end
				if feedbackEntryPointButtonSizeAdjustment2 then
					utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var68, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
					
					return
				end
				utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var68).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end
		
		if disableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		end
		var67:Start(function(p4, p5)
			-- upvalues: httpService (copy), name (copy), text (ref), rolesCheckCallback (ref)
			local var68
			local var69 = false
			local var70 = false
			local _ = nil
			
			if not p4 then
				var68 = "Roles Api Request: Connection error"
			elseif p5.StatusCode == 401 then
				var68 = "Roles Api Request: Unauthorized"
			elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
				var68 = "Roles Api Status code: " .. p35.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref), var69 (write)
					for i, v in pairs(httpService:JSONDecode(p5.Body).roles) do
						if v == "Soothsayer" then
							var69 = true
						end
					end
				end)
				var70 = ok
				var68 = status
			end
			if not var70 then
				name:warning("Feedback Mode initialization api call failed with url: " .. text .. " and with error message: " .. var369)
			end
			rolesCheckCallback(var69)
		end)
	end
	
	local function createTranslationOptions()
		-- upvalues: playersService (copy), url (copy), httpService (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), localPlayer (copy), reportSettingsChangeForAnalytics (copy), runService (copy)
		local var68 = 1
		local var69 = 1
		local var70 = false
		local var71 = nil
		local var72 = nil
		local localeId = playersService.LocalPlayer.LocaleId
		local var73 = nil
		local var74 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
		local var75 = httpService:RequestInternal({ Method = "GET", Url = text })
		local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local var76 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
		local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local var77 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
		local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local var78 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
		
		local function userExperienceLanguageSettingsCallback(value, p4)
			-- upvalues: name (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_4 (ref), t_2 (ref), var71 (write), t (ref), var74 (write), t_1 (ref), var68 (write), var69 (write), localPlayer (copy), var72 (write), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var70 (write), runService (copy)
			if value then
				local var79 = false
				table.insert(t_4, t_2[var71].languageName .. " (Original)")
				
				for i, v in pairs(t) do
					if v == var74 then
						var79 = true
					end
					if v ~= var71 then
						table.insert(t_4, t_2[v].languageName)
					end
				end
				if var79 == true then
					for i_1, v_1 in pairs(t_4) do
						if i_1 ~= 1 and t_1[v_1] == var74 then
							var68 = i_1
							var69 = i_1
						end
					end
				end
				local var80, var81, var82 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_4, var68)
				gameSettingsTab.LanguageSelectorFrame = var80
				gameSettingsTab.LanguageSelectorLabel = var81
				gameSettingsTab.LanguageSelectorMode = var82
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				
				if var68 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var72)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[var68]]].localeCode)
				end
				gameSettingsTab.LanguageSelectorMode.CurrentLanguage = gameSettingsTab.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				gameSettingsTab.LanguageSelectorMode.IndexChanged:connect(function(p5)
					-- upvalues: gameSettingsTab (copy), t_2 (copy), var71 (copy), t_1 (copy), t_4 (copy), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var69 (copy), localPlayer (copy), var72 (copy), name (copy), var70 (copy), runService (copy)
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					local var83 = if p5 == 1 then t_2[var71].id else t_2[t_1[t_4[p5]]].id
					local currentLanguage = gameSettingsTab.LanguageSelectorMode.CurrentLanguage
					local var84 = t_4[p5]
					
					if currentLanguage ~= var84 then
						gameSettingsTab.LanguageSelectorMode.CurrentLanguage = var84
						reportSettingsChangeForAnalytics("experience_language", currentLanguage, var84)
					end
					local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local var85 = httpService:RequestInternal({
						Method = "POST",
						Url = text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = httpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = var83 }
						})
					})
					
					local function callback(p6, p7)
						-- upvalues: var69 (copy), p5 (ref), localPlayer (copy), var72 (copy), t_1 (copy), t_4 (copy), t_2 (copy), name (copy), var70 (copy), gameSettingsTab (copy)
						if p6 then
							var69 = p5
							
							if p5 == 1 then
								localPlayer:SetExperienceSettingsLocaleId(var72)
							else
								localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
							end
						else
							name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p39)
							var70 = true
							gameSettingsTab.LanguageSelectorMode:SetSelectionIndex(var69)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
					end
					
					if runService:IsStudio() then
						var69 = p5
						
						if p5 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var72)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
						
						return
					elseif not var70 then
						var85:Start(function(p6, p7)
							-- upvalues: name (copy), text (ref), callback (ref)
							local var86 = false
							local text_1 = nil
							
							if not p6 then
								text_1 = "User Experience Language Settings Update Request: Connection error"
							elseif p7.StatusCode == 401 then
								text_1 = "User Experience Language Settings Update Request: Unauthorized"
							elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
								text_1 = "User Experience Language Settings Update Request Status Code: " .. p41.StatusCode
							else
								name:info("User Experience Language Settings Update Request succeeded with code: " .. p41.StatusCode)
								var86 = true
							end
							if not var86 then
								name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. text_1)
							end
							callback(var86, text_1)
						end)
						
						return
					end
					var70 = false
					var69 = p5
					
					if p5 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var72)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
					end
					gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
				end)
				
				return
			elseif p4 == nil then
				p4 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p36)
			local var83, var84, var85 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var83
			gameSettingsTab.LanguageSelectorLabel = var84
			gameSettingsTab.LanguageSelectorMode = var85
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local function _(p5, p6)
			-- upvalues: var78 (ref), httpService (copy), var74 (write), var73 (write), var71 (write), t_3 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p5 then
				var78:Start(function(p7, p8)
					-- upvalues: httpService (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
					local var86
					local var87 = false
					local _ = nil
					
					if not p7 then
						var86 = "User Experience Language Setting Request: Connection error"
					elseif p8.StatusCode == 401 then
						var86 = "User Experience Language Setting Request: Unauthorized"
					elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
						var86 = "User Experience Language Setting Request Status code: " .. p45.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p8 (ref), var74 (copy), var73 (copy), var71 (copy), t_3 (copy)
							local userUniverseLocalizationSettingValue = httpService:JSONDecode(p8.Body).userUniverseLocalizationSettingValue
							
							if userUniverseLocalizationSettingValue == nil then
								var74 = var73
								
								return
							elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
								var74 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var71 else var73
							end
							if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
								if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
									var74 = var73
									
									return
								end
								var74 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
							end
						end)
						var87 = ok
						var86 = status
					end
					if not var87 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var410)
					end
					userExperienceLanguageSettingsCallback(var87, var86)
				end)
				
				return
			end
			local var86 = p6
			
			if var86 == nil then
				var86 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var405)
			local var87, var88, var89 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var87
			gameSettingsTab.LanguageSelectorLabel = var88
			gameSettingsTab.LanguageSelectorMode = var89
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local _ = function(p5, p6)
			-- upvalues: var77 (ref), httpService (copy), t (ref), name (copy), text_2 (ref), var78 (ref), var74 (write), var73 (write), var71 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p5 then
				var77:Start(function(p7, p8)
					-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p6 (write), p5 (ref), var78 (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var86
					local var87 = false
					local _ = nil
					
					if not p7 then
						var86 = "Experience Supported Language Request: Connection error"
					elseif p8.StatusCode == 401 then
						var86 = "Experience Supported Language Request: Unauthorized"
					elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
						var86 = "Experience Supported Language Request Status code: " .. p49.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p8 (ref), t (copy)
							for i, v in pairs(httpService:JSONDecode(p8.Body).data) do
								t[i] = v.languageCode
							end
						end)
						var87 = ok
						var86 = status
					end
					if not var87 then
						name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var416)
					end
					if p6 == nil then
						p6 = var86
					end
					local var88 = p6
					
					if var87 and p5 then
						var78:Start(function(p9, p10)
							-- upvalues: httpService (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
							local var89
							local var90 = false
							local _ = nil
							
							if not p9 then
								var89 = "User Experience Language Setting Request: Connection error"
							elseif p10.StatusCode == 401 then
								var89 = "User Experience Language Setting Request: Unauthorized"
							elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
								var89 = "User Experience Language Setting Request Status code: " .. p51.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p10 (ref), var74 (copy), var73 (copy), var71 (copy), t_3 (copy)
									local userUniverseLocalizationSettingValue = httpService:JSONDecode(p10.Body).userUniverseLocalizationSettingValue
									
									if userUniverseLocalizationSettingValue == nil then
										var74 = var73
										
										return
									elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
										var74 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var71 else var73
									end
									if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
										if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
											var74 = var73
											
											return
										end
										var74 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
									end
								end)
								var90 = ok
								var89 = status
							end
							if not var90 then
								name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var410)
							end
							userExperienceLanguageSettingsCallback(var90, var89)
						end)
						
						return
					end
					local var89 = var88
					
					if var89 == nil then
						var89 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var418)
					local var90, var91, var92 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
					gameSettingsTab.LanguageSelectorFrame = var90
					gameSettingsTab.LanguageSelectorLabel = var91
					gameSettingsTab.LanguageSelectorMode = var92
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				end)
			else
				local var93 = p6
				
				if var93 == nil then
					var93 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var411)
				local var94, var95, var96 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var94
				gameSettingsTab.LanguageSelectorLabel = var95
				gameSettingsTab.LanguageSelectorMode = var96
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p7, p8)
			-- upvalues: var76 (ref), httpService (copy), var71 (write), var72 (write), t_2 (ref), name (copy), text_1 (ref), var77 (ref), t (ref), text_2 (ref), var78 (ref), var74 (write), var73 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p7 then
				var76:Start(function(p9, p10)
					-- upvalues: httpService (copy), var71 (copy), var72 (copy), t_2 (copy), name (copy), text_1 (copy), p8 (write), p7 (ref), var77 (copy), t (copy), text_2 (copy), var78 (copy), var74 (copy), var73 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var86
					local var87 = false
					local _ = nil
					
					if not p9 then
						var86 = "Experience Source Language Request: Connection error"
					elseif p10.StatusCode == 401 then
						var86 = "Experience Source Language Request: Unauthorized"
					elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
						var86 = "Experience Source Language Status code: " .. p55.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p10 (ref), var71 (copy), var72 (copy), t_2 (copy)
							var71 = httpService:JSONDecode(p10.Body).languageCode
							var72 = t_2[var71].localeCode
						end)
						var87 = ok
						var86 = status
					end
					if not var87 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var427)
					end
					if p8 == nil then
						p8 = var86
					end
					local p11 = var87 and p7
					local var88 = p8
					
					if p11 then
						var77:Start(function(p12, p13)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), var88 (write), p11 (ref), var78 (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var89
							local var90 = false
							local _ = nil
							
							if not p12 then
								var89 = "Experience Supported Language Request: Connection error"
							elseif p13.StatusCode == 401 then
								var89 = "Experience Supported Language Request: Unauthorized"
							elseif p13.StatusCode < 200 or p13.StatusCode >= 400 then
								var89 = "Experience Supported Language Request Status code: " .. p57.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p13 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p13.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var90 = ok
								var89 = status
							end
							if not var90 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var416)
							end
							if p6 == nil then
								p6 = var89
							end
							if var90 and p11 then
								var78:Start(function(p14, p15)
									-- upvalues: httpService (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var91
									local var92 = false
									local _ = nil
									
									if not p14 then
										var91 = "User Experience Language Setting Request: Connection error"
									elseif p15.StatusCode == 401 then
										var91 = "User Experience Language Setting Request: Unauthorized"
									elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then
										var91 = "User Experience Language Setting Request Status code: " .. p59.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p15 (ref), var74 (copy), var73 (copy), var71 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p15.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var74 = var73
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var74 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var71 else var73
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var74 = var73
													
													return
												end
												var74 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var92 = ok
										var91 = status
									end
									if not var92 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var410)
									end
									userExperienceLanguageSettingsCallback(var92, var91)
								end)
								
								return
							end
							local var91 = p6
							
							if var91 == nil then
								var91 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var418)
							local var92, var93, var94 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var92
							gameSettingsTab.LanguageSelectorLabel = var93
							gameSettingsTab.LanguageSelectorMode = var94
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var95 = var88
						
						if var95 == nil then
							var95 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var430)
						local var96, var97, var98 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var96
						gameSettingsTab.LanguageSelectorLabel = var97
						gameSettingsTab.LanguageSelectorMode = var98
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var89 = p8
				
				if var89 == nil then
					var89 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var422)
				local var90, var91, var92 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var90
				gameSettingsTab.LanguageSelectorLabel = var91
				gameSettingsTab.LanguageSelectorMode = var92
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		var75:Start(function(p9, p10)
			-- upvalues: httpService (copy), t_2 (ref), t_3 (ref), t_1 (ref), localeId (ref), var73 (write), name (copy), text (ref), var76 (ref), var71 (write), var72 (write), text_1 (ref), var77 (ref), t (ref), text_2 (ref), var78 (ref), var74 (write), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local var86
			local var87 = false
			local _ = nil
			
			if not p9 then
				var86 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p10.StatusCode == 401 then
				var86 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
				var86 = "Locale Code to Language Code Mapping Request Status code: " .. p61.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p10 (ref), t_2 (copy), t_3 (copy), t_1 (copy), localeId (copy), var73 (copy)
					for i, v in pairs(httpService:JSONDecode(p10.Body).data) do
						local languageCode = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id
						t_2[languageCode] = { localeCode = locale, languageName = name, id = id }
						t_3[id] = languageCode
						t_1[name] = languageCode
						
						if v.locale.locale == localeId:gsub("-", "_") then
							var73 = v.locale.language.languageCode
						end
					end
				end)
				var87 = ok
				var86 = status
			end
			if not var87 then
				name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var435)
			end
			local var88 = var86
			
			if var87 then
				var76:Start(function(p11, p12)
					-- upvalues: httpService (copy), var71 (copy), var72 (copy), t_2 (copy), name (copy), text_1 (copy), var88 (write), var87 (ref), var77 (copy), t (copy), text_2 (copy), var78 (copy), var74 (copy), var73 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var89
					local var90 = false
					local _ = nil
					
					if not p11 then
						var89 = "Experience Source Language Request: Connection error"
					elseif p12.StatusCode == 401 then
						var89 = "Experience Source Language Request: Unauthorized"
					elseif p12.StatusCode < 200 or p12.StatusCode >= 400 then
						var89 = "Experience Source Language Status code: " .. p63.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p12 (ref), var71 (copy), var72 (copy), t_2 (copy)
							var71 = httpService:JSONDecode(p12.Body).languageCode
							var72 = t_2[var71].localeCode
						end)
						var90 = ok
						var89 = status
					end
					if not var90 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var427)
					end
					if p8 == nil then
						p8 = var89
					end
					local p13 = var90 and var87
					
					if p13 then
						var77:Start(function(p14, p15)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p8 (write), p13 (ref), var78 (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var8 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var91
							local var92 = false
							local _ = nil
							
							if not p14 then
								var91 = "Experience Supported Language Request: Connection error"
							elseif p15.StatusCode == 401 then
								var91 = "Experience Supported Language Request: Unauthorized"
							elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then
								var91 = "Experience Supported Language Request Status code: " .. p65.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p15 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p15.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var92 = ok
								var91 = status
							end
							if not var92 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var416)
							end
							if p6 == nil then
								p6 = var91
							end
							if var92 and p13 then
								var78:Start(function(p16, p17)
									-- upvalues: httpService (copy), var74 (copy), var73 (copy), var71 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var93
									local var94 = false
									local _ = nil
									
									if not p16 then
										var93 = "User Experience Language Setting Request: Connection error"
									elseif p17.StatusCode == 401 then
										var93 = "User Experience Language Setting Request: Unauthorized"
									elseif p17.StatusCode < 200 or p17.StatusCode >= 400 then
										var93 = "User Experience Language Setting Request Status code: " .. p67.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p17 (ref), var74 (copy), var73 (copy), var71 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p17.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var74 = var73
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var74 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var71 else var73
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var74 = var73
													
													return
												end
												var74 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var94 = ok
										var93 = status
									end
									if not var94 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var410)
									end
									userExperienceLanguageSettingsCallback(var94, var93)
								end)
								
								return
							end
							local var93 = p6
							
							if var93 == nil then
								var93 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var418)
							local var94, var95, var96 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var94
							gameSettingsTab.LanguageSelectorLabel = var95
							gameSettingsTab.LanguageSelectorMode = var96
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var97 = p8
						
						if var97 == nil then
							var97 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var430)
						local var98, var99, var100 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var98
						gameSettingsTab.LanguageSelectorLabel = var99
						gameSettingsTab.LanguageSelectorMode = var100
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var91 = var88
				
				if var91 == nil then
					var91 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var437)
				local var92, var93, var94 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var8 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var92
				gameSettingsTab.LanguageSelectorLabel = var93
				gameSettingsTab.LanguageSelectorMode = var94
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end)
	end
	
	local function getChatTranslationLayerData(p11)
		-- upvalues: getFFlagChatTranslationWaitForIXPModule (copy), IXPServiceWrapper (copy), getFFlagChatTranslationNewDefaultsModule (copy)
		local t = {
			ChatTranslationEnabled = false,
			ChatTranslationToggleEnabled = false
		}
		
		if not p11 or p11 == "" then
			return t
		elseif p11 == "override" then
			t.ChatTranslationEnabled = true
			
			return t
		elseif getFFlagChatTranslationWaitForIXPModule() then
			IXPServiceWrapper:WaitForInitialization()
		end
		local ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), p11 (ref)
			return IXPServiceWrapper:GetLayerData(p11)
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
		local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, if fFlagRenameVolumeToMainVolumeModule then robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume") else "Volume", "Slider", 10, math.floor(gameSettings.MasterVolume * 10))
		gameSettingsTab.VolumeFrame = var89
		gameSettingsTab.VolumeLabel = var90
		gameSettingsTab.VolumeSlider = var91
		gameSettingsTab.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame
		local volumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		volumeChangeSound.Name = "VolumeChangeSound"
		volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		gameSettingsTab.VolumeSlider.ValueChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), volumeChangeSound (ref), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var92 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.MasterVolume * 10 + 0.5) else nil
			local var93 = p11 / 10
			volumeChangeSound.Volume = var93
			volumeChangeSound:Play()
			gameSettings.MasterVolume = var93
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", var92, math.floor(gameSettings.MasterVolume * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default_3 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.PartyVoiceVolume * 10)
		local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, "Party Voice Volume", "Slider", 10, floored)
		gameSettingsTab.PartyVoiceVolumeFrame = var89
		gameSettingsTab.PartyVoiceVolumeLabel = var90
		gameSettingsTab.PartyVoiceVolumeSlider = var91
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
		gameSettingsTab.PartyVoiceVolumeSlider.ValueChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), floored (ref), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var92 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then if floored ~= nil then 0 else math.floor(floored * 10 + 0.5) else nil
			gameSettings.PartyVoiceVolume = p11 / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", var92, math.floor(p11 * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createVoiceChatVolumeOptions()
		-- upvalues: gameSettings (copy), var3 (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.VoiceChatVolume * 5 + 0.5)
		local ok, status = pcall(function()
			-- upvalues: var3 (copy)
			return var3:Format("CoreScripts.InGameMenu.GameSettings.VoiceChatVolume")
		end)
		
		if not ok then
			status = "Voice Chat Volume"
			name:debug("[GameSettings] createVoiceChatVolumeOptions failed to get translation for Voice Chat Volume label, using placeholder text instead")
		end
		local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, status, "Slider", 10, floored)
		gameSettingsTab.VoiceChatVolumeFrame = var89
		gameSettingsTab.VoiceChatVolumeLabel = var90
		gameSettingsTab.VoiceChatVolumeSlider = var91
		gameSettingsTab.VoiceChatVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceChatVolumeFrame
		gameSettingsTab.VoiceChatVolumeFrame.Visible = false
		
		if voiceVolumeControlsDisableInteractionWhenNoMasterVolume then
			local function updateVoiceChatVolumeSliderInteractable(p11)
				-- upvalues: gameSettings (copy), gameSettingsTab (copy)
				local var92
				if p11 == nil then
					var92 = gameSettings.MasterVolume == 0
				else
					var92 = p11 == 0
					var92 = nil
				end
				if var92 then
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
		gameSettingsTab.VoiceChatVolumeSlider.ValueChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), gameSettingsTab (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var92 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.VoiceChatVolume * 5 + 0.5) else nil
			gameSettings.VoiceChatVolume = p11 / 5
			
			if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil then
				gameSettingsTab.maxVoiceChatVolumeDuringSession = math.max(gameSettingsTab.maxVoiceChatVolumeDuringSession, gameSettings.VoiceChatVolume)
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("voice_chat_volume", var92, math.floor(gameSettings.VoiceChatVolume * 5 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle()
		-- upvalues: gameSettings (copy), getAppFeaturePolicies (copy), var3 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, if getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() then var3:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if gameSettings.HapticStrength == 0 then 1 else 2)
		gameSettingsTab.HapticsFrame = var89
		_ = var90
		gameSettingsTab.HapticsSelector = var91
		gameSettingsTab.HapticsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.HapticsFrame
		gameSettingsTab.HapticsSelector.IndexChanged:connect(function(p11)
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local hapticStrength = gameSettings.HapticStrength
			
			if p11 == 2 then
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
		local var89 = 1
		
		if pcall(function()
			-- upvalues: gameSettings (copy), var89 (write)
			if gameSettings.CameraYInverted == true then
				var89 = 2
			end
		end) == false then
			return
		end
		local var90, var91, var92 = utilityModule:AddNewRow(gameSettingsTab, "Camera Inverted", "Selector", { "Off", "On" }, var89)
		gameSettingsTab.CameraInvertedFrame = var90
		_ = var91
		gameSettingsTab.CameraInvertedSelector = var92
		gameSettingsTab.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t_7[gameSettingsTab.CameraInvertedFrame] = true
		gameSettingsTab.CameraInvertedSelector.IndexChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var93 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.CameraYInverted else nil
			
			if p11 == 2 then
				gameSettings.CameraYInverted = true
			else
				gameSettings.CameraYInverted = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("camera_y_inverted", var93, gameSettings.CameraYInverted)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function setCameraSensitivity(value)
		-- upvalues: userInputService (copy), gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var89 = nil
		local x = nil
		
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var89 = "gamepad"
				x = gameSettings.GamepadCameraSensitivity
			end
			gameSettings.GamepadCameraSensitivity = value
		end
		if userInputService.MouseEnabled then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var89 = "mouse"
				x = gameSettings.MouseSensitivityFirstPerson.X
			end
			local vector2 = Vector2.new(value, value)
			gameSettings.MouseSensitivityFirstPerson = vector2
			gameSettings.MouseSensitivityThirdPerson = vector2
		end
		if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(x) == "number" and typeof(value) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", x)), tonumber(string.format("%.2f", value)), { sensitivity_type = var89 })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), setCameraSensitivity (ref)
		local function _(p11)
			return if p11 <= 0.2 then 0 else p11 <= 1 and math.floor((p11 - 0.2) / 0.16 + 0.5) or math.floor((p11 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p11)
			local var89 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			
			return if var89 <= 0.2 then 0.2 else var89
		end
		
		local mouseSensitivity = gameSettings.MouseSensitivity
		local var89 = if mouseSensitivity <= 0.2 then 0 else mouseSensitivity <= 1 and math.floor((mouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((mouseSensitivity + 2) / 0.6 + 0.5)
		local var90 = true
		local _ = tostring(gameSettings.MouseSensitivityFirstPerson.X)
		local var91, var92, var93 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, var89)
		gameSettingsTab.MouseAdvancedFrame = var91
		gameSettingsTab.MouseAdvancedLabel = var92
		gameSettingsTab.MouseAdvancedEntry = var93
		gameSettingsTab.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
		t_7[gameSettingsTab.MouseAdvancedFrame] = true
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		gameSettingsTab.MouseAdvancedLabel.ZIndex = 2
		gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
		local var94 = create("TextBox")({
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
			Parent = var94
		})
		
		local _ = function(value)
			-- upvalues: var94 (ref)
			var94.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
		end
		
		var94.Text = tostring(tonumber(string.format("%.3f", math.floor(gameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))
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
		
		function setMouseSensitivity(value, p11)
			-- upvalues: var90 (write), setCameraSensitivity (copy), gameSettingsTab (copy), var94 (ref)
			if not var90 then return end
			setCameraSensitivity(value)
			var90 = false
			
			if p11 ~= gameSettingsTab.MouseAdvancedEntry then
				gameSettingsTab.MouseAdvancedEntry:SetValue(if value <= 0.2 then 0 else value <= 1 and math.floor((value - 0.2) / 0.16 + 0.5) or math.floor((value + 2) / 0.6 + 0.5))
			end
			var94.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
			var90 = true
		end
		
		var94.FocusLost:connect(function()
			-- upvalues: gameSettingsTab (copy), var94 (ref), gameSettings (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
			local var95 = tonumber(string.match(var94.Text, "([%d%.]+)"))
			
			if var95 then
				setMouseSensitivity(clampMouseSensitivity(var95), var94)
				
				return
			end
			setMouseSensitivity(gameSettings.MouseSensitivityFirstPerson.X, var94)
		end)
		var94.Focused:connect(function()
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(false)
		end)
		gameSettingsTab.MouseAdvancedEntry.ValueChanged:connect(function(p11)
			-- upvalues: gameSettingsTab (copy)
			local var95 = clampMouseSensitivity(p11)
			local var96 = if var95 <= 5 then 0.16 * var95 + 0.2 else 0.6 * var95 - 2
			setMouseSensitivity(if var96 <= 0.2 then 0.2 else var96, gameSettingsTab.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (ref)
		local function _(p11)
			return if p11 <= 0.2 then 0 else p11 <= 1 and math.floor((p11 - 0.2) / 0.16 + 0.5) or math.floor((p11 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p11)
			local var89 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			
			return if var89 <= 0.2 then 0.2 else var89
		end
		
		local gamepadCameraSensitivity = gameSettings.GamepadCameraSensitivity
		local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, if gamepadCameraSensitivity <= 0.2 then 0 else gamepadCameraSensitivity <= 1 and math.floor((gamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((gamepadCameraSensitivity + 2) / 0.6 + 0.5))
		gameSettingsTab.GamepadSensitivityFrame = var89
		gameSettingsTab.GamepadSensitivityLabel = var90
		gameSettingsTab.GamepadSensitivitySlider = var91
		gameSettingsTab.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		gameSettingsTab.GamepadSensitivitySlider.ValueChanged:connect(function(p11)
			-- upvalues: setCameraSensitivity (copy)
			local var92 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			setCameraSensitivity(if var92 <= 0.2 then 0.2 else var92)
		end)
	end
	
	local function createOverscanOption()
		-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), runService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local adjustButton, adjustButton_1, adjustButton_2 = utilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function()
			-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			local _ = nil
			local var89 = require(robloxGui.Modules.Settings.Components.OverscanWrapper)(require(robloxGui.Modules.Shell.Components.Overscan10ft.Overscan))
			local roactModule = require(corePackagesService.Packages.Roact)
			local var90 = nil
			local t = {
				onUnmount = function()
					-- upvalues: var90 (write), roactModule (ref), contextActionService (copy), settingsHubModule (ref)
					if var90 then
						roactModule.unmount(var90)
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
			var90 = roactModule.mount(roactModule.createElement(var89, t), robloxGui, tostring(var89))
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
		local var89 = utilityModule:AddNewRowObject(gameSettingsTab, "Safe Zone", adjustButton)
		var89.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
		adjustButton_2(var89)
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
				local var89 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton, nil, true)
				var89.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				devConsoleButton_2(var89)
				
				return
			end
			local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, gameSettingsTab)
			devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
			devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
			devConsoleButton.Position = UDim2.new(1, -400, 0.5, 0)
			devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
			local var90 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton)
			var90.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			devConsoleButton_2(var90)
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
			local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			gameSettingsTab.uiToggleRow = var89
			gameSettingsTab.uiToggleFrame = var90
			gameSettingsTab.uiToggleSelector = var91
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
		local var92 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var93 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		gameSettingsTab.uiToggleSelectors = {}
		
		for i, v in list do
			local var94 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = v.label })
			local var95, var96, var97 = utilityModule:AddNewRow(gameSettingsTab, var94, "Selector", { var92, var93 }, 1)
			var95.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v.layoutOrderKey]
			var97.IndexChanged:Connect(function(p11)
				-- upvalues: guiService (copy), v (ref)
				if (if guiService:GetGuiIsVisible(v.type) then 1 else 2) ~= p11 then
					guiService:ToggleGuiIsVisibleIfAllowed(v.type)
				end
			end)
			gameSettingsTab.uiToggleSelectors[v.label] = {
				label = var94,
				type = v.type,
				row = var95,
				frame = var96,
				selector = var97
			}
		end
		local var98, var99, var100 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { var93, var92 }, 1)
		gameSettingsTab.freecamRow = var98
		gameSettingsTab.freecamFrame = var99
		gameSettingsTab.freecamSelector = var100
		gameSettingsTab.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
		gameSettingsTab.freecamSelector.IndexChanged:Connect(function(p11)
			-- upvalues: localPlayer (copy)
			local var101 = p11 == 2
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				freecamScript:SetAttribute("FreecamEnabled", var101)
				
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
				local var101 = if guiService:GetGuiIsVisible(v.type) then 1 else 2
				
				if var101 ~= v.selector:GetSelectedIndex() then
					v.selector:SetSelectionIndex(var101)
				end
			end
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				gameSettingsTab.freecamSelector:SetSelectionIndex(if freecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not gameSettingsTab.uiToggleSelector then return end
		local var102 = if guiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if var102 == gameSettingsTab.uiToggleSelector:GetSelectedIndex() then return end
		gameSettingsTab.uiToggleSelector:SetSelectionIndex(var102)
	end
	
	local _ = function(p11, p12, p13)
		return p11 and (p12 and (p13 and (#p11 > 0 and (p13 > 0 and (p13 <= #p11 and #p11 == #p12)))))
	end
	
	local _ = function(p11, p12)
		-- upvalues: soundService (copy), name (copy)
		soundService:SetOutputDevice(p11, p12)
		name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", p11, p12)
	end
	
	local function createDeviceOptions(p11)
		-- upvalues: gameSettingsTab (ref), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFIntVoiceChatDeviceChangeDebounceDelayModule (copy), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
		local var103 = gameSettingsTab[p11 .. "DeviceIndex"] or 0
		local var104 = gameSettingsTab[p11 .. "DeviceNames"] or {}
		local var105 = gameSettingsTab[p11 .. "DeviceGuids"] or {}
		local var106 = p11 == "Input" and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local var107 = gameSettingsTab
		local text = p11 .. "DeviceFrame"
		local text_1 = p11 .. "DeviceSelector"
		local var108, var109, var110 = utilityModule:AddNewRow(gameSettingsTab, var106, "Selector", var104, var103)
		var107[text] = var108
		_ = var109
		gameSettingsTab[text_1] = var110
		gameSettingsTab[p11 .. "DeviceFrame"].LayoutOrder = if p11 == "Input" then SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput else SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		gameSettingsTab[p11 .. "DeviceInfo"] = {
			Name = if var103 > 0 then var104[var103] else nil,
			Guid = if var103 > 0 then var105[var103] else nil
		}
		gameSettingsTab[p11 .. "PrevDeviceName"] = gameSettingsTab[p11 .. "DeviceInfo"].Name
		local var111 = 0
		local var112 = getFIntVoiceChatDeviceChangeDebounceDelayModule()
		gameSettingsTab[p11 .. "DeviceSelector"].IndexChanged:connect(function(p12)
			-- upvalues: gameSettingsTab (copy), p11 (ref), var111 (write), var112 (ref), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab[p11 .. "DeviceInfo"].Name == gameSettingsTab[p11 .. "DeviceNames"][p12] and gameSettingsTab[p11 .. "DeviceInfo"].Guid == gameSettingsTab[p11 .. "DeviceGuids"][p12] then return end
			local var113 = var111 + 1
			var111 = var113
			wait(var112)
			
			if var113 == var111 then
				var111 = 0
				gameSettingsTab[p11 .. "DeviceInfo"] = {
					Name = gameSettingsTab[p11 .. "DeviceNames"][p12],
					Guid = gameSettingsTab[p11 .. "DeviceGuids"][p12]
				}
				local name_1 = gameSettingsTab[p11 .. "DeviceInfo"].Name
				local guid = gameSettingsTab[p11 .. "DeviceInfo"].Guid
				
				if gameSettingsTab.VoiceChatOptionsEnabled then
					default_2:SwitchDevice(p11, name_1, guid)
				else
					soundService:SetOutputDevice(name_1, guid)
					name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", name_1, guid)
				end
				if getFFlagEnableCrossExpVoice() then
					name:debug("[GameSettings] Changing {} device to {} {} ", p11, name_1, guid)
					
					if p11 == "Input" then
						default_3:changeInputDevice(name_1, guid)
					else
						default_3:changeOutputDevice(name_1, guid)
					end
				end
				reportSettingsChangeForAnalytics(p11, gameSettingsTab[p11 .. "PrevDeviceName"], name_1)
				gameSettingsTab[p11 .. "PrevDeviceName"] = name_1
			end
		end)
	end
	
	local _ = function()
		-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var103, var104, var105 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var103
			gameSettingsTab.badgeVisibleFrame = var104
			gameSettingsTab.badgeVisibleSelector = var105
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p11)
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p11 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p11 == 1)
			end)
		end)
	end
	
	local function createChatModerationOptions()
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), var3 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), signalsModule (copy), reportSettingsChangeForAnalytics (copy)
		local _ = {
			title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView",
			description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription",
			on = "InGame.CommonUI.Label.On",
			off = "InGame.CommonUI.Label.Off"
		}
		local var103, var104, var105 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			var3:Format("InGame.CommonUI.Label.Off"),
			var3:Format("InGame.CommonUI.Label.On")
		}, 1, nil, var3:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		gameSettingsTab.ChatModerationFrame = var103
		_ = var104
		gameSettingsTab.ChatModerationSelector = var105
		gameSettingsTab.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
		gameSettingsTab.ChatModerationFrame.Visible = false
		local chatModerationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		gameSettingsTab.ChatModerationDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), chatModerationStore (ref)
			gameSettingsTab.ChatModerationFrame.Visible = chatModerationStore.getIsSettingVisible(p11)
			local var106 = if chatModerationStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.ChatModerationSelector:GetSelectedIndex() ~= var106 then
				gameSettingsTab.ChatModerationSelector:SetSelectionIndex(var106)
			end
		end)
		gameSettingsTab.ChatModerationSelector.IndexChanged:connect(function(p11)
			-- upvalues: chatModerationStore (ref), reportSettingsChangeForAnalytics (copy)
			local var106 = p11 == 2
			chatModerationStore.setIsSettingEnabled(var106)
			reportSettingsChangeForAnalytics("moderate_chat", not var106, var106)
		end)
		chatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceAIRephraseSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy), expChatDebounceRephraseIndexSelection (copy), throttleFunctionCallModule (copy)
		local var103, var104, var105 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription"))
		gameSettingsTab.AIRephraseFrame = var103
		_ = var104
		gameSettingsTab.AIRephraseSelector = var105
		gameSettingsTab.AIRephraseFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AIRephraseFrame
		gameSettingsTab.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local var106 = getFIntDebounceAIRephraseSettingDelayModule()
		local var107 = var106 > 0
		local var108 = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.AIRephraseDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), AIRephraseSettingStore (ref), var108 (write)
			gameSettingsTab.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p11)
			local var109 = if AIRephraseSettingStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.AIRephraseSelector:GetSelectedIndex() ~= var109 then
				var108 = var109
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var109)
			end
		end)
		
		local var109 = function(p11)
			-- upvalues: var108 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p11 == var108 then
				return
			end
			local var110 = p11 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var110 (ref), AIRephraseSettingStore (copy), var108 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var110 then "Enabled" else "Disabled") then
					AIRephraseSettingStore.setIsSettingEnabled(var110)
					var108 = p11
					reportSettingsChangeForAnalytics("ai_rephrase", not var110, var110)
					
					return
				end
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var108)
			end)
		end
		
		if not expChatDebounceRephraseIndexSelection then
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(if var107 then throttleFunctionCallModule(var106, var109) else var109)
		elseif var107 then
			local var110 = nil
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(function(p11)
				-- upvalues: var110 (write), var106 (ref), var108 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var110 then
					task.cancel(var110)
				end
				var110 = task.delay(var106, function()
					-- upvalues: var110 (copy), p11 (ref), var108 (copy), textChatService (copy), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var110 = nil
					
					if p11 == var108 then
						return
					end
					local var111 = p11 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var111 (ref), AIRephraseSettingStore (copy), var108 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var111 then "Enabled" else "Disabled") then
							AIRephraseSettingStore.setIsSettingEnabled(var111)
							var108 = p11
							reportSettingsChangeForAnalytics("ai_rephrase", not var111, var111)
							
							return
						end
						gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var108)
					end)
				end)
			end)
		else
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(var109)
		end
	end
	
	local function createChatSummariesSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceChatSummariesSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy)
		local var103, var104, var105 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription"))
		gameSettingsTab.ChatSummariesFrame = var103
		_ = var104
		gameSettingsTab.ChatSummariesSelector = var105
		gameSettingsTab.ChatSummariesFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatSummariesFrame
		gameSettingsTab.ChatSummariesFrame.Visible = false
		local chatSummariesSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local var106 = getFIntDebounceChatSummariesSettingDelayModule()
		local var107 = var106 > 0
		local var108 = if chatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.ChatSummariesDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), chatSummariesSettingStore (ref), var108 (write)
			gameSettingsTab.ChatSummariesFrame.Visible = chatSummariesSettingStore.getIsSettingVisible(p11)
			local var109 = if chatSummariesSettingStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.ChatSummariesSelector:GetSelectedIndex() ~= var109 then
				var108 = var109
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var109)
			end
		end)
		
		local var109 = function(p11)
			-- upvalues: var108 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p11 == var108 then
				return
			end
			local var110 = p11 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var110 (ref), chatSummariesSettingStore (copy), var108 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var110 then "Enabled" else "Disabled") then
					chatSummariesSettingStore.setIsSettingEnabled(var110)
					var108 = p11
					reportSettingsChangeForAnalytics("chat_summaries", not var110, var110)
					
					return
				end
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var108)
			end)
		end
		
		if var107 then
			local var110 = nil
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(function(p11)
				-- upvalues: var110 (write), var106 (ref), var108 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var110 then
					task.cancel(var110)
				end
				var110 = task.delay(var106, function()
					-- upvalues: var110 (copy), p11 (ref), var108 (copy), textChatService (copy), chatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var110 = nil
					
					if p11 == var108 then
						return
					end
					local var111 = p11 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var111 (ref), chatSummariesSettingStore (copy), var108 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var111 then "Enabled" else "Disabled") then
							chatSummariesSettingStore.setIsSettingEnabled(var111)
							var108 = p11
							reportSettingsChangeForAnalytics("chat_summaries", not var111, var111)
							
							return
						end
						gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var108)
					end)
				end)
			end)
		else
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(var109)
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
		local var103 = robloxTranslatorModule:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications")
		local var104 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var105 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		
		local function _()
			-- upvalues: default (ref), notificationTypeEnum (ref)
			return if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then 1 else 2
		end
		
		local var106 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
		local var107, var108, var109 = utilityModule:AddNewRow(gameSettingsTab, var103, "Selector", { var105, var104 }, var106)
		gameSettingsTab.ChatNotificationsFrame = var107
		_ = var108
		gameSettingsTab.ChatNotificationsSelector = var109
		gameSettingsTab.ChatNotificationsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatNotificationsFrame
		gameSettingsTab.ChatNotificationsSelector.IndexChanged:connect(function(p11)
			-- upvalues: var106 (write), default (ref), notificationGroups (ref), reportSettingsChangeForAnalytics (copy)
			if p11 == var106 then return end
			local var110 = var106 == 2
			local var111 = p11 == 2
			var106 = p11
			
			if var111 then
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
			reportSettingsChangeForAnalytics("chat_notifications", var110, var111)
		end)
		notificationSnoozedSignal:connect(function(p11)
			-- upvalues: notificationTypeEnum (ref), snoozeActionEnum (ref), gameSettingsTab (copy), var106 (write)
			if p11.notificationType ~= notificationTypeEnum.ChatNewMessage then return end
			local var110 = if p11.actionType == snoozeActionEnum.Mute then 1 else 2
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var110 then
				var106 = var110
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var110)
			end
		end)
		gameSettingsTab.Displayed.Event:Connect(function()
			-- upvalues: default (ref), notificationTypeEnum (ref), t (ref), gameSettingsTab (copy), var106 (write)
			local var110 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var110 then
				var106 = var110
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var110)
			end
		end)
	end
	
	local function createCameraDeviceOptions()
		-- upvalues: gameSettingsTab (ref), var12 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
		local cameraDeviceIndex = gameSettingsTab.CameraDeviceIndex or 1
		local cameraDeviceNames = gameSettingsTab.CameraDeviceNames or {}
		local cameraDeviceGuids = gameSettingsTab.CameraDeviceGuids or {}
		local var103, var104, var105 = utilityModule:AddNewRow(gameSettingsTab, var12, "Selector", cameraDeviceNames, cameraDeviceIndex)
		gameSettingsTab.CameraDeviceFrame = var103
		_ = var104
		gameSettingsTab.CameraDeviceSelector = var105
		gameSettingsTab.CameraDeviceFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraDeviceFrame
		gameSettingsTab.CameraDeviceInfo = {
			Name = if cameraDeviceIndex > 0 then cameraDeviceNames[cameraDeviceIndex] else nil,
			Guid = if cameraDeviceIndex > 0 then cameraDeviceGuids[cameraDeviceIndex] else nil
		}
		gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		gameSettingsTab.CameraDeviceSelector.IndexChanged:connect(function(p11)
			-- upvalues: gameSettingsTab (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab.CameraDeviceInfo.Name == gameSettingsTab.CameraDeviceNames[p11] and gameSettingsTab.CameraDeviceInfo.Guid == gameSettingsTab.CameraDeviceGuids[p11] then
				return
			end
			gameSettingsTab.CameraDeviceInfo = {
				Name = gameSettingsTab.CameraDeviceNames[p11],
				Guid = gameSettingsTab.CameraDeviceGuids[p11]
			}
			local guid = gameSettingsTab.CameraDeviceInfo.Guid
			name:info("Changed webcam to: {}", guid)
			userGameSettingsService.DefaultCameraID = guid
			reportSettingsChangeForAnalytics("video_camera", gameSettingsTab.prevCameraDeviceName or "None", gameSettingsTab.CameraDeviceInfo.Name)
			gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		end)
	end
	
	local function updateAudioDevices(p11)
		-- upvalues: soundService (copy), var3 (copy), gameSettingsTab (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy), createDeviceOptions (ref)
		local ok, status, var103, var104 = pcall(function()
			-- upvalues: p11 (ref), soundService (copy)
			return if p11 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var103 and (var104 and (#status > 0 and (var104 > 0 and (var104 <= #status and #status == #var103)))))) then
			if var103[1] == "" then
				status[1] = var3:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p11 .. "DeviceNames"] = status
			gameSettingsTab[p11 .. "DeviceGuids"] = var103
			gameSettingsTab[p11 .. "DeviceIndex"] = var104
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} device info", p11)
		end
		gameSettingsTab[p11 .. "DeviceNames"] = {}
		gameSettingsTab[p11 .. "DeviceGuids"] = {}
		gameSettingsTab[p11 .. "DeviceIndex"] = 0
		if gameSettingsTab[p11 .. "DeviceSelector"] then
			gameSettingsTab[p11 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p11 .. "DeviceSelector"]:SetSelectionIndex(var104)
			
			return
		end
		createDeviceOptions(p11)
	end
	
	local function updateVoiceChatDevices(p11)
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), soundService (copy), var3 (copy), gameSettingsTab (ref), createDeviceOptions (ref)
		if p11 ~= "Input" and p11 ~= "Output" and getFFlagVoiceChatUILoggingModule() then
			name:warning("{} is not supported in VoiceChat devices", p11)
		end
		local ok, status, var103, var104 = pcall(function()
			-- upvalues: p11 (ref), soundService (copy)
			return if p11 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var103 and (var104 and (#status > 0 and (var104 > 0 and (var104 <= #status and #status == #var103)))))) then
			if var103[1] == "" then
				status[1] = var3:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p11 .. "DeviceNames"] = status
			gameSettingsTab[p11 .. "DeviceGuids"] = var103
			gameSettingsTab[p11 .. "DeviceIndex"] = var104
		elseif getFFlagVoiceChatUILoggingModule() then
			if #status > 0 then
				name:warning("Errors in get {} device info success: {}", p11, ok)
			else
				name:warning("Empty deviceNames list for {}", p11)
			end
		end
		gameSettingsTab[p11 .. "DeviceNames"] = {}
		gameSettingsTab[p11 .. "DeviceGuids"] = {}
		gameSettingsTab[p11 .. "DeviceIndex"] = 0
		if gameSettingsTab[p11 .. "DeviceSelector"] then
			gameSettingsTab[p11 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p11 .. "DeviceSelector"]:SetSelectionIndex(var104)
		else
			createDeviceOptions(p11)
		end
		if gameSettingsTab[p11 .. "DeviceFrame"] then
			if #status > 0 then
				gameSettingsTab[p11 .. "DeviceFrame"].Visible = true
				
				return
			end
			gameSettingsTab[p11 .. "DeviceFrame"].Visible = false
		end
	end
	
	local function updateCameraDevices()
		-- upvalues: videoCaptureService (copy), var11 (copy), userGameSettingsService (copy), gameSettingsTab (ref), createCameraDeviceOptions (ref)
		local cameraDevices = videoCaptureService:GetCameraDevices()
		local t = {}
		local t_1 = {}
		local var103 = 1
		table.insert(t, var11)
		table.insert(t_1, "{DefaultDeviceGuid}")
		
		for i, v in pairs(cameraDevices) do
			if i == userGameSettingsService.DefaultCameraID then
				var103 = #t + 1
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
		gameSettingsTab.CameraDeviceSelector:SetSelectionIndex(var103)
	end
	
	local var104 = nil
	local var105 = nil
	
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
		-- upvalues: soundService (copy), var104 (write), gameSettingsTab (ref), updateAudioOptions (ref)
		if soundService.DeviceListChanged then
			var104 = soundService.DeviceListChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var105 (write), gameSettingsTab (ref), updateCameraDevices (ref)
		if videoCaptureService.DevicesChanged then
			var105 = videoCaptureService.DevicesChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
				if gameSettingsTab.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: soundService (copy), var104 (write)
		if soundService.DeviceListChanged and var104 then
			var104:Disconnect()
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var105 (write)
		if videoCaptureService.DevicesChanged and var105 then
			var105:Disconnect()
			var105 = nil
		end
	end
	
	local var106 = nil
	local var107 = nil
	
	local _ = function()
		-- upvalues: RUUserScalePreferenceAPIEngineFeature (copy), var106 (write), gameSettingsTab (ref), createUIScaleOptionsImpl (ref), var107 (write)
		if RUUserScalePreferenceAPIEngineFeature then
			local function rebindToCurrentCamera()
				-- upvalues: var106 (copy), gameSettingsTab (copy), createUIScaleOptionsImpl (copy)
				if var106 then
					var106:Disconnect()
					var106 = nil
				end
				local currentCamera = workspace.CurrentCamera
				
				if currentCamera then
					var106 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: gameSettingsTab (copy), createUIScaleOptionsImpl (copy)
						if gameSettingsTab.PageOpen then
							local ok, status = pcall(createUIScaleOptionsImpl)
							
							if not ok then
								warn("createUIScaleOptions failed: " .. tostring(status))
							end
						end
					end)
					
					return
				end
			end
			
			rebindToCurrentCamera()
			var107 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(rebindToCurrentCamera)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var106 (write), var107 (write), var33 (write), var34 (write)
		if var106 then
			var106:Disconnect()
			var106 = nil
		end
		if var107 then
			var107:Disconnect()
			var107 = nil
		end
		var33 = nil
		var34 = nil
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
	
	local var108 = false
	local var109 = if differentiateVoiceSelectorSystemAndUser then false else nil
	
	local function createVoiceChatSelector()
		-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (ref), var3 (copy), default_2 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), differentiateVoiceSelectorSystemAndUser (copy), getFIntDebounceDisconnectButtonDelayModule (copy), var109 (write), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var108 (write), throttleFunctionCallModule (copy), voiceChatSelectorReconnectFocus2AEGIS2 (copy), guiService (copy), debounceVoiceSelectorIndexChange (copy), deferProgrammaticChange (copy)
		if voiceSelectorAvailableAfterFae and gameSettingsTab.VoiceConnectDisconnectFrame and gameSettingsTab.VoiceConnectDisconnectSelector then return end
		local var110 = var3:Format("Feature.GameDetails.Label.VoiceChat")
		local var111 = var3:Format("Feature.SettingsHub.Label.Disconnected")
		local var112 = var3:Format("Feature.SettingsHub.Label.Connected")
		local var113 = if default_2:VoiceChatEnded() then 1 else 2
		local var114 = gameSettingsTab
		local var115, var116, var117 = utilityModule:AddNewRow(gameSettingsTab, var110, "Selector", { var111, var112 }, var113)
		gameSettingsTab.VoiceConnectDisconnectFrame = var115
		_ = var116
		var114.VoiceConnectDisconnectSelector = var117
		gameSettingsTab.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectDisconnectSelector
		local service = default_2:getService()
		
		if service and not differentiateVoiceSelectorSystemAndUser then
			service.StateChanged:Connect(function(p11, p12)
				-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (copy), default_2 (copy)
				if voiceSelectorAvailableAfterFae then
					if p11 == p12 then return end
					if p12 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						
						return
					elseif (p12 == Enum.VoiceChatState.Ended or p12 == Enum.VoiceChatState.Failed or p12 == Enum.VoiceChatState.Idle) and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
						
						return
					end
				elseif p11 == p12 then return end
				if p12 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				elseif default_2:VoiceChatEnded() then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			end)
		end
		local var118 = var113
		local var119 = getFIntDebounceDisconnectButtonDelayModule()
		
		local var120 = function(p11)
			-- upvalues: var118 (write), differentiateVoiceSelectorSystemAndUser (copy), var109 (copy), fFlagVoiceRewarmTelemetry (copy), default_2 (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var108 (copy), gameSettingsTab (copy)
			if p11 == var118 then return end
			var118 = p11
			
			if differentiateVoiceSelectorSystemAndUser and var109 then return end
			if fFlagVoiceRewarmTelemetry then
				local var121, var122, var123, var124 = default_2:GetConnectDisconnectButtonAnalyticsData(p11 == 2)
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var121, var122, var123, var124, default_2.joinVoiceButtonContext)
			else
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(p11 == 2))
			end
			if p11 == 2 then
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
			if var108 then
				task.spawn(function()
					-- upvalues: p11 (ref), gameSettingsTab (copy)
					task.wait(0.5)
					
					if p11 ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		gameSettingsTab.VoiceConnectDisconnectSelector.IndexChanged:connect(if var119 > 0 then throttleFunctionCallModule(var119, var120) else var120)
		
		if voiceChatSelectorReconnectFocus2AEGIS2 then
			gameSettingsTab.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p11, p12)
				-- upvalues: var110 (ref), gameSettingsTab (copy), guiService (copy)
				if p12 and p11 and (p11.Parent and p11.Parent.Name == var110 .. "Frame") and (p12.Name == "ImageButton" and gameSettingsTab.Active) then
					guiService.SelectedCoreObject = p11
				end
			end)
		end
		default_2:subscribe("OnStateChanged", function(_, p11)
			-- upvalues: differentiateVoiceSelectorSystemAndUser (copy), var109 (copy), debounceVoiceSelectorIndexChange (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			if differentiateVoiceSelectorSystemAndUser then
				var109 = true
				
				if debounceVoiceSelectorIndexChange then
					if p11 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					end
				elseif p11 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end
			if debounceVoiceSelectorIndexChange then
				if p11 == Enum.VoiceChatState.Failed and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			elseif p11 == Enum.VoiceChatState.Failed then
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end
			if differentiateVoiceSelectorSystemAndUser then
				if deferProgrammaticChange then
					task.defer(function()
						-- upvalues: var109 (copy)
						var109 = false
					end)
					
					return
				end
				var109 = false
			end
		end)
		default_2:subscribe("OnRequestMicPermissionRejected", function()
			-- upvalues: var108 (copy), differentiateVoiceSelectorSystemAndUser (copy), var109 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			task.spawn(function()
				-- upvalues: var108 (copy), differentiateVoiceSelectorSystemAndUser (copy), var109 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
				task.wait(0.5)
				var108 = true
				
				if differentiateVoiceSelectorSystemAndUser then
					var109 = true
				end
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if differentiateVoiceSelectorSystemAndUser then
					if deferProgrammaticChange then
						task.defer(function()
							-- upvalues: var109 (copy)
							var109 = false
						end)
						
						return
					end
					var109 = false
				end
			end)
		end)
	end
	
	local function createVoiceConnectDisconnect()
		-- upvalues: default_2 (copy), var3 (copy), getFIntDebounceDisconnectButtonDelayModule (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), utilityModule (copy), throttleFunctionCallModule (copy), gameSettingsTab (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy)
		if default_2:IsSeamlessVoice() and not default_2.isShowingFTUX then
			local _ = nil
			local _ = nil
			local _ = nil
			local _ = nil
			local var110 = var3:Format("Feature.GameDetails.Label.VoiceChat")
			local var111 = var3:Format("Feature.SettingsHub.Label.Connect")
			local var112 = var3:Format("Feature.SettingsHub.Label.Disconnect")
			local var113 = getFIntDebounceDisconnectButtonDelayModule()
			local var114 = var113 > 0
			
			local var115 = function()
				-- upvalues: default_2 (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy)
				local var116
				if default_2:getService() then
					var116 = nil
					var116 = default_2:getService().StateChanged:Connect(function(_, p11)
						-- upvalues: fFlagVoiceRewarmTelemetry (copy), default_2 (copy), var116 (write)
						if p11 == Enum.VoiceChatState.Joined then
							if fFlagVoiceRewarmTelemetry then
								local var117, var118, var119, var120 = default_2:GetConnectDisconnectButtonAnalyticsData(true)
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var117, var118, var119, var120, default_2.joinVoiceButtonContext)
							else
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							var116:Disconnect()
						end
					end)
				elseif fFlagVoiceRewarmTelemetry then
					var116, var636, var637, var638 = default_2:GetConnectDisconnectButtonAnalyticsData(false)
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var116, var636, var637, var638, default_2.joinVoiceButtonContext)
				else
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			end
			
			local var116 = function()
				-- upvalues: default_2 (copy), constantsModule_1 (copy)
				default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			
			local voiceConnectButton, voiceConnectButton_1, voiceConnectButton_2 = utilityModule:MakeStyledButton("VoiceConnectButton", var111, UDim2.new(1, 0, 1, -20), if var114 then throttleFunctionCallModule(var113, var115) else var115, gameSettingsTab)
			voiceConnectSetRowRef = voiceConnectButton_2
			local var117 = voiceConnectButton
			local var118 = voiceConnectButton_1
			local voiceDisconnectButton, voiceDisconnectButton_1, voiceDisconnectButton_2 = utilityModule:MakeStyledButton("VoiceDisconnectButton", var112, UDim2.new(1, 0, 1, -20), if var114 then throttleFunctionCallModule(var113, var116) else var116, gameSettingsTab)
			voiceDisconnectSetRowRef = voiceDisconnectButton_2
			local var119 = voiceDisconnectButton
			local var120 = voiceDisconnectButton_1
			var117.Size = UDim2.new(0.6, 0, 0, 40)
			var117.Position = UDim2.new(0.4, 0, 0.5, 0)
			var117.AnchorPoint = Vector2.new(0, 0.5)
			var117.ZIndex = 2
			var117.Selectable = true
			var118.ZIndex = 2
			var119.Size = UDim2.new(0.6, 0, 0, 40)
			var119.Position = UDim2.new(0.4, 0, 0.5, 0)
			var119.AnchorPoint = Vector2.new(0, 0.5)
			var119.ZIndex = 2
			var119.Selectable = true
			var120.ZIndex = 2
			local var121 = utilityModule:AddNewRowObject(gameSettingsTab, var110, var117, nil, true)
			local var122 = utilityModule:AddNewRowObject(gameSettingsTab, var110, var119, nil, true)
			gameSettingsTab.VoiceConnectFrame = var121
			gameSettingsTab.VoiceDisconnectFrame = var122
			var121.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			var122.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(var121)
			voiceDisconnectSetRowRef(var122)
			
			if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				var121.Visible = false
				var122.Visible = false
				
				return
			elseif default_2:ShouldShowJoinVoice() then
				var121.Visible = true
				var122.Visible = false
				
				return
			end
			var121.Visible = false
			var122.Visible = true
		end
	end
	
	local function createVRComfortSettingOptions()
		-- upvalues: var3 (copy), gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
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
			t_1[i] = var3:Format(t[tostring(v)])
		end
		local var110, var111, var112 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", t_1, table.find(enumItems, gameSettings.VRComfortSetting), nil, var3:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		gameSettingsTab.VRComfortSettingFrame = var110
		gameSettingsTab.VRComfortSettingLabel = var111
		gameSettingsTab.VRComfortSettingSelector = var112
		gameSettingsTab.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame
		local var113, var114, var115 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VignetteEnabled then 1 else 2)
		gameSettingsTab.VRVignetteEnabledFrame = var113
		gameSettingsTab.VRVignetteEnabledLabel = var114
		gameSettingsTab.VRVignetteEnabledSelector = var115
		gameSettingsTab.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame
		local var116, var117, var118 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRSmoothRotationEnabled then 2 else 1)
		gameSettingsTab.VRSteppedRotationEnabledFrame = var116
		gameSettingsTab.VRSteppedRotationEnabledLabel = var117
		gameSettingsTab.VRSteppedRotationEnabledSelector = var118
		gameSettingsTab.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame
		local var119, var120, var121 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame = var119
		gameSettingsTab.VRThirdPersonFixedCamEnabledLabel = var120
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector = var121
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame
		
		local var122 = function(p11)
			-- upvalues: gameSettingsTab (copy)
			if p11 == Enum.VRComfortSetting.Custom then
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
		
		gameSettingsTab.VRComfortSettingSelector.IndexChanged:connect(function(p11)
			-- upvalues: enumItems (ref), gameSettings (copy), var122 (ref)
			local var123 = enumItems[p11]
			gameSettings.VRComfortSetting = var123
			var122(var123)
		end)
		var122(gameSettings.VRComfortSetting)
		gameSettingsTab.VRVignetteEnabledSelector.IndexChanged:connect(function(p11)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VignetteEnabledCustomOption = p11 == 1
			end
		end)
		gameSettingsTab.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p11)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRSmoothRotationEnabledCustomOption = p11 == 2
			end
		end)
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p11)
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRThirdPersonFollowCamEnabledCustomOption = p11 == 2
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
			local var123 = if gameSettings.VignetteEnabled then 1 else 2
			
			if gameSettingsTab.VRVignetteEnabledSelector:GetSelectedIndex() ~= var123 then
				gameSettingsTab.VRVignetteEnabledSelector:SetSelectionIndex(var123)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var123 = if gameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if gameSettingsTab.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= var123 then
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetSelectionIndex(var123)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var123 = if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= var123 then
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(var123)
			end
		end)
	end
	
	local function createVRSafetyBubbleModeOptions()
		-- upvalues: var3 (copy), gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
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
			t_1[i] = var3:Format(t[tostring(v)])
		end
		local index = table.find(enumItems, gameSettings.VRSafetyBubbleMode)
		task.defer(function()
			-- upvalues: gameSettingsTab (copy), utilityModule (copy), var3 (copy), t_1 (ref), index (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), enumItems (ref), gameSettings (copy)
			local var123, var124, var125 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", t_1, index, nil, var3:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			gameSettingsTab.VRSafetyBubbleModeFrame = var123
			gameSettingsTab.VRSafetyBubbleModeLabel = var124
			gameSettingsTab.VRSafetyBubbleModeSelector = var125
			gameSettingsTab.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSafetyBubbleModeFrame
			gameSettingsTab.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p11)
				-- upvalues: enumItems (copy), gameSettings (copy)
				gameSettings.VRSafetyBubbleMode = enumItems[p11]
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
	local var123 = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (getFFlagEnableVrVoiceConnectDisconnect() or (if isInExperienceUIVREnabled then not isSpatial() else true)) then
		spawn(function()
			-- upvalues: getFFlagEnableVoiceUxUpdates (copy), hideVoiceChatSelectorForFaeAEGIS2 (copy), default_2 (copy), createVoiceChatSelector (ref), isVoiceFocused (copy), gameSettingsTab (ref), observeIsVoiceFocused (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), voiceVolumeControlsEligibility (copy), name (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var109 (write), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (ref), default_3 (copy), t_4 (copy), getFFlagVoiceChatUILoggingModule (copy)
			if getFFlagEnableVoiceUxUpdates() and (not hideVoiceChatSelectorForFaeAEGIS2 and default_2:EligibleForFaeUpsell() or default_2:IsSeamlessVoice()) and default_2:verifyUniverseAndPlaceCanUseVoice() then
				createVoiceChatSelector()
				
				if isVoiceFocused() and gameSettingsTab.VoiceConnectDisconnectFrame then
					gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
				end
				observeIsVoiceFocused(function(p11)
					-- upvalues: gameSettingsTab (copy)
					if p11 then
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
				-- upvalues: default_2 (copy), gameSettingsTab (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), voiceVolumeControlsEligibility (copy), name (copy), observeIsVoiceFocused (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableVoiceUxUpdates (copy), createVoiceChatSelector (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var109 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (copy), default_3 (copy), t_4 (copy)
				VoiceChatService = default_2:getService()
				
				if default_2:VoiceChatAvailable() then
					gameSettingsTab.VoiceChatOptionsEnabled = true
				end
				if fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and gameSettingsTab.VoiceChatVolumeFrame then
					local function _(p11)
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
						local ok, status = pcall(function()
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), p11 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
							local voiceChatService = game:GetService("VoiceChatService")
							local service = default_2:getService()
							gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then p11 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
						end)
						
						if not ok then
							name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
						end
					end
					
					local var124 = nil
					local ok, status = pcall(function()
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var124 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
						local voiceChatService = game:GetService("VoiceChatService")
						local service = default_2:getService()
						gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var124 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
					end)
					
					if not ok then
						name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
					end
					if voiceVolumeControlsSuppressInExperienceUiForPartyVoice and getFFlagEnableCrossExpVoice() and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						observeIsVoiceFocused(function()
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local var125 = nil
							local ok, status = pcall(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var125 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
								local voiceChatService = game:GetService("VoiceChatService")
								local service = default_2:getService()
								gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var125 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
							end)
							
							if not ok then
								name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
							end
						end)
					end
					if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then
						default_2:subscribe("OnStateChanged", function(_, p11)
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local ok, status = pcall(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), p11 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
								local voiceChatService = game:GetService("VoiceChatService")
								local service = default_2:getService()
								gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then p11 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
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
								local var125 = nil
								local ok, status = pcall(function()
									-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var125 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
									local voiceChatService = game:GetService("VoiceChatService")
									local service = default_2:getService()
									gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var125 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
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
						var109 = true
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function()
							-- upvalues: var109 (copy)
							var109 = false
						end)
						
						return
					end
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				else
					local var125 = false
					
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
						createVoiceConnectDisconnect()
						
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							var125 = isVoiceFocused()
							observeIsVoiceFocused(function(p11)
								-- upvalues: var125 (write), gameSettingsTab (copy), default_2 (copy)
								var125 = p11
								
								if p11 then
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
							gameSettingsTab.VoiceDisconnectFrame.Visible = not var125
						else
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end
					default_2.showVoiceUI.Event:Connect(function()
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var125 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var125 then return end
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
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var125 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var125 then return end
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
		
		var123 = function()
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
	local var124 = nil
	
	local _ = function()
		-- upvalues: var124 (write)
		if var124 then
			var124:disconnect()
			var124 = nil
		end
	end
	
	if getFFlagSelfViewCameraSettings() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local var125 = function(p11)
			-- upvalues: gameSettingsTab (ref)
			gameSettingsTab.VideoOptionsEnabled = p11.hasCameraPermissions
		end
		
		if isCamEnabledForUserAndPlaceModule() then
			getCamMicPermissionsModule(var125, { default.Permissions.CAMERA_ACCESS }, true)
			var124 = cameraDevicePermissionGrantedSignalModule:connect(function()
				-- upvalues: gameSettingsTab (ref), updateCameraDevices (ref), videoCaptureService (copy), var105 (write)
				gameSettingsTab.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if videoCaptureService.DevicesChanged then
					var105 = videoCaptureService.DevicesChanged:Connect(function()
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
		createCameraModeOptions(not var10 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
	end
	local ok
	local _ = function()
		-- upvalues: gameSettings (copy), createGamepadOptions (ref)
		if gameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		end
		local var126 = nil
		var126 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
			-- upvalues: gameSettings (copy), var126 (write), createGamepadOptions (copy)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if var126 then
					var126:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	
	if userInputService.MouseEnabled then
		createMouseOptions()
	elseif not userInputService.GamepadEnabled then
		ok = nil
		ok = userInputService.GamepadConnected:connect(function()
			-- upvalues: ok (write), gameSettings (copy), createGamepadOptions (ref)
			if ok then
				ok:disconnect()
			end
			if gameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()
				
				return
			end
			local var126 = nil
			var126 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: gameSettings (copy), var126 (write), createGamepadOptions (copy)
				if gameSettings.IsUsingGamepadCameraSensitivity then
					if var126 then
						var126:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end)
	elseif gameSettings.IsUsingGamepadCameraSensitivity then
		createGamepadOptions()
	else
		ok = nil
		ok = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
			-- upvalues: gameSettings (copy), ok (write), createGamepadOptions (ref)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if ok then
					ok:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	if not isInExperienceUIVREnabled then
		if gameSettings.IsUsingCameraYInverted then
			createCameraInvertedOptions()
		else
			ok = nil
			ok = gameSettings.Changed:connect(function(p11)
				-- upvalues: gameSettings (copy), ok (write), createCameraInvertedOptions (ref)
				if p11 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
					ok:disconnect()
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
			createCameraModeOptions(not var10 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
			
			if gameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				ok = nil
				ok = gameSettings.Changed:connect(function(p11)
					-- upvalues: gameSettings (copy), ok (write), createCameraInvertedOptions (ref)
					if p11 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
						ok:disconnect()
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
		ok = false
		gameSettingsTab.Displayed.Event:Connect(function()
			-- upvalues: ok (write), gameSettingsTab (ref), default_2 (copy)
			ok = true
			
			if gameSettingsTab.VoiceChatVolumeFrame and gameSettingsTab.VoiceChatVolumeFrame.Visible then
				default_2:RecordGameSettingsOpened()
			end
		end)
		gameSettingsTab.Hidden.Event:Connect(function()
			-- upvalues: ok (write)
			ok = false
		end)
		gameSettingsTab.VoiceChatVolumeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: gameSettingsTab (ref), ok (write), default_2 (copy)
			if gameSettingsTab.VoiceChatVolumeFrame.Visible and ok then
				default_2:RecordGameSettingsOpened()
			end
		end)
	end
	if var6 then
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
	
	if RUUserScalePreferenceAPIEngineFeature then
		ok, status = pcall(createUIScaleOptionsImpl)
		
		if not ok then
			warn("createUIScaleOptions failed: " .. tostring(status))
		end
	end
	createUiNavigationKeyBindOptions()
	
	if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
		createPerformanceStatsOptions()
	end
	if var4 then
		createMicroProfilerOptions()
	end
	if var10 and getAppFeaturePolicies().getSupportsOverscan() then
		createOverscanOption()
	end
	if showAntiHarassmentSettings and fFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var126, var127, var128 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var126
			gameSettingsTab.badgeVisibleFrame = var127
			gameSettingsTab.badgeVisibleSelector = var128
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p11)
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p11 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p11 == 1)
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
	getHasGuiHidingPermissionModule(runService:IsStudio(), localPlayer, playerPermissionsModule):andThen(function(p11)
		-- upvalues: createUiToggleOptions (ref)
		if p11 then
			createUiToggleOptions()
		end
	end):catch(function(p11)
		warn(p11)
	end)
	var16 = true
	
	if VRService.VREnabled then
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	if var5 then
		gameSettingsTab.MoreSettingsBanner = var5({
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MoreSettingsBanner,
			parent = gameSettingsTab.Page
		})
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
		-- upvalues: runService (copy), enableTFFeedbackModeEntryCheck (copy), var10 (copy)
		return if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false else enableTFFeedbackModeEntryCheck and var10
	end
	
	function gameSettingsTab.OpenSettingsPage()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), RUUserScalePreferenceAPIEngineFeature (copy), createUIScaleOptionsImpl (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), updateAudioOptions (ref), soundService (copy), var104 (write), var106 (write), var107 (write), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), getFFlagSelfViewCameraSettings (copy), updateCameraDevices (ref), videoCaptureService (copy), var105 (write), updateUiToggleSelection (ref), var2 (copy), var9 (copy), themeModule (copy), var8 (copy), getLastValueChangerFrame (copy), fFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		gameSettingsTab.PageOpen = true
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if RUUserScalePreferenceAPIEngineFeature then
			local ok, status = pcall(createUIScaleOptionsImpl)
			
			if not ok then
				warn("createUIScaleOptions failed: " .. tostring(status))
			end
		end
		if getFFlagLazyInitiateExperienceLanguageSwitcherModule() and not gameSettingsTab.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and getFFlagEnableLocalesForExperienceLanguageSwitcherModule()) then
			gameSettingsTab.LanguageSwitcherInitialized = true
			experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if soundService.DeviceListChanged then
			var104 = soundService.DeviceListChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
		if RUUserScalePreferenceAPIEngineFeature and RUUserScalePreferenceAPIEngineFeature then
			local function rebindToCurrentCamera()
				-- upvalues: var106 (copy), gameSettingsTab (copy), createUIScaleOptionsImpl (copy)
				if var106 then
					var106:Disconnect()
					var106 = nil
				end
				local currentCamera = workspace.CurrentCamera
				
				if currentCamera then
					var106 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: gameSettingsTab (copy), createUIScaleOptionsImpl (copy)
						if gameSettingsTab.PageOpen then
							local ok, status = pcall(createUIScaleOptionsImpl)
							
							if not ok then
								warn("createUIScaleOptions failed: " .. tostring(status))
							end
						end
					end)
					
					return
				end
			end
			
			rebindToCurrentCamera()
			var107 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(rebindToCurrentCamera)
		end
		gameSettingsTab.startVolume = gameSettings.MasterVolume
		
		if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then
			gameSettingsTab.maxVoiceChatVolumeDuringSession = gameSettings.VoiceChatVolume
		end
		if getFFlagSelfViewCameraSettings() and gameSettingsTab.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
			updateCameraDevices()
			
			if videoCaptureService.DevicesChanged then
				var105 = videoCaptureService.DevicesChanged:Connect(function()
					-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
					if gameSettingsTab.PageOpen then
						updateCameraDevices()
					end
				end)
			end
		end
		updateUiToggleSelection()
		
		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and gameSettingsTab.toggleFeedbackModeButton and gameSettingsTab.toggleFeedbackModeText then
			gameSettingsTab.FeedbackEntryPointEnabled = var2 ~= nil and var2:CanEnterCaptureMode()
			
			if gameSettingsTab.FeedbackEntryPointEnabled then
				gameSettingsTab.toggleFeedbackModeButton.Active = true
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = true
				gameSettingsTab.toggleFeedbackModeText.Text = var9
			else
				gameSettingsTab.toggleFeedbackModeButton.Active = false
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = false
				gameSettingsTab.toggleFeedbackModeText.TextColor3 = themeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				gameSettingsTab.toggleFeedbackModeText.Text = var8
			end
		end
		table.insert(gameSettingsTab.LastSelectableObjects, getLastValueChangerFrame(gameSettingsTab))
		
		if fFlagIEMTabFocusNav then
			table.insert(gameSettingsTab.FirstSelectableObjects, getFirstValueChangerFrame(gameSettingsTab))
			gameSettingsTab.FirstSelectableObjectsUpdated:fire()
		end
	end
	
	function gameSettingsTab.V1MenuLanguageSelectionFeaturePerMillageRollout()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), soundService (copy), var104 (write), RUUserScalePreferenceAPIEngineFeature (copy), var106 (write), var107 (write), var33 (write), var34 (write), getFFlagEnableCrossExpVoice (copy), var123 (write), getFFlagSelfViewCameraSettings (copy), videoCaptureService (copy), var105 (write), var124 (write), default_2 (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy)
		gameSettingsTab.PageOpen = false
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if soundService.DeviceListChanged and var104 then
			var104:Disconnect()
		end
		if RUUserScalePreferenceAPIEngineFeature then
			if var106 then
				var106:Disconnect()
				var106 = nil
			end
			if var107 then
				var107:Disconnect()
				var107 = nil
			end
			var33 = nil
			var34 = nil
		end
		if getFFlagEnableCrossExpVoice() and var123 then
			var123()
		end
		if getFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and videoCaptureService.DevicesChanged and var105 then
				var105:Disconnect()
				var105 = nil
			end
			if var124 then
				var124:disconnect()
				var124 = nil
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
	
	function gameSettingsTab.SetHub(_, p11)
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (ref), getFFlagChatTranslationSettingEnabledModule (copy), getFFlagChatTranslationHoldoutEnabledModule (copy), getFStringChatTranslationLayerNameModule (copy), getChatTranslationLayerData (ref), textChatServiceSettingsSavedEngineFeature (copy), getFFlagChatTranslationNewDefaultsModule (copy), gameSettings (copy), textChatService (copy), getFFlagChatTranslationForceSettingModule (copy), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy), runService (copy), enableTFFeedbackModeEntryCheck (copy), var10 (copy), createFeedbackModeOptions (ref)
		gameSettingsTab.HubRef = p11
		
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
		if if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false elseif enableTFFeedbackModeEntryCheck and var10 then false else true then
			createFeedbackModeOptions()
		end
	end
	
	return gameSettingsTab
end)()