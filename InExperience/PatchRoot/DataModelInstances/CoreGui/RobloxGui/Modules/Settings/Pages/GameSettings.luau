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
local var5 = default_1 and default_1.getHasPartyVoiceVolume()
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
local var6 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local var7 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local var8 = robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
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
local var9 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local _ = nil
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local default_2 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceVolumeControlsEligibility = require(corePackagesService.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local default_3 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local var10 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local romarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local var12 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local var13 = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
local var14 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true

if isInExperienceUIVREnabled then
	if not var14 and not var13 then
		var4 = isSpatial() and var12
	end
elseif not var14 then
	var4 = var13 and var12
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
	local var15 = userInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if var15 then
		t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
	else
		t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
	end
	if var15 then
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
	-- upvalues: IGMEnableGFXReset (ref), gfxResetModule (ref), robloxGui (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (ref), VRService (ref), gameSettings (ref), utilityModule (ref), SETTINGS_MENU_LAYOUT_ORDER (ref), guiService (ref), getFFlagFixCyclicFullscreenIndexEventModule (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), reportSettingsChangeForAnalytics (ref), reportSettingsForAnalytics (ref), rbxAnalyticsService (ref), constantsModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), eraseFPSFromDefaultSetting (ref), robloxTranslatorModule (ref), romarkStartWithGraphicQualityLevelFastInt (ref), t (ref), updateVisibilitySettingsCopy (ref), fFlagUpdatePeopleNamesSettingCopyModule (ref), t_6 (ref), userInputService (ref), create (ref), themeModule (ref), centerShiftLockOverride (ref), microProfilerReadOnlyInformationLabel (ref), touchEnabled (ref), var14 (ref), var13 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), localPlayer (ref), coreUtilityModule (ref), t_3 (ref), getFFlagAlwaysShowVRToggleModule (ref), getAppFeaturePolicies (ref), t_5 (ref), var6 (ref), t_2 (ref), t_1 (ref), url (ref), httpService (ref), feedbackEntryPointImprovedStrictnessCheck (ref), safetyService (ref), var2 (write), feedbackEntryPointButtonSizeAdjustment2 (ref), var8 (ref), disableFeedbackSoothsayerCheck (ref), name (ref), playersService (ref), var7 (ref), runService (ref), getFFlagChatTranslationWaitForIXPModule (ref), IXPServiceWrapper (ref), getFFlagChatTranslationNewDefaultsModule (ref), fFlagRenameVolumeToMainVolumeModule (ref), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (ref), default_3 (ref), var3 (write), voiceVolumeControlsDisableInteractionWhenNoMasterVolume (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), corePackagesService (ref), contextActionService (ref), fixDeveloperConsoleButtonSizeAndPositioning (ref), playerPermissionsModule (ref), userFreecamGuiDestabilization (ref), userShowGuiHideToggles (ref), soundService (ref), getFIntVoiceChatDeviceChangeDebounceDelayModule (ref), default_2 (ref), getFFlagEnableCrossExpVoice (ref), signalsModule (ref), getFIntDebounceAIRephraseSettingDelayModule (ref), textChatService (ref), expChatDebounceRephraseIndexSelection (ref), throttleFunctionCallModule (ref), getFIntDebounceChatSummariesSettingDelayModule (ref), var11 (ref), userGameSettingsService (ref), getFFlagVoiceChatUILoggingModule (ref), videoCaptureService (ref), var10 (ref), differentiateVoiceSelectorSystemAndUser (ref), voiceSelectorAvailableAfterFae (ref), getFIntDebounceDisconnectButtonDelayModule (ref), fFlagVoiceRewarmTelemetry (ref), constantsModule_1 (ref), voiceSelectorIgnoreFailedStateDisconnect (ref), voiceChatSelectorReconnectFocus2AEGIS2 (ref), debounceVoiceSelectorIndexChange (ref), deferProgrammaticChange (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), isVoiceFocused (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), getFFlagEnableVoiceUxUpdates (ref), hideVoiceChatSelectorForFaeAEGIS2 (ref), observeIsVoiceFocused (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (ref), voiceVolumeControlsEligibility (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), t_4 (ref), getFFlagSelfViewCameraSettings (ref), isCamEnabledForUserAndPlaceModule (ref), getCamMicPermissionsModule (ref), default (ref), cameraDevicePermissionGrantedSignalModule (ref), var9 (ref), fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (ref), var5 (ref), showAntiHarassmentSettings (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), playerChoiceTranslationSettingInitializerModule (ref), cachedPolicyServiceModule (ref), var4 (ref), fFlagBadgeVisibilitySettingEnabled (ref), fFlagEnableModerateChatRemoteEvent (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getHasGuiHidingPermissionModule (ref), fFlagIEMSettingsGroupsModule (ref), renderSettingsHeaderModule (write), renderSettingsDividerModule (write), migration (ref), builderIconsModule (ref), enableTFFeedbackModeEntryCheck (ref), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (ref), experienceLanguageSwitcherInitializerModule (ref), getLastValueChangerFrame (ref), fFlagIEMTabFocusNav (ref), getFirstValueChangerFrame (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFFlagChatTranslationHoldoutEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), textChatServiceSettingsSavedEngineFeature (ref), getFFlagChatTranslationForceSettingModule (ref), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (ref)
	if IGMEnableGFXReset then
		gfxResetModule.RunGfxReset()
	end
	local gameSettingsTab = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		gameSettingsTab.LanguageSwitcherInitialized = false
	end
	local var15 = false
	local t_7 = {}
	
	local function _()
		-- upvalues: VRService (copy), t_7 (ref)
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function()
		-- upvalues: VRService (copy), var15 (write), t_7 (ref)
		if VRService.VREnabled and var15 then
			local VREnabled = VRService.VREnabled
			
			for i, v in pairs(t_7) do
				i.Visible = not VREnabled
			end
		end
	end)
	local function createGraphicsOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), rbxAnalyticsService (copy), constantsModule (copy), gameBasicSettingsFramerateCapEngineFeature (copy), VRService (copy), eraseFPSFromDefaultSetting (copy), robloxTranslatorModule (copy), IGMEnableGFXReset (copy), gfxResetModule (copy), romarkStartWithGraphicQualityLevelFastInt (copy), t (copy)
		local var16, var17, var18 = utilityModule:AddNewRow(gameSettingsTab, "Fullscreen", "Selector", { "On", "Off" }, if not gameSettings:InFullScreen() then 2 else 1)
		gameSettingsTab.FullscreenFrame = var16
		gameSettingsTab.FullscreenLabel = var17
		gameSettingsTab.FullscreenEnabler = var18
		gameSettingsTab.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t_7[gameSettingsTab.FullscreenFrame] = true
		gameSettingsTab.FullscreenEnabler.IndexChanged:connect(function(p3)
			-- upvalues: gameSettings (copy), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), gameSettingsTab (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var19 = gameSettings:InFullScreen()
			
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
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), var19 (ref), gameSettings (copy), reportSettingsForAnalytics (copy)
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", var19, gameSettings:InFullScreen())
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
		local var19 = gameSettingsTab
		local var20, var21, var22 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then 2 else 1)
		gameSettingsTab.GraphicsEnablerFrame = var20
		gameSettingsTab.GraphicsEnablerLabel = var21
		var19.GraphicsQualityEnabler = var22
		gameSettingsTab.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame
		local var23 = gameSettingsTab
		local var24, var25, var26 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Quality", "Slider", 10, 1)
		gameSettingsTab.GraphicsQualityFrame = var24
		gameSettingsTab.GraphicsQualityLabel = var25
		var23.GraphicsQualitySlider = var26
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
				local var27, var28, var29 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", list, table.find(cloned, gameSettings.FramerateCap), nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				gameSettingsTab.FramerateCapFrame = var27
				gameSettingsTab.FramerateCapLabel = var28
				gameSettingsTab.FramerateCapMode = var29
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
				local var27, var28 = gfxResetModule.TemporaryOverride(value)
				
				if var27 then
					settings().Rendering.QualityLevel = var28
					
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
		
		local var27 = false
		gameSettingsTab.GraphicsQualitySlider.ValueChanged:connect(function(p3)
			-- upvalues: var27 (write), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p3)
			
			if var27 == true then
				reportSettingsForAnalytics()
			end
			var27 = true
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
			local var28 = tostring(gameSettings.SavedQualityLevel)
			var28 = if t[var28] then t[var28] else 10
			SetGraphicsQuality(var28)
			spawn(function()
				-- upvalues: gameSettingsTab (copy), var28 (write)
				gameSettingsTab.GraphicsQualitySlider:SetValue(var28)
			end)
		end
	end
	
	local function createReducedMotionOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var29, var30, var31 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.ReducedMotion then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion"))
		gameSettingsTab.ReducedMotionFrame = var29
		gameSettingsTab.ReducedMotionLabel = var30
		gameSettingsTab.ReducedMotionMode = var31
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
		
		local var29, var30, var31 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.PlayerNamesEnabled then t_6.On else t_6.Off, nil, if fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		gameSettingsTab.PlayerNamesEnabledFrame = var29
		gameSettingsTab.playerNamesEnabledLabel = var30
		gameSettingsTab.playerNamesEnabledMode = var31
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
		local var32, var33, var34 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(gameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque"))
		gameSettingsTab.PreferredTransparencyFrame = var32
		gameSettingsTab.PreferredTransparencyLabel = var33
		gameSettingsTab.PreferredTransparencySlider = var34
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
		local var32, var33, var34 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, gameSettings.PreferredTextSize.Value - 1, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest"))
		gameSettingsTab.PreferredTextSizeFrame = var32
		gameSettingsTab.PreferredTextSizeLabel = var33
		gameSettingsTab.PreferredTextSizeSlider = var34
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
	
	local function createUiNavigationKeyBindOptions()
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), userInputService (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t = { On = 1, Off = 2 }
		local var32, var33, var34 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.UiNavigationKeyBindEnabled then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}))
		gameSettingsTab.UiNavigationKeyBindEnabledFrame = var32
		gameSettingsTab.UiNavigationKeyBindEnabledLabel = var33
		gameSettingsTab.UiNavigationKeyBindEnabledMode = var34
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
		local var32 = nil
		local var33 = nil
		local var34 = nil
		local var35 = nil
		gameSettingsTab.PerformanceStatsFrame = var32
		gameSettingsTab.PerformanceStatsLabel = var33
		gameSettingsTab.PerformanceStatsMode = var34
		gameSettingsTab.PerformanceStatsOverrideText = var35
		
		function GetDesiredPerformanceStatsIndex()
			-- upvalues: gameSettings (copy)
			return if gameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		local var36, var37, var38 = utilityModule:AddNewRow(gameSettingsTab, "Performance Stats", "Selector", { "On", "Off" }, GetDesiredPerformanceStatsIndex())
		gameSettingsTab.PerformanceStatsFrame = var36
		gameSettingsTab.PerformanceStatsLabel = var37
		gameSettingsTab.PerformanceStatsMode = var38
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
			local var39 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.PerformanceStatsVisible else nil
			
			if p3 == 1 then
				gameSettings.PerformanceStatsVisible = true
			else
				gameSettings.PerformanceStatsVisible = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", var39, gameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		gameSettings.PerformanceStatsVisibleChanged:connect(function()
			-- upvalues: gameSettingsTab (copy)
			local var39 = GetDesiredPerformanceStatsIndex()
			
			if var39 ~= gameSettingsTab.PerformanceStatsMode.CurrentIndex then
				gameSettingsTab.PerformanceStatsMode:SetSelectionIndex(var39)
			end
		end)
	end
	
	local function createWebServerInformationRow()
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), microProfilerReadOnlyInformationLabel (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), touchEnabled (copy), create (copy), themeModule (copy)
		local var32, var33, var34 = utilityModule:AddNewRow(gameSettingsTab, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, if microProfilerReadOnlyInformationLabel then false else nil)
		gameSettingsTab.InformationFrame = var32
		gameSettingsTab.InformationLabel = var33
		gameSettingsTab.InformationTextBox = var34
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
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), createWebServerInformationRow (ref), var14 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), var13 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local var32 = nil
		local var33 = nil
		local var34 = nil
		local var35 = nil
		gameSettingsTab.MicroProfilerFrame = var32
		gameSettingsTab.MicroProfilerLabel = var33
		gameSettingsTab.MicroProfilerMode = var34
		gameSettingsTab.MicroProfilerOverrideText = var35
		
		local function _()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), createWebServerInformationRow (copy)
			local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
			
			if microProfilerWebServerPort == 0 then
				return false
			end
			local var36, var37 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var36
			gameSettingsTab.InformationText = var37
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
			
			return true
		end
		
		local function setMicroProfilerIndex(value)
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), var14 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), createWebServerInformationRow (copy), var13 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
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
			
			local var36 = nil
			local onScreenProfilerEnabled = nil
			local onScreenProfilerEnabled_1 = nil
			
			if var14 then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var36 = "webserver"
					onScreenProfilerEnabled = gameSettings.MicroProfilerWebServerEnabled
				end
				if value == 1 then
					gameSettings.MicroProfilerWebServerEnabled = true
					local var37 = 30
					while var37 >= 1 do
						local var38
						local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
						
						if microProfilerWebServerPort == 0 then
							var38 = false
						else
							local var39, var40 = createWebServerInformationRow()
							gameSettingsTab.InformationFrame = var39
							gameSettingsTab.InformationText = var40
							gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
							var38 = true
						end
						if var38 then break end
						var37 -= 1
						wait(0.1)
					end
					if var37 <= 0 then
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
			elseif var13 or isInExperienceUIVREnabled and isSpatial() then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var36 = "regular"
					onScreenProfilerEnabled = gameSettings.OnScreenProfilerEnabled
				end
				gameSettings.OnScreenProfilerEnabled = value == 1
				
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.OnScreenProfilerEnabled
				end
			end
			rbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", onScreenProfilerEnabled, onScreenProfilerEnabled_1, { microprofiler_type = var36 })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function()
			-- upvalues: var14 (copy), gameSettings (copy), var13 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy)
			return if var14 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif not (not var13 and (not isInExperienceUIVREnabled or not isSpatial())) then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2
		end
		
		local var41 = gameSettingsTab
		local var42, var43, var44 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if var14 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif var13 or isInExperienceUIVREnabled and isSpatial() then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2)
		var41.MicroProfilerFrame = var42
		gameSettingsTab.MicroProfilerLabel = var43
		gameSettingsTab.MicroProfilerMode = var44
		gameSettingsTab.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame
		local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
		
		if microProfilerWebServerPort ~= 0 then
			local var45, var46 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var45
			gameSettingsTab.InformationText = var46
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
		end
		local var47 = false
		gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
			-- upvalues: var47 (write), gameSettings (copy), gameSettingsTab (copy)
			var47 = true
			
			if gameSettings.OnScreenProfilerEnabled then
				gameSettingsTab.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			end
			gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
		end)
		gameSettingsTab.MicroProfilerMode.IndexChanged:connect(function(...)
			-- upvalues: var47 (write), setMicroProfilerIndex (ref)
			if var47 then
				var47 = false
				
				return
			end
			setMicroProfilerIndex(...)
		end)
	end
	
	local function createCameraModeOptions(p3)
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), localPlayer (copy), userInputService (copy), coreUtilityModule (copy), t_3 (copy), VRService (copy), getFFlagAlwaysShowVRToggleModule (copy), getAppFeaturePolicies (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var6 (copy), t_2 (copy), t_1 (copy)
		local var36 = nil
		local var37 = nil
		local var38 = nil
		local var39 = nil
		gameSettingsTab.ShiftLockFrame = var36
		gameSettingsTab.ShiftLockLabel = var37
		gameSettingsTab.ShiftLockMode = var38
		gameSettingsTab.ShiftLockOverrideText = var39
		local var40, var41, var42 = utilityModule:AddNewRow(gameSettingsTab, "Shift Lock Switch", "Selector", { "On", "Off" }, if gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		gameSettingsTab.ShiftLockFrame = var40
		gameSettingsTab.ShiftLockLabel = var41
		gameSettingsTab.ShiftLockMode = var42
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
			local var43 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p4 == 1 then
				gameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				gameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", var43, gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
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
			local var43 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var43
				local devEnableMouseLock = not var43 and localPlayer.DevEnableMouseLock
				
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
			local var43 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var43
				local devEnableMouseLock = not var43 and localPlayer.DevEnableMouseLock
				
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
		local var43 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var43
			local devEnableMouseLock = not var43 and localPlayer.DevEnableMouseLock
			
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
			local var44 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var44
				local devEnableMouseLock = not var44 and localPlayer.DevEnableMouseLock
				
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
			local var44 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var44
				local devEnableMouseLock = not var44 and localPlayer.DevEnableMouseLock
				
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
			local var44 = nil
			
			if not pcall(function()
				-- upvalues: var44 (write), t_4 (copy), t (copy), p4 (ref)
				var44 = t_4[t[p4]]
			end) or var44 == nil then
				return false
			end
			local var45
			local _ = nil
			local value = nil
			
			if userInputService.PreferredInput == Enum.PreferredInput.Touch then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					value = gameSettings.TouchCameraMovementMode.Value
				end
				var45 = gameSettings.TouchCameraMovementMode.Value ~= var44
				gameSettings.TouchCameraMovementMode = var44
			elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				value = gameSettings.ComputerCameraMovementMode.Value
			end
			var45 = gameSettings.ComputerCameraMovementMode.Value ~= var44
			gameSettings.ComputerCameraMovementMode = var44
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and var45 then
				reportSettingsChangeForAnalytics("camera_mode", value, var44)
			end
			return var45
		end
		
		local function updateCameraMovementModes()
			-- upvalues: playerScripts (ref), userInputService (copy), t (write), t_4 (write), t_3 (copy), gameSettingsTab (copy), gameSettings (copy), updateCurrentCameraMovementIndex (ref)
			local var44 = if playerScripts then if userInputService.PreferredInput == Enum.PreferredInput.Touch then playerScripts:GetRegisteredTouchCameraMovementModes() else playerScripts:GetRegisteredComputerCameraMovementModes() else {}
			t = {}
			t_4 = {}
			
			if #var44 <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #var44 do
				local var45 = var44[i]
				local name = var45.Name
				
				if name == "Default" then
					name = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_3.DEFAULT_FOLLOW else t_3.DEFAULT_CLASSIC
				end
				t[#t + 1] = name
				t_4[name] = var45.Value
			end
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode:UpdateOptions(t)
			end
			local _ = -1
			local var46 = userInputService.PreferredInput == Enum.PreferredInput.Touch
			local var47 = if var46 then gameSettings.TouchCameraMovementMode.Value else gameSettings.ComputerCameraMovementMode.Value
			
			if var47 > -1 then
				if var46 or gameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					var47 += 1
				end
				updateCurrentCameraMovementIndex(var47)
				gameSettingsTab.CameraMode:SetSelectionIndex(var47)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		local var48 = gameSettingsTab
		local var49 = gameSettingsTab
		local var50 = gameSettingsTab
		local var51, var52, var53 = utilityModule:AddNewRow(gameSettingsTab, "Camera Mode", "Selector", t, 1)
		var48.CameraModeFrame = var51
		var49.CameraModeLabel = var52
		var50.CameraMode = var53
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
		local var54 = false
		
		t = function()
			-- upvalues: var54 (write), gameSettings (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not var54 then
				var54 = true
				local var55 = if gameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				local var56, var57, var58 = utilityModule:AddNewRow(gameSettingsTab, "VR", "Selector", var55, if gameSettings.VREnabled then 1 else 2)
				gameSettingsTab.VREnabledFrame = var56
				gameSettingsTab.VREnabledLabel = var57
				gameSettingsTab.VREnabledSelector = var58
				gameSettingsTab.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				gameSettingsTab.VREnabledSelector.IndexChanged:connect(function(p4)
					-- upvalues: gameSettings (copy), var55 (write), reportSettingsChangeForAnalytics (copy)
					local t = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local var59 = p4 == t.On.Value
					
					if gameSettings.VREnabled ~= var59 then
						gameSettings.VREnabled = var59
						local value = var55[t.On.Value]
						local var60 = var55[p4]
						
						if var60 == var55[t.On.Value] then
							value = var55[t.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", value, var60)
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
		
		local var55 = function(_) end
		
		local _ = function(value)
			-- upvalues: gameSettingsTab (copy), t_8 (write)
			if gameSettingsTab.MovementMode then
				local var56 = value and #t_8 > 0
				gameSettingsTab.MovementMode.SelectorFrame.Visible = var56
				gameSettingsTab.MovementMode:SetInteractable(var56)
				gameSettingsTab.MovementModeOverrideText.Visible = not var56
			end
		end
		
		if p3 then
			local t_11 = {}
			local playerScripts_1 = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
			
			local _ = function(p4)
				-- upvalues: userInputService (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var6 (copy)
				local var56 = p4
				
				if p4 == "Default" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey)
					end
					var56 = t_5.DEFAULT_KEYBOARD
					
					return var56
				elseif p4 == "KeyboardMouse" then
					var56 = "Keyboard + Mouse"
					
					return var56
				elseif p4 == "ClickToMove" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return t_5.TAP_TO_MOVE
					end
					var56 = t_5.CLICK_TO_MOVE
					
					return var56
				elseif p4 == "DynamicThumbstick" then
					var56 = "Dynamic Thumbstick"
					
					return var56
				elseif p4 == "Thumbstick" then
					var56 = var6
				end
				return var56
			end
			
			local var56, var57, var58 = utilityModule:AddNewRow(gameSettingsTab, "Movement Mode", "Selector", t_11, 1)
			gameSettingsTab.MovementModeFrame = var56
			gameSettingsTab.MovementModeLabel = var57
			gameSettingsTab.MovementMode = var58
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
			
			var55 = function(p4)
				-- upvalues: localPlayer (copy), gameSettingsTab (copy), t_8 (write)
				local var59
				local _ = nil
				
				if p4 then
					var59 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					var59 = nil
				else
					var59 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if gameSettingsTab.MovementMode then
					local var60 = var59 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var60
					gameSettingsTab.MovementMode:SetInteractable(var60)
					gameSettingsTab.MovementModeOverrideText.Visible = not var60
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var59
				end
			end
			
			local function updateMovementModes()
				-- upvalues: userInputService (copy), playerScripts_1 (ref), t_8 (write), t_9 (write), t_6 (write), t_10 (write), gameSettingsTab (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var6 (copy), gameSettings (copy), setMovementMode (ref), var55 (write)
				local var59 = userInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if playerScripts_1 then
					t_8 = if var59 then playerScripts_1:GetRegisteredTouchMovementModes() else playerScripts_1:GetRegisteredComputerMovementModes()
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
					local var60 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var60
					gameSettingsTab.MovementMode:SetInteractable(var60)
					gameSettingsTab.MovementModeOverrideText.Visible = not var60
				end
				for i, v in t_8 do
					t_6[i] = v
					local var61 = t_10
					local name = v.Name
					local var62 = name
					
					if name == "Default" then
						var62 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else t_5.DEFAULT_KEYBOARD
					elseif name == "KeyboardMouse" then
						var62 = "Keyboard + Mouse"
					elseif name == "ClickToMove" then
						var62 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_5.TAP_TO_MOVE else t_5.CLICK_TO_MOVE
					elseif name == "DynamicThumbstick" then
						var62 = "Dynamic Thumbstick"
					elseif name == "Thumbstick" then
						var62 = var6
					end
					var61[i] = var62
					t_9[v] = i
				end
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode:UpdateOptions(t_10)
				end
				local var63 = if var59 then gameSettings.TouchMovementMode else gameSettings.ComputerMovementMode
				
				if var63 then
					setMovementMode(var63)
					gameSettingsTab.MovementMode:SetSelectionIndex(t_9[var63])
				end
				var55(var59)
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
		local var59
		local _ = false
		local var60 = userInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if var60 then
			var59 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			var59 = nil
		else
			var59 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if var59 then
			gameSettingsTab.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			gameSettingsTab.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local var61
		local _ = false
		
		if var60 then
			var61 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
			var61 = nil
		else
			var61 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if gameSettingsTab.MovementModeOverrideText then
			if var61 then
				gameSettingsTab.MovementModeOverrideText.Visible = false
				
				if gameSettingsTab.MovementMode then
					local var62 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var62
					gameSettingsTab.MovementMode:SetInteractable(var62)
					gameSettingsTab.MovementModeOverrideText.Visible = not var62
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
		local var63 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var63
			local devEnableMouseLock = not var63 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(value)
			-- upvalues: localPlayer (copy), gameSettingsTab (copy), var55 (write), t_8 (write)
			if value == "DevEnableMouseLock" then
				local var64 = not localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockOverrideText then
					gameSettingsTab.ShiftLockOverrideText.Visible = var64
					local devEnableMouseLock = not var64 and localPlayer.DevEnableMouseLock
					
					if gameSettingsTab.ShiftLockMode then
						gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
						gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
						
						return
					end
				end
			elseif value == "DevComputerCameraMode" then
				local var65 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
				setCameraModeVisible(var65)
				gameSettingsTab.CameraModeOverrideText.Visible = not var65
				
				return
			elseif value == "DevComputerMovementMode" then
				if var55 ~= nil then
					var55(false)
					
					return
				end
				local var66 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var67 = var66 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var67
					gameSettingsTab.MovementMode:SetInteractable(var67)
					gameSettingsTab.MovementModeOverrideText.Visible = not var67
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var66
					
					return
				end
			elseif value == "DevTouchMovementMode" then
				if var55 ~= nil then
					var55(true)
					
					return
				end
				local var68 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var69 = var68 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var69
					gameSettingsTab.MovementMode:SetInteractable(var69)
					gameSettingsTab.MovementModeOverrideText.Visible = not var69
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var68
					
					return
				end
			elseif value == "DevTouchCameraMode" then
				local var70 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
				setCameraModeVisible(var70)
				gameSettingsTab.CameraModeOverrideText.Visible = not var70
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
		-- upvalues: url (copy), httpService (copy), feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (ref), safetyService (copy), var2 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var8 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), disableFeedbackSoothsayerCheck (copy), name (copy)
		local text = url.ROLES_URL .. "v1/users/authenticated/roles"
		local var64 = httpService:RequestInternal({ Method = "GET", Url = text })
		
		local function rolesCheckCallback(p4)
			-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var2 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var8 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p4 then
				if not feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
				local var65, var66
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
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var8, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var65 = toggleFeedbackModeButton
					var66 = toggleFeedbackModeButton_1
					var65.Size = UDim2.new(0.6, 0, 0, 40)
					var65.Position = UDim2.new(0.4, 0, 0.5, 0)
					var65.AnchorPoint = Vector2.new(0, 0.5)
				else
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var8, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var65 = toggleFeedbackModeButton
					var66 = toggleFeedbackModeButton_1
					var65.Size = UDim2.new(0, 300, 0, 30)
					var65.Position = UDim2.new(0.4, 0, 0.5, 0)
					var65.AnchorPoint = Vector2.new(0, 0.5)
				end
				var65.ZIndex = 2
				var65.Selectable = true
				var66.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					gameSettingsTab.toggleFeedbackModeButton = var65
					gameSettingsTab.toggleFeedbackModeText = var66
				end
				if feedbackEntryPointButtonSizeAdjustment2 then
					utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var65, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
					
					return
				end
				utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var65).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end
		
		if disableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		end
		var64:Start(function(p4, p5)
			-- upvalues: httpService (copy), name (copy), text (ref), rolesCheckCallback (ref)
			local var65
			local var66 = false
			local var67 = false
			local _ = nil
			
			if not p4 then
				var65 = "Roles Api Request: Connection error"
			elseif p5.StatusCode == 401 then
				var65 = "Roles Api Request: Unauthorized"
			elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
				var65 = "Roles Api Status code: " .. p31.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref), var66 (write)
					for i, v in pairs(httpService:JSONDecode(p5.Body).roles) do
						if v == "Soothsayer" then
							var66 = true
						end
					end
				end)
				var67 = ok
				var65 = status
			end
			if not var67 then
				name:warning("Feedback Mode initialization api call failed with url: " .. text .. " and with error message: " .. var345)
			end
			rolesCheckCallback(var66)
		end)
	end
	
	local function createTranslationOptions()
		-- upvalues: playersService (copy), url (copy), httpService (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), localPlayer (copy), reportSettingsChangeForAnalytics (copy), runService (copy)
		local var65 = 1
		local var66 = 1
		local var67 = false
		local var68 = nil
		local var69 = nil
		local localeId = playersService.LocalPlayer.LocaleId
		local var70 = nil
		local var71 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
		local var72 = httpService:RequestInternal({ Method = "GET", Url = text })
		local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local var73 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
		local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local var74 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
		local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local var75 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
		
		local function userExperienceLanguageSettingsCallback(value, p4)
			-- upvalues: name (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_4 (ref), t_2 (ref), var68 (write), t (ref), var71 (write), t_1 (ref), var65 (write), var66 (write), localPlayer (copy), var69 (write), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var67 (write), runService (copy)
			if value then
				local var76 = false
				table.insert(t_4, t_2[var68].languageName .. " (Original)")
				
				for i, v in pairs(t) do
					if v == var71 then
						var76 = true
					end
					if v ~= var68 then
						table.insert(t_4, t_2[v].languageName)
					end
				end
				if var76 == true then
					for i_1, v_1 in pairs(t_4) do
						if i_1 ~= 1 and t_1[v_1] == var71 then
							var65 = i_1
							var66 = i_1
						end
					end
				end
				local var77, var78, var79 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_4, var65)
				gameSettingsTab.LanguageSelectorFrame = var77
				gameSettingsTab.LanguageSelectorLabel = var78
				gameSettingsTab.LanguageSelectorMode = var79
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				
				if var65 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var69)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[var65]]].localeCode)
				end
				gameSettingsTab.LanguageSelectorMode.CurrentLanguage = gameSettingsTab.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				gameSettingsTab.LanguageSelectorMode.IndexChanged:connect(function(p5)
					-- upvalues: gameSettingsTab (copy), t_2 (copy), var68 (copy), t_1 (copy), t_4 (copy), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var66 (copy), localPlayer (copy), var69 (copy), name (copy), var67 (copy), runService (copy)
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					local var80 = if p5 == 1 then t_2[var68].id else t_2[t_1[t_4[p5]]].id
					local currentLanguage = gameSettingsTab.LanguageSelectorMode.CurrentLanguage
					local var81 = t_4[p5]
					
					if currentLanguage ~= var81 then
						gameSettingsTab.LanguageSelectorMode.CurrentLanguage = var81
						reportSettingsChangeForAnalytics("experience_language", currentLanguage, var81)
					end
					local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local var82 = httpService:RequestInternal({
						Method = "POST",
						Url = text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = httpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = var80 }
						})
					})
					
					local function callback(p6, p7)
						-- upvalues: var66 (copy), p5 (ref), localPlayer (copy), var69 (copy), t_1 (copy), t_4 (copy), t_2 (copy), name (copy), var67 (copy), gameSettingsTab (copy)
						if p6 then
							var66 = p5
							
							if p5 == 1 then
								localPlayer:SetExperienceSettingsLocaleId(var69)
							else
								localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
							end
						else
							name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p35)
							var67 = true
							gameSettingsTab.LanguageSelectorMode:SetSelectionIndex(var66)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
					end
					
					if runService:IsStudio() then
						var66 = p5
						
						if p5 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var69)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
						
						return
					elseif not var67 then
						var82:Start(function(p6, p7)
							-- upvalues: name (copy), text (ref), callback (ref)
							local var83 = false
							local text_1 = nil
							
							if not p6 then
								text_1 = "User Experience Language Settings Update Request: Connection error"
							elseif p7.StatusCode == 401 then
								text_1 = "User Experience Language Settings Update Request: Unauthorized"
							elseif p7.StatusCode < 200 or p7.StatusCode >= 400 then
								text_1 = "User Experience Language Settings Update Request Status Code: " .. p37.StatusCode
							else
								name:info("User Experience Language Settings Update Request succeeded with code: " .. p37.StatusCode)
								var83 = true
							end
							if not var83 then
								name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. text_1)
							end
							callback(var83, text_1)
						end)
						
						return
					end
					var67 = false
					var66 = p5
					
					if p5 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var69)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p5]]].localeCode)
					end
					gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
				end)
				
				return
			elseif p4 == nil then
				p4 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p32)
			local var80, var81, var82 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var80
			gameSettingsTab.LanguageSelectorLabel = var81
			gameSettingsTab.LanguageSelectorMode = var82
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local function _(p5, p6)
			-- upvalues: var75 (ref), httpService (copy), var71 (write), var70 (write), var68 (write), t_3 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p5 then
				var75:Start(function(p7, p8)
					-- upvalues: httpService (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
					local var83
					local var84 = false
					local _ = nil
					
					if not p7 then
						var83 = "User Experience Language Setting Request: Connection error"
					elseif p8.StatusCode == 401 then
						var83 = "User Experience Language Setting Request: Unauthorized"
					elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
						var83 = "User Experience Language Setting Request Status code: " .. p41.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p8 (ref), var71 (copy), var70 (copy), var68 (copy), t_3 (copy)
							local userUniverseLocalizationSettingValue = httpService:JSONDecode(p8.Body).userUniverseLocalizationSettingValue
							
							if userUniverseLocalizationSettingValue == nil then
								var71 = var70
								
								return
							elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
								var71 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var68 else var70
							end
							if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
								if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
									var71 = var70
									
									return
								end
								var71 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
							end
						end)
						var84 = ok
						var83 = status
					end
					if not var84 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
					end
					userExperienceLanguageSettingsCallback(var84, var83)
				end)
				
				return
			end
			local var83 = p6
			
			if var83 == nil then
				var83 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var381)
			local var84, var85, var86 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var84
			gameSettingsTab.LanguageSelectorLabel = var85
			gameSettingsTab.LanguageSelectorMode = var86
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local _ = function(p5, p6)
			-- upvalues: var74 (ref), httpService (copy), t (ref), name (copy), text_2 (ref), var75 (ref), var71 (write), var70 (write), var68 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p5 then
				var74:Start(function(p7, p8)
					-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p6 (write), p5 (ref), var75 (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var83
					local var84 = false
					local _ = nil
					
					if not p7 then
						var83 = "Experience Supported Language Request: Connection error"
					elseif p8.StatusCode == 401 then
						var83 = "Experience Supported Language Request: Unauthorized"
					elseif p8.StatusCode < 200 or p8.StatusCode >= 400 then
						var83 = "Experience Supported Language Request Status code: " .. p45.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p8 (ref), t (copy)
							for i, v in pairs(httpService:JSONDecode(p8.Body).data) do
								t[i] = v.languageCode
							end
						end)
						var84 = ok
						var83 = status
					end
					if not var84 then
						name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
					end
					if p6 == nil then
						p6 = var83
					end
					local var85 = p6
					
					if var84 and p5 then
						var75:Start(function(p9, p10)
							-- upvalues: httpService (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
							local var86
							local var87 = false
							local _ = nil
							
							if not p9 then
								var86 = "User Experience Language Setting Request: Connection error"
							elseif p10.StatusCode == 401 then
								var86 = "User Experience Language Setting Request: Unauthorized"
							elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
								var86 = "User Experience Language Setting Request Status code: " .. p47.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p10 (ref), var71 (copy), var70 (copy), var68 (copy), t_3 (copy)
									local userUniverseLocalizationSettingValue = httpService:JSONDecode(p10.Body).userUniverseLocalizationSettingValue
									
									if userUniverseLocalizationSettingValue == nil then
										var71 = var70
										
										return
									elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
										var71 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var68 else var70
									end
									if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
										if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
											var71 = var70
											
											return
										end
										var71 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
									end
								end)
								var87 = ok
								var86 = status
							end
							if not var87 then
								name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
							end
							userExperienceLanguageSettingsCallback(var87, var86)
						end)
						
						return
					end
					local var86 = var85
					
					if var86 == nil then
						var86 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
					local var87, var88, var89 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
					gameSettingsTab.LanguageSelectorFrame = var87
					gameSettingsTab.LanguageSelectorLabel = var88
					gameSettingsTab.LanguageSelectorMode = var89
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				end)
			else
				local var90 = p6
				
				if var90 == nil then
					var90 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var387)
				local var91, var92, var93 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var91
				gameSettingsTab.LanguageSelectorLabel = var92
				gameSettingsTab.LanguageSelectorMode = var93
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p7, p8)
			-- upvalues: var73 (ref), httpService (copy), var68 (write), var69 (write), t_2 (ref), name (copy), text_1 (ref), var74 (ref), t (ref), text_2 (ref), var75 (ref), var71 (write), var70 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p7 then
				var73:Start(function(p9, p10)
					-- upvalues: httpService (copy), var68 (copy), var69 (copy), t_2 (copy), name (copy), text_1 (copy), p8 (write), p7 (ref), var74 (copy), t (copy), text_2 (copy), var75 (copy), var71 (copy), var70 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var83
					local var84 = false
					local _ = nil
					
					if not p9 then
						var83 = "Experience Source Language Request: Connection error"
					elseif p10.StatusCode == 401 then
						var83 = "Experience Source Language Request: Unauthorized"
					elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
						var83 = "Experience Source Language Status code: " .. p51.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p10 (ref), var68 (copy), var69 (copy), t_2 (copy)
							var68 = httpService:JSONDecode(p10.Body).languageCode
							var69 = t_2[var68].localeCode
						end)
						var84 = ok
						var83 = status
					end
					if not var84 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var403)
					end
					if p8 == nil then
						p8 = var83
					end
					local p11 = var84 and p7
					local var85 = p8
					
					if p11 then
						var74:Start(function(p12, p13)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), var85 (write), p11 (ref), var75 (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var86
							local var87 = false
							local _ = nil
							
							if not p12 then
								var86 = "Experience Supported Language Request: Connection error"
							elseif p13.StatusCode == 401 then
								var86 = "Experience Supported Language Request: Unauthorized"
							elseif p13.StatusCode < 200 or p13.StatusCode >= 400 then
								var86 = "Experience Supported Language Request Status code: " .. p53.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p13 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p13.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var87 = ok
								var86 = status
							end
							if not var87 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
							end
							if p6 == nil then
								p6 = var86
							end
							if var87 and p11 then
								var75:Start(function(p14, p15)
									-- upvalues: httpService (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var88
									local var89 = false
									local _ = nil
									
									if not p14 then
										var88 = "User Experience Language Setting Request: Connection error"
									elseif p15.StatusCode == 401 then
										var88 = "User Experience Language Setting Request: Unauthorized"
									elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then
										var88 = "User Experience Language Setting Request Status code: " .. p55.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p15 (ref), var71 (copy), var70 (copy), var68 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p15.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var71 = var70
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var71 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var68 else var70
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var71 = var70
													
													return
												end
												var71 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var89 = ok
										var88 = status
									end
									if not var89 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
									end
									userExperienceLanguageSettingsCallback(var89, var88)
								end)
								
								return
							end
							local var88 = p6
							
							if var88 == nil then
								var88 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
							local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var89
							gameSettingsTab.LanguageSelectorLabel = var90
							gameSettingsTab.LanguageSelectorMode = var91
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var92 = var85
						
						if var92 == nil then
							var92 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var406)
						local var93, var94, var95 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var93
						gameSettingsTab.LanguageSelectorLabel = var94
						gameSettingsTab.LanguageSelectorMode = var95
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var86 = p8
				
				if var86 == nil then
					var86 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var398)
				local var87, var88, var89 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var87
				gameSettingsTab.LanguageSelectorLabel = var88
				gameSettingsTab.LanguageSelectorMode = var89
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		var72:Start(function(p9, p10)
			-- upvalues: httpService (copy), t_2 (ref), t_3 (ref), t_1 (ref), localeId (ref), var70 (write), name (copy), text (ref), var73 (ref), var68 (write), var69 (write), text_1 (ref), var74 (ref), t (ref), text_2 (ref), var75 (ref), var71 (write), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local var83
			local var84 = false
			local _ = nil
			
			if not p9 then
				var83 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p10.StatusCode == 401 then
				var83 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p10.StatusCode < 200 or p10.StatusCode >= 400 then
				var83 = "Locale Code to Language Code Mapping Request Status code: " .. p57.StatusCode
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p10 (ref), t_2 (copy), t_3 (copy), t_1 (copy), localeId (copy), var70 (copy)
					for i, v in pairs(httpService:JSONDecode(p10.Body).data) do
						local languageCode = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id
						t_2[languageCode] = { localeCode = locale, languageName = name, id = id }
						t_3[id] = languageCode
						t_1[name] = languageCode
						
						if v.locale.locale == localeId:gsub("-", "_") then
							var70 = v.locale.language.languageCode
						end
					end
				end)
				var84 = ok
				var83 = status
			end
			if not var84 then
				name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var411)
			end
			local var85 = var83
			
			if var84 then
				var73:Start(function(p11, p12)
					-- upvalues: httpService (copy), var68 (copy), var69 (copy), t_2 (copy), name (copy), text_1 (copy), var85 (write), var84 (ref), var74 (copy), t (copy), text_2 (copy), var75 (copy), var71 (copy), var70 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var86
					local var87 = false
					local _ = nil
					
					if not p11 then
						var86 = "Experience Source Language Request: Connection error"
					elseif p12.StatusCode == 401 then
						var86 = "Experience Source Language Request: Unauthorized"
					elseif p12.StatusCode < 200 or p12.StatusCode >= 400 then
						var86 = "Experience Source Language Status code: " .. p59.StatusCode
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), p12 (ref), var68 (copy), var69 (copy), t_2 (copy)
							var68 = httpService:JSONDecode(p12.Body).languageCode
							var69 = t_2[var68].localeCode
						end)
						var87 = ok
						var86 = status
					end
					if not var87 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var403)
					end
					if p8 == nil then
						p8 = var86
					end
					local p13 = var87 and var84
					
					if p13 then
						var74:Start(function(p14, p15)
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p8 (write), p13 (ref), var75 (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var7 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var88
							local var89 = false
							local _ = nil
							
							if not p14 then
								var88 = "Experience Supported Language Request: Connection error"
							elseif p15.StatusCode == 401 then
								var88 = "Experience Supported Language Request: Unauthorized"
							elseif p15.StatusCode < 200 or p15.StatusCode >= 400 then
								var88 = "Experience Supported Language Request Status code: " .. p61.StatusCode
							else
								local ok, status = pcall(function()
									-- upvalues: httpService (copy), p15 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p15.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var89 = ok
								var88 = status
							end
							if not var89 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var392)
							end
							if p6 == nil then
								p6 = var88
							end
							if var89 and p13 then
								var75:Start(function(p16, p17)
									-- upvalues: httpService (copy), var71 (copy), var70 (copy), var68 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var90
									local var91 = false
									local _ = nil
									
									if not p16 then
										var90 = "User Experience Language Setting Request: Connection error"
									elseif p17.StatusCode == 401 then
										var90 = "User Experience Language Setting Request: Unauthorized"
									elseif p17.StatusCode < 200 or p17.StatusCode >= 400 then
										var90 = "User Experience Language Setting Request Status code: " .. p63.StatusCode
									else
										local ok, status = pcall(function()
											-- upvalues: httpService (copy), p17 (ref), var71 (copy), var70 (copy), var68 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p17.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var71 = var70
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var71 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var68 else var70
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var71 = var70
													
													return
												end
												var71 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var91 = ok
										var90 = status
									end
									if not var91 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var386)
									end
									userExperienceLanguageSettingsCallback(var91, var90)
								end)
								
								return
							end
							local var90 = p6
							
							if var90 == nil then
								var90 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var394)
							local var91, var92, var93 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var91
							gameSettingsTab.LanguageSelectorLabel = var92
							gameSettingsTab.LanguageSelectorMode = var93
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var94 = p8
						
						if var94 == nil then
							var94 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var406)
						local var95, var96, var97 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var95
						gameSettingsTab.LanguageSelectorLabel = var96
						gameSettingsTab.LanguageSelectorMode = var97
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var88 = var85
				
				if var88 == nil then
					var88 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var413)
				local var89, var90, var91 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var7 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var89
				gameSettingsTab.LanguageSelectorLabel = var90
				gameSettingsTab.LanguageSelectorMode = var91
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
		local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, if fFlagRenameVolumeToMainVolumeModule then robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume") else "Volume", "Slider", 10, math.floor(gameSettings.MasterVolume * 10))
		gameSettingsTab.VolumeFrame = var86
		gameSettingsTab.VolumeLabel = var87
		gameSettingsTab.VolumeSlider = var88
		gameSettingsTab.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame
		local volumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		volumeChangeSound.Name = "VolumeChangeSound"
		volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		gameSettingsTab.VolumeSlider.ValueChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), volumeChangeSound (ref), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var89 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.MasterVolume * 10 + 0.5) else nil
			local var90 = p11 / 10
			volumeChangeSound.Volume = var90
			volumeChangeSound:Play()
			gameSettings.MasterVolume = var90
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", var89, math.floor(gameSettings.MasterVolume * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default_3 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.PartyVoiceVolume * 10)
		local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, "Party Voice Volume", "Slider", 10, floored)
		gameSettingsTab.PartyVoiceVolumeFrame = var86
		gameSettingsTab.PartyVoiceVolumeLabel = var87
		gameSettingsTab.PartyVoiceVolumeSlider = var88
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
			local var89 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then if floored ~= nil then 0 else math.floor(floored * 10 + 0.5) else nil
			gameSettings.PartyVoiceVolume = p11 / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", var89, math.floor(p11 * 10 + 0.5))
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
		local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, status, "Slider", 10, floored)
		gameSettingsTab.VoiceChatVolumeFrame = var86
		gameSettingsTab.VoiceChatVolumeLabel = var87
		gameSettingsTab.VoiceChatVolumeSlider = var88
		gameSettingsTab.VoiceChatVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceChatVolumeFrame
		gameSettingsTab.VoiceChatVolumeFrame.Visible = false
		
		if voiceVolumeControlsDisableInteractionWhenNoMasterVolume then
			local function updateVoiceChatVolumeSliderInteractable(p11)
				-- upvalues: gameSettings (copy), gameSettingsTab (copy)
				local var89
				if p11 == nil then
					var89 = gameSettings.MasterVolume == 0
				else
					var89 = p11 == 0
					var89 = nil
				end
				if var89 then
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
			local var89 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.VoiceChatVolume * 5 + 0.5) else nil
			gameSettings.VoiceChatVolume = p11 / 5
			
			if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and gameSettingsTab.maxVoiceChatVolumeDuringSession ~= nil then
				gameSettingsTab.maxVoiceChatVolumeDuringSession = math.max(gameSettingsTab.maxVoiceChatVolumeDuringSession, gameSettings.VoiceChatVolume)
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("voice_chat_volume", var89, math.floor(gameSettings.VoiceChatVolume * 5 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle()
		-- upvalues: gameSettings (copy), getAppFeaturePolicies (copy), var3 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, if getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() then var3:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if gameSettings.HapticStrength == 0 then 1 else 2)
		gameSettingsTab.HapticsFrame = var86
		_ = var87
		gameSettingsTab.HapticsSelector = var88
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
		local var86 = 1
		
		if pcall(function()
			-- upvalues: gameSettings (copy), var86 (write)
			if gameSettings.CameraYInverted == true then
				var86 = 2
			end
		end) == false then
			return
		end
		local var87, var88, var89 = utilityModule:AddNewRow(gameSettingsTab, "Camera Inverted", "Selector", { "Off", "On" }, var86)
		gameSettingsTab.CameraInvertedFrame = var87
		_ = var88
		gameSettingsTab.CameraInvertedSelector = var89
		gameSettingsTab.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t_7[gameSettingsTab.CameraInvertedFrame] = true
		gameSettingsTab.CameraInvertedSelector.IndexChanged:connect(function(p11)
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var90 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.CameraYInverted else nil
			
			if p11 == 2 then
				gameSettings.CameraYInverted = true
			else
				gameSettings.CameraYInverted = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("camera_y_inverted", var90, gameSettings.CameraYInverted)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function setCameraSensitivity(value)
		-- upvalues: userInputService (copy), gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var86 = nil
		local x = nil
		
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var86 = "gamepad"
				x = gameSettings.GamepadCameraSensitivity
			end
			gameSettings.GamepadCameraSensitivity = value
		end
		if userInputService.MouseEnabled then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var86 = "mouse"
				x = gameSettings.MouseSensitivityFirstPerson.X
			end
			local vector2 = Vector2.new(value, value)
			gameSettings.MouseSensitivityFirstPerson = vector2
			gameSettings.MouseSensitivityThirdPerson = vector2
		end
		if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(x) == "number" and typeof(value) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", x)), tonumber(string.format("%.2f", value)), { sensitivity_type = var86 })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), setCameraSensitivity (ref)
		local function _(p11)
			return if p11 <= 0.2 then 0 else p11 <= 1 and math.floor((p11 - 0.2) / 0.16 + 0.5) or math.floor((p11 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p11)
			local var86 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			
			return if var86 <= 0.2 then 0.2 else var86
		end
		
		local mouseSensitivity = gameSettings.MouseSensitivity
		local var86 = if mouseSensitivity <= 0.2 then 0 else mouseSensitivity <= 1 and math.floor((mouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((mouseSensitivity + 2) / 0.6 + 0.5)
		local var87 = true
		local _ = tostring(gameSettings.MouseSensitivityFirstPerson.X)
		local var88, var89, var90 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, var86)
		gameSettingsTab.MouseAdvancedFrame = var88
		gameSettingsTab.MouseAdvancedLabel = var89
		gameSettingsTab.MouseAdvancedEntry = var90
		gameSettingsTab.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
		t_7[gameSettingsTab.MouseAdvancedFrame] = true
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		gameSettingsTab.MouseAdvancedLabel.ZIndex = 2
		gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
		local var91 = create("TextBox")({
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
			Parent = var91
		})
		
		local _ = function(value)
			-- upvalues: var91 (ref)
			var91.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
		end
		
		var91.Text = tostring(tonumber(string.format("%.3f", math.floor(gameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))
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
			-- upvalues: var87 (write), setCameraSensitivity (copy), gameSettingsTab (copy), var91 (ref)
			if not var87 then return end
			setCameraSensitivity(value)
			var87 = false
			
			if p11 ~= gameSettingsTab.MouseAdvancedEntry then
				gameSettingsTab.MouseAdvancedEntry:SetValue(if value <= 0.2 then 0 else value <= 1 and math.floor((value - 0.2) / 0.16 + 0.5) or math.floor((value + 2) / 0.6 + 0.5))
			end
			var91.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
			var87 = true
		end
		
		var91.FocusLost:connect(function()
			-- upvalues: gameSettingsTab (copy), var91 (ref), gameSettings (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
			local var92 = tonumber(string.match(var91.Text, "([%d%.]+)"))
			
			if var92 then
				setMouseSensitivity(clampMouseSensitivity(var92), var91)
				
				return
			end
			setMouseSensitivity(gameSettings.MouseSensitivityFirstPerson.X, var91)
		end)
		var91.Focused:connect(function()
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(false)
		end)
		gameSettingsTab.MouseAdvancedEntry.ValueChanged:connect(function(p11)
			-- upvalues: gameSettingsTab (copy)
			local var92 = clampMouseSensitivity(p11)
			local var93 = if var92 <= 5 then 0.16 * var92 + 0.2 else 0.6 * var92 - 2
			setMouseSensitivity(if var93 <= 0.2 then 0.2 else var93, gameSettingsTab.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions()
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (ref)
		local function _(p11)
			return if p11 <= 0.2 then 0 else p11 <= 1 and math.floor((p11 - 0.2) / 0.16 + 0.5) or math.floor((p11 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p11)
			local var86 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			
			return if var86 <= 0.2 then 0.2 else var86
		end
		
		local gamepadCameraSensitivity = gameSettings.GamepadCameraSensitivity
		local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, if gamepadCameraSensitivity <= 0.2 then 0 else gamepadCameraSensitivity <= 1 and math.floor((gamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((gamepadCameraSensitivity + 2) / 0.6 + 0.5))
		gameSettingsTab.GamepadSensitivityFrame = var86
		gameSettingsTab.GamepadSensitivityLabel = var87
		gameSettingsTab.GamepadSensitivitySlider = var88
		gameSettingsTab.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		gameSettingsTab.GamepadSensitivitySlider.ValueChanged:connect(function(p11)
			-- upvalues: setCameraSensitivity (copy)
			local var89 = if p11 <= 5 then 0.16 * p11 + 0.2 else 0.6 * p11 - 2
			setCameraSensitivity(if var89 <= 0.2 then 0.2 else var89)
		end)
	end
	
	local function createOverscanOption()
		-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), runService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local adjustButton, adjustButton_1, adjustButton_2 = utilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function()
			-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			local _ = nil
			local var86 = require(robloxGui.Modules.Settings.Components.OverscanWrapper)(require(robloxGui.Modules.Shell.Components.Overscan10ft.Overscan))
			local roactModule = require(corePackagesService.Packages.Roact)
			local var87 = nil
			local t = {
				onUnmount = function()
					-- upvalues: var87 (write), roactModule (ref), contextActionService (copy), settingsHubModule (ref)
					if var87 then
						roactModule.unmount(var87)
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
			var87 = roactModule.mount(roactModule.createElement(var86, t), robloxGui, tostring(var86))
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
		local var86 = utilityModule:AddNewRowObject(gameSettingsTab, "Safe Zone", adjustButton)
		var86.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
		adjustButton_2(var86)
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
				local var86 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton, nil, true)
				var86.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				devConsoleButton_2(var86)
				
				return
			end
			local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, gameSettingsTab)
			devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
			devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
			devConsoleButton.Position = UDim2.new(1, -400, 0.5, 0)
			devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
			local var87 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton)
			var87.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			devConsoleButton_2(var87)
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
			local var86, var87, var88 = utilityModule:AddNewRow(gameSettingsTab, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			gameSettingsTab.uiToggleRow = var86
			gameSettingsTab.uiToggleFrame = var87
			gameSettingsTab.uiToggleSelector = var88
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
		local var89 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var90 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		gameSettingsTab.uiToggleSelectors = {}
		
		for i, v in list do
			local var91 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = v.label })
			local var92, var93, var94 = utilityModule:AddNewRow(gameSettingsTab, var91, "Selector", { var89, var90 }, 1)
			var92.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v.layoutOrderKey]
			var94.IndexChanged:Connect(function(p11)
				-- upvalues: guiService (copy), v (ref)
				if (if guiService:GetGuiIsVisible(v.type) then 1 else 2) ~= p11 then
					guiService:ToggleGuiIsVisibleIfAllowed(v.type)
				end
			end)
			gameSettingsTab.uiToggleSelectors[v.label] = {
				label = var91,
				type = v.type,
				row = var92,
				frame = var93,
				selector = var94
			}
		end
		local var95, var96, var97 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { var90, var89 }, 1)
		gameSettingsTab.freecamRow = var95
		gameSettingsTab.freecamFrame = var96
		gameSettingsTab.freecamSelector = var97
		gameSettingsTab.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
		gameSettingsTab.freecamSelector.IndexChanged:Connect(function(p11)
			-- upvalues: localPlayer (copy)
			local var98 = p11 == 2
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				freecamScript:SetAttribute("FreecamEnabled", var98)
				
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
				local var98 = if guiService:GetGuiIsVisible(v.type) then 1 else 2
				
				if var98 ~= v.selector:GetSelectedIndex() then
					v.selector:SetSelectionIndex(var98)
				end
			end
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				gameSettingsTab.freecamSelector:SetSelectionIndex(if freecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not gameSettingsTab.uiToggleSelector then return end
		local var99 = if guiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if var99 == gameSettingsTab.uiToggleSelector:GetSelectedIndex() then return end
		gameSettingsTab.uiToggleSelector:SetSelectionIndex(var99)
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
		local var100 = gameSettingsTab[p11 .. "DeviceIndex"] or 0
		local var101 = gameSettingsTab[p11 .. "DeviceNames"] or {}
		local var102 = gameSettingsTab[p11 .. "DeviceGuids"] or {}
		local var103 = p11 == "Input" and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local var104 = gameSettingsTab
		local text = p11 .. "DeviceFrame"
		local text_1 = p11 .. "DeviceSelector"
		local var105, var106, var107 = utilityModule:AddNewRow(gameSettingsTab, var103, "Selector", var101, var100)
		var104[text] = var105
		_ = var106
		gameSettingsTab[text_1] = var107
		gameSettingsTab[p11 .. "DeviceFrame"].LayoutOrder = if p11 == "Input" then SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput else SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		gameSettingsTab[p11 .. "DeviceInfo"] = {
			Name = if var100 > 0 then var101[var100] else nil,
			Guid = if var100 > 0 then var102[var100] else nil
		}
		gameSettingsTab[p11 .. "PrevDeviceName"] = gameSettingsTab[p11 .. "DeviceInfo"].Name
		local var108 = 0
		local var109 = getFIntVoiceChatDeviceChangeDebounceDelayModule()
		gameSettingsTab[p11 .. "DeviceSelector"].IndexChanged:connect(function(p12)
			-- upvalues: gameSettingsTab (copy), p11 (ref), var108 (write), var109 (ref), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab[p11 .. "DeviceInfo"].Name == gameSettingsTab[p11 .. "DeviceNames"][p12] and gameSettingsTab[p11 .. "DeviceInfo"].Guid == gameSettingsTab[p11 .. "DeviceGuids"][p12] then return end
			local var110 = var108 + 1
			var108 = var110
			wait(var109)
			
			if var110 == var108 then
				var108 = 0
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
			local var100, var101, var102 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var100
			gameSettingsTab.badgeVisibleFrame = var101
			gameSettingsTab.badgeVisibleSelector = var102
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
		local var100, var101, var102 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			var3:Format("InGame.CommonUI.Label.Off"),
			var3:Format("InGame.CommonUI.Label.On")
		}, 1, nil, var3:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		gameSettingsTab.ChatModerationFrame = var100
		_ = var101
		gameSettingsTab.ChatModerationSelector = var102
		gameSettingsTab.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
		gameSettingsTab.ChatModerationFrame.Visible = false
		local chatModerationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		gameSettingsTab.ChatModerationDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), chatModerationStore (ref)
			gameSettingsTab.ChatModerationFrame.Visible = chatModerationStore.getIsSettingVisible(p11)
			local var103 = if chatModerationStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.ChatModerationSelector:GetSelectedIndex() ~= var103 then
				gameSettingsTab.ChatModerationSelector:SetSelectionIndex(var103)
			end
		end)
		gameSettingsTab.ChatModerationSelector.IndexChanged:connect(function(p11)
			-- upvalues: chatModerationStore (ref), reportSettingsChangeForAnalytics (copy)
			local var103 = p11 == 2
			chatModerationStore.setIsSettingEnabled(var103)
			reportSettingsChangeForAnalytics("moderate_chat", not var103, var103)
		end)
		chatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceAIRephraseSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy), expChatDebounceRephraseIndexSelection (copy), throttleFunctionCallModule (copy)
		local var100, var101, var102 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription"))
		gameSettingsTab.AIRephraseFrame = var100
		_ = var101
		gameSettingsTab.AIRephraseSelector = var102
		gameSettingsTab.AIRephraseFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AIRephraseFrame
		gameSettingsTab.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local var103 = getFIntDebounceAIRephraseSettingDelayModule()
		local var104 = var103 > 0
		local var105 = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.AIRephraseDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), AIRephraseSettingStore (ref), var105 (write)
			gameSettingsTab.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p11)
			local var106 = if AIRephraseSettingStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.AIRephraseSelector:GetSelectedIndex() ~= var106 then
				var105 = var106
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var106)
			end
		end)
		
		local var106 = function(p11)
			-- upvalues: var105 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p11 == var105 then
				return
			end
			local var107 = p11 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var107 (ref), AIRephraseSettingStore (copy), var105 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var107 then "Enabled" else "Disabled") then
					AIRephraseSettingStore.setIsSettingEnabled(var107)
					var105 = p11
					reportSettingsChangeForAnalytics("ai_rephrase", not var107, var107)
					
					return
				end
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var105)
			end)
		end
		
		if not expChatDebounceRephraseIndexSelection then
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(if var104 then throttleFunctionCallModule(var103, var106) else var106)
		elseif var104 then
			local var107 = nil
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(function(p11)
				-- upvalues: var107 (write), var103 (ref), var105 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var107 then
					task.cancel(var107)
				end
				var107 = task.delay(var103, function()
					-- upvalues: var107 (copy), p11 (ref), var105 (copy), textChatService (copy), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var107 = nil
					
					if p11 == var105 then
						return
					end
					local var108 = p11 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var108 (ref), AIRephraseSettingStore (copy), var105 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var108 then "Enabled" else "Disabled") then
							AIRephraseSettingStore.setIsSettingEnabled(var108)
							var105 = p11
							reportSettingsChangeForAnalytics("ai_rephrase", not var108, var108)
							
							return
						end
						gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var105)
					end)
				end)
			end)
		else
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(var106)
		end
	end
	
	local function createChatSummariesSettingOptions()
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceChatSummariesSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy)
		local var100, var101, var102 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription"))
		gameSettingsTab.ChatSummariesFrame = var100
		_ = var101
		gameSettingsTab.ChatSummariesSelector = var102
		gameSettingsTab.ChatSummariesFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatSummariesFrame
		gameSettingsTab.ChatSummariesFrame.Visible = false
		local chatSummariesSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local var103 = getFIntDebounceChatSummariesSettingDelayModule()
		local var104 = var103 > 0
		local var105 = if chatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.ChatSummariesDisposeEffect = signalsModule.createEffect(function(p11)
			-- upvalues: gameSettingsTab (copy), chatSummariesSettingStore (ref), var105 (write)
			gameSettingsTab.ChatSummariesFrame.Visible = chatSummariesSettingStore.getIsSettingVisible(p11)
			local var106 = if chatSummariesSettingStore.getIsSettingEnabled(p11) then 2 else 1
			
			if gameSettingsTab.ChatSummariesSelector:GetSelectedIndex() ~= var106 then
				var105 = var106
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var106)
			end
		end)
		
		local var106 = function(p11)
			-- upvalues: var105 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p11 == var105 then
				return
			end
			local var107 = p11 == 2
			task.spawn(function()
				-- upvalues: textChatService (copy), var107 (ref), chatSummariesSettingStore (copy), var105 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var107 then "Enabled" else "Disabled") then
					chatSummariesSettingStore.setIsSettingEnabled(var107)
					var105 = p11
					reportSettingsChangeForAnalytics("chat_summaries", not var107, var107)
					
					return
				end
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var105)
			end)
		end
		
		if var104 then
			local var107 = nil
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(function(p11)
				-- upvalues: var107 (write), var103 (ref), var105 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var107 then
					task.cancel(var107)
				end
				var107 = task.delay(var103, function()
					-- upvalues: var107 (copy), p11 (ref), var105 (copy), textChatService (copy), chatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var107 = nil
					
					if p11 == var105 then
						return
					end
					local var108 = p11 == 2
					task.spawn(function()
						-- upvalues: textChatService (copy), var108 (ref), chatSummariesSettingStore (copy), var105 (copy), p11 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var108 then "Enabled" else "Disabled") then
							chatSummariesSettingStore.setIsSettingEnabled(var108)
							var105 = p11
							reportSettingsChangeForAnalytics("chat_summaries", not var108, var108)
							
							return
						end
						gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var105)
					end)
				end)
			end)
		else
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(var106)
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
		local var100 = robloxTranslatorModule:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications")
		local var101 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var102 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		
		local function _()
			-- upvalues: default (ref), notificationTypeEnum (ref)
			return if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then 1 else 2
		end
		
		local var103 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
		local var104, var105, var106 = utilityModule:AddNewRow(gameSettingsTab, var100, "Selector", { var102, var101 }, var103)
		gameSettingsTab.ChatNotificationsFrame = var104
		_ = var105
		gameSettingsTab.ChatNotificationsSelector = var106
		gameSettingsTab.ChatNotificationsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatNotificationsFrame
		gameSettingsTab.ChatNotificationsSelector.IndexChanged:connect(function(p11)
			-- upvalues: var103 (write), default (ref), notificationGroups (ref), reportSettingsChangeForAnalytics (copy)
			if p11 == var103 then return end
			local var107 = var103 == 2
			local var108 = p11 == 2
			var103 = p11
			
			if var108 then
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
			reportSettingsChangeForAnalytics("chat_notifications", var107, var108)
		end)
		notificationSnoozedSignal:connect(function(p11)
			-- upvalues: notificationTypeEnum (ref), snoozeActionEnum (ref), gameSettingsTab (copy), var103 (write)
			if p11.notificationType ~= notificationTypeEnum.ChatNewMessage then return end
			local var107 = if p11.actionType == snoozeActionEnum.Mute then 1 else 2
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var107 then
				var103 = var107
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var107)
			end
		end)
		gameSettingsTab.Displayed.Event:Connect(function()
			-- upvalues: default (ref), notificationTypeEnum (ref), t (ref), gameSettingsTab (copy), var103 (write)
			local var107 = if default:isSnoozedNotificationType(notificationTypeEnum.ChatNewMessage) then t.Off else t.On
			
			if gameSettingsTab.ChatNotificationsSelector:GetSelectedIndex() ~= var107 then
				var103 = var107
				gameSettingsTab.ChatNotificationsSelector:SetSelectionIndex(var107)
			end
		end)
	end
	
	local function createCameraDeviceOptions()
		-- upvalues: gameSettingsTab (ref), var11 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
		local cameraDeviceIndex = gameSettingsTab.CameraDeviceIndex or 1
		local cameraDeviceNames = gameSettingsTab.CameraDeviceNames or {}
		local cameraDeviceGuids = gameSettingsTab.CameraDeviceGuids or {}
		local var100, var101, var102 = utilityModule:AddNewRow(gameSettingsTab, var11, "Selector", cameraDeviceNames, cameraDeviceIndex)
		gameSettingsTab.CameraDeviceFrame = var100
		_ = var101
		gameSettingsTab.CameraDeviceSelector = var102
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
		local ok, status, var100, var101 = pcall(function()
			-- upvalues: p11 (ref), soundService (copy)
			return if p11 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var100 and (var101 and (#status > 0 and (var101 > 0 and (var101 <= #status and #status == #var100)))))) then
			if var100[1] == "" then
				status[1] = var3:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p11 .. "DeviceNames"] = status
			gameSettingsTab[p11 .. "DeviceGuids"] = var100
			gameSettingsTab[p11 .. "DeviceIndex"] = var101
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} device info", p11)
		end
		gameSettingsTab[p11 .. "DeviceNames"] = {}
		gameSettingsTab[p11 .. "DeviceGuids"] = {}
		gameSettingsTab[p11 .. "DeviceIndex"] = 0
		if gameSettingsTab[p11 .. "DeviceSelector"] then
			gameSettingsTab[p11 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p11 .. "DeviceSelector"]:SetSelectionIndex(var101)
			
			return
		end
		createDeviceOptions(p11)
	end
	
	local function updateVoiceChatDevices(p11)
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), soundService (copy), var3 (copy), gameSettingsTab (ref), createDeviceOptions (ref)
		if p11 ~= "Input" and p11 ~= "Output" and getFFlagVoiceChatUILoggingModule() then
			name:warning("{} is not supported in VoiceChat devices", p11)
		end
		local ok, status, var100, var101 = pcall(function()
			-- upvalues: p11 (ref), soundService (copy)
			return if p11 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var100 and (var101 and (#status > 0 and (var101 > 0 and (var101 <= #status and #status == #var100)))))) then
			if var100[1] == "" then
				status[1] = var3:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p11 .. "DeviceNames"] = status
			gameSettingsTab[p11 .. "DeviceGuids"] = var100
			gameSettingsTab[p11 .. "DeviceIndex"] = var101
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
			gameSettingsTab[p11 .. "DeviceSelector"]:SetSelectionIndex(var101)
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
		-- upvalues: videoCaptureService (copy), var10 (copy), userGameSettingsService (copy), gameSettingsTab (ref), createCameraDeviceOptions (ref)
		local cameraDevices = videoCaptureService:GetCameraDevices()
		local t = {}
		local t_1 = {}
		local var100 = 1
		table.insert(t, var10)
		table.insert(t_1, "{DefaultDeviceGuid}")
		
		for i, v in pairs(cameraDevices) do
			if i == userGameSettingsService.DefaultCameraID then
				var100 = #t + 1
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
		gameSettingsTab.CameraDeviceSelector:SetSelectionIndex(var100)
	end
	
	local var101 = nil
	local var102 = nil
	
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
		-- upvalues: soundService (copy), var101 (write), gameSettingsTab (ref), updateAudioOptions (ref)
		if soundService.DeviceListChanged then
			var101 = soundService.DeviceListChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var102 (write), gameSettingsTab (ref), updateCameraDevices (ref)
		if videoCaptureService.DevicesChanged then
			var102 = videoCaptureService.DevicesChanged:Connect(function()
				-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
				if gameSettingsTab.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function()
		-- upvalues: soundService (copy), var101 (write)
		if soundService.DeviceListChanged and var101 then
			var101:Disconnect()
		end
	end
	
	local _ = function()
		-- upvalues: videoCaptureService (copy), var102 (write)
		if videoCaptureService.DevicesChanged and var102 then
			var102:Disconnect()
			var102 = nil
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
	
	local var103 = false
	local var104 = if differentiateVoiceSelectorSystemAndUser then false else nil
	
	local function createVoiceChatSelector()
		-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (ref), var3 (copy), default_2 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), differentiateVoiceSelectorSystemAndUser (copy), getFIntDebounceDisconnectButtonDelayModule (copy), var104 (write), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var103 (write), throttleFunctionCallModule (copy), voiceChatSelectorReconnectFocus2AEGIS2 (copy), guiService (copy), debounceVoiceSelectorIndexChange (copy), deferProgrammaticChange (copy)
		if voiceSelectorAvailableAfterFae and gameSettingsTab.VoiceConnectDisconnectFrame and gameSettingsTab.VoiceConnectDisconnectSelector then return end
		local var105 = var3:Format("Feature.GameDetails.Label.VoiceChat")
		local var106 = var3:Format("Feature.SettingsHub.Label.Disconnected")
		local var107 = var3:Format("Feature.SettingsHub.Label.Connected")
		local var108 = if default_2:VoiceChatEnded() then 1 else 2
		local var109 = gameSettingsTab
		local var110, var111, var112 = utilityModule:AddNewRow(gameSettingsTab, var105, "Selector", { var106, var107 }, var108)
		gameSettingsTab.VoiceConnectDisconnectFrame = var110
		_ = var111
		var109.VoiceConnectDisconnectSelector = var112
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
		local var113 = var108
		local var114 = getFIntDebounceDisconnectButtonDelayModule()
		
		local var115 = function(p11)
			-- upvalues: var113 (write), differentiateVoiceSelectorSystemAndUser (copy), var104 (copy), fFlagVoiceRewarmTelemetry (copy), default_2 (copy), constantsModule_1 (copy), voiceSelectorIgnoreFailedStateDisconnect (copy), var103 (copy), gameSettingsTab (copy)
			if p11 == var113 then return end
			var113 = p11
			
			if differentiateVoiceSelectorSystemAndUser and var104 then return end
			if fFlagVoiceRewarmTelemetry then
				local var116, var117, var118, var119 = default_2:GetConnectDisconnectButtonAnalyticsData(p11 == 2)
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var116, var117, var118, var119, default_2.joinVoiceButtonContext)
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
			if var103 then
				task.spawn(function()
					-- upvalues: p11 (ref), gameSettingsTab (copy)
					task.wait(0.5)
					
					if p11 ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		gameSettingsTab.VoiceConnectDisconnectSelector.IndexChanged:connect(if var114 > 0 then throttleFunctionCallModule(var114, var115) else var115)
		
		if voiceChatSelectorReconnectFocus2AEGIS2 then
			gameSettingsTab.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p11, p12)
				-- upvalues: var105 (ref), gameSettingsTab (copy), guiService (copy)
				if p12 and p11 and (p11.Parent and p11.Parent.Name == var105 .. "Frame") and (p12.Name == "ImageButton" and gameSettingsTab.Active) then
					guiService.SelectedCoreObject = p11
				end
			end)
		end
		default_2:subscribe("OnStateChanged", function(_, p11)
			-- upvalues: differentiateVoiceSelectorSystemAndUser (copy), var104 (copy), debounceVoiceSelectorIndexChange (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			if differentiateVoiceSelectorSystemAndUser then
				var104 = true
				
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
						-- upvalues: var104 (copy)
						var104 = false
					end)
					
					return
				end
				var104 = false
			end
		end)
		default_2:subscribe("OnRequestMicPermissionRejected", function()
			-- upvalues: var103 (copy), differentiateVoiceSelectorSystemAndUser (copy), var104 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			task.spawn(function()
				-- upvalues: var103 (copy), differentiateVoiceSelectorSystemAndUser (copy), var104 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
				task.wait(0.5)
				var103 = true
				
				if differentiateVoiceSelectorSystemAndUser then
					var104 = true
				end
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if differentiateVoiceSelectorSystemAndUser then
					if deferProgrammaticChange then
						task.defer(function()
							-- upvalues: var104 (copy)
							var104 = false
						end)
						
						return
					end
					var104 = false
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
			local var105 = var3:Format("Feature.GameDetails.Label.VoiceChat")
			local var106 = var3:Format("Feature.SettingsHub.Label.Connect")
			local var107 = var3:Format("Feature.SettingsHub.Label.Disconnect")
			local var108 = getFIntDebounceDisconnectButtonDelayModule()
			local var109 = var108 > 0
			
			local var110 = function()
				-- upvalues: default_2 (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy)
				local var111
				if default_2:getService() then
					var111 = nil
					var111 = default_2:getService().StateChanged:Connect(function(_, p11)
						-- upvalues: fFlagVoiceRewarmTelemetry (copy), default_2 (copy), var111 (write)
						if p11 == Enum.VoiceChatState.Joined then
							if fFlagVoiceRewarmTelemetry then
								local var112, var113, var114, var115 = default_2:GetConnectDisconnectButtonAnalyticsData(true)
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var112, var113, var114, var115, default_2.joinVoiceButtonContext)
							else
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							var111:Disconnect()
						end
					end)
				elseif fFlagVoiceRewarmTelemetry then
					var111, var611, var612, var613 = default_2:GetConnectDisconnectButtonAnalyticsData(false)
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var111, var611, var612, var613, default_2.joinVoiceButtonContext)
				else
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			end
			
			local var111 = function()
				-- upvalues: default_2 (copy), constantsModule_1 (copy)
				default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			
			local voiceConnectButton, voiceConnectButton_1, voiceConnectButton_2 = utilityModule:MakeStyledButton("VoiceConnectButton", var106, UDim2.new(1, 0, 1, -20), if var109 then throttleFunctionCallModule(var108, var110) else var110, gameSettingsTab)
			voiceConnectSetRowRef = voiceConnectButton_2
			local var112 = voiceConnectButton
			local var113 = voiceConnectButton_1
			local voiceDisconnectButton, voiceDisconnectButton_1, voiceDisconnectButton_2 = utilityModule:MakeStyledButton("VoiceDisconnectButton", var107, UDim2.new(1, 0, 1, -20), if var109 then throttleFunctionCallModule(var108, var111) else var111, gameSettingsTab)
			voiceDisconnectSetRowRef = voiceDisconnectButton_2
			local var114 = voiceDisconnectButton
			local var115 = voiceDisconnectButton_1
			var112.Size = UDim2.new(0.6, 0, 0, 40)
			var112.Position = UDim2.new(0.4, 0, 0.5, 0)
			var112.AnchorPoint = Vector2.new(0, 0.5)
			var112.ZIndex = 2
			var112.Selectable = true
			var113.ZIndex = 2
			var114.Size = UDim2.new(0.6, 0, 0, 40)
			var114.Position = UDim2.new(0.4, 0, 0.5, 0)
			var114.AnchorPoint = Vector2.new(0, 0.5)
			var114.ZIndex = 2
			var114.Selectable = true
			var115.ZIndex = 2
			local var116 = utilityModule:AddNewRowObject(gameSettingsTab, var105, var112, nil, true)
			local var117 = utilityModule:AddNewRowObject(gameSettingsTab, var105, var114, nil, true)
			gameSettingsTab.VoiceConnectFrame = var116
			gameSettingsTab.VoiceDisconnectFrame = var117
			var116.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			var117.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(var116)
			voiceDisconnectSetRowRef(var117)
			
			if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				var116.Visible = false
				var117.Visible = false
				
				return
			elseif default_2:ShouldShowJoinVoice() then
				var116.Visible = true
				var117.Visible = false
				
				return
			end
			var116.Visible = false
			var117.Visible = true
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
		local var105, var106, var107 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", t_1, table.find(enumItems, gameSettings.VRComfortSetting), nil, var3:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		gameSettingsTab.VRComfortSettingFrame = var105
		gameSettingsTab.VRComfortSettingLabel = var106
		gameSettingsTab.VRComfortSettingSelector = var107
		gameSettingsTab.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame
		local var108, var109, var110 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VignetteEnabled then 1 else 2)
		gameSettingsTab.VRVignetteEnabledFrame = var108
		gameSettingsTab.VRVignetteEnabledLabel = var109
		gameSettingsTab.VRVignetteEnabledSelector = var110
		gameSettingsTab.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame
		local var111, var112, var113 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRSmoothRotationEnabled then 2 else 1)
		gameSettingsTab.VRSteppedRotationEnabledFrame = var111
		gameSettingsTab.VRSteppedRotationEnabledLabel = var112
		gameSettingsTab.VRSteppedRotationEnabledSelector = var113
		gameSettingsTab.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame
		local var114, var115, var116 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			var3:Format("InGame.CommonUI.Label.On"),
			var3:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame = var114
		gameSettingsTab.VRThirdPersonFixedCamEnabledLabel = var115
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector = var116
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame
		
		local var117 = function(p11)
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
			-- upvalues: enumItems (ref), gameSettings (copy), var117 (ref)
			local var118 = enumItems[p11]
			gameSettings.VRComfortSetting = var118
			var117(var118)
		end)
		var117(gameSettings.VRComfortSetting)
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
			local var118 = if gameSettings.VignetteEnabled then 1 else 2
			
			if gameSettingsTab.VRVignetteEnabledSelector:GetSelectedIndex() ~= var118 then
				gameSettingsTab.VRVignetteEnabledSelector:SetSelectionIndex(var118)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var118 = if gameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if gameSettingsTab.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= var118 then
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetSelectionIndex(var118)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function()
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var118 = if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= var118 then
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(var118)
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
			local var118, var119, var120 = utilityModule:AddNewRow(gameSettingsTab, var3:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", t_1, index, nil, var3:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			gameSettingsTab.VRSafetyBubbleModeFrame = var118
			gameSettingsTab.VRSafetyBubbleModeLabel = var119
			gameSettingsTab.VRSafetyBubbleModeSelector = var120
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
	local var118 = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (getFFlagEnableVrVoiceConnectDisconnect() or (if isInExperienceUIVREnabled then not isSpatial() else true)) then
		spawn(function()
			-- upvalues: getFFlagEnableVoiceUxUpdates (copy), hideVoiceChatSelectorForFaeAEGIS2 (copy), default_2 (copy), createVoiceChatSelector (ref), isVoiceFocused (copy), gameSettingsTab (ref), observeIsVoiceFocused (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), voiceVolumeControlsEligibility (copy), name (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var104 (write), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (ref), default_3 (copy), t_4 (copy), getFFlagVoiceChatUILoggingModule (copy)
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
				-- upvalues: default_2 (copy), gameSettingsTab (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), voiceVolumeControlsEligibility (copy), name (copy), observeIsVoiceFocused (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableVoiceUxUpdates (copy), createVoiceChatSelector (copy), getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var104 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (copy), default_3 (copy), t_4 (copy)
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
					
					local var119 = nil
					local ok, status = pcall(function()
						-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var119 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
						local voiceChatService = game:GetService("VoiceChatService")
						local service = default_2:getService()
						gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var119 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
					end)
					
					if not ok then
						name:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", status)
					end
					if voiceVolumeControlsSuppressInExperienceUiForPartyVoice and getFFlagEnableCrossExpVoice() and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						observeIsVoiceFocused(function()
							-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy), name (copy)
							local var120 = nil
							local ok, status = pcall(function()
								-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var120 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
								local voiceChatService = game:GetService("VoiceChatService")
								local service = default_2:getService()
								gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var120 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
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
								local var120 = nil
								local ok, status = pcall(function()
									-- upvalues: default_2 (copy), voiceVolumeControlsFixSliderVisibilityOnEligibleGames (copy), var120 (ref), voiceVolumeControlsSuppressInExperienceUiForPartyVoice (copy), getFFlagEnableCrossExpVoice (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), gameSettingsTab (copy), voiceVolumeControlsEligibility (copy)
									local voiceChatService = game:GetService("VoiceChatService")
									local service = default_2:getService()
									gameSettingsTab.VoiceChatVolumeFrame.Visible = voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible((if voiceVolumeControlsFixSliderVisibilityOnEligibleGames then var120 or service and service.VoiceChatState else service and service.VoiceChatState) == Enum.VoiceChatState.Joined, voiceChatService and voiceChatService.UseNewAudioApi) and not (voiceVolumeControlsSuppressInExperienceUiForPartyVoice and (getFFlagEnableCrossExpVoice() and (getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused())))
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
						var104 = true
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function()
							-- upvalues: var104 (copy)
							var104 = false
						end)
						
						return
					end
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				else
					local var120 = false
					
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
						createVoiceConnectDisconnect()
						
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							var120 = isVoiceFocused()
							observeIsVoiceFocused(function(p11)
								-- upvalues: var120 (write), gameSettingsTab (copy), default_2 (copy)
								var120 = p11
								
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
							gameSettingsTab.VoiceDisconnectFrame.Visible = not var120
						else
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end
					default_2.showVoiceUI.Event:Connect(function()
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var120 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var120 then return end
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
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var120 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var120 then return end
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
		
		var118 = function()
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
	local var119 = nil
	
	local _ = function()
		-- upvalues: var119 (write)
		if var119 then
			var119:disconnect()
			var119 = nil
		end
	end
	
	if getFFlagSelfViewCameraSettings() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local var120 = function(p11)
			-- upvalues: gameSettingsTab (ref)
			gameSettingsTab.VideoOptionsEnabled = p11.hasCameraPermissions
		end
		
		if isCamEnabledForUserAndPlaceModule() then
			getCamMicPermissionsModule(var120, { default.Permissions.CAMERA_ACCESS }, true)
			var119 = cameraDevicePermissionGrantedSignalModule:connect(function()
				-- upvalues: gameSettingsTab (ref), updateCameraDevices (ref), videoCaptureService (copy), var102 (write)
				gameSettingsTab.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if videoCaptureService.DevicesChanged then
					var102 = videoCaptureService.DevicesChanged:Connect(function()
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
		createCameraModeOptions(not var9 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
	end
	local changedConnection
	local _ = function()
		-- upvalues: gameSettings (copy), createGamepadOptions (ref)
		if gameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		end
		local var121 = nil
		var121 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
			-- upvalues: gameSettings (copy), var121 (write), createGamepadOptions (copy)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if var121 then
					var121:disconnect()
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
			local var121 = nil
			var121 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: gameSettings (copy), var121 (write), createGamepadOptions (copy)
				if gameSettings.IsUsingGamepadCameraSensitivity then
					if var121 then
						var121:disconnect()
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
			changedConnection = gameSettings.Changed:connect(function(p11)
				-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
				if p11 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
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
			createCameraModeOptions(not var9 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
			
			if gameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				changedConnection = nil
				changedConnection = gameSettings.Changed:connect(function(p11)
					-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
					if p11 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
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
	if var5 then
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
	if var4 then
		createMicroProfilerOptions()
	end
	if var9 and getAppFeaturePolicies().getSupportsOverscan() then
		createOverscanOption()
	end
	if showAntiHarassmentSettings and fFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var121, var122, var123 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var121
			gameSettingsTab.badgeVisibleFrame = var122
			gameSettingsTab.badgeVisibleSelector = var123
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
	var15 = true
	
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
		-- upvalues: runService (copy), enableTFFeedbackModeEntryCheck (copy), var9 (copy)
		return if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false else enableTFFeedbackModeEntryCheck and var9
	end
	
	function gameSettingsTab.OpenSettingsPage()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), updateAudioOptions (ref), soundService (copy), var101 (write), gameSettings (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), getFFlagSelfViewCameraSettings (copy), updateCameraDevices (ref), videoCaptureService (copy), var102 (write), updateUiToggleSelection (ref), var2 (copy), var8 (copy), themeModule (copy), var7 (copy), getLastValueChangerFrame (copy), fFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		gameSettingsTab.PageOpen = true
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if getFFlagLazyInitiateExperienceLanguageSwitcherModule() and not gameSettingsTab.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and getFFlagEnableLocalesForExperienceLanguageSwitcherModule()) then
			gameSettingsTab.LanguageSwitcherInitialized = true
			experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if soundService.DeviceListChanged then
			var101 = soundService.DeviceListChanged:Connect(function()
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
				var102 = videoCaptureService.DevicesChanged:Connect(function()
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
				gameSettingsTab.toggleFeedbackModeText.Text = var8
			else
				gameSettingsTab.toggleFeedbackModeButton.Active = false
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = false
				gameSettingsTab.toggleFeedbackModeText.TextColor3 = themeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				gameSettingsTab.toggleFeedbackModeText.Text = var7
			end
		end
		table.insert(gameSettingsTab.LastSelectableObjects, getLastValueChangerFrame(gameSettingsTab))
		
		if fFlagIEMTabFocusNav then
			table.insert(gameSettingsTab.FirstSelectableObjects, getFirstValueChangerFrame(gameSettingsTab))
			gameSettingsTab.FirstSelectableObjectsUpdated:fire()
		end
	end
	
	function gameSettingsTab.CloseSettingsPage()
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), soundService (copy), var101 (write), getFFlagEnableCrossExpVoice (copy), var118 (write), getFFlagSelfViewCameraSettings (copy), videoCaptureService (copy), var102 (write), var119 (write), default_2 (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy)
		gameSettingsTab.PageOpen = false
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if soundService.DeviceListChanged and var101 then
			var101:Disconnect()
		end
		if getFFlagEnableCrossExpVoice() and var118 then
			var118()
		end
		if getFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and videoCaptureService.DevicesChanged and var102 then
				var102:Disconnect()
				var102 = nil
			end
			if var119 then
				var119:disconnect()
				var119 = nil
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
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (ref), getFFlagChatTranslationSettingEnabledModule (copy), getFFlagChatTranslationHoldoutEnabledModule (copy), getFStringChatTranslationLayerNameModule (copy), getChatTranslationLayerData (ref), textChatServiceSettingsSavedEngineFeature (copy), getFFlagChatTranslationNewDefaultsModule (copy), gameSettings (copy), textChatService (copy), getFFlagChatTranslationForceSettingModule (copy), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy), runService (copy), enableTFFeedbackModeEntryCheck (copy), var9 (copy), createFeedbackModeOptions (ref)
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
		if if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false elseif enableTFFeedbackModeEntryCheck and var9 then false else true then
			createFeedbackModeOptions()
		end
	end
	
	return gameSettingsTab
end)()