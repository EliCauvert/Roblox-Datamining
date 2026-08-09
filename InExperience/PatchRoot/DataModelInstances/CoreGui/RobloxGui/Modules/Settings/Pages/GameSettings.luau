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
local var83_1
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
local fFlagAIRephraseSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled
local fFlagVoiceRewarmTelemetry = sharedFlagsModule.FFlagVoiceRewarmTelemetry
local debounceVoiceSelectorIndexChange = game:DefineFastFlag("DebounceVoiceSelectorIndexChange", false)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local default_1 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local gameSettingsConstantsModule = require(robloxGui.Modules.Settings.Resources.GameSettingsConstants)
local var45 = default_1 and default_1.getHasPartyVoiceVolume()
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
local var53 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local var54 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local var55 = robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local t_6 = { On = 1, Off = 2 }

local function _() --[[ line: 163 | named "getDefaultCameraMode" ]]
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then "Default (Follow)" else "Default (Classic)"
end

local _ = function() --[[ line: 172 | named "getDefaultMovementMode" ]]
	-- upvalues: userInputService (ref), robloxTranslatorModule (ref), constantsModule (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else "Default (Keyboard)"
end

local _ = function() --[[ line: 181 | named "getDefaultSelectToMove" ]]
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
local var76 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local _ = nil
local localPlayer = playersService.LocalPlayer
local platform = userInputService:GetPlatform()
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local default_2 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local default_3 = require(corePackagesService.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local var79 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local var80 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local romarkStartWithGraphicQualityLevelFastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local var83 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local var84 = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
local var85 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true

if isInExperienceUIVREnabled then
	if not var85 and not var84 then
		var83_1 = isSpatial() and var83
	end
elseif not var85 then
	var83_1 = var84 and var83
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

local function reportSettingsChangeForAnalytics(value, p0, p1, p2) --[[ line: 306 ]]
	-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), userInputService (ref), cryoModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	if not getFFlagEnableExplicitSettingsChangeAnalyticsModule() or p0 == p1 or (p0 == nil or p1 == nil) then return end
	local t = {
		universe_id = tostring(game.GameId),
		name = value,
		old_value = tostring(p0),
		new_value = tostring(p1),
		has_touch = userInputService.TouchEnabled,
		has_mouse = userInputService.MouseEnabled,
		has_gamepad = userInputService.GamepadEnabled
	}
	
	if p2 then
		t = cryoModule.Dictionary.join(t, p2)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsExplicitSettingsChangeName, t)
end

local function reportSettingsForAnalytics() --[[ line: 337 ]]
	-- upvalues: userInputService (ref), gameSettings (ref), gameBasicSettingsFramerateCapEngineFeature (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), rbxAnalyticsService (ref), constantsModule (ref)
	local t = {}
	local var114 = userInputService.PreferredInput == Enum.PreferredInput.Touch
	
	if var114 then
		t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
	else
		t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
	end
	if var114 then
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

local function getLastValueChangerFrame(p3) --[[ line: 403 ]]
	-- upvalues: fFlagIEMFocusNavToButtons (ref)
	if not fFlagIEMFocusNavToButtons then return end
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p3:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or layoutOrder <= selectionFrame.LayoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p3:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

local function getFirstValueChangerFrame(p4) --[[ line: 422 ]]
	-- upvalues: fFlagIEMTabFocusNav (ref)
	if not fFlagIEMTabFocusNav then return end
	local layoutOrder = nil
	local valueChangerValueChangerFrame = nil
	
	for i, v in pairs(p4:GetRows()) do
		local selectionFrame = v.SelectionFrame
		
		if not layoutOrder or selectionFrame.LayoutOrder < layoutOrder then
			layoutOrder = selectionFrame.LayoutOrder
			valueChangerValueChangerFrame = p4:getValueChangerFrame(v.ValueChanger)
		end
	end
	return valueChangerValueChangerFrame
end

return (function() --[[ line: 441 | named "Initialize" ]]
	-- upvalues: IGMEnableGFXReset (ref), gfxResetModule (ref), robloxGui (ref), getFFlagLazyInitiateExperienceLanguageSwitcherModule (ref), VRService (ref), gameSettings (ref), utilityModule (ref), SETTINGS_MENU_LAYOUT_ORDER (ref), guiService (ref), getFFlagFixCyclicFullscreenIndexEventModule (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (ref), reportSettingsChangeForAnalytics (ref), reportSettingsForAnalytics (ref), rbxAnalyticsService (ref), constantsModule (ref), gameBasicSettingsFramerateCapEngineFeature (ref), eraseFPSFromDefaultSetting (ref), robloxTranslatorModule (ref), romarkStartWithGraphicQualityLevelFastInt (ref), t (ref), updateVisibilitySettingsCopy (ref), fFlagUpdatePeopleNamesSettingCopyModule (ref), t_6 (ref), userInputService (ref), create (ref), themeModule (ref), centerShiftLockOverride (ref), microProfilerReadOnlyInformationLabel (ref), touchEnabled (ref), var85 (ref), var84 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), localPlayer (ref), coreUtilityModule (ref), t_3 (ref), getFFlagAlwaysShowVRToggleModule (ref), getAppFeaturePolicies (ref), t_5 (ref), var53 (ref), t_2 (ref), t_1 (ref), url (ref), httpService (ref), feedbackEntryPointImprovedStrictnessCheck (ref), safetyService (ref), var17 (write), feedbackEntryPointButtonSizeAdjustment2 (ref), var55 (ref), disableFeedbackSoothsayerCheck (ref), name (ref), playersService (ref), var54 (ref), runService (ref), getFFlagChatTranslationWaitForIXPModule (ref), IXPServiceWrapper (ref), getFFlagChatTranslationNewDefaultsModule (ref), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (ref), default_3 (ref), var20 (write), corePackagesService (ref), contextActionService (ref), fixDeveloperConsoleButtonSizeAndPositioning (ref), playerPermissionsModule (ref), userFreecamGuiDestabilization (ref), userShowGuiHideToggles (ref), soundService (ref), getFIntVoiceChatDeviceChangeDebounceDelayModule (ref), default_2 (ref), getFFlagEnableCrossExpVoice (ref), signalsModule (ref), getFIntDebounceAIRephraseSettingDelayModule (ref), textChatService (ref), expChatDebounceRephraseIndexSelection (ref), throttleFunctionCallModule (ref), getFIntDebounceChatSummariesSettingDelayModule (ref), var80 (ref), userGameSettingsService (ref), getFFlagVoiceChatUILoggingModule (ref), videoCaptureService (ref), var79 (ref), differentiateVoiceSelectorSystemAndUser (ref), voiceSelectorAvailableAfterFae (ref), enableVoiceSelectorTranslationsAEGIS2 (ref), getFIntDebounceDisconnectButtonDelayModule (ref), fFlagVoiceRewarmTelemetry (ref), constantsModule_1 (ref), voiceChatSelectorReconnectFocus2AEGIS2 (ref), debounceVoiceSelectorIndexChange (ref), deferProgrammaticChange (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), isVoiceFocused (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), getFFlagEnableVoiceUxUpdates (ref), hideVoiceChatSelectorForFaeAEGIS2 (ref), observeIsVoiceFocused (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), t_4 (ref), getFFlagSelfViewCameraSettings (ref), isCamEnabledForUserAndPlaceModule (ref), getCamMicPermissionsModule (ref), default (ref), cameraDevicePermissionGrantedSignalModule (ref), var76 (ref), var45 (ref), showAntiHarassmentSettings (ref), getFFlagEnablePlayerNamesEnabledSettingModule (ref), playerChoiceTranslationSettingInitializerModule (ref), cachedPolicyServiceModule (ref), var83_1 (ref), fFlagBadgeVisibilitySettingEnabled (ref), fFlagEnableModerateChatRemoteEvent (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), getHasGuiHidingPermissionModule (ref), fFlagIEMSettingsGroupsModule (ref), renderSettingsHeaderModule (write), renderSettingsDividerModule (write), migration (ref), builderIconsModule (ref), enableTFFeedbackModeEntryCheck (ref), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (ref), experienceLanguageSwitcherInitializerModule (ref), fFlagIEMFocusNavToButtons (ref), getLastValueChangerFrame (ref), fFlagIEMTabFocusNav (ref), getFirstValueChangerFrame (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFFlagChatTranslationHoldoutEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), textChatServiceSettingsSavedEngineFeature (ref), getFFlagChatTranslationForceSettingModule (ref), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (ref)
	if IGMEnableGFXReset then
		gfxResetModule.RunGfxReset()
	end
	local gameSettingsTab = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	if getFFlagLazyInitiateExperienceLanguageSwitcherModule() then
		gameSettingsTab.LanguageSwitcherInitialized = false
	end
	local var118 = false
	local t_7 = {}
	
	local function _() --[[ line: 454 | named "onVRSettingsReady" ]]
		-- upvalues: VRService (copy), t_7 (ref)
		local VREnabled = VRService.VREnabled
		
		for i, v in pairs(t_7) do
			i.Visible = not VREnabled
		end
	end
	
	VRService:GetPropertyChangedSignal("VREnabled"):connect(function() --[[ line: 461 | named "onVREnabled" ]]
		-- upvalues: VRService (copy), var118 (write), t_7 (ref)
		if VRService.VREnabled and var118 then
			local VREnabled = VRService.VREnabled
			
			for i, v in pairs(t_7) do
				i.Visible = not VREnabled
			end
		end
	end)
	local function createGraphicsOptions() --[[ line: 473 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), rbxAnalyticsService (copy), constantsModule (copy), gameBasicSettingsFramerateCapEngineFeature (copy), VRService (copy), eraseFPSFromDefaultSetting (copy), robloxTranslatorModule (copy), IGMEnableGFXReset (copy), gfxResetModule (copy), romarkStartWithGraphicQualityLevelFastInt (copy), t (copy)
		local var167, var168, var169 = utilityModule:AddNewRow(gameSettingsTab, "Fullscreen", "Selector", { "On", "Off" }, if not gameSettings:InFullScreen() then 2 else 1)
		gameSettingsTab.FullscreenFrame = var167
		gameSettingsTab.FullscreenLabel = var168
		gameSettingsTab.FullscreenEnabler = var169
		gameSettingsTab.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t_7[gameSettingsTab.FullscreenFrame] = true
		gameSettingsTab.FullscreenEnabler.IndexChanged:connect(function(p5) --[[ line: 486 ]]
			-- upvalues: gameSettings (copy), guiService (copy), getFFlagFixCyclicFullscreenIndexEventModule (copy), gameSettingsTab (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var183 = gameSettings:InFullScreen()
			
			if p5 == 1 then
				if not gameSettings:InFullScreen() then
					guiService:ToggleFullscreen()
					
					if not getFFlagFixCyclicFullscreenIndexEventModule() then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 1 then
						gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p5 == 2 and gameSettings:InFullScreen() then
				guiService:ToggleFullscreen()
				
				if not getFFlagFixCyclicFullscreenIndexEventModule() then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				elseif gameSettingsTab.FullscreenEnabler.GetSelectedIndex() ~= 2 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
				end
			end
			spawn(function() --[[ line: 511 ]]
				-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), var183 (ref), gameSettings (copy), reportSettingsForAnalytics (copy)
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", var183, gameSettings:InFullScreen())
				end
				reportSettingsForAnalytics()
			end)
		end)
		gameSettings.FullscreenChanged:connect(function(p6) --[[ line: 519 ]]
			-- upvalues: gameSettingsTab (copy), rbxAnalyticsService (copy), constantsModule (copy)
			if p6 then
				if gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					gameSettingsTab.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif gameSettingsTab.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				gameSettingsTab.FullscreenEnabler:SetSelectionIndex(2)
			end
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsFullscreenModeName, { enabled = p6 })
		end)
		local var170 = gameSettingsTab
		local var171, var172, var173 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Mode", "Selector", { "Automatic", "Manual" }, if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then 2 else 1)
		gameSettingsTab.GraphicsEnablerFrame = var171
		gameSettingsTab.GraphicsEnablerLabel = var172
		var170.GraphicsQualityEnabler = var173
		gameSettingsTab.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame
		local var174 = gameSettingsTab
		local var175, var176, var177 = utilityModule:AddNewRow(gameSettingsTab, "Graphics Quality", "Slider", 10, 1)
		gameSettingsTab.GraphicsQualityFrame = var175
		gameSettingsTab.GraphicsQualityLabel = var176
		var174.GraphicsQualitySlider = var177
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
			task.defer(function() --[[ line: 585 ]]
				-- upvalues: gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), list (ref), cloned (ref), gameSettings (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local var184, var185, var186 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", list, table.find(cloned, gameSettings.FramerateCap), nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				gameSettingsTab.FramerateCapFrame = var184
				gameSettingsTab.FramerateCapLabel = var185
				gameSettingsTab.FramerateCapMode = var186
				gameSettingsTab.FramerateCapFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FramerateCap
				gameSettingsTab.FramerateCapMode.IndexChanged:Connect(function(p7) --[[ line: 597 ]]
					-- upvalues: gameSettings (copy), cloned (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
					local framerateCap = gameSettings.FramerateCap
					gameSettings.FramerateCap = cloned[p7]
					
					if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
						reportSettingsChangeForAnalytics("framerate_cap", framerateCap, gameSettings.FramerateCap)
					end
					reportSettingsForAnalytics()
				end)
			end)
		end
		settings().Rendering.EnableFRM = true
		
		function SetGraphicsQuality(value, p8) --[[ line: 615 ]]
			-- upvalues: IGMEnableGFXReset (copy), gfxResetModule (copy), gameSettings (copy)
			if IGMEnableGFXReset then
				local var187, var188 = gfxResetModule.TemporaryOverride(value)
				
				if var187 then
					settings().Rendering.QualityLevel = var188
					
					return
				end
			end
			local floored = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * (value / 10))
			
			if floored == 20 then
				floored = 21
			elseif value == 1 then
				floored = 1
			elseif value < 1 and not p8 then
				value = 1
				floored = 1
			elseif settings().Rendering:GetMaxQualityLevel() < floored then
				floored = settings().Rendering:GetMaxQualityLevel() - 1
			end
			gameSettings.SavedQualityLevel = value
			settings().Rendering.QualityLevel = floored
		end
		
		local function _() --[[ line: 641 | named "setGraphicsToAuto" ]]
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
			gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
			gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		end
		
		local function setGraphicsToManual(value) --[[ line: 649 ]]
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
		
		local var181 = false
		gameSettingsTab.GraphicsQualitySlider.ValueChanged:connect(function(p9) --[[ line: 663 ]]
			-- upvalues: var181 (write), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p9)
			
			if var181 == true then
				reportSettingsForAnalytics()
			end
			var181 = true
		end)
		gameSettingsTab.GraphicsQualityEnabler.IndexChanged:connect(function(p10) --[[ line: 671 ]]
			-- upvalues: gameSettingsTab (copy), setGraphicsToManual (ref), reportSettingsForAnalytics (copy), reportSettingsChangeForAnalytics (copy)
			local t = {
				Automatic = { Name = "Automatic", Value = 1 },
				Manual = { Name = "Manual", Value = 2 }
			}
			local name = t.Automatic.Name
			local name_1 = t.Manual.Name
			
			if p10 == t.Automatic.Value then
				name = t.Manual.Name
				name_1 = t.Automatic.Name
				gameSettingsTab.GraphicsQualitySlider:SetZIndex(1)
				gameSettingsTab.GraphicsQualityLabel.ZIndex = 1
				gameSettingsTab.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p10 == t.Manual.Value then
				setGraphicsToManual(gameSettingsTab.GraphicsQualitySlider:GetValue())
			end
			reportSettingsForAnalytics()
			reportSettingsChangeForAnalytics("gfx_mode", name, name_1)
		end)
		game.GraphicsQualityChangeRequest:Connect(function(p11) --[[ line: 689 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			if gameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local value = gameSettingsTab.GraphicsQualitySlider:GetValue()
				gameSettingsTab.GraphicsQualitySlider:SetValue(if p11 then value + 1 else value - 1)
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
			local var182 = tostring(gameSettings.SavedQualityLevel)
			var182 = if t[var182] then t[var182] else 10
			SetGraphicsQuality(var182)
			spawn(function() --[[ line: 722 ]]
				-- upvalues: gameSettingsTab (copy), var182 (write)
				gameSettingsTab.GraphicsQualitySlider:SetValue(var182)
			end)
		end
	end
	
	local function createReducedMotionOptions() --[[ line: 728 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var192, var193, var194 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.ReducedMotion"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.ReducedMotion then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.ReducedMotion"))
		gameSettingsTab.ReducedMotionFrame = var192
		gameSettingsTab.ReducedMotionLabel = var193
		gameSettingsTab.ReducedMotionMode = var194
		gameSettingsTab.ReducedMotionFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ReducedMotionFrame
		gameSettingsTab.ReducedMotionMode.IndexChanged:connect(function(p12) --[[ line: 750 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local reducedMotion = gameSettings.ReducedMotion
			gameSettings.ReducedMotion = p12 == 1
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("reduced_motion", reducedMotion, gameSettings.ReducedMotion)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPlayerNamesEnabledOptions() --[[ line: 761 ]]
		-- upvalues: updateVisibilitySettingsCopy (copy), robloxTranslatorModule (copy), fFlagUpdatePeopleNamesSettingCopyModule (copy), gameSettings (copy), t_6 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local function _() --[[ line: 769 | named "GetPlayerNamesEnabledStartIndex" ]]
			-- upvalues: gameSettings (copy)
			return if gameSettings.PlayerNamesEnabled then 1 else 2
		end
		
		local var195, var196, var197 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") elseif fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames"), "Selector", {
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.PlayerNamesEnabled then t_6.On else t_6.Off, nil, if fFlagUpdatePeopleNamesSettingCopyModule then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil)
		gameSettingsTab.PlayerNamesEnabledFrame = var195
		gameSettingsTab.playerNamesEnabledLabel = var196
		gameSettingsTab.playerNamesEnabledMode = var197
		gameSettingsTab.PlayerNamesEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PlayerNamesEnabledFrame
		gameSettingsTab.playerNamesEnabledMode.IndexChanged:connect(function(p13) --[[ line: 788 ]]
			-- upvalues: gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local playerNamesEnabled = gameSettings.PlayerNamesEnabled
			gameSettings.PlayerNamesEnabled = p13 == 1
			reportSettingsChangeForAnalytics("player_names_enabled", playerNamesEnabled, gameSettings.PlayerNamesEnabled)
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTransparencyOptions() --[[ line: 797 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var198, var199, var200 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, 10 - math.clamp(math.floor(gameSettings.PreferredTransparency * 10 + 0.5), 0, 10), nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque"))
		gameSettingsTab.PreferredTransparencyFrame = var198
		gameSettingsTab.PreferredTransparencyLabel = var199
		gameSettingsTab.PreferredTransparencySlider = var200
		gameSettingsTab.PreferredTransparencyFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTransparencyFrame
		gameSettingsTab.PreferredTransparencySlider.ValueChanged:connect(function(p14) --[[ line: 823 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTransparency = gameSettings.PreferredTransparency
			gameSettings.PreferredTransparency = (10 - math.clamp(math.floor(p14), 0, 10)) / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_transparency", preferredTransparency, gameSettings.PreferredTransparency)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPreferredTextSizeOptions() --[[ line: 835 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local enumItems = Enum.PreferredTextSize:GetEnumItems()
		local var202, var203, var204 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, gameSettings.PreferredTextSize.Value - 1, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), robloxTranslatorModule:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest"))
		gameSettingsTab.PreferredTextSizeFrame = var202
		gameSettingsTab.PreferredTextSizeLabel = var203
		gameSettingsTab.PreferredTextSizeSlider = var204
		gameSettingsTab.PreferredTextSizeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTextSizeFrame
		gameSettingsTab.PreferredTextSizeSlider.ValueChanged:connect(function(p15) --[[ line: 860 ]]
			-- upvalues: gameSettings (copy), enumItems (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local preferredTextSize = gameSettings.PreferredTextSize
			gameSettings.PreferredTextSize = enumItems[p15 + 1]
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("preferred_text_size", preferredTextSize, gameSettings.PreferredTextSize)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createUiNavigationKeyBindOptions() --[[ line: 870 ]]
		-- upvalues: gameSettings (copy), robloxTranslatorModule (copy), userInputService (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t = { On = 1, Off = 2 }
		local var206, var207, var208 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		}, if gameSettings.UiNavigationKeyBindEnabled then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}))
		gameSettingsTab.UiNavigationKeyBindEnabledFrame = var206
		gameSettingsTab.UiNavigationKeyBindEnabledLabel = var207
		gameSettingsTab.UiNavigationKeyBindEnabledMode = var208
		gameSettingsTab.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame
		gameSettingsTab.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p16) --[[ line: 901 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local uiNavigationKeyBindEnabled = gameSettings.UiNavigationKeyBindEnabled
			gameSettings.UiNavigationKeyBindEnabled = p16 == 1
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("ui_navigation_key_bind_enabled", uiNavigationKeyBindEnabled, gameSettings.UiNavigationKeyBindEnabled)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _() --[[ line: 914 | named "updateUiNavigationKeyBindVisibility" ]]
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
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ line: 929 ]]
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
	
	local function createPerformanceStatsOptions() --[[ line: 934 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var209 = nil
		local var210 = nil
		local var211 = nil
		local var212 = nil
		gameSettingsTab.PerformanceStatsFrame = var209
		gameSettingsTab.PerformanceStatsLabel = var210
		gameSettingsTab.PerformanceStatsMode = var211
		gameSettingsTab.PerformanceStatsOverrideText = var212
		
		function GetDesiredPerformanceStatsIndex() --[[ line: 940 ]]
			-- upvalues: gameSettings (copy)
			return if gameSettings.PerformanceStatsVisible then 1 else 2
		end
		
		local var213, var214, var215 = utilityModule:AddNewRow(gameSettingsTab, "Performance Stats", "Selector", { "On", "Off" }, GetDesiredPerformanceStatsIndex())
		gameSettingsTab.PerformanceStatsFrame = var213
		gameSettingsTab.PerformanceStatsLabel = var214
		gameSettingsTab.PerformanceStatsMode = var215
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
		gameSettingsTab.PerformanceStatsMode.IndexChanged:connect(function(p17) --[[ line: 969 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var216 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.PerformanceStatsVisible else nil
			
			if p17 == 1 then
				gameSettings.PerformanceStatsVisible = true
			else
				gameSettings.PerformanceStatsVisible = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("show_performance_stats", var216, gameSettings.PerformanceStatsVisible)
			end
			reportSettingsForAnalytics()
		end)
		gameSettings.PerformanceStatsVisibleChanged:connect(function() --[[ line: 991 ]]
			-- upvalues: gameSettingsTab (copy)
			local var217 = GetDesiredPerformanceStatsIndex()
			
			if var217 ~= gameSettingsTab.PerformanceStatsMode.CurrentIndex then
				gameSettingsTab.PerformanceStatsMode:SetSelectionIndex(var217)
			end
		end)
	end
	
	local function createWebServerInformationRow() --[[ line: 1001 ]]
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), microProfilerReadOnlyInformationLabel (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), touchEnabled (copy), create (copy), themeModule (copy)
		local var218, var219, var220 = utilityModule:AddNewRow(gameSettingsTab, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, if microProfilerReadOnlyInformationLabel then false else nil)
		gameSettingsTab.InformationFrame = var218
		gameSettingsTab.InformationLabel = var219
		gameSettingsTab.InformationTextBox = var220
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
	
	local function createMicroProfilerOptions() --[[ line: 1041 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), createWebServerInformationRow (ref), var85 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), var84 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local var221 = nil
		local var222 = nil
		local var223 = nil
		local var224 = nil
		gameSettingsTab.MicroProfilerFrame = var221
		gameSettingsTab.MicroProfilerLabel = var222
		gameSettingsTab.MicroProfilerMode = var223
		gameSettingsTab.MicroProfilerOverrideText = var224
		
		local function _() --[[ line: 1046 | named "tryContentLabel" ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), createWebServerInformationRow (copy)
			local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
			
			if microProfilerWebServerPort == 0 then
				return false
			end
			local var233, var234 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var233
			gameSettingsTab.InformationText = var234
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
			
			return true
		end
		
		local function setMicroProfilerIndex(value) --[[ line: 1058 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy), var85 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), createWebServerInformationRow (copy), var84 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), rbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local function _() --[[ line: 1059 | named "hideContentLabel" ]]
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
			
			local var235 = nil
			local onScreenProfilerEnabled = nil
			local onScreenProfilerEnabled_1 = nil
			
			if var85 then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var235 = "webserver"
					onScreenProfilerEnabled = gameSettings.MicroProfilerWebServerEnabled
				end
				if value == 1 then
					gameSettings.MicroProfilerWebServerEnabled = true
					local var236 = 30
					while var236 >= 1 do
						local var239
						local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
						
						if microProfilerWebServerPort == 0 then
							var239 = false
						else
							local var237, var238 = createWebServerInformationRow()
							gameSettingsTab.InformationFrame = var237
							gameSettingsTab.InformationText = var238
							gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
							var239 = true
						end
						if var239 then break end
						var236 -= 1
						wait(0.1)
					end
					if var236 <= 0 then
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
			elseif var84 or isInExperienceUIVREnabled and isSpatial() then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					var235 = "regular"
					onScreenProfilerEnabled = gameSettings.OnScreenProfilerEnabled
				end
				gameSettings.OnScreenProfilerEnabled = value == 1
				
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					onScreenProfilerEnabled_1 = gameSettings.OnScreenProfilerEnabled
				end
			end
			rbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("microprofiler_enabled", onScreenProfilerEnabled, onScreenProfilerEnabled_1, { microprofiler_type = var235 })
			end
			reportSettingsForAnalytics()
		end
		
		local _ = function() --[[ line: 1132 | named "GetDesiredWebServerIndex" ]]
			-- upvalues: var85 (copy), gameSettings (copy), var84 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy)
			return if var85 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif not (not var84 and (not isInExperienceUIVREnabled or not isSpatial())) then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2
		end
		
		local var226 = gameSettingsTab
		local var227, var228, var229 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, if var85 then if gameSettings.MicroProfilerWebServerEnabled then 1 else 2 elseif var84 or isInExperienceUIVREnabled and isSpatial() then if gameSettings.OnScreenProfilerEnabled then 1 else 2 else 2)
		var226.MicroProfilerFrame = var227
		gameSettingsTab.MicroProfilerLabel = var228
		gameSettingsTab.MicroProfilerMode = var229
		gameSettingsTab.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame
		local microProfilerWebServerPort = gameSettings.MicroProfilerWebServerPort
		
		if microProfilerWebServerPort ~= 0 then
			local var230, var231 = createWebServerInformationRow()
			gameSettingsTab.InformationFrame = var230
			gameSettingsTab.InformationText = var231
			gameSettingsTab.InformationText.Text = gameSettings.MicroProfilerWebServerIP .. microProfilerWebServerPort
		end
		local var232 = false
		gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ line: 1161 ]]
			-- upvalues: var232 (write), gameSettings (copy), gameSettingsTab (copy)
			var232 = true
			
			if gameSettings.OnScreenProfilerEnabled then
				gameSettingsTab.MicroProfilerMode:SetSelectionIndex(1)
				
				return
			end
			gameSettingsTab.MicroProfilerMode:SetSelectionIndex(2)
		end)
		gameSettingsTab.MicroProfilerMode.IndexChanged:connect(function(...) --[[ line: 1171 | named "onIndexChanged" ]]
			-- upvalues: var232 (write), setMicroProfilerIndex (ref)
			if var232 then
				var232 = false
				
				return
			end
			setMicroProfilerIndex(...)
		end)
	end
	
	local function createCameraModeOptions(p18) --[[ line: 1182 ]]
		-- upvalues: gameSettingsTab (ref), gameSettings (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), centerShiftLockOverride (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), localPlayer (copy), userInputService (copy), coreUtilityModule (copy), t_3 (copy), VRService (copy), getFFlagAlwaysShowVRToggleModule (copy), getAppFeaturePolicies (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var53 (copy), t_2 (copy), t_1 (copy)
		local var240 = nil
		local var241 = nil
		local var242 = nil
		local var243 = nil
		gameSettingsTab.ShiftLockFrame = var240
		gameSettingsTab.ShiftLockLabel = var241
		gameSettingsTab.ShiftLockMode = var242
		gameSettingsTab.ShiftLockOverrideText = var243
		local var244, var245, var246 = utilityModule:AddNewRow(gameSettingsTab, "Shift Lock Switch", "Selector", { "On", "Off" }, if gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then 1 else 2)
		gameSettingsTab.ShiftLockFrame = var244
		gameSettingsTab.ShiftLockLabel = var245
		gameSettingsTab.ShiftLockMode = var246
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
		gameSettingsTab.ShiftLockMode.IndexChanged:connect(function(p19) --[[ line: 1213 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var281 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch else nil
			
			if p19 == 1 then
				gameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				gameSettings.ControlMode = Enum.ControlMode.Classic
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", var281, gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end
			reportSettingsForAnalytics()
		end)
		
		local function _(value) --[[ line: 1235 | named "setShiftLockSelectorVisible" ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local devEnableMouseLock = value and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		
		local _ = function() --[[ line: 1243 | named "applyDevOverrideShiftLockSelector" ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy)
			local var283 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var283
				local devEnableMouseLock = not var283 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end
		
		local _ = function() --[[ line: 1251 | named "updateShiftLockVisibility" ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var286 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var286
				local devEnableMouseLock = not var286 and localPlayer.DevEnableMouseLock
				
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
		local var248 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var248
			local devEnableMouseLock = not var248 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		userInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ line: 1261 ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var289 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var289
				local devEnableMouseLock = not var289 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ line: 1265 ]]
			-- upvalues: userInputService (copy), gameSettingsTab (copy), localPlayer (copy)
			local keyboardEnabled = userInputService.MouseEnabled and userInputService.KeyboardEnabled
			
			if gameSettingsTab.ShiftLockFrame then
				gameSettingsTab.ShiftLockFrame.Visible = keyboardEnabled
			end
			local var292 = not localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockOverrideText then
				gameSettingsTab.ShiftLockOverrideText.Visible = var292
				local devEnableMouseLock = not var292 and localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockMode then
					gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
					gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
				end
			end
		end)
		
		function cameraModeIsUserChoice() --[[ line: 1271 ]]
			-- upvalues: userInputService (copy), localPlayer (copy)
			return if userInputService.PreferredInput == Enum.PreferredInput.Touch then localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		
		function setCameraModeVisible(value) --[[ line: 1280 ]]
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
		
		local function updateCurrentCameraMovementIndex(p20) --[[ line: 1294 ]]
			-- upvalues: t_4 (write), t (write), userInputService (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy)
			local var294 = nil
			
			if not pcall(function() --[[ line: 1296 ]]
				-- upvalues: var294 (write), t_4 (copy), t (copy), p20 (ref)
				var294 = t_4[t[p20]]
			end) or var294 == nil then
				return false
			end
			local var295
			local _ = nil
			local value = nil
			
			if userInputService.PreferredInput == Enum.PreferredInput.Touch then
				if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
					value = gameSettings.TouchCameraMovementMode.Value
				end
				var295 = gameSettings.TouchCameraMovementMode.Value ~= var294
				gameSettings.TouchCameraMovementMode = var294
			elseif getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				value = gameSettings.ComputerCameraMovementMode.Value
			end
			var295 = gameSettings.ComputerCameraMovementMode.Value ~= var294
			gameSettings.ComputerCameraMovementMode = var294
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and var295 then
				reportSettingsChangeForAnalytics("camera_mode", value, var294)
			end
			return var295
		end
		
		local function updateCameraMovementModes() --[[ line: 1330 ]]
			-- upvalues: playerScripts (ref), userInputService (copy), t (write), t_4 (write), t_3 (copy), gameSettingsTab (copy), gameSettings (copy), updateCurrentCameraMovementIndex (ref)
			local var296 = if playerScripts then if userInputService.PreferredInput == Enum.PreferredInput.Touch then playerScripts:GetRegisteredTouchCameraMovementModes() else playerScripts:GetRegisteredComputerCameraMovementModes() else {}
			t = {}
			t_4 = {}
			
			if #var296 <= 0 then
				setCameraModeVisible(false)
				
				return
			end
			for i = 1, #var296 do
				local var297 = var296[i]
				local name = var297.Name
				
				if name == "Default" then
					name = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_3.DEFAULT_FOLLOW else t_3.DEFAULT_CLASSIC
				end
				t[#t + 1] = name
				t_4[name] = var297.Value
			end
			if gameSettingsTab.CameraMode then
				gameSettingsTab.CameraMode:UpdateOptions(t)
			end
			local _ = -1
			local var298 = userInputService.PreferredInput == Enum.PreferredInput.Touch
			local var299 = if var298 then gameSettings.TouchCameraMovementMode.Value else gameSettings.ComputerCameraMovementMode.Value
			
			if var299 > -1 then
				if var298 or gameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					var299 += 1
				end
				updateCurrentCameraMovementIndex(var299)
				gameSettingsTab.CameraMode:SetSelectionIndex(var299)
			end
			setCameraModeVisible(cameraModeIsUserChoice())
		end
		
		local var255 = gameSettingsTab
		local var256 = gameSettingsTab
		local var257 = gameSettingsTab
		local var258, var259, var260 = utilityModule:AddNewRow(gameSettingsTab, "Camera Mode", "Selector", t, 1)
		var255.CameraModeFrame = var258
		var256.CameraModeLabel = var259
		var257.CameraMode = var260
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
			playerScripts.TouchCameraMovementModeRegistered:connect(function(_) --[[ line: 1416 ]]
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.TouchEnabled then
					updateCameraMovementModes()
				end
			end)
			playerScripts.ComputerCameraMovementModeRegistered:connect(function(_) --[[ line: 1422 ]]
				-- upvalues: userInputService (copy), updateCameraMovementModes (ref)
				if userInputService.MouseEnabled then
					updateCameraMovementModes()
				end
			end)
		end
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 1429 ]]
			-- upvalues: updateCameraMovementModes (ref)
			updateCameraMovementModes()
		end)
		local t_6 = false
		gameSettingsTab.CameraMode.IndexChanged:connect(function(p21) --[[ line: 1434 ]]
			-- upvalues: updateCurrentCameraMovementIndex (ref), t_6 (write), reportSettingsForAnalytics (copy)
			if updateCurrentCameraMovementIndex(p21) then
				if t_6 then
					reportSettingsForAnalytics()
				end
				t_6 = true
			end
		end)
		updateCameraMovementModes()
		local var262 = false
		
		t = function() --[[ line: 1450 | named "createVROption" ]]
			-- upvalues: var262 (write), gameSettings (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not var262 then
				var262 = true
				local var300 = if gameSettings.VREnabled then { "On", "Off (restart pending)" } else { "On (restart pending)", "Off" }
				local var301, var302, var303 = utilityModule:AddNewRow(gameSettingsTab, "VR", "Selector", var300, if gameSettings.VREnabled then 1 else 2)
				gameSettingsTab.VREnabledFrame = var301
				gameSettingsTab.VREnabledLabel = var302
				gameSettingsTab.VREnabledSelector = var303
				gameSettingsTab.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				gameSettingsTab.VREnabledSelector.IndexChanged:connect(function(p22) --[[ line: 1465 ]]
					-- upvalues: gameSettings (copy), var300 (write), reportSettingsChangeForAnalytics (copy)
					local t = {
						On = { Name = "On", Value = 1 },
						Off = { Name = "Off", Value = 2 }
					}
					local var305 = p22 == t.On.Value
					
					if gameSettings.VREnabled ~= var305 then
						gameSettings.VREnabled = var305
						local value = var300[t.On.Value]
						local var306 = var300[p22]
						
						if var306 == var300[t.On.Value] then
							value = var300[t.Off.Value]
						end
						reportSettingsChangeForAnalytics("vr_mode", value, var306)
					end
				end)
			end
		end
		
		t_4 = function() --[[ line: 1484 | named "onVREnabledChanged" ]]
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
		
		local var266 = function(_) --[[ line: 1509 ]] end
		
		local _ = function(value) --[[ line: 1513 | named "setMovementModeVisible" ]]
			-- upvalues: gameSettingsTab (copy), t_8 (write)
			if gameSettingsTab.MovementMode then
				local var307 = value and #t_8 > 0
				gameSettingsTab.MovementMode.SelectorFrame.Visible = var307
				gameSettingsTab.MovementMode:SetInteractable(var307)
				gameSettingsTab.MovementModeOverrideText.Visible = not var307
			end
		end
		
		if p18 then
			local t_11 = {}
			local playerScripts_1 = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerScripts")
			
			local _ = function(p23) --[[ line: 1527 | named "getDisplayName" ]]
				-- upvalues: userInputService (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var53 (copy)
				local var308 = p23
				
				if p23 == "Default" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey)
					end
					var308 = t_5.DEFAULT_KEYBOARD
					
					return var308
				elseif p23 == "KeyboardMouse" then
					var308 = "Keyboard + Mouse"
					
					return var308
				elseif p23 == "ClickToMove" then
					if userInputService.PreferredInput == Enum.PreferredInput.Touch then
						return t_5.TAP_TO_MOVE
					end
					var308 = t_5.CLICK_TO_MOVE
					
					return var308
				elseif p23 == "DynamicThumbstick" then
					var308 = "Dynamic Thumbstick"
					
					return var308
				elseif p23 == "Thumbstick" then
					var308 = var53
				end
				return var308
			end
			
			local var269, var270, var271 = utilityModule:AddNewRow(gameSettingsTab, "Movement Mode", "Selector", t_11, 1)
			gameSettingsTab.MovementModeFrame = var269
			gameSettingsTab.MovementModeLabel = var270
			gameSettingsTab.MovementMode = var271
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
			
			local function setMovementMode(value) --[[ line: 1568 ]]
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
			
			var266 = function(p24) --[[ line: 1585 ]]
				-- upvalues: localPlayer (copy), gameSettingsTab (copy), t_8 (write)
				local var309
				local _ = nil
				
				if p24 then
					var309 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					var309 = nil
				else
					var309 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if gameSettingsTab.MovementMode then
					local var310 = var309 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var310
					gameSettingsTab.MovementMode:SetInteractable(var310)
					gameSettingsTab.MovementModeOverrideText.Visible = not var310
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var309
				end
			end
			
			local function updateMovementModes() --[[ line: 1597 ]]
				-- upvalues: userInputService (copy), playerScripts_1 (ref), t_8 (write), t_9 (write), t_6 (write), t_10 (write), gameSettingsTab (copy), robloxTranslatorModule (copy), constantsModule (copy), t_5 (copy), var53 (copy), gameSettings (copy), setMovementMode (ref), var266 (write)
				local var311 = userInputService.PreferredInput == Enum.PreferredInput.Touch
				
				if playerScripts_1 then
					t_8 = if var311 then playerScripts_1:GetRegisteredTouchMovementModes() else playerScripts_1:GetRegisteredComputerMovementModes()
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
					local var312 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var312
					gameSettingsTab.MovementMode:SetInteractable(var312)
					gameSettingsTab.MovementModeOverrideText.Visible = not var312
				end
				for i, v in t_8 do
					t_6[i] = v
					local var314 = t_10
					local name = v.Name
					local var315 = name
					
					if name == "Default" then
						var315 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then robloxTranslatorModule:FormatByKey(constantsModule.MovementModeDynamicThumbstickKey) else t_5.DEFAULT_KEYBOARD
					elseif name == "KeyboardMouse" then
						var315 = "Keyboard + Mouse"
					elseif name == "ClickToMove" then
						var315 = if userInputService.PreferredInput == Enum.PreferredInput.Touch then t_5.TAP_TO_MOVE else t_5.CLICK_TO_MOVE
					elseif name == "DynamicThumbstick" then
						var315 = "Dynamic Thumbstick"
					elseif name == "Thumbstick" then
						var315 = var53
					end
					var314[i] = var315
					t_9[v] = i
				end
				if gameSettingsTab.MovementMode then
					gameSettingsTab.MovementMode:UpdateOptions(t_10)
				end
				local var313 = if var311 then gameSettings.TouchMovementMode else gameSettings.ComputerMovementMode
				
				if var313 then
					setMovementMode(var313)
					gameSettingsTab.MovementMode:SetSelectionIndex(t_9[var313])
				end
				var266(var311)
			end
			
			updateMovementModes()
			
			if playerScripts_1 then
				playerScripts_1.TouchMovementModeRegistered:connect(function(_) --[[ line: 1641 ]]
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.TouchEnabled then
						updateMovementModes()
					end
				end)
				playerScripts_1.ComputerMovementModeRegistered:connect(function(_) --[[ line: 1647 ]]
					-- upvalues: userInputService (copy), updateMovementModes (ref)
					if userInputService.MouseEnabled then
						updateMovementModes()
					end
				end)
			end
			userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 1654 ]]
				-- upvalues: updateMovementModes (ref)
				updateMovementModes()
			end)
			gameSettingsTab.MovementMode.IndexChanged:connect(function(p25) --[[ line: 1658 ]]
				-- upvalues: setMovementMode (ref), t_6 (write), reportSettingsForAnalytics (copy)
				setMovementMode(t_6[p25])
				reportSettingsForAnalytics()
			end)
		end
		local var275
		local _ = false
		local var274 = userInputService.PreferredInput == Enum.PreferredInput.Touch
		
		if var274 then
			var275 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			var275 = nil
		else
			var275 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if var275 then
			gameSettingsTab.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			gameSettingsTab.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local var276
		local _ = false
		
		if var274 then
			var276 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
			var276 = nil
		else
			var276 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if gameSettingsTab.MovementModeOverrideText then
			if var276 then
				gameSettingsTab.MovementModeOverrideText.Visible = false
				
				if gameSettingsTab.MovementMode then
					local var277 = #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var277
					gameSettingsTab.MovementMode:SetInteractable(var277)
					gameSettingsTab.MovementModeOverrideText.Visible = not var277
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
		local var278 = not localPlayer.DevEnableMouseLock
		
		if gameSettingsTab.ShiftLockOverrideText then
			gameSettingsTab.ShiftLockOverrideText.Visible = var278
			local devEnableMouseLock = not var278 and localPlayer.DevEnableMouseLock
			
			if gameSettingsTab.ShiftLockMode then
				gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
				gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
			end
		end
		local function updateUserSettingsMenu(value) --[[ line: 1704 ]]
			-- upvalues: localPlayer (copy), gameSettingsTab (copy), var266 (write), t_8 (write)
			if value == "DevEnableMouseLock" then
				local var316 = not localPlayer.DevEnableMouseLock
				
				if gameSettingsTab.ShiftLockOverrideText then
					gameSettingsTab.ShiftLockOverrideText.Visible = var316
					local devEnableMouseLock = not var316 and localPlayer.DevEnableMouseLock
					
					if gameSettingsTab.ShiftLockMode then
						gameSettingsTab.ShiftLockMode.SelectorFrame.Visible = devEnableMouseLock
						gameSettingsTab.ShiftLockMode:SetInteractable(devEnableMouseLock)
						
						return
					end
				end
			elseif value == "DevComputerCameraMode" then
				local var318 = localPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
				setCameraModeVisible(var318)
				gameSettingsTab.CameraModeOverrideText.Visible = not var318
				
				return
			elseif value == "DevComputerMovementMode" then
				if var266 ~= nil then
					var266(false)
					
					return
				end
				local var319 = localPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var320 = var319 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var320
					gameSettingsTab.MovementMode:SetInteractable(var320)
					gameSettingsTab.MovementModeOverrideText.Visible = not var320
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var319
					
					return
				end
			elseif value == "DevTouchMovementMode" then
				if var266 ~= nil then
					var266(true)
					
					return
				end
				local var321 = localPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				
				if gameSettingsTab.MovementMode then
					local var322 = var321 and #t_8 > 0
					gameSettingsTab.MovementMode.SelectorFrame.Visible = var322
					gameSettingsTab.MovementMode:SetInteractable(var322)
					gameSettingsTab.MovementModeOverrideText.Visible = not var322
				end
				if gameSettingsTab.MovementModeOverrideText then
					gameSettingsTab.MovementModeOverrideText.Visible = not var321
					
					return
				end
			elseif value == "DevTouchCameraMode" then
				local var323 = localPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
				setCameraModeVisible(var323)
				gameSettingsTab.CameraModeOverrideText.Visible = not var323
			end
		end
		
		localPlayer.Changed:connect(function(p26) --[[ line: 1739 ]]
			-- upvalues: t_2 (copy), updateUserSettingsMenu (ref), t_1 (copy)
			if t_2[p26] then
				updateUserSettingsMenu(p26)
			end
			if t_1[p26] then
				updateUserSettingsMenu(p26)
			end
		end)
	end
	
	local function createFeedbackModeOptions() --[[ line: 1752 ]]
		-- upvalues: url (copy), httpService (copy), feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (ref), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var55 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), disableFeedbackSoothsayerCheck (copy), name (copy)
		local text = url.ROLES_URL .. "v1/users/authenticated/roles"
		local var325 = httpService:RequestInternal({ Method = "GET", Url = text })
		
		local function rolesCheckCallback(p27) --[[ line: 1759 ]]
			-- upvalues: feedbackEntryPointImprovedStrictnessCheck (copy), gameSettingsTab (copy), safetyService (copy), var17 (copy), reportSettingsChangeForAnalytics (copy), feedbackEntryPointButtonSizeAdjustment2 (copy), utilityModule (copy), var55 (copy), robloxTranslatorModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p27 then
				if not feedbackEntryPointImprovedStrictnessCheck and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not gameSettingsTab.FeedbackEntryPointEnabled then return end
				local var330, var331
				local function onToggleFeedbackMode() --[[ line: 1771 ]]
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
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var55, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var330 = toggleFeedbackModeButton
					var331 = toggleFeedbackModeButton_1
					var330.Size = UDim2.new(0.6, 0, 0, 40)
					var330.Position = UDim2.new(0.4, 0, 0.5, 0)
					var330.AnchorPoint = Vector2.new(0, 0.5)
				else
					local toggleFeedbackModeButton, toggleFeedbackModeButton_1 = utilityModule:MakeStyledButton("toggleFeedbackModeButton", var55, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, gameSettingsTab)
					var330 = toggleFeedbackModeButton
					var331 = toggleFeedbackModeButton_1
					var330.Size = UDim2.new(0, 300, 0, 30)
					var330.Position = UDim2.new(0.4, 0, 0.5, 0)
					var330.AnchorPoint = Vector2.new(0, 0.5)
				end
				var330.ZIndex = 2
				var330.Selectable = true
				var331.ZIndex = 2
				
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					gameSettingsTab.toggleFeedbackModeButton = var330
					gameSettingsTab.toggleFeedbackModeText = var331
				end
				if feedbackEntryPointButtonSizeAdjustment2 then
					utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var330, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
					
					return
				end
				utilityModule:AddNewRowObject(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), var330).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end
		
		if disableFeedbackSoothsayerCheck then
			rolesCheckCallback(true)
			
			return
		end
		var325:Start(function(p28, p29) --[[ line: 1855 ]]
			-- upvalues: httpService (copy), name (copy), text (ref), rolesCheckCallback (ref)
			local var336
			local var334 = false
			local var335 = false
			local _ = nil
			
			if not p28 then
				var336 = "Roles Api Request: Connection error"
			elseif p29.StatusCode == 401 then
				var336 = "Roles Api Request: Unauthorized"
			elseif p29.StatusCode < 200 or p29.StatusCode >= 400 then
				var336 = "Roles Api Status code: " .. p29.StatusCode
			else
				local ok, status = pcall(function() --[[ line: 1867 ]]
					-- upvalues: httpService (copy), p29 (ref), var334 (write)
					for i, v in pairs(httpService:JSONDecode(p29.Body).roles) do
						if v == "Soothsayer" then
							var334 = true
						end
					end
				end)
				var335 = ok
				var336 = status
			end
			if not var335 then
				name:warning("Feedback Mode initialization api call failed with url: " .. text .. " and with error message: " .. var336)
			end
			rolesCheckCallback(var334)
		end)
	end
	
	local function createTranslationOptions() --[[ line: 1895 ]]
		-- upvalues: playersService (copy), url (copy), httpService (copy), name (copy), gameSettingsTab (ref), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), localPlayer (copy), reportSettingsChangeForAnalytics (copy), runService (copy)
		local var337 = 1
		local var338 = 1
		local var339 = false
		local var340 = nil
		local var341 = nil
		local localeId = playersService.LocalPlayer.LocaleId
		local var342 = nil
		local var343 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local text = url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", playersService.LocalPlayer.LocaleId:gsub("-", "_"))
		local var350 = httpService:RequestInternal({ Method = "GET", Url = text })
		local text_1 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local var352 = httpService:RequestInternal({ Method = "GET", Url = text_1 })
		local text_2 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local var354 = httpService:RequestInternal({ Method = "GET", Url = text_2 })
		local text_3 = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local var356 = httpService:RequestInternal({ Method = "GET", Url = text_3 })
		
		local function userExperienceLanguageSettingsCallback(value, p30) --[[ line: 1960 ]]
			-- upvalues: name (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_4 (ref), t_2 (ref), var340 (write), t (ref), var343 (write), t_1 (ref), var337 (write), var338 (write), localPlayer (copy), var341 (write), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var339 (write), runService (copy)
			if value then
				local var361 = false
				table.insert(t_4, t_2[var340].languageName .. " (Original)")
				
				for i, v in pairs(t) do
					if v == var343 then
						var361 = true
					end
					if v ~= var340 then
						table.insert(t_4, t_2[v].languageName)
					end
				end
				if var361 == true then
					for i_1, v_1 in pairs(t_4) do
						if i_1 ~= 1 and t_1[v_1] == var343 then
							var337 = i_1
							var338 = i_1
						end
					end
				end
				local var362, var363, var364 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t_4, var337)
				gameSettingsTab.LanguageSelectorFrame = var362
				gameSettingsTab.LanguageSelectorLabel = var363
				gameSettingsTab.LanguageSelectorMode = var364
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				
				if var337 == 1 then
					localPlayer:SetExperienceSettingsLocaleId(var341)
				else
					localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[var337]]].localeCode)
				end
				gameSettingsTab.LanguageSelectorMode.CurrentLanguage = gameSettingsTab.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				gameSettingsTab.LanguageSelectorMode.IndexChanged:connect(function(p31) --[[ line: 2040 | named "toggleTranslation" ]]
					-- upvalues: gameSettingsTab (copy), t_2 (copy), var340 (copy), t_1 (copy), t_4 (copy), reportSettingsChangeForAnalytics (copy), url (copy), httpService (copy), var338 (copy), localPlayer (copy), var341 (copy), name (copy), var339 (copy), runService (copy)
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					local var365 = if p31 == 1 then t_2[var340].id else t_2[t_1[t_4[p31]]].id
					local currentLanguage = gameSettingsTab.LanguageSelectorMode.CurrentLanguage
					local var366 = t_4[p31]
					
					if currentLanguage ~= var366 then
						gameSettingsTab.LanguageSelectorMode.CurrentLanguage = var366
						reportSettingsChangeForAnalytics("experience_language", currentLanguage, var366)
					end
					local text = url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local var368 = httpService:RequestInternal({
						Method = "POST",
						Url = text,
						Headers = { ["Content-Type"] = "application/json" },
						Body = httpService:JSONEncode({
							settingValue = { settingType = "LanguageFamily", settingTargetId = var365 }
						})
					})
					
					local function callback(p32, p33) --[[ line: 2087 ]]
						-- upvalues: var338 (copy), p31 (ref), localPlayer (copy), var341 (copy), t_1 (copy), t_4 (copy), t_2 (copy), name (copy), var339 (copy), gameSettingsTab (copy)
						if p32 then
							var338 = p31
							
							if p31 == 1 then
								localPlayer:SetExperienceSettingsLocaleId(var341)
							else
								localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p31]]].localeCode)
							end
						else
							name:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p33)
							var339 = true
							gameSettingsTab.LanguageSelectorMode:SetSelectionIndex(var338)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
					end
					
					if runService:IsStudio() then
						var338 = p31
						
						if p31 == 1 then
							localPlayer:SetExperienceSettingsLocaleId(var341)
						else
							localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p31]]].localeCode)
						end
						gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
						
						return
					elseif not var339 then
						var368:Start(function(p34, p35) --[[ line: 2130 ]]
							-- upvalues: name (copy), text (ref), callback (ref)
							local var370 = false
							local text_1 = nil
							
							if not p34 then
								text_1 = "User Experience Language Settings Update Request: Connection error"
							elseif p35.StatusCode == 401 then
								text_1 = "User Experience Language Settings Update Request: Unauthorized"
							elseif p35.StatusCode < 200 or p35.StatusCode >= 400 then
								text_1 = "User Experience Language Settings Update Request Status Code: " .. p35.StatusCode
							else
								name:info("User Experience Language Settings Update Request succeeded with code: " .. p35.StatusCode)
								var370 = true
							end
							if not var370 then
								name:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. text .. " with error message: " .. text_1)
							end
							callback(var370, text_1)
						end)
						
						return
					end
					var339 = false
					var338 = p31
					
					if p31 == 1 then
						localPlayer:SetExperienceSettingsLocaleId(var341)
					else
						localPlayer:SetExperienceSettingsLocaleId(t_2[t_1[t_4[p31]]].localeCode)
					end
					gameSettingsTab.LanguageSelectorMode:SetInteractable(true)
				end)
				
				return
			elseif p30 == nil then
				p30 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p30)
			local var358, var359, var360 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var358
			gameSettingsTab.LanguageSelectorLabel = var359
			gameSettingsTab.LanguageSelectorMode = var360
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local function _(p36, p37) --[[ line: 2165 | named "experienceSupportedLanguagesCallback" ]]
			-- upvalues: var356 (ref), httpService (copy), var343 (write), var342 (write), var340 (write), t_3 (ref), name (copy), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p36 then
				var356:Start(function(p38, p39) --[[ line: 2167 ]]
					-- upvalues: httpService (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
					local var377
					local var376 = false
					local _ = nil
					
					if not p38 then
						var377 = "User Experience Language Setting Request: Connection error"
					elseif p39.StatusCode == 401 then
						var377 = "User Experience Language Setting Request: Unauthorized"
					elseif p39.StatusCode < 200 or p39.StatusCode >= 400 then
						var377 = "User Experience Language Setting Request Status code: " .. p39.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2178 ]]
							-- upvalues: httpService (copy), p39 (ref), var343 (copy), var342 (copy), var340 (copy), t_3 (copy)
							local userUniverseLocalizationSettingValue = httpService:JSONDecode(p39.Body).userUniverseLocalizationSettingValue
							
							if userUniverseLocalizationSettingValue == nil then
								var343 = var342
								
								return
							elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
								var343 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var340 else var342
							end
							if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
								if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
									var343 = var342
									
									return
								end
								var343 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
							end
						end)
						var376 = ok
						var377 = status
					end
					if not var376 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var377)
					end
					userExperienceLanguageSettingsCallback(var376, var377)
				end)
				
				return
			end
			local var372 = p37
			
			if var372 == nil then
				var372 = "Execution path did not set earliest error to non-nil value."
			end
			name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var372)
			local var373, var374, var375 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
			gameSettingsTab.LanguageSelectorFrame = var373
			gameSettingsTab.LanguageSelectorLabel = var374
			gameSettingsTab.LanguageSelectorMode = var375
			gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
			gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
		end
		
		local _ = function(p40, p41) --[[ line: 2227 | named "experienceSourceLanguageCallback" ]]
			-- upvalues: var354 (ref), httpService (copy), t (ref), name (copy), text_2 (ref), var356 (ref), var343 (write), var342 (write), var340 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p40 then
				var354:Start(function(p42, p43) --[[ line: 2229 ]]
					-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p41 (write), p40 (ref), var356 (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var383
					local var382 = false
					local _ = nil
					
					if not p42 then
						var383 = "Experience Supported Language Request: Connection error"
					elseif p43.StatusCode == 401 then
						var383 = "Experience Supported Language Request: Unauthorized"
					elseif p43.StatusCode < 200 or p43.StatusCode >= 400 then
						var383 = "Experience Supported Language Request Status code: " .. p43.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2239 ]]
							-- upvalues: httpService (copy), p43 (ref), t (copy)
							for i, v in pairs(httpService:JSONDecode(p43.Body).data) do
								t[i] = v.languageCode
							end
						end)
						var382 = ok
						var383 = status
					end
					if not var382 then
						name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var383)
					end
					if p41 == nil then
						p41 = var383
					end
					local var384 = p41
					
					if var382 and p40 then
						var356:Start(function(p44, p45) --[[ line: 2167 ]]
							-- upvalues: httpService (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
							local var377
							local var376 = false
							local _ = nil
							
							if not p44 then
								var377 = "User Experience Language Setting Request: Connection error"
							elseif p45.StatusCode == 401 then
								var377 = "User Experience Language Setting Request: Unauthorized"
							elseif p45.StatusCode < 200 or p45.StatusCode >= 400 then
								var377 = "User Experience Language Setting Request Status code: " .. p45.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2178 ]]
									-- upvalues: httpService (copy), p45 (ref), var343 (copy), var342 (copy), var340 (copy), t_3 (copy)
									local userUniverseLocalizationSettingValue = httpService:JSONDecode(p45.Body).userUniverseLocalizationSettingValue
									
									if userUniverseLocalizationSettingValue == nil then
										var343 = var342
										
										return
									elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
										var343 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var340 else var342
									end
									if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
										if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
											var343 = var342
											
											return
										end
										var343 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
									end
								end)
								var376 = ok
								var377 = status
							end
							if not var376 then
								name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var377)
							end
							userExperienceLanguageSettingsCallback(var376, var377)
						end)
						
						return
					end
					local var385 = var384
					
					if var385 == nil then
						var385 = "Execution path did not set earliest error to non-nil value."
					end
					name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var385)
					local var386, var387, var388 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
					gameSettingsTab.LanguageSelectorFrame = var386
					gameSettingsTab.LanguageSelectorLabel = var387
					gameSettingsTab.LanguageSelectorMode = var388
					gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
					gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
				end)
			else
				local var378 = p41
				
				if var378 == nil then
					var378 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var378)
				local var379, var380, var381 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var379
				gameSettingsTab.LanguageSelectorLabel = var380
				gameSettingsTab.LanguageSelectorMode = var381
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		local _ = function(p46, p47) --[[ line: 2268 | named "localeCodeToLanguageCodeMappingCallback" ]]
			-- upvalues: var352 (ref), httpService (copy), var340 (write), var341 (write), t_2 (ref), name (copy), text_1 (ref), var354 (ref), t (ref), text_2 (ref), var356 (ref), var343 (write), var342 (write), t_3 (ref), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p46 then
				var352:Start(function(p48, p49) --[[ line: 2270 ]]
					-- upvalues: httpService (copy), var340 (copy), var341 (copy), t_2 (copy), name (copy), text_1 (copy), p47 (write), p46 (ref), var354 (copy), t (copy), text_2 (copy), var356 (copy), var343 (copy), var342 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var394
					local var393 = false
					local _ = nil
					
					if not p48 then
						var394 = "Experience Source Language Request: Connection error"
					elseif p49.StatusCode == 401 then
						var394 = "Experience Source Language Request: Unauthorized"
					elseif p49.StatusCode < 200 or p49.StatusCode >= 400 then
						var394 = "Experience Source Language Status code: " .. p49.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2281 ]]
							-- upvalues: httpService (copy), p49 (ref), var340 (copy), var341 (copy), t_2 (copy)
							var340 = httpService:JSONDecode(p49.Body).languageCode
							var341 = t_2[var340].localeCode
						end)
						var393 = ok
						var394 = status
					end
					if not var393 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var394)
					end
					if p47 == nil then
						p47 = var394
					end
					local p46_1 = var393 and p46
					local var396 = p47
					
					if p46_1 then
						var354:Start(function(p50, p51) --[[ line: 2229 ]]
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), var396 (write), p46_1 (ref), var356 (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var383
							local var382 = false
							local _ = nil
							
							if not p50 then
								var383 = "Experience Supported Language Request: Connection error"
							elseif p51.StatusCode == 401 then
								var383 = "Experience Supported Language Request: Unauthorized"
							elseif p51.StatusCode < 200 or p51.StatusCode >= 400 then
								var383 = "Experience Supported Language Request Status code: " .. p51.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2239 ]]
									-- upvalues: httpService (copy), p51 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p51.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var382 = ok
								var383 = status
							end
							if not var382 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var383)
							end
							if p41 == nil then
								p41 = var383
							end
							if var382 and p46_1 then
								var356:Start(function(p52, p53) --[[ line: 2167 ]]
									-- upvalues: httpService (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var377
									local var376 = false
									local _ = nil
									
									if not p52 then
										var377 = "User Experience Language Setting Request: Connection error"
									elseif p53.StatusCode == 401 then
										var377 = "User Experience Language Setting Request: Unauthorized"
									elseif p53.StatusCode < 200 or p53.StatusCode >= 400 then
										var377 = "User Experience Language Setting Request Status code: " .. p53.StatusCode
									else
										local ok, status = pcall(function() --[[ line: 2178 ]]
											-- upvalues: httpService (copy), p53 (ref), var343 (copy), var342 (copy), var340 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p53.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var343 = var342
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var343 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var340 else var342
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var343 = var342
													
													return
												end
												var343 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var376 = ok
										var377 = status
									end
									if not var376 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var377)
									end
									userExperienceLanguageSettingsCallback(var376, var377)
								end)
								
								return
							end
							local var385 = p41
							
							if var385 == nil then
								var385 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var385)
							local var386, var387, var388 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var386
							gameSettingsTab.LanguageSelectorLabel = var387
							gameSettingsTab.LanguageSelectorMode = var388
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var397 = var396
						
						if var397 == nil then
							var397 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var397)
						local var398, var399, var400 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var398
						gameSettingsTab.LanguageSelectorLabel = var399
						gameSettingsTab.LanguageSelectorMode = var400
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var389 = p47
				
				if var389 == nil then
					var389 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var389)
				local var390, var391, var392 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var390
				gameSettingsTab.LanguageSelectorLabel = var391
				gameSettingsTab.LanguageSelectorMode = var392
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end
		
		var350:Start(function(p54, p55) --[[ line: 2312 ]]
			-- upvalues: httpService (copy), t_2 (ref), t_3 (ref), t_1 (ref), localeId (ref), var342 (write), name (copy), text (ref), var352 (ref), var340 (write), var341 (write), text_1 (ref), var354 (ref), t (ref), text_2 (ref), var356 (ref), var343 (write), text_3 (ref), userExperienceLanguageSettingsCallback (ref), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local var402
			local var401 = false
			local _ = nil
			
			if not p54 then
				var402 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p55.StatusCode == 401 then
				var402 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p55.StatusCode < 200 or p55.StatusCode >= 400 then
				var402 = "Locale Code to Language Code Mapping Request Status code: " .. p55.StatusCode
			else
				local ok, status = pcall(function() --[[ line: 2323 ]]
					-- upvalues: httpService (copy), p55 (ref), t_2 (copy), t_3 (copy), t_1 (copy), localeId (copy), var342 (copy)
					for i, v in pairs(httpService:JSONDecode(p55.Body).data) do
						local languageCode = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id
						t_2[languageCode] = { localeCode = locale, languageName = name, id = id }
						t_3[id] = languageCode
						t_1[name] = languageCode
						
						if v.locale.locale == localeId:gsub("-", "_") then
							var342 = v.locale.language.languageCode
						end
					end
				end)
				var401 = ok
				var402 = status
			end
			if not var401 then
				name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text .. " with error message: " .. var402)
			end
			local var403 = var402
			
			if var401 then
				var352:Start(function(p56, p57) --[[ line: 2270 ]]
					-- upvalues: httpService (copy), var340 (copy), var341 (copy), t_2 (copy), name (copy), text_1 (copy), var403 (write), var401 (ref), var354 (copy), t (copy), text_2 (copy), var356 (copy), var343 (copy), var342 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local var394
					local var393 = false
					local _ = nil
					
					if not p56 then
						var394 = "Experience Source Language Request: Connection error"
					elseif p57.StatusCode == 401 then
						var394 = "Experience Source Language Request: Unauthorized"
					elseif p57.StatusCode < 200 or p57.StatusCode >= 400 then
						var394 = "Experience Source Language Status code: " .. p57.StatusCode
					else
						local ok, status = pcall(function() --[[ line: 2281 ]]
							-- upvalues: httpService (copy), p57 (ref), var340 (copy), var341 (copy), t_2 (copy)
							var340 = httpService:JSONDecode(p57.Body).languageCode
							var341 = t_2[var340].localeCode
						end)
						var393 = ok
						var394 = status
					end
					if not var393 then
						name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_1 .. " with error message: " .. var394)
					end
					if p47 == nil then
						p47 = var394
					end
					local p46_1 = var393 and var401
					
					if p46_1 then
						var354:Start(function(p58, p59) --[[ line: 2229 ]]
							-- upvalues: httpService (copy), t (copy), name (copy), text_2 (copy), p47 (write), p46_1 (ref), var356 (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy), gameSettingsTab (copy), utilityModule (copy), robloxTranslatorModule (copy), var54 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local var383
							local var382 = false
							local _ = nil
							
							if not p58 then
								var383 = "Experience Supported Language Request: Connection error"
							elseif p59.StatusCode == 401 then
								var383 = "Experience Supported Language Request: Unauthorized"
							elseif p59.StatusCode < 200 or p59.StatusCode >= 400 then
								var383 = "Experience Supported Language Request Status code: " .. p59.StatusCode
							else
								local ok, status = pcall(function() --[[ line: 2239 ]]
									-- upvalues: httpService (copy), p59 (ref), t (copy)
									for i, v in pairs(httpService:JSONDecode(p59.Body).data) do
										t[i] = v.languageCode
									end
								end)
								var382 = ok
								var383 = status
							end
							if not var382 then
								name:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. text_2 .. " with error message: " .. var383)
							end
							if p41 == nil then
								p41 = var383
							end
							if var382 and p46_1 then
								var356:Start(function(p60, p61) --[[ line: 2167 ]]
									-- upvalues: httpService (copy), var343 (copy), var342 (copy), var340 (copy), t_3 (copy), name (copy), text_3 (copy), userExperienceLanguageSettingsCallback (copy)
									local var377
									local var376 = false
									local _ = nil
									
									if not p60 then
										var377 = "User Experience Language Setting Request: Connection error"
									elseif p61.StatusCode == 401 then
										var377 = "User Experience Language Setting Request: Unauthorized"
									elseif p61.StatusCode < 200 or p61.StatusCode >= 400 then
										var377 = "User Experience Language Setting Request Status code: " .. p61.StatusCode
									else
										local ok, status = pcall(function() --[[ line: 2178 ]]
											-- upvalues: httpService (copy), p61 (ref), var343 (copy), var342 (copy), var340 (copy), t_3 (copy)
											local userUniverseLocalizationSettingValue = httpService:JSONDecode(p61.Body).userUniverseLocalizationSettingValue
											
											if userUniverseLocalizationSettingValue == nil then
												var343 = var342
												
												return
											elseif userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												var343 = if userUniverseLocalizationSettingValue.settingTargetId == 1 then var340 else var342
											end
											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t_3[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													var343 = var342
													
													return
												end
												var343 = t_3[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
										var376 = ok
										var377 = status
									end
									if not var376 then
										name:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. text_3 .. " with error message: " .. var377)
									end
									userExperienceLanguageSettingsCallback(var376, var377)
								end)
								
								return
							end
							local var385 = p41
							
							if var385 == nil then
								var385 = "Execution path did not set earliest error to non-nil value."
							end
							name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var385)
							local var386, var387, var388 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
							gameSettingsTab.LanguageSelectorFrame = var386
							gameSettingsTab.LanguageSelectorLabel = var387
							gameSettingsTab.LanguageSelectorMode = var388
							gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
							gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local var397 = p47
						
						if var397 == nil then
							var397 = "Execution path did not set earliest error to non-nil value."
						end
						name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var397)
						local var398, var399, var400 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
						gameSettingsTab.LanguageSelectorFrame = var398
						gameSettingsTab.LanguageSelectorLabel = var399
						gameSettingsTab.LanguageSelectorMode = var400
						gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
						gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local var404 = var403
				
				if var404 == nil then
					var404 = "Execution path did not set earliest error to non-nil value."
				end
				name:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. var404)
				local var405, var406, var407 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { var54 }, 1)
				gameSettingsTab.LanguageSelectorFrame = var405
				gameSettingsTab.LanguageSelectorLabel = var406
				gameSettingsTab.LanguageSelectorMode = var407
				gameSettingsTab.LanguageSelectorMode:SetInteractable(false)
				gameSettingsTab.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end)
	end
	
	local function getChatTranslationLayerData(p62) --[[ line: 2362 ]]
		-- upvalues: getFFlagChatTranslationWaitForIXPModule (copy), IXPServiceWrapper (copy), getFFlagChatTranslationNewDefaultsModule (copy)
		local t = {
			ChatTranslationEnabled = false,
			ChatTranslationToggleEnabled = false
		}
		
		if not p62 or p62 == "" then
			return t
		elseif p62 == "override" then
			t.ChatTranslationEnabled = true
			
			return t
		elseif getFFlagChatTranslationWaitForIXPModule() then
			IXPServiceWrapper:WaitForInitialization()
		end
		local ok, status = pcall(function() --[[ line: 2384 ]]
			-- upvalues: IXPServiceWrapper (copy), p62 (ref)
			return IXPServiceWrapper:GetLayerData(p62)
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
	
	local function createVolumeOptions() --[[ line: 2402 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var409, var410, var411 = utilityModule:AddNewRow(gameSettingsTab, "Volume", "Slider", 10, math.floor(gameSettings.MasterVolume * 10))
		gameSettingsTab.VolumeFrame = var409
		gameSettingsTab.VolumeLabel = var410
		gameSettingsTab.VolumeSlider = var411
		gameSettingsTab.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame
		local volumeChangeSound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		volumeChangeSound.Name = "VolumeChangeSound"
		volumeChangeSound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		gameSettingsTab.VolumeSlider.ValueChanged:connect(function(p63) --[[ line: 2413 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), volumeChangeSound (ref), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var413 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then math.floor(gameSettings.MasterVolume * 10 + 0.5) else nil
			local var414 = p63 / 10
			volumeChangeSound.Volume = var414
			volumeChangeSound:Play()
			gameSettings.MasterVolume = var414
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("volume", var413, math.floor(gameSettings.MasterVolume * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createPartyVoiceVolumeOptions() --[[ line: 2431 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default_3 (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local floored = math.floor(gameSettings.PartyVoiceVolume * 10)
		local var416, var417, var418 = utilityModule:AddNewRow(gameSettingsTab, "Party Voice Volume", "Slider", 10, floored)
		gameSettingsTab.PartyVoiceVolumeFrame = var416
		gameSettingsTab.PartyVoiceVolumeLabel = var417
		gameSettingsTab.PartyVoiceVolumeSlider = var418
		gameSettingsTab.PartyVoiceVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PartyVoiceVolumeFrame
		
		if getFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty() then
			gameSettingsTab.PartyVoiceVolumeFrame.Visible = default_3.hasExperienceStarted
			default_3.ExperienceJoined.Event:Connect(function() --[[ line: 2440 ]]
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = true
			end)
			default_3.ExperienceLeft.Event:Connect(function() --[[ line: 2443 ]]
				-- upvalues: gameSettingsTab (copy)
				gameSettingsTab.PartyVoiceVolumeFrame.Visible = false
			end)
		end
		gameSettingsTab.PartyVoiceVolumeSlider.ValueChanged:connect(function(p64) --[[ line: 2448 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), floored (ref), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var419 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then if floored ~= nil then 0 else math.floor(floored * 10 + 0.5) else nil
			gameSettings.PartyVoiceVolume = p64 / 10
			
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("party_voice_volume", var419, math.floor(p64 * 10 + 0.5))
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function createHapticsToggle() --[[ line: 2464 ]]
		-- upvalues: gameSettings (copy), getAppFeaturePolicies (copy), var20 (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var420, var421, var422 = utilityModule:AddNewRow(gameSettingsTab, if getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() then var20:Format("CoreScripts.InGameMenu.Vibration") else "Haptics", "Selector", { "Off", "On" }, if gameSettings.HapticStrength == 0 then 1 else 2)
		gameSettingsTab.HapticsFrame = var420
		_ = var421
		gameSettingsTab.HapticsSelector = var422
		gameSettingsTab.HapticsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.HapticsFrame
		gameSettingsTab.HapticsSelector.IndexChanged:connect(function(p65) --[[ line: 2473 ]]
			-- upvalues: gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local hapticStrength = gameSettings.HapticStrength
			
			if p65 == 2 then
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
	
	local function createCameraInvertedOptions() --[[ line: 2489 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var423 = 1
		
		if pcall(function() --[[ line: 2491 ]]
			-- upvalues: gameSettings (copy), var423 (write)
			if gameSettings.CameraYInverted == true then
				var423 = 2
			end
		end) == false then
			return
		end
		local var424, var425, var426 = utilityModule:AddNewRow(gameSettingsTab, "Camera Inverted", "Selector", { "Off", "On" }, var423)
		gameSettingsTab.CameraInvertedFrame = var424
		_ = var425
		gameSettingsTab.CameraInvertedSelector = var426
		gameSettingsTab.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t_7[gameSettingsTab.CameraInvertedFrame] = true
		gameSettingsTab.CameraInvertedSelector.IndexChanged:connect(function(p66) --[[ line: 2506 ]]
			-- upvalues: getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), gameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local var427 = if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then gameSettings.CameraYInverted else nil
			
			if p66 == 2 then
				gameSettings.CameraYInverted = true
			else
				gameSettings.CameraYInverted = false
			end
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				reportSettingsChangeForAnalytics("camera_y_inverted", var427, gameSettings.CameraYInverted)
			end
			reportSettingsForAnalytics()
		end)
	end
	
	local function setCameraSensitivity(value) --[[ line: 2525 ]]
		-- upvalues: userInputService (copy), gameSettings (copy), getFFlagEnableExplicitSettingsChangeAnalyticsModule (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local var428 = nil
		local x = nil
		
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var428 = "gamepad"
				x = gameSettings.GamepadCameraSensitivity
			end
			gameSettings.GamepadCameraSensitivity = value
		end
		if userInputService.MouseEnabled then
			if getFFlagEnableExplicitSettingsChangeAnalyticsModule() then
				var428 = "mouse"
				x = gameSettings.MouseSensitivityFirstPerson.X
			end
			local vector2 = Vector2.new(value, value)
			gameSettings.MouseSensitivityFirstPerson = vector2
			gameSettings.MouseSensitivityThirdPerson = vector2
		end
		if getFFlagEnableExplicitSettingsChangeAnalyticsModule() and typeof(x) == "number" and typeof(value) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", x)), tonumber(string.format("%.2f", value)), { sensitivity_type = var428 })
		end
		reportSettingsForAnalytics()
	end
	
	local function createMouseOptions() --[[ line: 2563 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t_7 (ref), create (copy), themeModule (copy), setCameraSensitivity (ref)
		local function _(p67) --[[ line: 2568 | named "translateEngineMouseSensitivityToGui" ]]
			return if p67 <= 0.2 then 0 else p67 <= 1 and math.floor((p67 - 0.2) / 0.16 + 0.5) or math.floor((p67 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p68) --[[ line: 2576 | named "translateGuiMouseSensitivityToEngine" ]]
			local var436 = if p68 <= 5 then 0.16 * p68 + 0.2 else 0.6 * p68 - 2
			
			return if var436 <= 0.2 then 0.2 else var436
		end
		
		local mouseSensitivity = gameSettings.MouseSensitivity
		local var430 = if mouseSensitivity <= 0.2 then 0 else mouseSensitivity <= 1 and math.floor((mouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((mouseSensitivity + 2) / 0.6 + 0.5)
		local var431 = true
		local _ = tostring(gameSettings.MouseSensitivityFirstPerson.X)
		local var432, var433, var434 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, var430)
		gameSettingsTab.MouseAdvancedFrame = var432
		gameSettingsTab.MouseAdvancedLabel = var433
		gameSettingsTab.MouseAdvancedEntry = var434
		gameSettingsTab.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
		t_7[gameSettingsTab.MouseAdvancedFrame] = true
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, gameSettingsTab.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		gameSettingsTab.MouseAdvancedLabel.ZIndex = 2
		gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
		local var435 = create("TextBox")({
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
			Parent = var435
		})
		
		local _ = function(value) --[[ line: 2635 | named "setMouseSensitivityText" ]]
			-- upvalues: var435 (ref)
			var435.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
		end
		
		var435.Text = tostring(tonumber(string.format("%.3f", math.floor(gameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000)))
		local x = gameSettings.MouseSensitivityFirstPerson.X
		gameSettingsTab.MouseAdvancedEntry:SetValue(if x <= 0.2 then 0 else x <= 1 and math.floor((x - 0.2) / 0.16 + 0.5) or math.floor((x + 2) / 0.6 + 0.5))
		
		function clampMouseSensitivity(value) --[[ line: 2650 ]]
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
		
		function setMouseSensitivity(value, p69) --[[ line: 2668 ]]
			-- upvalues: var431 (write), setCameraSensitivity (copy), gameSettingsTab (copy), var435 (ref)
			if not var431 then return end
			setCameraSensitivity(value)
			var431 = false
			
			if p69 ~= gameSettingsTab.MouseAdvancedEntry then
				gameSettingsTab.MouseAdvancedEntry:SetValue(if value <= 0.2 then 0 else value <= 1 and math.floor((value - 0.2) / 0.16 + 0.5) or math.floor((value + 2) / 0.6 + 0.5))
			end
			var435.Text = tostring(tonumber(string.format("%.3f", math.floor(value * 1000 + 0.5) / 1000)))
			var431 = true
		end
		
		var435.FocusLost:connect(function() --[[ line: 2686 ]]
			-- upvalues: gameSettingsTab (copy), var435 (ref), gameSettings (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(true)
			local var437 = tonumber(string.match(var435.Text, "([%d%.]+)"))
			
			if var437 then
				setMouseSensitivity(clampMouseSensitivity(var437), var435)
				
				return
			end
			setMouseSensitivity(gameSettings.MouseSensitivityFirstPerson.X, var435)
		end)
		var435.Focused:connect(function() --[[ line: 2698 ]]
			-- upvalues: gameSettingsTab (copy)
			gameSettingsTab.MouseAdvancedEntry:SetInteractable(false)
		end)
		gameSettingsTab.MouseAdvancedEntry.ValueChanged:connect(function(p70) --[[ line: 2702 ]]
			-- upvalues: gameSettingsTab (copy)
			local var438 = clampMouseSensitivity(p70)
			local var439 = if var438 <= 5 then 0.16 * var438 + 0.2 else 0.6 * var438 - 2
			setMouseSensitivity(if var439 <= 0.2 then 0.2 else var439, gameSettingsTab.MouseAdvancedEntry)
		end)
	end
	
	local function createGamepadOptions() --[[ line: 2709 ]]
		-- upvalues: gameSettings (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (ref)
		local function _(p71) --[[ line: 2714 | named "translateEngineGamepadSensitivityToGui" ]]
			return if p71 <= 0.2 then 0 else p71 <= 1 and math.floor((p71 - 0.2) / 0.16 + 0.5) or math.floor((p71 + 2) / 0.6 + 0.5)
		end
		
		local _ = function(p72) --[[ line: 2721 | named "translateGuiGamepadSensitivityToEngine" ]]
			local var443 = if p72 <= 5 then 0.16 * p72 + 0.2 else 0.6 * p72 - 2
			
			return if var443 <= 0.2 then 0.2 else var443
		end
		
		local gamepadCameraSensitivity = gameSettings.GamepadCameraSensitivity
		local var440, var441, var442 = utilityModule:AddNewRow(gameSettingsTab, "Camera Sensitivity", "Slider", 10, if gamepadCameraSensitivity <= 0.2 then 0 else gamepadCameraSensitivity <= 1 and math.floor((gamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((gamepadCameraSensitivity + 2) / 0.6 + 0.5))
		gameSettingsTab.GamepadSensitivityFrame = var440
		gameSettingsTab.GamepadSensitivityLabel = var441
		gameSettingsTab.GamepadSensitivitySlider = var442
		gameSettingsTab.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		gameSettingsTab.GamepadSensitivitySlider.ValueChanged:connect(function(p73) --[[ line: 2736 ]]
			-- upvalues: setCameraSensitivity (copy)
			local var444 = if p73 <= 5 then 0.16 * p73 + 0.2 else 0.6 * p73 - 2
			setCameraSensitivity(if var444 <= 0.2 then 0.2 else var444)
		end)
	end
	
	local function createOverscanOption() --[[ line: 2741 ]]
		-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), runService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
		local adjustButton, adjustButton_1, adjustButton_2 = utilityModule:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function() --[[ line: 2742 ]]
			-- upvalues: robloxGui (copy), corePackagesService (copy), contextActionService (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			local _ = nil
			local var450 = require(robloxGui.Modules.Settings.Components.OverscanWrapper)(require(robloxGui.Modules.Shell.Components.Overscan10ft.Overscan))
			local roactModule = require(corePackagesService.Packages.Roact)
			local var452 = nil
			local t = {
				onUnmount = function() --[[ line: 2753 ]]
					-- upvalues: var452 (write), roactModule (ref), contextActionService (copy), settingsHubModule (ref)
					if var452 then
						roactModule.unmount(var452)
						contextActionService:UnbindCoreAction("RbxStopOverscanMovement")
						settingsHubModule:SetVisibility(true, true)
					end
				end,
				ImageVisible = false,
				BackgroundTransparency = 0.2
			}
			settingsHubModule:SetVisibility(false, true)
			contextActionService:BindCoreAction("RbxStopOverscanMovement", function() --[[ line: 2769 ]] end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			local _ = nil
			var452 = roactModule.mount(roactModule.createElement(var450, t), robloxGui, tostring(var450))
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
		local var448 = utilityModule:AddNewRowObject(gameSettingsTab, "Safe Zone", adjustButton)
		var448.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
		adjustButton_2(var448)
	end
	
	local function createDeveloperConsoleOption() --[[ line: 2808 ]]
		-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (ref), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), runService (copy), playerPermissionsModule (copy), playersService (copy)
		local function makeDevConsoleOption() --[[ line: 2810 ]]
			-- upvalues: reportSettingsChangeForAnalytics (copy), fixDeveloperConsoleButtonSizeAndPositioning (copy), utilityModule (copy), gameSettingsTab (copy), themeModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local function onOpenDevConsole() --[[ line: 2811 ]]
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
				local var459 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton, nil, true)
				var459.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				devConsoleButton_2(var459)
				
				return
			end
			local devConsoleButton, devConsoleButton_1, devConsoleButton_2 = utilityModule:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, gameSettingsTab)
			devConsoleButton_1.Font = themeModule.font(Enum.Font.SourceSans)
			devConsoleButton.Size = UDim2.new(0.6, -10, 0, 35)
			devConsoleButton.Position = UDim2.new(1, -400, 0.5, 0)
			devConsoleButton.AnchorPoint = Vector2.new(0, 0.5)
			local var463 = utilityModule:AddNewRowObject(gameSettingsTab, "Developer Console", devConsoleButton)
			var463.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			devConsoleButton_2(var463)
		end
		
		if runService:IsStudio() then
			makeDevConsoleOption()
			
			return
		end
		spawn(function() --[[ line: 2863 ]]
			-- upvalues: playerPermissionsModule (copy), playersService (copy), makeDevConsoleOption (ref)
			if playerPermissionsModule.CanPlayerManagePlaceAsync(playersService.LocalPlayer) then
				makeDevConsoleOption()
			end
		end)
	end
	
	local function createUiToggleOptions() --[[ line: 2872 ]]
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), guiService (copy), localPlayer (copy)
		if not userFreecamGuiDestabilization and not userShowGuiHideToggles then
			local var476, var477, var478 = utilityModule:AddNewRow(gameSettingsTab, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			gameSettingsTab.uiToggleRow = var476
			gameSettingsTab.uiToggleFrame = var477
			gameSettingsTab.uiToggleSelector = var478
			gameSettingsTab.uiToggleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiToggleRow
			gameSettingsTab.uiToggleSelector.IndexChanged:connect(function(_) --[[ line: 2941 ]]
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
		local var467 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		local var468 = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off")
		gameSettingsTab.uiToggleSelectors = {}
		
		for i, v in list do
			local var472 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", { GuiType = v.label })
			local var473, var474, var475 = utilityModule:AddNewRow(gameSettingsTab, var472, "Selector", { var467, var468 }, 1)
			var473.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v.layoutOrderKey]
			var475.IndexChanged:Connect(function(p74) --[[ line: 2900 ]]
				-- upvalues: guiService (copy), v (ref)
				if (if guiService:GetGuiIsVisible(v.type) then 1 else 2) ~= p74 then
					guiService:ToggleGuiIsVisibleIfAllowed(v.type)
				end
			end)
			gameSettingsTab.uiToggleSelectors[v.label] = {
				label = var472,
				type = v.type,
				row = var473,
				frame = var474,
				selector = var475
			}
		end
		local var469, var470, var471 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { var468, var467 }, 1)
		gameSettingsTab.freecamRow = var469
		gameSettingsTab.freecamFrame = var470
		gameSettingsTab.freecamSelector = var471
		gameSettingsTab.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
		gameSettingsTab.freecamSelector.IndexChanged:Connect(function(p75) --[[ line: 2922 ]]
			-- upvalues: localPlayer (copy)
			local var479 = p75 == 2
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				freecamScript:SetAttribute("FreecamEnabled", var479)
				
				return
			end
			warn("Freecam not present")
		end)
	end
	
	local function updateUiToggleSelection() --[[ line: 2947 ]]
		-- upvalues: userFreecamGuiDestabilization (copy), userShowGuiHideToggles (copy), gameSettingsTab (ref), guiService (copy), localPlayer (copy)
		if userFreecamGuiDestabilization or userShowGuiHideToggles then
			if not gameSettingsTab.uiToggleSelectors then return end
			for i, v in gameSettingsTab.uiToggleSelectors do
				local var482 = if guiService:GetGuiIsVisible(v.type) then 1 else 2
				
				if var482 ~= v.selector:GetSelectedIndex() then
					v.selector:SetSelectionIndex(var482)
				end
			end
			local freecamScript = localPlayer:FindFirstChild("FreecamScript", true)
			
			if freecamScript then
				gameSettingsTab.freecamSelector:SetSelectionIndex(if freecamScript:GetAttribute("FreecamEnabled") then 2 else 1)
				
				return
			end
		elseif not gameSettingsTab.uiToggleSelector then return end
		local var483 = if guiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) then 1 else 2
		
		if var483 == gameSettingsTab.uiToggleSelector:GetSelectedIndex() then return end
		gameSettingsTab.uiToggleSelector:SetSelectionIndex(var483)
	end
	
	local _ = function(p76, p77, p78) --[[ line: 2989 | named "isValidDeviceList" ]]
		return p76 and (p77 and (p78 and (#p76 > 0 and (p78 > 0 and (p78 <= #p76 and #p76 == #p77)))))
	end
	
	local _ = function(p79, p80) --[[ line: 3002 | named "SwitchOutputDevice" ]]
		-- upvalues: soundService (copy), name (copy)
		soundService:SetOutputDevice(p79, p80)
		name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", p79, p80)
	end
	
	local function createDeviceOptions(p81) --[[ line: 3007 ]]
		-- upvalues: gameSettingsTab (ref), robloxTranslatorModule (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), getFIntVoiceChatDeviceChangeDebounceDelayModule (copy), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
		local var484 = gameSettingsTab[p81 .. "DeviceIndex"] or 0
		local var485 = gameSettingsTab[p81 .. "DeviceNames"] or {}
		local var486 = gameSettingsTab[p81 .. "DeviceGuids"] or {}
		local var487 = p81 == "Input" and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local var488 = gameSettingsTab
		local text = p81 .. "DeviceFrame"
		local text_1 = p81 .. "DeviceSelector"
		local var491, var492, var493 = utilityModule:AddNewRow(gameSettingsTab, var487, "Selector", var485, var484)
		var488[text] = var491
		_ = var492
		gameSettingsTab[text_1] = var493
		gameSettingsTab[p81 .. "DeviceFrame"].LayoutOrder = if p81 == "Input" then SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput else SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		gameSettingsTab[p81 .. "DeviceInfo"] = {
			Name = if var484 > 0 then var485[var484] else nil,
			Guid = if var484 > 0 then var486[var484] else nil
		}
		gameSettingsTab[p81 .. "PrevDeviceName"] = gameSettingsTab[p81 .. "DeviceInfo"].Name
		local var494 = 0
		local var495 = getFIntVoiceChatDeviceChangeDebounceDelayModule()
		gameSettingsTab[p81 .. "DeviceSelector"].IndexChanged:connect(function(p82) --[[ line: 3030 ]]
			-- upvalues: gameSettingsTab (copy), p81 (ref), var494 (write), var495 (ref), default_2 (copy), soundService (copy), name (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab[p81 .. "DeviceInfo"].Name == gameSettingsTab[p81 .. "DeviceNames"][p82] and gameSettingsTab[p81 .. "DeviceInfo"].Guid == gameSettingsTab[p81 .. "DeviceGuids"][p82] then return end
			local var496 = var494 + 1
			var494 = var496
			wait(var495)
			
			if var496 == var494 then
				var494 = 0
				gameSettingsTab[p81 .. "DeviceInfo"] = {
					Name = gameSettingsTab[p81 .. "DeviceNames"][p82],
					Guid = gameSettingsTab[p81 .. "DeviceGuids"][p82]
				}
				local name_1 = gameSettingsTab[p81 .. "DeviceInfo"].Name
				local guid = gameSettingsTab[p81 .. "DeviceInfo"].Guid
				
				if gameSettingsTab.VoiceChatOptionsEnabled then
					default_2:SwitchDevice(p81, name_1, guid)
				else
					soundService:SetOutputDevice(name_1, guid)
					name:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", name_1, guid)
				end
				if getFFlagEnableCrossExpVoice() then
					name:debug("[GameSettings] Changing {} device to {} {} ", p81, name_1, guid)
					
					if p81 == "Input" then
						default_3:changeInputDevice(name_1, guid)
					else
						default_3:changeOutputDevice(name_1, guid)
					end
				end
				reportSettingsChangeForAnalytics(p81, gameSettingsTab[p81 .. "PrevDeviceName"], name_1)
				gameSettingsTab[p81 .. "PrevDeviceName"] = name_1
			end
		end)
	end
	
	local _ = function() --[[ line: 3072 | named "createBadgeVisibilityOptions" ]]
		-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
		spawn(function() --[[ line: 3073 ]]
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var497, var498, var499 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var497
			gameSettingsTab.badgeVisibleFrame = var498
			gameSettingsTab.badgeVisibleSelector = var499
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p83) --[[ line: 3087 ]]
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p83 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p83 == 1)
			end)
		end)
	end
	
	local function createChatModerationOptions() --[[ line: 3094 ]]
		-- upvalues: gameSettingsTab (ref), utilityModule (copy), var20 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), signalsModule (copy), reportSettingsChangeForAnalytics (copy)
		local _ = {
			title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView",
			description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription",
			on = "InGame.CommonUI.Label.On",
			off = "InGame.CommonUI.Label.Off"
		}
		local var500, var501, var502 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", {
			var20:Format("InGame.CommonUI.Label.Off"),
			var20:Format("InGame.CommonUI.Label.On")
		}, 1, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		gameSettingsTab.ChatModerationFrame = var500
		_ = var501
		gameSettingsTab.ChatModerationSelector = var502
		gameSettingsTab.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
		gameSettingsTab.ChatModerationFrame.Visible = false
		local chatModerationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		gameSettingsTab.ChatModerationDisposeEffect = signalsModule.createEffect(function(p84) --[[ line: 3118 ]]
			-- upvalues: gameSettingsTab (copy), chatModerationStore (ref)
			gameSettingsTab.ChatModerationFrame.Visible = chatModerationStore.getIsSettingVisible(p84)
			local var504 = if chatModerationStore.getIsSettingEnabled(p84) then 2 else 1
			
			if gameSettingsTab.ChatModerationSelector:GetSelectedIndex() ~= var504 then
				gameSettingsTab.ChatModerationSelector:SetSelectionIndex(var504)
			end
		end)
		gameSettingsTab.ChatModerationSelector.IndexChanged:connect(function(p85) --[[ line: 3127 ]]
			-- upvalues: chatModerationStore (ref), reportSettingsChangeForAnalytics (copy)
			local var505 = p85 == 2
			chatModerationStore.setIsSettingEnabled(var505)
			reportSettingsChangeForAnalytics("moderate_chat", not var505, var505)
		end)
		chatModerationStore.initialize()
	end
	
	local function createAIRephraseSettingOptions() --[[ line: 3136 ]]
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceAIRephraseSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy), expChatDebounceRephraseIndexSelection (copy), throttleFunctionCallModule (copy)
		local var506, var507, var508 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription"))
		gameSettingsTab.AIRephraseFrame = var506
		_ = var507
		gameSettingsTab.AIRephraseSelector = var508
		gameSettingsTab.AIRephraseFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AIRephraseFrame
		gameSettingsTab.AIRephraseFrame.Visible = false
		local AIRephraseSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local var510 = getFIntDebounceAIRephraseSettingDelayModule()
		local var511 = var510 > 0
		local var512 = if AIRephraseSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.AIRephraseDisposeEffect = signalsModule.createEffect(function(p86) --[[ line: 3162 ]]
			-- upvalues: gameSettingsTab (copy), AIRephraseSettingStore (ref), var512 (write)
			gameSettingsTab.AIRephraseFrame.Visible = AIRephraseSettingStore.getIsSettingVisible(p86)
			local var515 = if AIRephraseSettingStore.getIsSettingEnabled(p86) then 2 else 1
			
			if gameSettingsTab.AIRephraseSelector:GetSelectedIndex() ~= var515 then
				var512 = var515
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var515)
			end
		end)
		
		local var513 = function(p87) --[[ line: 3173 ]]
			-- upvalues: var512 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p87 == var512 then
				return
			end
			local var516 = p87 == 2
			task.spawn(function() --[[ line: 3179 ]]
				-- upvalues: textChatService (copy), var516 (ref), AIRephraseSettingStore (copy), var512 (copy), p87 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var516 then "Enabled" else "Disabled") then
					AIRephraseSettingStore.setIsSettingEnabled(var516)
					var512 = p87
					reportSettingsChangeForAnalytics("ai_rephrase", not var516, var516)
					
					return
				end
				gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var512)
			end)
		end
		
		if not expChatDebounceRephraseIndexSelection then
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(if var511 then throttleFunctionCallModule(var510, var513) else var513)
		elseif var511 then
			local var514 = nil
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(function(p88) --[[ line: 3196 ]]
				-- upvalues: var514 (write), var510 (ref), var512 (write), textChatService (copy), AIRephraseSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var514 then
					task.cancel(var514)
				end
				var514 = task.delay(var510, function() --[[ line: 3200 ]]
					-- upvalues: var514 (copy), p88 (ref), var512 (copy), textChatService (copy), AIRephraseSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var514 = nil
					
					if p88 == var512 then
						return
					end
					local var517 = p88 == 2
					task.spawn(function() --[[ line: 3179 ]]
						-- upvalues: textChatService (copy), var517 (ref), AIRephraseSettingStore (copy), var512 (copy), p88 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("allowAIRephrase", if var517 then "Enabled" else "Disabled") then
							AIRephraseSettingStore.setIsSettingEnabled(var517)
							var512 = p88
							reportSettingsChangeForAnalytics("ai_rephrase", not var517, var517)
							
							return
						end
						gameSettingsTab.AIRephraseSelector:SetSelectionIndex(var512)
					end)
				end)
			end)
		else
			gameSettingsTab.AIRephraseSelector.IndexChanged:connect(var513)
		end
	end
	
	local function createChatSummariesSettingOptions() --[[ line: 3213 ]]
		-- upvalues: robloxTranslatorModule (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), corePackagesService (copy), getFIntDebounceChatSummariesSettingDelayModule (copy), signalsModule (copy), textChatService (copy), reportSettingsChangeForAnalytics (copy)
		local var518, var519, var520 = utilityModule:AddNewRow(gameSettingsTab, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries"), "Selector", {
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.Off"),
			robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.On")
		}, 1, nil, robloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription"))
		gameSettingsTab.ChatSummariesFrame = var518
		_ = var519
		gameSettingsTab.ChatSummariesSelector = var520
		gameSettingsTab.ChatSummariesFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatSummariesFrame
		gameSettingsTab.ChatSummariesFrame.Visible = false
		local chatSummariesSettingStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local var522 = getFIntDebounceChatSummariesSettingDelayModule()
		local var523 = var522 > 0
		local var524 = if chatSummariesSettingStore.getIsSettingEnabled(false) then 2 else 1
		gameSettingsTab.ChatSummariesDisposeEffect = signalsModule.createEffect(function(p89) --[[ line: 3239 ]]
			-- upvalues: gameSettingsTab (copy), chatSummariesSettingStore (ref), var524 (write)
			gameSettingsTab.ChatSummariesFrame.Visible = chatSummariesSettingStore.getIsSettingVisible(p89)
			local var527 = if chatSummariesSettingStore.getIsSettingEnabled(p89) then 2 else 1
			
			if gameSettingsTab.ChatSummariesSelector:GetSelectedIndex() ~= var527 then
				var524 = var527
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var527)
			end
		end)
		
		local var525 = function(p90) --[[ line: 3250 ]]
			-- upvalues: var524 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
			if p90 == var524 then
				return
			end
			local var528 = p90 == 2
			task.spawn(function() --[[ line: 3256 ]]
				-- upvalues: textChatService (copy), var528 (ref), chatSummariesSettingStore (copy), var524 (copy), p90 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var528 then "Enabled" else "Disabled") then
					chatSummariesSettingStore.setIsSettingEnabled(var528)
					var524 = p90
					reportSettingsChangeForAnalytics("chat_summaries", not var528, var528)
					
					return
				end
				gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var524)
			end)
		end
		
		if var523 then
			local var526 = nil
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(function(p91) --[[ line: 3272 ]]
				-- upvalues: var526 (write), var522 (ref), var524 (write), textChatService (copy), chatSummariesSettingStore (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
				if var526 then
					task.cancel(var526)
				end
				var526 = task.delay(var522, function() --[[ line: 3276 ]]
					-- upvalues: var526 (copy), p91 (ref), var524 (copy), textChatService (copy), chatSummariesSettingStore (copy), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
					var526 = nil
					
					if p91 == var524 then
						return
					end
					local var529 = p91 == 2
					task.spawn(function() --[[ line: 3256 ]]
						-- upvalues: textChatService (copy), var529 (ref), chatSummariesSettingStore (copy), var524 (copy), p91 (ref), reportSettingsChangeForAnalytics (copy), gameSettingsTab (copy)
						if textChatService:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", if var529 then "Enabled" else "Disabled") then
							chatSummariesSettingStore.setIsSettingEnabled(var529)
							var524 = p91
							reportSettingsChangeForAnalytics("chat_summaries", not var529, var529)
							
							return
						end
						gameSettingsTab.ChatSummariesSelector:SetSelectionIndex(var524)
					end)
				end)
			end)
		else
			gameSettingsTab.ChatSummariesSelector.IndexChanged:connect(var525)
		end
	end
	
	local function createCameraDeviceOptions() --[[ line: 3289 ]]
		-- upvalues: gameSettingsTab (ref), var80 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
		local cameraDeviceIndex = gameSettingsTab.CameraDeviceIndex or 1
		local cameraDeviceNames = gameSettingsTab.CameraDeviceNames or {}
		local cameraDeviceGuids = gameSettingsTab.CameraDeviceGuids or {}
		local var533, var534, var535 = utilityModule:AddNewRow(gameSettingsTab, var80, "Selector", cameraDeviceNames, cameraDeviceIndex)
		gameSettingsTab.CameraDeviceFrame = var533
		_ = var534
		gameSettingsTab.CameraDeviceSelector = var535
		gameSettingsTab.CameraDeviceFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraDeviceFrame
		gameSettingsTab.CameraDeviceInfo = {
			Name = if cameraDeviceIndex > 0 then cameraDeviceNames[cameraDeviceIndex] else nil,
			Guid = if cameraDeviceIndex > 0 then cameraDeviceGuids[cameraDeviceIndex] else nil
		}
		gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		gameSettingsTab.CameraDeviceSelector.IndexChanged:connect(function(p92) --[[ line: 3306 ]]
			-- upvalues: gameSettingsTab (copy), name (copy), userGameSettingsService (copy), reportSettingsChangeForAnalytics (copy)
			if gameSettingsTab.CameraDeviceInfo.Name == gameSettingsTab.CameraDeviceNames[p92] and gameSettingsTab.CameraDeviceInfo.Guid == gameSettingsTab.CameraDeviceGuids[p92] then
				return
			end
			gameSettingsTab.CameraDeviceInfo = {
				Name = gameSettingsTab.CameraDeviceNames[p92],
				Guid = gameSettingsTab.CameraDeviceGuids[p92]
			}
			local guid = gameSettingsTab.CameraDeviceInfo.Guid
			name:info("Changed webcam to: {}", guid)
			userGameSettingsService.DefaultCameraID = guid
			reportSettingsChangeForAnalytics("video_camera", gameSettingsTab.prevCameraDeviceName or "None", gameSettingsTab.CameraDeviceInfo.Name)
			gameSettingsTab.prevCameraDeviceName = gameSettingsTab.CameraDeviceInfo.Name
		end)
	end
	
	local function updateAudioDevices(p93) --[[ line: 3331 ]]
		-- upvalues: soundService (copy), var20 (copy), gameSettingsTab (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy), createDeviceOptions (ref)
		local ok, status, var536, var537 = pcall(function() --[[ line: 3332 ]]
			-- upvalues: p93 (ref), soundService (copy)
			return if p93 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var536 and (var537 and (#status > 0 and (var537 > 0 and (var537 <= #status and #status == #var536)))))) then
			if var536[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p93 .. "DeviceNames"] = status
			gameSettingsTab[p93 .. "DeviceGuids"] = var536
			gameSettingsTab[p93 .. "DeviceIndex"] = var537
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} device info", p93)
		end
		gameSettingsTab[p93 .. "DeviceNames"] = {}
		gameSettingsTab[p93 .. "DeviceGuids"] = {}
		gameSettingsTab[p93 .. "DeviceIndex"] = 0
		if gameSettingsTab[p93 .. "DeviceSelector"] then
			gameSettingsTab[p93 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p93 .. "DeviceSelector"]:SetSelectionIndex(var537)
			
			return
		end
		createDeviceOptions(p93)
	end
	
	local function updateVoiceChatDevices(p94) --[[ line: 3364 ]]
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy), soundService (copy), var20 (copy), gameSettingsTab (ref), createDeviceOptions (ref)
		if p94 ~= "Input" and p94 ~= "Output" and getFFlagVoiceChatUILoggingModule() then
			name:warning("{} is not supported in VoiceChat devices", p94)
		end
		local ok, status, var538, var539 = pcall(function() --[[ line: 3371 ]]
			-- upvalues: p94 (ref), soundService (copy)
			return if p94 == "Input" then soundService:GetInputDevices() else soundService:GetOutputDevices()
		end)
		
		if ok and (status and (var538 and (var539 and (#status > 0 and (var539 > 0 and (var539 <= #status and #status == #var538)))))) then
			if var538[1] == "" then
				status[1] = var20:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. status[1] .. ")"
			end
			gameSettingsTab[p94 .. "DeviceNames"] = status
			gameSettingsTab[p94 .. "DeviceGuids"] = var538
			gameSettingsTab[p94 .. "DeviceIndex"] = var539
		elseif getFFlagVoiceChatUILoggingModule() then
			if #status > 0 then
				name:warning("Errors in get {} device info success: {}", p94, ok)
			else
				name:warning("Empty deviceNames list for {}", p94)
			end
		end
		gameSettingsTab[p94 .. "DeviceNames"] = {}
		gameSettingsTab[p94 .. "DeviceGuids"] = {}
		gameSettingsTab[p94 .. "DeviceIndex"] = 0
		if gameSettingsTab[p94 .. "DeviceSelector"] then
			gameSettingsTab[p94 .. "DeviceSelector"]:UpdateOptions(status)
			gameSettingsTab[p94 .. "DeviceSelector"]:SetSelectionIndex(var539)
		else
			createDeviceOptions(p94)
		end
		if gameSettingsTab[p94 .. "DeviceFrame"] then
			if #status > 0 then
				gameSettingsTab[p94 .. "DeviceFrame"].Visible = true
				
				return
			end
			gameSettingsTab[p94 .. "DeviceFrame"].Visible = false
		end
	end
	
	local function updateCameraDevices() --[[ line: 3423 ]]
		-- upvalues: videoCaptureService (copy), var79 (copy), userGameSettingsService (copy), gameSettingsTab (ref), createCameraDeviceOptions (ref)
		local cameraDevices = videoCaptureService:GetCameraDevices()
		local t = {}
		local t_1 = {}
		local var543 = 1
		table.insert(t, var79)
		table.insert(t_1, "{DefaultDeviceGuid}")
		
		for i, v in pairs(cameraDevices) do
			if i == userGameSettingsService.DefaultCameraID then
				var543 = #t + 1
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
		gameSettingsTab.CameraDeviceSelector:SetSelectionIndex(var543)
	end
	
	local var152 = nil
	local var153 = nil
	
	local function updateAudioOptions() --[[ line: 3453 ]]
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
	
	local _ = function() --[[ line: 3465 | named "setupDeviceChangedListener" ]]
		-- upvalues: soundService (copy), var152 (write), gameSettingsTab (ref), updateAudioOptions (ref)
		if soundService.DeviceListChanged then
			var152 = soundService.DeviceListChanged:Connect(function() --[[ line: 3467 ]]
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
	end
	
	local _ = function() --[[ line: 3475 | named "setupVideoCameraDeviceChangedListener" ]]
		-- upvalues: videoCaptureService (copy), var153 (write), gameSettingsTab (ref), updateCameraDevices (ref)
		if videoCaptureService.DevicesChanged then
			var153 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3477 ]]
				-- upvalues: gameSettingsTab (copy), updateCameraDevices (copy)
				if gameSettingsTab.PageOpen then
					updateCameraDevices()
				end
			end)
		end
	end
	
	local _ = function() --[[ line: 3485 | named "teardownDeviceChangedListener" ]]
		-- upvalues: soundService (copy), var152 (write)
		if soundService.DeviceListChanged and var152 then
			var152:Disconnect()
		end
	end
	
	local _ = function() --[[ line: 3491 | named "teardownVideoCameraDeviceChangedListener" ]]
		-- upvalues: videoCaptureService (copy), var153 (write)
		if videoCaptureService.DevicesChanged and var153 then
			var153:Disconnect()
			var153 = nil
		end
	end
	
	local _ = function() --[[ line: 3499 | named "checkVoiceChatOptions" ]]
		-- upvalues: default_2 (copy), gameSettingsTab (ref)
		if default_2:VoiceChatAvailable() then
			gameSettingsTab.VoiceChatOptionsEnabled = true
		end
	end
	
	local _ = function() --[[ line: 3505 | named "updateInputDeviceVisibility" ]]
		-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy)
		local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
		
		if gameSettingsTab.InputDeviceFrame then
			gameSettingsTab.InputDeviceFrame.Visible = voiceChatOptionsEnabled
		end
	end
	
	local var155 = false
	local var156 = if differentiateVoiceSelectorSystemAndUser then false else nil
	
	local function createVoiceChatSelector() --[[ line: 3518 ]]
		-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (ref), enableVoiceSelectorTranslationsAEGIS2 (copy), var20 (copy), default_2 (copy), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), differentiateVoiceSelectorSystemAndUser (copy), getFIntDebounceDisconnectButtonDelayModule (copy), var156 (write), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), var155 (write), throttleFunctionCallModule (copy), voiceChatSelectorReconnectFocus2AEGIS2 (copy), guiService (copy), debounceVoiceSelectorIndexChange (copy), deferProgrammaticChange (copy)
		if voiceSelectorAvailableAfterFae and gameSettingsTab.VoiceConnectDisconnectFrame and gameSettingsTab.VoiceConnectDisconnectSelector then return end
		local var545 = "Voice Chat"
		local var546 = "Disconnected"
		local var547 = "Connected"
		
		if enableVoiceSelectorTranslationsAEGIS2 then
			var545 = var20:Format("Feature.GameDetails.Label.VoiceChat")
			var546 = var20:Format("Feature.SettingsHub.Label.Disconnected")
			var547 = var20:Format("Feature.SettingsHub.Label.Connected")
		end
		local var548 = if default_2:VoiceChatEnded() then 1 else 2
		local var549 = gameSettingsTab
		local var550, var551, var552 = utilityModule:AddNewRow(gameSettingsTab, var545, "Selector", { var546, var547 }, var548)
		gameSettingsTab.VoiceConnectDisconnectFrame = var550
		_ = var551
		var549.VoiceConnectDisconnectSelector = var552
		gameSettingsTab.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectDisconnectSelector
		local service = default_2:getService()
		
		if service and not differentiateVoiceSelectorSystemAndUser then
			service.StateChanged:Connect(function(p95, p96) --[[ line: 3543 ]]
				-- upvalues: voiceSelectorAvailableAfterFae (copy), gameSettingsTab (copy), default_2 (copy)
				if voiceSelectorAvailableAfterFae then
					if p95 == p96 then return end
					if p96 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						
						return
					elseif (p96 == Enum.VoiceChatState.Ended or p96 == Enum.VoiceChatState.Failed or p96 == Enum.VoiceChatState.Idle) and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
						
						return
					end
				elseif p95 == p96 then return end
				if p96 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				elseif default_2:VoiceChatEnded() then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			end)
		end
		local var554 = var548
		local var555 = getFIntDebounceDisconnectButtonDelayModule()
		
		local var556 = function(p97) --[[ line: 3577 ]]
			-- upvalues: var554 (write), differentiateVoiceSelectorSystemAndUser (copy), var156 (copy), fFlagVoiceRewarmTelemetry (copy), default_2 (copy), constantsModule_1 (copy), var155 (copy), gameSettingsTab (copy)
			if p97 == var554 then return end
			var554 = p97
			
			if differentiateVoiceSelectorSystemAndUser and var156 then return end
			if fFlagVoiceRewarmTelemetry then
				local var557, var558, var559, var560 = default_2:GetConnectDisconnectButtonAnalyticsData(p97 == 2)
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var557, var558, var559, var560, default_2.joinVoiceButtonContext)
			else
				default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(p97 == 2))
			end
			if p97 == 2 then
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			elseif not default_2:VoiceChatEnded() then
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			if var155 then
				task.spawn(function() --[[ line: 3611 ]]
					-- upvalues: p97 (ref), gameSettingsTab (copy)
					task.wait(0.5)
					
					if p97 ~= 1 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end
		
		gameSettingsTab.VoiceConnectDisconnectSelector.IndexChanged:connect(if var555 > 0 then throttleFunctionCallModule(var555, var556) else var556)
		
		if voiceChatSelectorReconnectFocus2AEGIS2 then
			gameSettingsTab.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p98, p99) --[[ line: 3625 ]]
				-- upvalues: var545 (write), gameSettingsTab (copy), guiService (copy)
				if p99 and p98 and (p98.Parent and p98.Parent.Name == var545 .. "Frame") and (p99.Name == "ImageButton" and gameSettingsTab.Active) then
					guiService.SelectedCoreObject = p98
				end
			end)
		end
		default_2:subscribe("OnStateChanged", function(_, p100) --[[ line: 3632 ]]
			-- upvalues: differentiateVoiceSelectorSystemAndUser (copy), var156 (copy), debounceVoiceSelectorIndexChange (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			if differentiateVoiceSelectorSystemAndUser then
				var156 = true
				
				if debounceVoiceSelectorIndexChange then
					if p100 == Enum.VoiceChatState.Joined and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					end
				elseif p100 == Enum.VoiceChatState.Joined then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end
			if debounceVoiceSelectorIndexChange then
				if p100 == Enum.VoiceChatState.Failed and gameSettingsTab.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
			elseif p100 == Enum.VoiceChatState.Failed then
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end
			if differentiateVoiceSelectorSystemAndUser then
				if deferProgrammaticChange then
					task.defer(function() --[[ line: 3664 ]]
						-- upvalues: var156 (copy)
						var156 = false
					end)
					
					return
				end
				var156 = false
			end
		end)
		default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ line: 3673 ]]
			-- upvalues: var155 (copy), differentiateVoiceSelectorSystemAndUser (copy), var156 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
			task.spawn(function() --[[ line: 3674 ]]
				-- upvalues: var155 (copy), differentiateVoiceSelectorSystemAndUser (copy), var156 (copy), gameSettingsTab (copy), deferProgrammaticChange (copy)
				task.wait(0.5)
				var155 = true
				
				if differentiateVoiceSelectorSystemAndUser then
					var156 = true
				end
				gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				
				if differentiateVoiceSelectorSystemAndUser then
					if deferProgrammaticChange then
						task.defer(function() --[[ line: 3683 ]]
							-- upvalues: var156 (copy)
							var156 = false
						end)
						
						return
					end
					var156 = false
				end
			end)
		end)
	end
	
	local function createVoiceConnectDisconnect() --[[ line: 3694 ]]
		-- upvalues: default_2 (copy), var20 (copy), getFIntDebounceDisconnectButtonDelayModule (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy), utilityModule (copy), throttleFunctionCallModule (copy), gameSettingsTab (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy)
		if default_2:IsSeamlessVoice() and not default_2.isShowingFTUX then
			local _ = nil
			local _ = nil
			local _ = nil
			local _ = nil
			local var561 = var20:Format("Feature.GameDetails.Label.VoiceChat")
			local var562 = var20:Format("Feature.SettingsHub.Label.Connect")
			local var563 = var20:Format("Feature.SettingsHub.Label.Disconnect")
			local var564 = getFIntDebounceDisconnectButtonDelayModule()
			local var565 = var564 > 0
			
			local var566 = function() --[[ line: 3704 ]]
				-- upvalues: default_2 (copy), fFlagVoiceRewarmTelemetry (copy), constantsModule_1 (copy)
				local var580
				if default_2:getService() then
					var580 = nil
					var580 = default_2:getService().StateChanged:Connect(function(_, p101) --[[ line: 3708 ]]
						-- upvalues: fFlagVoiceRewarmTelemetry (copy), default_2 (copy), var580 (write)
						if p101 == Enum.VoiceChatState.Joined then
							if fFlagVoiceRewarmTelemetry then
								local var584, var585, var586, var587 = default_2:GetConnectDisconnectButtonAnalyticsData(true)
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var584, var585, var586, var587, default_2.joinVoiceButtonContext)
							else
								default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
							end
							var580:Disconnect()
						end
					end)
				elseif fFlagVoiceRewarmTelemetry then
					var580, var581, var582, var583 = default_2:GetConnectDisconnectButtonAnalyticsData(false)
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", var580, var581, var582, var583, default_2.joinVoiceButtonContext)
				else
					default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(false))
				end
				default_2.pendingConnectionSource = constantsModule_1.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default_2:JoinVoice()
			end
			
			local var567 = function() --[[ line: 3741 ]]
				-- upvalues: default_2 (copy), constantsModule_1 (copy)
				default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", default_2:GetConnectDisconnectButtonAnalyticsData(true))
				default_2.pendingDisconnectReason = constantsModule_1.VOICE_DISCONNECT_REASON.USER_DISCONNECT
				default_2:Leave()
			end
			
			local voiceConnectButton, voiceConnectButton_1, voiceConnectButton_2 = utilityModule:MakeStyledButton("VoiceConnectButton", var562, UDim2.new(1, 0, 1, -20), if var565 then throttleFunctionCallModule(var564, var566) else var566, gameSettingsTab)
			voiceConnectSetRowRef = voiceConnectButton_2
			local var571 = voiceConnectButton
			local var572 = voiceConnectButton_1
			local voiceDisconnectButton, voiceDisconnectButton_1, voiceDisconnectButton_2 = utilityModule:MakeStyledButton("VoiceDisconnectButton", var563, UDim2.new(1, 0, 1, -20), if var565 then throttleFunctionCallModule(var564, var567) else var567, gameSettingsTab)
			voiceDisconnectSetRowRef = voiceDisconnectButton_2
			local var576 = voiceDisconnectButton
			local var577 = voiceDisconnectButton_1
			var571.Size = UDim2.new(0.6, 0, 0, 40)
			var571.Position = UDim2.new(0.4, 0, 0.5, 0)
			var571.AnchorPoint = Vector2.new(0, 0.5)
			var571.ZIndex = 2
			var571.Selectable = true
			var572.ZIndex = 2
			var576.Size = UDim2.new(0.6, 0, 0, 40)
			var576.Position = UDim2.new(0.4, 0, 0.5, 0)
			var576.AnchorPoint = Vector2.new(0, 0.5)
			var576.ZIndex = 2
			var576.Selectable = true
			var577.ZIndex = 2
			local var578 = utilityModule:AddNewRowObject(gameSettingsTab, var561, var571, nil, true)
			local var579 = utilityModule:AddNewRowObject(gameSettingsTab, var561, var576, nil, true)
			gameSettingsTab.VoiceConnectFrame = var578
			gameSettingsTab.VoiceDisconnectFrame = var579
			var578.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			var579.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(var578)
			voiceDisconnectSetRowRef(var579)
			
			if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				var578.Visible = false
				var579.Visible = false
				
				return
			elseif default_2:ShouldShowJoinVoice() then
				var578.Visible = true
				var579.Visible = false
				
				return
			end
			var578.Visible = false
			var579.Visible = true
		end
	end
	
	local function createVRComfortSettingOptions() --[[ line: 3804 ]]
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
		local var591, var592, var593 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", t_1, table.find(enumItems, gameSettings.VRComfortSetting), nil, var20:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		gameSettingsTab.VRComfortSettingFrame = var591
		gameSettingsTab.VRComfortSettingLabel = var592
		gameSettingsTab.VRComfortSettingSelector = var593
		gameSettingsTab.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame
		local var594, var595, var596 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VignetteEnabled then 1 else 2)
		gameSettingsTab.VRVignetteEnabledFrame = var594
		gameSettingsTab.VRVignetteEnabledLabel = var595
		gameSettingsTab.VRVignetteEnabledSelector = var596
		gameSettingsTab.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame
		local var597, var598, var599 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRSmoothRotationEnabled then 2 else 1)
		gameSettingsTab.VRSteppedRotationEnabledFrame = var597
		gameSettingsTab.VRSteppedRotationEnabledLabel = var598
		gameSettingsTab.VRSteppedRotationEnabledSelector = var599
		gameSettingsTab.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame
		local var600, var601, var602 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", {
			var20:Format("InGame.CommonUI.Label.On"),
			var20:Format("InGame.CommonUI.Label.Off")
		}, if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1)
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame = var600
		gameSettingsTab.VRThirdPersonFixedCamEnabledLabel = var601
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector = var602
		gameSettingsTab.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame
		
		local var603 = function(p102) --[[ line: 3870 ]]
			-- upvalues: gameSettingsTab (copy)
			if p102 == Enum.VRComfortSetting.Custom then
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
		
		gameSettingsTab.VRComfortSettingSelector.IndexChanged:connect(function(p103) --[[ line: 3894 ]]
			-- upvalues: enumItems (ref), gameSettings (copy), var603 (ref)
			local var604 = enumItems[p103]
			gameSettings.VRComfortSetting = var604
			var603(var604)
		end)
		var603(gameSettings.VRComfortSetting)
		gameSettingsTab.VRVignetteEnabledSelector.IndexChanged:connect(function(p104) --[[ line: 3901 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VignetteEnabledCustomOption = p104 == 1
			end
		end)
		gameSettingsTab.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p105) --[[ line: 3907 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRSmoothRotationEnabledCustomOption = p105 == 2
			end
		end)
		gameSettingsTab.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p106) --[[ line: 3913 ]]
			-- upvalues: gameSettings (copy)
			if gameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
				gameSettings.VRThirdPersonFollowCamEnabledCustomOption = p106 == 2
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ line: 3919 ]]
			-- upvalues: enumItems (ref), gameSettings (copy), gameSettingsTab (copy)
			local index = table.find(enumItems, gameSettings.VRComfortSetting)
			
			if gameSettingsTab.VRComfortSettingSelector:GetSelectedIndex() ~= index then
				gameSettingsTab.VRComfortSettingSelector:SetSelectionIndex(index)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ line: 3926 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var606 = if gameSettings.VignetteEnabled then 1 else 2
			
			if gameSettingsTab.VRVignetteEnabledSelector:GetSelectedIndex() ~= var606 then
				gameSettingsTab.VRVignetteEnabledSelector:SetSelectionIndex(var606)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ line: 3933 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var607 = if gameSettings.VRSmoothRotationEnabled then 2 else 1
			
			if gameSettingsTab.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= var607 then
				gameSettingsTab.VRSteppedRotationEnabledSelector:SetSelectionIndex(var607)
			end
		end)
		gameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ line: 3940 ]]
			-- upvalues: gameSettings (copy), gameSettingsTab (copy)
			local var608 = if gameSettings.VRThirdPersonFollowCamEnabled then 2 else 1
			
			if gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= var608 then
				gameSettingsTab.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(var608)
			end
		end)
	end
	
	local function createVRSafetyBubbleModeOptions() --[[ line: 3948 ]]
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
		task.defer(function() --[[ line: 3964 ]]
			-- upvalues: gameSettingsTab (copy), utilityModule (copy), var20 (copy), t_1 (ref), index (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), enumItems (ref), gameSettings (copy)
			local var613, var614, var615 = utilityModule:AddNewRow(gameSettingsTab, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", t_1, index, nil, var20:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			gameSettingsTab.VRSafetyBubbleModeFrame = var613
			gameSettingsTab.VRSafetyBubbleModeLabel = var614
			gameSettingsTab.VRSafetyBubbleModeSelector = var615
			gameSettingsTab.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSafetyBubbleModeFrame
			gameSettingsTab.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p107) --[[ line: 3977 ]]
				-- upvalues: enumItems (copy), gameSettings (copy)
				gameSettings.VRSafetyBubbleMode = enumItems[p107]
			end)
			gameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ line: 3982 ]]
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
	local var161 = nil
	
	if game:GetEngineFeature("VoiceChatSupported") and (getFFlagEnableVrVoiceConnectDisconnect() or (if isInExperienceUIVREnabled then not isSpatial() else true)) then
		spawn(function() --[[ line: 3996 ]]
			-- upvalues: getFFlagEnableVoiceUxUpdates (copy), hideVoiceChatSelectorForFaeAEGIS2 (copy), default_2 (copy), createVoiceChatSelector (ref), isVoiceFocused (copy), gameSettingsTab (ref), observeIsVoiceFocused (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableUniveralVoiceToastsModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var156 (write), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy)
			if getFFlagEnableVoiceUxUpdates() and (not hideVoiceChatSelectorForFaeAEGIS2 and default_2:EligibleForFaeUpsell() or default_2:IsSeamlessVoice()) and default_2:verifyUniverseAndPlaceCanUseVoice() then
				createVoiceChatSelector()
				
				if isVoiceFocused() and gameSettingsTab.VoiceConnectDisconnectFrame then
					gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
				end
				observeIsVoiceFocused(function(p108) --[[ line: 4006 ]]
					-- upvalues: gameSettingsTab (copy)
					if p108 then
						if gameSettingsTab.VoiceConnectDisconnectFrame then
							gameSettingsTab.VoiceConnectDisconnectFrame.Visible = false
							
							return
						end
					elseif gameSettingsTab.VoiceConnectDisconnectFrame then
						gameSettingsTab.VoiceConnectDisconnectFrame.Visible = true
					end
				end)
			end
			default_2:asyncInit():andThen(function() --[[ line: 4019 ]]
				-- upvalues: default_2 (copy), gameSettingsTab (copy), voiceSelectorAvailableAfterFae (copy), getFFlagEnableVoiceUxUpdates (copy), createVoiceChatSelector (copy), getFFlagEnableUniveralVoiceToastsModule (copy), differentiateVoiceSelectorSystemAndUser (copy), deferProgrammaticChange (copy), var156 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), createVoiceConnectDisconnect (copy), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), observeIsVoiceFocused (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
				VoiceChatService = default_2:getService()
				
				if default_2:VoiceChatAvailable() then
					gameSettingsTab.VoiceChatOptionsEnabled = true
				end
				if voiceSelectorAvailableAfterFae and getFFlagEnableVoiceUxUpdates() and (default_2:UserVoiceEnabled() and default_2:verifyUniverseAndPlaceCanUseVoice()) then
					createVoiceChatSelector()
				end
				if not getFFlagEnableUniveralVoiceToastsModule() then
					default_2:CheckAndShowNotAudiblePrompt()
				end
				if getFFlagEnableVoiceUxUpdates() then
					if differentiateVoiceSelectorSystemAndUser and deferProgrammaticChange then
						var156 = true
						gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function() --[[ line: 4043 ]]
							-- upvalues: var156 (copy)
							var156 = false
						end)
						
						return
					end
					gameSettingsTab.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					
					return
				else
					local var617 = false
					
					if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
						createVoiceConnectDisconnect()
						
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
							var617 = isVoiceFocused()
							observeIsVoiceFocused(function(p109) --[[ line: 4058 ]]
								-- upvalues: var617 (write), gameSettingsTab (copy), default_2 (copy)
								var617 = p109
								
								if p109 then
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
							gameSettingsTab.VoiceDisconnectFrame.Visible = not var617
						else
							gameSettingsTab.VoiceDisconnectFrame.Visible = true
						end
					end
					default_2.showVoiceUI.Event:Connect(function() --[[ line: 4091 ]]
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var617 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var617 then return end
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
					default_2.hideVoiceUI.Event:Connect(function() --[[ line: 4109 ]]
						-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), var617 (write), gameSettingsTab (copy), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy)
						if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and var617 then return end
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
			end):catch(function() --[[ line: 4129 ]]
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
		local eventConnection = default_3.ExperienceJoined.Event:Connect(function() --[[ line: 4142 ]]
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		local eventConnection_1 = default_3.ExperienceLeft.Event:Connect(function() --[[ line: 4145 ]]
			-- upvalues: gameSettingsTab (ref), getFFlagEnableCrossExpVoice (copy), default_3 (copy), t_4 (copy)
			local voiceChatOptionsEnabled = gameSettingsTab.VoiceChatOptionsEnabled or getFFlagEnableCrossExpVoice() and default_3:getIsConnected()
			
			if gameSettingsTab[t_4.Input .. "DeviceFrame"] then
				gameSettingsTab[t_4.Input .. "DeviceFrame"].Visible = voiceChatOptionsEnabled
			end
		end)
		
		var161 = function() --[[ line: 4148 ]]
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
	local var164 = nil
	
	local _ = function() --[[ line: 4162 ]]
		-- upvalues: var164 (write)
		if var164 then
			var164:disconnect()
			var164 = nil
		end
	end
	
	if getFFlagSelfViewCameraSettings() and (if isInExperienceUIVREnabled then not isSpatial() else true) then
		local var165 = function(p110) --[[ line: 4170 ]]
			-- upvalues: gameSettingsTab (ref)
			gameSettingsTab.VideoOptionsEnabled = p110.hasCameraPermissions
		end
		
		if isCamEnabledForUserAndPlaceModule() then
			getCamMicPermissionsModule(var165, { default.Permissions.CAMERA_ACCESS }, true)
			var164 = cameraDevicePermissionGrantedSignalModule:connect(function() --[[ line: 4186 ]]
				-- upvalues: gameSettingsTab (ref), updateCameraDevices (ref), videoCaptureService (copy), var153 (write)
				gameSettingsTab.VideoOptionsEnabled = true
				updateCameraDevices()
				
				if videoCaptureService.DevicesChanged then
					var153 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3477 ]]
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
		createCameraModeOptions(not var76 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
	end
	local changedConnection
	local _ = function() --[[ line: 4202 ]]
		-- upvalues: gameSettings (copy), createGamepadOptions (ref)
		if gameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
			
			return
		end
		local var622 = nil
		var622 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4208 ]]
			-- upvalues: gameSettings (copy), var622 (write), createGamepadOptions (copy)
			if gameSettings.IsUsingGamepadCameraSensitivity then
				if var622 then
					var622:disconnect()
				end
				createGamepadOptions()
			end
		end)
	end
	
	if userInputService.MouseEnabled then
		createMouseOptions()
	elseif not userInputService.GamepadEnabled then
		changedConnection = nil
		changedConnection = userInputService.GamepadConnected:connect(function() --[[ line: 4226 ]]
			-- upvalues: changedConnection (write), gameSettings (copy), createGamepadOptions (ref)
			if changedConnection then
				changedConnection:disconnect()
			end
			if gameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()
				
				return
			end
			local var623 = nil
			var623 = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4208 ]]
				-- upvalues: gameSettings (copy), var623 (write), createGamepadOptions (copy)
				if gameSettings.IsUsingGamepadCameraSensitivity then
					if var623 then
						var623:disconnect()
					end
					createGamepadOptions()
				end
			end)
		end)
	elseif gameSettings.IsUsingGamepadCameraSensitivity then
		createGamepadOptions()
	else
		changedConnection = nil
		changedConnection = gameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ line: 4208 ]]
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
			changedConnection = gameSettings.Changed:connect(function(p111) --[[ line: 4240 ]]
				-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
				if p111 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
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
			createCameraModeOptions(not var76 and (userInputService.TouchEnabled or (userInputService.MouseEnabled or userInputService.KeyboardEnabled)))
			
			if gameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				changedConnection = nil
				changedConnection = gameSettings.Changed:connect(function(p112) --[[ line: 4269 ]]
					-- upvalues: gameSettings (copy), changedConnection (write), createCameraInvertedOptions (ref)
					if p112 == "IsUsingCameraYInverted" and gameSettings.IsUsingCameraYInverted then
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
	
	if var45 then
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
	if var83_1 then
		createMicroProfilerOptions()
	end
	if var76 and getAppFeaturePolicies().getSupportsOverscan() then
		createOverscanOption()
	end
	if showAntiHarassmentSettings and fFlagBadgeVisibilitySettingEnabled then
		spawn(function() --[[ line: 3073 ]]
			-- upvalues: playerPermissionsModule (copy), localPlayer (copy), robloxTranslatorModule (copy), updateVisibilitySettingsCopy (copy), gameSettingsTab (ref), utilityModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), gameSettings (copy)
			local var497, var498, var499 = utilityModule:AddNewRow(gameSettingsTab, if updateVisibilitySettingsCopy then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges"), "Selector", {
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Hide"),
				robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Show")
			}, if playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(localPlayer) then 1 else 2, nil, robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.PeoplesNames"))
			gameSettingsTab.badgeVisibleRow = var497
			gameSettingsTab.badgeVisibleFrame = var498
			gameSettingsTab.badgeVisibleSelector = var499
			gameSettingsTab.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			gameSettingsTab.badgeVisibleSelector.IndexChanged:connect(function(p113) --[[ line: 3087 ]]
				-- upvalues: gameSettings (copy), playerPermissionsModule (copy), localPlayer (copy)
				gameSettings.BadgeVisible = p113 == 2
				playerPermissionsModule.SetPlayerInExperienceNameEnabled(localPlayer, p113 == 1)
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
	createDeveloperConsoleOption()
	getHasGuiHidingPermissionModule(runService:IsStudio(), localPlayer, playerPermissionsModule):andThen(function(p115) --[[ line: 4340 ]]
		-- upvalues: createUiToggleOptions (ref)
		if p115 then
			createUiToggleOptions()
		end
	end):catch(function(p114) --[[ line: 4345 ]]
		warn(p114)
	end)
	var118 = true
	
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
	local _ = function() --[[ line: 4414 | named "staticFeedbackEntryPointChecksPassed" ]]
		-- upvalues: runService (copy), enableTFFeedbackModeEntryCheck (copy), var76 (copy)
		return if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false else enableTFFeedbackModeEntryCheck and var76
	end
	
	function gameSettingsTab.OpenSettingsPage() --[[ line: 4430 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), updateAudioOptions (ref), soundService (copy), var152 (write), gameSettings (copy), getFFlagSelfViewCameraSettings (copy), updateCameraDevices (ref), videoCaptureService (copy), var153 (write), updateUiToggleSelection (ref), var17 (copy), var55 (copy), themeModule (copy), var54 (copy), fFlagIEMFocusNavToButtons (copy), getLastValueChangerFrame (copy), fFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		gameSettingsTab.PageOpen = true
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if getFFlagLazyInitiateExperienceLanguageSwitcherModule() and not gameSettingsTab.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and getFFlagEnableLocalesForExperienceLanguageSwitcherModule()) then
			gameSettingsTab.LanguageSwitcherInitialized = true
			experienceLanguageSwitcherInitializerModule(gameSettingsTab, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end
		updateAudioOptions()
		
		if soundService.DeviceListChanged then
			var152 = soundService.DeviceListChanged:Connect(function() --[[ line: 3467 ]]
				-- upvalues: gameSettingsTab (copy), updateAudioOptions (copy)
				if gameSettingsTab.PageOpen then
					updateAudioOptions()
				end
			end)
		end
		gameSettingsTab.startVolume = gameSettings.MasterVolume
		
		if getFFlagSelfViewCameraSettings() and gameSettingsTab.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
			updateCameraDevices()
			
			if videoCaptureService.DevicesChanged then
				var153 = videoCaptureService.DevicesChanged:Connect(function() --[[ line: 3477 ]]
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
				gameSettingsTab.toggleFeedbackModeText.Text = var55
			else
				gameSettingsTab.toggleFeedbackModeButton.Active = false
				gameSettingsTab.toggleFeedbackModeButton.Enabled.Value = false
				gameSettingsTab.toggleFeedbackModeText.TextColor3 = themeModule.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				gameSettingsTab.toggleFeedbackModeText.Text = var54
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
	
	function gameSettingsTab.CloseSettingsPage() --[[ line: 4497 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), soundService (copy), var152 (write), getFFlagEnableCrossExpVoice (copy), var161 (write), getFFlagSelfViewCameraSettings (copy), videoCaptureService (copy), var153 (write), var164 (write), default_2 (copy)
		gameSettingsTab.PageOpen = false
		
		if isInExperienceUIVREnabled and isSpatial() then return end
		if soundService.DeviceListChanged and var152 then
			var152:Disconnect()
		end
		if getFFlagEnableCrossExpVoice() and var161 then
			var161()
		end
		if getFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and videoCaptureService.DevicesChanged and var153 then
				var153:Disconnect()
				var153 = nil
			end
			if var164 then
				var164:disconnect()
				var164 = nil
			end
		end
		if game:GetEngineFeature("VoiceChatSupported") and gameSettingsTab.VoiceChatOptionsEnabled and (gameSettingsTab.startVolume ~= nil and gameSettingsTab.startVolume > 0) then
			default_2:CheckAndShowNotAudiblePrompt()
		end
	end
	
	function isLangaugeSelectionDropdownEnabled() --[[ line: 4530 ]]
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
	
	function gameSettingsTab.SetHub(_, p116) --[[ line: 4553 ]]
		-- upvalues: gameSettingsTab (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), getFFlagEnableLocalesForExperienceLanguageSwitcherModule (copy), getFFlagLazyInitiateExperienceLanguageSwitcherModule (copy), experienceLanguageSwitcherInitializerModule (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (ref), getFFlagChatTranslationSettingEnabledModule (copy), getFFlagChatTranslationHoldoutEnabledModule (copy), getFStringChatTranslationLayerNameModule (copy), getChatTranslationLayerData (ref), textChatServiceSettingsSavedEngineFeature (copy), getFFlagChatTranslationNewDefaultsModule (copy), gameSettings (copy), textChatService (copy), getFFlagChatTranslationForceSettingModule (copy), chatTranslationOptionsWithChatLanguageSwitcherInitializerModule (copy), runService (copy), enableTFFeedbackModeEntryCheck (copy), var76 (copy), createFeedbackModeOptions (ref)
		gameSettingsTab.HubRef = p116
		
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
					pcall(function() --[[ line: 4591 ]]
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
		if if runService:IsStudio() then false elseif game:GetEngineFeature("CaptureModeEnabled") == false then false elseif enableTFFeedbackModeEntryCheck and var76 then false else true then
			createFeedbackModeOptions()
		end
	end
	
	return gameSettingsTab
end)()