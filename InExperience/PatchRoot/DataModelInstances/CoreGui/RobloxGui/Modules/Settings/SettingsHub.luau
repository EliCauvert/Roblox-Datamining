local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var3 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local playersService = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local telemetryService = game:GetService("TelemetryService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local var10 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local roactModule = require(corePackagesService.Packages.Roact)
local cryoModule = require(corePackagesService.Packages.Cryo)
local otterModule = require(corePackagesService.Packages.Otter)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local traversal = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local portalWithFoundationStylelinkModule = require(script.Parent.Components.PortalWithFoundationStylelink)
local inExperienceMenuReactModule = require(script.Parent.InExperienceMenuReact)
local inExperienceMenuReactPageModule = require(script.Parent.Pages.InExperienceMenuReactPage)
local reactPageSignalModule = require(script.Parent.ReactPageSignal)
local utilsModule = require(script.Parent.Integrations.Utils)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local perfUtilsModule = require(robloxGui.Modules.Common.PerfUtils)
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local isSubjectToDesktopPolicies = require(corePackagesService.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local switchTabHint = require(robloxGui.Modules.Settings.Components.TabHeader).SwitchTabHint
local traversalHistoryMenu = require(robloxGui.Modules.Settings.Components.Traversal).TraversalHistoryMenu
local menuBackButtonModule = require(robloxGui.Modules.Settings.Components.MenuBackButton)
local menuFrontButtonModule = require(robloxGui.Modules.Settings.Components.MenuFrontButton)
local menuButtonsContainerModule = require(robloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local roactAppExperimentModule = require(corePackagesService.Packages.RoactAppExperiment)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local capturesPolicy = require(corePackagesService.Workspace.Packages.CapturesInExperience).CapturesPolicy
local inExperienceCapabilities = require(corePackagesService.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local getCamMicPermissionsModule = require(coreGuiService.RobloxGui.Modules.Settings.getCamMicPermissions)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local stores = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Stores
local signalsModule = require(corePackagesService.Packages.Signals)
local createSignal = signalsModule.createSignal
local appStyleProvider = require(corePackagesService.Packages.UIBlox).App.Style.AppStyleProvider
local dark = require(corePackagesService.Packages.UIBlox).App.Style.Constants.ThemeName.Dark
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local themeModule = require(script.Parent.Theme)
local SETTINGS_SHIELD = themeModule.color("SETTINGS_SHIELD", Color3.new(0.160784313725, 0.160784313725, 0.160784313725))
local SETTINGS_SHIELD_TRANSPARENCY = themeModule.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2)
local SHIELD_INACTIVE_POSITION = themeModule.SHIELD_INACTIVE_POSITION
local settingsHubCursorOverride = symbol.named("SettingsHubCursorOverride")
local var38 = if var10 then 32 elseif utilityModule:IsSmallTouchScreen() then 24 else 26
local checkLeaveGameUpsellCooldown = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300)
local getServerChannelRetries = game:DefineFastInt("GetServerChannelRetries", 10)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local flagsModule = require(script.Parent.Flags)
local fFlagIEMFocusNavPeoplePageToButtons = sharedFlagsModule.FFlagIEMFocusNavPeoplePageToButtons
local t = {
	EngineFeatureRbxAnalyticsServiceExposePlaySessionId = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId"),
	EngineFeatureTeleportHistoryButtons = game:GetEngineFeature("TeleportHistoryButtons"),
	EngineFeaturePlayerScriptStatusProperty = game:GetEngineFeature("PlayerScriptStatusProperty"),
	FFlagRemoveRecordPage = game:DefineFastFlag("RemoveRecordPage", false),
	FFlagPreventHiddenSwitchPage = game:DefineFastFlag("PreventHiddenSwitchPage", false),
	FFlagLuaEnableGameInviteModalSettingsHub = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false),
	FFlagFixDisableTopPaddingError = game:DefineFastFlag("FixDisableTopPaddingError", false),
	GetFFlagLuaInExperienceCoreScriptsGameInviteUnification = require(robloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification),
	FFlagEnableInGameMenuDurationLogger = require(robloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)(),
	isNewInGameMenuEnabled = require(robloxGui.Modules.isNewInGameMenuEnabled),
	GetFFlagRemoveAssetVersionEndpoint = require(robloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint),
	GetFFlagNewEventIngestPlayerScriptsDimensions = require(robloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions),
	GetFFlagReportAbuseMenuEntrypointAnalytics = require(robloxGui.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics),
	GetFFlagEnableLeaveGameUpsellEntrypoint = require(robloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint),
	GetFStringInExperienceMenuIXPLayer = require(robloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer),
	GetFStringExitModalIXPLayer = require(robloxGui.Modules.Settings.Flags.GetFStringExitModalIXPLayer),
	GetFStringInExperienceMenuIXPVar = require(robloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPVar),
	FFlagRelocateMobileMenuButtons = require(robloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons),
	FIntRelocateMobileMenuButtonsVariant = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant),
	FFlagMenuButtonsMountWithIEM = require(robloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM),
	FFlagSpatialUIFixMenuPanelChatExclusive = require(robloxGui.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive),
	FFlagRemoveLoadingTimeout = require(robloxGui.Modules.Flags.FFlagRemoveLoadingTimeout),
	FFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav,
	ChromeEnabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled(),
	FFlagRespawnChromeShortcutTelemetry = require(robloxGui.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry),
	FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"),
	isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled,
	InExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP,
	FFlagAddSwitchTabHintsToIEM = sharedFlagsModule.FFlagAddSwitchTabHintsToIEM,
	GetFStringGameInviteMenuLayer = sharedFlagsModule.GetFStringGameInviteMenuLayer,
	GetFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience,
	GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = sharedFlagsModule.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints,
	GetFFlagDisplayServerChannel = sharedFlagsModule.GetFFlagDisplayServerChannel,
	FFlagSettingsHubIndependentBackgroundVisibility = sharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility(),
	GetFFlagPackagifySettingsShowSignal = sharedFlagsModule.GetFFlagPackagifySettingsShowSignal,
	FFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls,
	FFlagIEMFocusNavToButtons = sharedFlagsModule.FFlagIEMFocusNavToButtons,
	FFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav,
	FFlagIEMFocusNavSupportNewButtons = flagsModule.FFlagIEMFocusNavSupportNewButtons,
	FFlagIEMResumeButtonPressBugfix = sharedFlagsModule.FFlagIEMResumeButtonPressBugfix,
	FFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode,
	FIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant,
	FFlagInExperienceReportClosingBugfix = sharedFlagsModule.FFlagInExperienceReportClosingBugfix,
	FFlagEnableSettingsHubUIDelegateRollout = sharedFlagsModule.FFlagEnableSettingsHubUIDelegateRollout,
	FFlagAddIEMProfilePage = sharedFlagsModule.FFlagAddIEMProfilePage,
	FFlagFixSpatialUICaptures = sharedFlagsModule.FFlagFixSpatialUICaptures,
	FFlagVoiceRewarmTelemetry = sharedFlagsModule.FFlagVoiceRewarmTelemetry,
	FFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton,
	FFlagAddTraversalHistory = traversal.Flags.FFlagAddTraversalHistory,
	FFlagCreateInExperienceMenuReact = flagsModule.FFlagCreateInExperienceMenuReact,
	FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false),
	FFlagHelpPageIXPExposure = helpPageModule.Flags.FFlagHelpPageIXPExposure,
	FStringHelpPageIXPLayer = helpPageModule.Flags.FStringHelpPageIXPLayer,
	FFlagAddAbilityToDisableIGMScroll = sharedFlagsModule.FFlagAddAbilityToDisableIGMScroll,
	FFlagFixDisabledScrollOnIos = game:DefineFastFlag("FixDisabledScrollOnIos", false),
	FFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet,
	FFlagSideSheetAndroidBack = game:DefineFastFlag("SideSheetAndroidBack", false),
	FFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration,
	FFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet,
	FFlagImprovePageTitleCloseButton = game:DefineFastFlag("ImprovePageTitleCloseButton", false),
	FFlagIGMSelectionGroup = game:DefineFastFlag("IGMSelectionGroup", false),
	FFlagRemoveExitModal = require(robloxGui.Modules.Settings.Flags.FFlagRemoveExitModal),
	FFlagEnableExitModalExposure = game:DefineFastFlag("EnableExitModalExposure", false)
}
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local contentProviderService = game:GetService("ContentProvider")
local starterGuiService = game:GetService("StarterGui")
local starterPlayerService = game:GetService("StarterPlayer")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local gameSettings = UserSettings().GameSettings
local experienceMenuSessionManagerInstance = require(corePackagesService.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance
local var55 = nil
pcall(function() --[[ line: 199 ]]
	-- upvalues: var55 (write)
	var55 = game:GetService("PlatformService")
end)
local var56 = nil
pcall(function() --[[ line: 202 ]]
	-- upvalues: var56 (write)
	var56 = game:GetService("PlatformFriendsService")
end)
local var57 = nil
spawn(function() --[[ line: 206 ]]
	-- upvalues: var57 (write), robloxReplicatedStorageService (ref)
	var57 = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999)
end)
local var58 = nil

if t.GetFFlagDisplayServerChannel() then
	spawn(function() --[[ line: 212 ]]
		-- upvalues: var58 (write), robloxReplicatedStorageService (ref)
		var58 = robloxReplicatedStorageService:WaitForChild("GetServerChannel", 1e999)
	end)
end
local var59 = userInputService.PreferredInput == Enum.PreferredInput.Touch
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local platform = userInputService:GetPlatform()
local baseUrl = contentProviderService.BaseUrl
local var61 = not string.find(baseUrl, "www.roblox.com")
local devConsoleMasterModule = require(robloxGui.Modules.DevConsoleMaster)
local var63 = nil
local var64 = false
local var65 = nil
local var66 = nil
local settingsFullScreenTitleBarModule = require(robloxGui.Modules.Settings.Components.SettingsFullScreenTitleBar)
local menuLeaveGameTelemetryConfigModule = require(robloxGui.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig)
local menuResetCharacterTelemetryConfigModule = require(robloxGui.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig)
local menuResumeTelemetryConfigModule = require(robloxGui.Modules.Settings.Analytics.MenuResumeTelemetryConfig)
local reactPageAnalyticsModule = require(robloxGui.Modules.Settings.Analytics.ReactPageAnalytics)
local gameInviteAnalytics = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalytics
local _ = nil
local gameInviteModalManager = nil
local gameInviteInviteExperimentVariant = nil
local gameInviteConstants = nil

if t.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
	local gameInviteModule = require(corePackagesService.Workspace.Packages.GameInvite)
	gameInviteModalManager = gameInviteModule.GameInviteModalManager
	gameInviteInviteExperimentVariant = gameInviteModule.GameInviteInviteExperimentVariant
	gameInviteConstants = gameInviteModule.GameInviteConstants
end
local capturesAppModule = require(robloxGui.Modules.Captures.CapturesApp)
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local var75 = cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local settingsHubRaceConditionFix = game:DefineFastFlag("SettingsHubRaceConditionFix", false)
local fixReportButtonCutOff = game:DefineFastFlag("FixReportButtonCutOff", false)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local var80 = if t.GetFFlagPackagifySettingsShowSignal() then require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil
local var81 = if t.GetFFlagPackagifySettingsShowSignal() then require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil
local t_1 = { frequency = 4, dampingRatio = 1 }
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
local getSideSheetVisibility = inExperienceSideSheetModule.getSideSheetVisibility
local _ = require(robloxGui.Modules.Settings.ReactPageFactory)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local fFlagLocalizeVersionLabels = t.FFlagLocalizeVersionLabels or var75
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function _(p0, p1) --[[ line: 297 | named "tryTranslate" ]]
	-- upvalues: robloxTranslatorModule (ref)
	if not robloxTranslatorModule then
		return p1
	end
	local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, p0)
	
	return if ok then status else p1
end

local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local guiInset, _ = guiService:GetGuiInset()
local uDim2 = UDim2.new(0, 0, 0, -guiInset.Y)
local uDim2_1 = UDim2.new(1, 0, 1, guiInset.Y)

local function GetCorePackagesLoaded(p2) --[[ line: 313 ]]
	local corePackagesService = game:GetService("CorePackages")
	
	for i, v in pairs(p2) do
		if not corePackagesService:FindFirstChild(v) then
			return false
		end
	end
	return true
end

local _ = function() --[[ line: 323 | named "GetServerVersionBlocking" ]]
	-- upvalues: var65 (write), var57 (write)
	if var65 then
		return var65
	elseif not var57 then
		repeat
			wait()
		until var57
	end
	var65 = var57:InvokeServer()
	
	return var65
end

local function GetServerChannelBlocking() --[[ line: 336 ]]
	-- upvalues: var66 (write), getServerChannelRetries (ref), var58 (write)
	if var66 then
		return var66
	end
	local var97 = getServerChannelRetries
	
	if not var58 then
		repeat
			task.wait()
			var97 -= 1
		until var58 or var97 == 0
	end
	if var58 then
		var66 = var58:InvokeServer()
	else
		warn("GetServerChannelRemote not available")
		var66 = "Unknown"
	end
	return var66
end

local _ = function() --[[ line: 357 | named "GetPlaceVersionText" ]]
	-- upvalues: t (ref), httpRbxApiService (ref), httpService (ref)
	if t.GetFFlagRemoveAssetVersionEndpoint() then
		return game.PlaceVersion
	end
	local placeVersion = game.PlaceVersion
	pcall(function() --[[ line: 364 ]]
		-- upvalues: httpRbxApiService (copy), httpService (copy), placeVersion (write)
		placeVersion = string.format("%s (Latest: %d)", placeVersion, httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber)
	end)
	
	return placeVersion
end

local function createReactPage(p3) --[[ line: 374 ]]
	-- upvalues: create (ref)
	return create("Frame")({
		Name = "InExperienceMenuPage",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.fromScale(0, 0),
		Parent = p3
	})
end

local function CreateSettingsHub() --[[ line: 385 ]]
	-- upvalues: t (ref), robloxGui (ref), var80 (ref), utilityModule (ref), var81 (ref), createSignal (ref), constantsModule_1 (ref), stores (ref), rbxAnalyticsService (ref), reactPageAnalyticsModule (ref), createReactPage (ref), themeModule (ref), contextActionService (ref), localizationService (ref), localization (ref), var10 (ref), create (ref), var59 (ref), userInputService (ref), platform (ref), default (ref), getCamMicPermissionsModule (ref), otterModule (ref), robloxTranslatorModule (ref), settingsHubRaceConditionFix (ref), starterGuiService (ref), inExperienceSideSheetModule (ref), telemetryService (ref), menuLeaveGameTelemetryConfigModule (ref), menuResetCharacterTelemetryConfigModule (ref), constantsModule (ref), menuResumeTelemetryConfigModule (ref), reactRobloxModule (ref), reactModule (ref), menuButtonsContainerModule (ref), flagsModule (ref), guiService (ref), uDim2_1 (ref), uDim2 (ref), SHIELD_INACTIVE_POSITION (ref), SETTINGS_SHIELD_TRANSPARENCY (ref), SETTINGS_SHIELD (ref), var38 (ref), fFlagLocalizeVersionLabels (ref), GetServerChannelBlocking (ref), var65 (write), var57 (write), runService (ref), httpRbxApiService (ref), httpService (ref), cachedPolicyServiceModule (ref), baseUrl (ref), var61 (ref), starterPlayerService (ref), playersService (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), roactModule (ref), roactAppExperimentModule (ref), IXPService (ref), appStyleProvider (ref), dark (ref), menuBackButtonModule (ref), menuFrontButtonModule (ref), appFonts (ref), t_1 (ref), corePackagesService (ref), inExperienceAppChatModalModule (ref), inExperienceCapabilities (ref), foundationProvider (ref), foundationModule (ref), utilsModule (ref), switchTabHint (ref), isSubjectToDesktopPolicies (ref), settingsFullScreenTitleBarModule (ref), VRService (ref), gameSettings (ref), devConsoleMasterModule (ref), fixReportButtonCutOff (ref), cryoModule (ref), IXPServiceWrapper (ref), experienceMenuSessionManagerInstance (ref), reactPageSignalModule (ref), mouseIconOverrideService (ref), settingsHubCursorOverride (ref), checkLeaveGameUpsellCooldown (ref), tweenService (ref), perfUtilsModule (ref), var63 (write), chatSelectorModule (ref), fFlagEnableNewBackpack (ref), var3 (ref), var64 (write), gameInviteInviteExperimentVariant (write), var56 (write), var55 (write), gameInviteModalManager (write), gameInviteConstants (write), GetCorePackagesLoaded (ref), gameInviteAnalytics (ref), capturesPolicy (ref), isSpatial (ref), capturesAppModule (ref), getSideSheetVisibility (ref), toggleSideSheet (ref), leaveGameModule (ref), signalsModule (ref), portalWithFoundationStylelinkModule (ref), traversalHistoryMenu (ref), inExperienceMenuReactModule (ref), inExperienceMenuReactPageModule (ref)
	local t_2 = {
		Visible = false,
		Active = true,
		Pages = { CurrentPage = nil, PageTable = {} },
		MenuStack = {},
		TabHeaders = {},
		BottomBarButtons = {},
		BottomBarButtonsComponents = {},
		ResizedConnection = nil,
		BackBarVisibleConnection = nil
	}
	
	if t.EngineFeatureTeleportHistoryButtons then
		t_2.FrontBarVisibleConnection = nil
	end
	t_2.PreferredTransparencyChangedConnection = nil
	t_2.TabConnection = nil
	t_2.LeaveGamePage = require(robloxGui.Modules.Settings.Pages.LeaveGame)
	t_2.LeaveGameUpsellPage = if t.GetFFlagEnableLeaveGameUpsellEntrypoint() then require(robloxGui.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil
	t_2.ResetCharacterPage = require(robloxGui.Modules.Settings.Pages.ResetCharacter)
	t_2.SettingsShowSignal = if t.GetFFlagPackagifySettingsShowSignal() then var80 else utilityModule:CreateSignal()
	t_2.CurrentPageSignal = if t.GetFFlagPackagifySettingsShowSignal() then var81.CreateSignal() else utilityModule:CreateSignal()
	local var99, var100 = createSignal(false)
	t_2.showBottomBarSignal = var99
	t_2.setShowBottomBarSignal = var100
	t_2.OpenStateChangedCount = 0
	t_2.BottomButtonFrame = nil
	
	if t.FFlagRelocateMobileMenuButtons then
		t_2.addMenuKeyBindings = nil
		t_2.removeMenuKeyBindings = nil
	end
	if t.FFlagIEMFocusNavSupportNewButtons then
		t_2.ResumeMenuButton = nil
	end
	t_2.hasMicPermissions = false
	
	if t.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		t_2.checkedUpsell = false
		t_2.leaveGameUpsellProp = constantsModule_1.PHONE_UPSELL_VALUE_PROP.None
		t_2.sessionStartTime = os.time()
	end
	t_2.isFetchingMicPermissions = true
	
	if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 then
		t_2.uiLessStore = stores.GetUILessStore(false)
	end
	t_2.PageTitleLabel = nil
	t_2.PageTitleCloseButton = nil
	t_2.PageTitleHeader = nil
	t_2.isMuted = nil
	t_2.lastVoiceRecordingIndicatorTextUpdated = nil
	t_2.playSessionId = ""
	
	if t.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
		t_2.playSessionId = rbxAnalyticsService:GetPlaySessionId()
	end
	t_2.reactPageAnalytics = reactPageAnalyticsModule.new()
	local var101 = nil
	local var102 = nil
	local poppedMenu = Instance.new("BindableEvent")
	poppedMenu.Name = "PoppedMenu"
	t_2.PoppedMenu = poppedMenu.Event
	t_2.ReactPage = nil
	
	if t.FFlagCreateInExperienceMenuReact then
		t_2.ReactPage = createReactPage()
	end
	local text, text_1, text_2
	local function _(p4) --[[ line: 457 | named "shouldShowHubBar" ]]
		-- upvalues: t_2 (ref), t (copy)
		p4 = p4 or t_2.Pages.CurrentPage
		
		return if t.FFlagEnableSideSheet then p4.ShouldShowHubBar == true else p4.ShouldShowBottomBar == true
	end
	
	local _ = function(p5) --[[ line: 462 | named "updatePageTitleHeader" ]]
		-- upvalues: t_2 (ref), t (copy)
		local var160
		p5 = p5 or t_2.Pages.CurrentPage
		
		if t.FFlagEnableSideSheet then
			var160 = p5.ShouldShowHubBar == true
			var160 = nil
		else
			var160 = p5.ShouldShowBottomBar == true
		end
		if var160 and p5.TabHeader then
			t_2.PageTitleLabel.Text = p5.TabHeader.TabLabel.Title.Text
			
			return
		end
		t_2.PageTitleLabel.Text = ""
	end
	
	local _ = function(value) --[[ line: 471 | named "setTabHeaderSelection" ]]
		-- upvalues: t (copy)
		if not t.FFlagIEMTabFocusNav then return end
		local tabHeader = value:GetTabHeader()
		
		if not tabHeader then return end
		for i, v in value.FirstSelectableObjects do
			v.NextSelectionUp = tabHeader
			tabHeader.NextSelectionDown = v
		end
	end
	
	local _ = function() --[[ line: 485 | named "updateTabHeaderWrapping" ]]
		-- upvalues: t (copy), t_2 (ref)
		if not t.FFlagIEMTabFocusNav then return end
		for i, v in t_2.TabHeaders do
			v.NextSelectionLeft = nil
			v.NextSelectionRight = nil
		end
		local tabHeadersCount = #t_2.TabHeaders
		
		if tabHeadersCount < 2 then
			return
		end
		t_2.TabHeaders[1].NextSelectionLeft = t_2.TabHeaders[tabHeadersCount]
		t_2.TabHeaders[tabHeadersCount].NextSelectionRight = t_2.TabHeaders[1]
	end
	
	local function setBottomBarSelection(value) --[[ line: 497 ]]
		-- upvalues: t_2 (ref), t (copy)
		if not t_2.BottomButtonFrame and t.FFlagIEMFocusNavToButtons and not value and (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2) then return end
		if t_2.ResumeButton then
			value.PageNextSelectionDown = t_2.ResumeButton
		elseif t.FFlagIEMFocusNavSupportNewButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.ResumeMenuButton then
			value.PageNextSelectionDown = t_2.ResumeMenuButton
		end
		if t.FFlagIEMTabFocusNav and t_2.BottomButtonFrame then
			local tabHeader = value:GetTabHeader()
			local resumeButton = t_2.ResumeButton or t_2.ResumeMenuButton
			
			if resumeButton then
				for i, v in pairs(t_2.Pages.PageTable) do
					local tabHeader_1 = i:GetTabHeader()
					
					if tabHeader_1 then
						tabHeader_1.NextSelectionUp = resumeButton
					end
				end
			end
			for i, v in t_2.BottomButtonFrame:GetDescendants() do
				if v:IsA("GuiObject") and v.Selectable then
					v.NextSelectionDown = tabHeader
				end
			end
		end
		for i, v in value.LastSelectableObjects do
			t_2.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
			t_2.BottomButtonFrame.NextSelectionUp = v
			v.NextSelectionDown = value.PageNextSelectionDown
			local leaveGameButton = t_2.LeaveGameButton
			
			if leaveGameButton then
				leaveGameButton.NextSelectionUp = v
			end
			if t.FFlagIEMFocusNavSupportNewButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 then
				for i_1, v_1 in t_2.BottomButtonFrame:GetDescendants() do
					if v_1:IsA("GuiObject") and v_1.Selectable then
						v_1.NextSelectionUp = v
					end
				end
			end
		end
		if #value.LastSelectableObjects < 1 then
			t_2.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			t_2.BottomButtonFrame.NextSelectionUp = nil
			local leaveGameButton = t_2.LeaveGameButton
			
			if leaveGameButton then
				leaveGameButton.NextSelectionUp = nil
			end
			if t.FFlagIEMFocusNavSupportNewButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 then
				for i_1, v_1 in t_2.BottomButtonFrame:GetDescendants() do
					if v_1:IsA("GuiObject") and v_1.Selectable then
						v_1.NextSelectionUp = if t.FFlagIEMTabFocusNav then value:GetTabHeader() else nil
					end
				end
			end
		end
	end
	
	local function shouldShowBottomBar(p6) --[[ line: 566 ]]
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), themeModule (copy)
		p6 = p6 or t_2.Pages.CurrentPage
		
		if (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2) and ((utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar()) then
			return false
		end
		p6 = false
		
		if p6 ~= nil then
			p6 = p6.ShouldShowBottomBar == true
		end
		return p6
	end
	
	local _ = function(p7) --[[ line: 580 | named "shouldDisableDefaultScroll" ]]
		-- upvalues: t_2 (ref)
		p7 = p7 or t_2.Pages.CurrentPage
		p7 = false
		
		if p7 ~= nil then
			p7 = p7.ShouldDisableDefaultScroll == true
		end
		return p7
	end
	
	local function setBottomBarBindings() --[[ line: 585 ]]
		-- upvalues: t_2 (ref), t (copy), contextActionService (copy)
		if not t_2.Visible then return end
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			for i = 1, #t_2.BottomBarButtons do
				local var168 = t_2.BottomBarButtons[i]
				local var169 = var168[2]
				contextActionService:BindCoreAction(var168[1], var169[1], false, unpack(var169[2]))
			end
		elseif t_2.addMenuKeyBindings then
			t_2.addMenuKeyBindings()
		end
		if t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Visible = true
		end
	end
	
	local function removeBottomBarBindings(p8) --[[ line: 608 ]]
		-- upvalues: t (copy), t_2 (ref), contextActionService (copy)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			for i, v in pairs(t_2.BottomBarButtons) do
				contextActionService:UnbindCoreAction(v[1])
			end
		elseif t_2.removeMenuKeyBindings then
			t_2.removeMenuKeyBindings()
		end
		local openStateChangedCount = t_2.OpenStateChangedCount
		
		local var170 = function() --[[ line: 620 ]]
			-- upvalues: t_2 (copy), openStateChangedCount (ref)
			if t_2.OpenStateChangedCount == openStateChangedCount and t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Visible = false
			end
		end
		
		if p8 then
			delay(p8, var170)
			
			return
		elseif t_2.OpenStateChangedCount == openStateChangedCount and t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Visible = false
		end
	end
	
	local _ = function(p9, p10, p11) --[[ line: 633 | named "updateButtonPosition" ]]
		-- upvalues: t (copy), t_2 (ref)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local var171 = t_2.BottomButtonFrame:FindFirstChild(p9 .. "ButtonButton", true)
			
			if not var171 then return end
			var171.Position = p10
			var171.Size = p11
		end
	end
	
	local var108 = localization.new(localizationService.RobloxLocaleId)
	
	local function hideVoiceUx() --[[ line: 649 ]]
		-- upvalues: t_2 (ref), var10 (copy), themeModule (copy), t (copy)
		local muteButtonButton = t_2.MuteButtonButton
		
		if muteButtonButton then
			muteButtonButton.Visible = false
			muteButtonButton:Destroy()
		end
		local var172 = if var10 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, themeModule.LargeButtonHeight)
		
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local uDim2 = UDim2.new(0.5, if var10 then -160 else -130, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local leaveGameButtonButton = t_2.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true)
				
				if leaveGameButtonButton then
					leaveGameButtonButton.Position = uDim2
					leaveGameButtonButton.Size = var172
				end
			end
			local uDim2_1 = UDim2.new(0.5, if var10 then -550 else -400, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local resetCharacterButtonButton = t_2.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true)
				
				if resetCharacterButtonButton then
					resetCharacterButtonButton.Position = uDim2_1
					resetCharacterButtonButton.Size = var172
				end
			end
			local uDim2_2 = UDim2.new(0.5, if var10 then 200 else 140, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local resumeButtonButton = t_2.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true)
				
				if not resumeButtonButton then return end
				resumeButtonButton.Position = uDim2_2
				resumeButtonButton.Size = var172
			end
		end
	end
	
	local function addBottomBarButtonOld(p12, p13, p14, p15, p16, p17, p18, p19) --[[ line: 665 ]]
		-- upvalues: t (copy), themeModule (copy), var10 (copy), t_2 (ref), utilityModule (copy), create (copy), var59 (copy), userInputService (copy), platform (copy)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local text = p12 .. "Button"
			local text_1 = p12 .. "Text"
			local var181 = t_2
			local var182, var183 = utilityModule:MakeStyledButton(p12 .. "Button", p13, if var10 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, themeModule.LargeButtonHeight), p17, nil, t_2)
			var181[text] = var182
			t_2[text_1] = var183
			create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Parent = t_2[text]
			})
			create("UIPadding")({ PaddingLeft = UDim.new(0.025, 0), Parent = t_2[text] })
			t_2[text_1].Size = UDim2.new(0, 0, 1, 0)
			create("UIFlexItem")({ FlexMode = Enum.UIFlexMode.Grow, Parent = t_2[text_1] })
			t_2[text].Position = p16
			t_2[text].Parent = t_2.BottomButtonFrame
			
			if var10 then
				t_2[text].ImageTransparency = 1
			end
			t_2[text_1].FontSize = Enum.FontSize.Size24
			local var184 = nil
			
			if not var59 then
				local text_2 = p12 .. "Hint"
				local _ = ""
				local var186 = if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) or platform == Enum.Platform.XBoxOne then p14 else p15
				var184 = create("ImageLabel")({
					BackgroundTransparency = 1,
					LayoutOrder = -1,
					Name = text_2,
					ZIndex = t_2.Shield.ZIndex + 2,
					Image = var186,
					Parent = t_2[text]
				})
				
				if var186 == p15 then
					var184.ImageColor3 = themeModule.color("WhiteButtonText", Color3.new(1, 1, 1))
					var184.ImageTransparency = themeModule.transparency("WhiteButtonText", 1)
				end
				var184.Position = UDim2.new(0, 9, 0.5, 0)
				var184.Size = UDim2.new(0, 33, 0, 33)
				var184.AnchorPoint = Vector2.new(0, 0.5)
			end
			if var10 then
				t_2[text_1].FontSize = Enum.FontSize.Size36
			end
			userInputService.InputBegan:connect(function(p20) --[[ line: 738 ]]
				-- upvalues: var184 (write), p14 (ref), p15 (ref)
				if p20.UserInputType == Enum.UserInputType.Gamepad1 or p20.UserInputType == Enum.UserInputType.Gamepad2 or (p20.UserInputType == Enum.UserInputType.Gamepad3 or p20.UserInputType == Enum.UserInputType.Gamepad4) then
					if var184 then
						var184.Image = p14
						
						return
					end
				elseif p20.UserInputType == Enum.UserInputType.Keyboard and var184 then
					var184.Image = p15
				end
			end)
			t_2.BottomBarButtons[#t_2.BottomBarButtons + 1] = {
				text,
				{
					function(_, p21, _) --[[ line: 761 ]]
						-- upvalues: p19 (ref)
						if p21 == Enum.UserInputState.Begin then
							p19()
						end
					end,
					p18
				}
			}
		end
	end
	
	local var111 = if var10 then "@2x" else ""
	local _ = nil
	local _ = nil
	local _ = nil
	
	if t.FFlagEnableConsoleExpControls then
		text = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		text_1 = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
		text_2 = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY)
	else
		text = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. var111 .. ".png"
		text_1 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. var111 .. ".png"
		text_2 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. var111 .. ".png"
	end
	local buttonStartImageForKeyCode = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	local var116 = false
	local var117 = nil
	
	local function setupVoiceListeners() --[[ line: 795 ]]
		-- upvalues: var116 (write), t_2 (ref), default (copy), getCamMicPermissionsModule (copy), var117 (write), otterModule (copy), robloxTranslatorModule (copy), hideVoiceUx (ref)
		if game:GetEngineFeature("VoiceChatSupported") and not var116 then
			var116 = true
			
			local function showUI() --[[ line: 800 ]]
				-- upvalues: t_2 (copy), default (copy), getCamMicPermissionsModule (copy), var117 (copy), otterModule (copy), robloxTranslatorModule (copy)
				t_2.VoiceRecordingText.Visible = true
				default:getService().StateChanged:Connect(function(_, p22) --[[ line: 803 ]]
					-- upvalues: t_2 (copy)
					if p22 == Enum.VoiceChatState.Joined then
						t_2.VoiceRecordingText.Visible = true
					end
				end)
				default:SetupParticipantListeners()
				getCamMicPermissionsModule(function(p23) --[[ line: 810 ]]
					-- upvalues: t_2 (copy)
					t_2.hasMicPermissions = p23.hasMicPermissions
				end, nil, true, "PermissionsButtons.getPermissions")
				var117 = default.muteChanged.Event:Connect(function(p24) --[[ line: 814 ]]
					-- upvalues: t_2 (copy), otterModule (copy), robloxTranslatorModule (copy)
					t_2.isMuted = p24
					t_2.lastVoiceRecordingIndicatorTextUpdated = tick()
					t_2.voiceRecordingIndicatorTextMotor:setGoal(otterModule.instant(0))
					
					if t_2.isMuted then
						local var189
						local voiceRecordingText = t_2.VoiceRecordingText
						
						if robloxTranslatorModule then
							local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.MicOff")
							var189 = if ok then status else "Mic Off"
						else
							var189 = "Mic Off"
						end
						voiceRecordingText.Text = var189
						
						return
					else
						local var190
						local voiceRecordingText = t_2.VoiceRecordingText
						
						if robloxTranslatorModule then
							local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.MicOnRecording")
							var190 = if ok then status else "Mic On (recording audio)"
						else
							var190 = "Mic On (recording audio)"
						end
						voiceRecordingText.Text = var190
					end
				end)
			end
			
			local function hideUI() --[[ line: 825 ]]
				-- upvalues: t_2 (copy), hideVoiceUx (copy), var117 (copy)
				t_2.VoiceRecordingText.Visible = false
				hideVoiceUx()
				
				if var117 then
					var117:Disconnect()
				end
			end
			
			if default.voiceUIVisible then
				showUI()
			end
			default.showVoiceUI.Event:Connect(showUI)
			default.hideVoiceUI.Event:Connect(hideUI)
		end
	end
	
	if not settingsHubRaceConditionFix then
		setupVoiceListeners()
	end
	local var119 = true
	
	local function setResetEnabled(value) --[[ line: 849 ]]
		-- upvalues: var119 (write), t_2 (ref)
		var119 = value
		
		if t_2.ResetCharacterButton then
			t_2.ResetCharacterButton.Selectable = value
			t_2.ResetCharacterButton.Active = value
			t_2.ResetCharacterButton.Enabled.Value = value
			local resetCharacterHint = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
			
			if resetCharacterHint then
				resetCharacterHint.ImageColor3 = value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
			local resetCharacterButtonTextLabel = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
			
			if resetCharacterButtonTextLabel then
				resetCharacterButtonTextLabel.TextColor3 = value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
		end
	end
	
	local var121 = nil
	
	function t_2.GetRespawnBehaviour(_) --[[ line: 867 ]]
		-- upvalues: t (copy), t_2 (ref), var119 (write), var121 (write)
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			return t_2:GetExperienceControlStore().getCanRespawn(false), t_2:GetExperienceControlStore().getCustomRespawnCallback(false)
		end
		return var119, var121
	end
	
	t_2.RespawnBehaviourChangedEvent = Instance.new("BindableEvent")
	starterGuiService:RegisterSetCore("ResetButtonCallback", function(p25) --[[ line: 877 ]]
		-- upvalues: t_2 (ref), t (copy), var119 (write), setResetEnabled (ref), inExperienceSideSheetModule (copy), var121 (write)
		local var193 = typeof(p25) == "Instance" and p25:IsA("BindableEvent")
		
		if var193 or type(p25) == "boolean" then
			t_2.ResetCharacterPage:SetResetCallback(p25)
		else
			warn("ResetButtonCallback must be set to a BindableEvent or a boolean")
		end
		local var194 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then t_2:GetExperienceControlStore().getCanRespawn(false) else var119
		
		if p25 == false then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCanRespawn(false)
			else
				setResetEnabled(false)
			end
			if t.FFlagEnableSideSheet then
				inExperienceSideSheetModule.setIsRespawnEnabled(false)
			end
		elseif not var194 and (var193 or p25 == true) then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCanRespawn(true)
			else
				setResetEnabled(true)
			end
			if t.FFlagEnableSideSheet then
				inExperienceSideSheetModule.setIsRespawnEnabled(true)
			end
		end
		if var193 then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCustomRespawnCallback(p25)
			else
				var121 = p25
			end
		end
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			t_2.RespawnBehaviourChangedEvent:Fire(t_2:GetExperienceControlStore().getCanRespawn(false), t_2:GetExperienceControlStore().getCustomRespawnCallback(false))
			
			return
		end
		t_2.RespawnBehaviourChangedEvent:Fire(var119, var121)
	end)
	starterGuiService:RegisterGetCore("ResetButtonCallback", function() --[[ line: 918 ]]
		-- upvalues: t_2 (ref)
		local respawnBehaviour, _ = t_2:GetRespawnBehaviour()
		
		return respawnBehaviour
	end)
	local setVisibilityInternal = nil
	local var123, var124 = createSignal(true)
	local var125, var126 = createSignal(nil)
	
	function t_2.GetExperienceControlStore(_) --[[ line: 928 ]]
		-- upvalues: var124 (ref), t_2 (ref), var123 (ref), var125 (ref), var126 (ref), t (copy), constantsModule_1 (copy), telemetryService (copy), menuLeaveGameTelemetryConfigModule (copy), menuResetCharacterTelemetryConfigModule (copy), rbxAnalyticsService (copy), constantsModule (copy), menuResumeTelemetryConfigModule (copy)
		return {
			getCanRespawn = var123,
			getCustomRespawnCallback = var125,
			setCanRespawn = function(p26) --[[ line: 929 ]]
				-- upvalues: var124 (copy), t_2 (copy)
				var124(p26)
				
				if t_2.ResetCharacterButton then
					t_2.ResetCharacterButton.Selectable = p26
					t_2.ResetCharacterButton.Active = p26
					t_2.ResetCharacterButton.Enabled.Value = p26
					local resetCharacterHint = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
					
					if resetCharacterHint then
						resetCharacterHint.ImageColor3 = p26 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
					local resetCharacterButtonTextLabel = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
					
					if resetCharacterButtonTextLabel then
						resetCharacterButtonTextLabel.TextColor3 = p26 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
				end
			end,
			setCustomRespawnCallback = var126,
			onLeaveGame = function(p27) --[[ line: 951 ]]
				-- upvalues: t_2 (copy), t (copy), constantsModule_1 (copy), telemetryService (copy), menuLeaveGameTelemetryConfigModule (copy)
				if not t_2:GetVisibility() then return end
				t_2:AddToMenuStack(t_2.Pages.CurrentPage)
				t_2.HubBar.Visible = false
				
				if t.GetFFlagEnableLeaveGameUpsellEntrypoint() and t_2.leaveGameUpsellProp ~= constantsModule_1.PHONE_UPSELL_VALUE_PROP.None then
					t_2:SwitchToPage(t_2.LeaveGameUpsellPage, false)
				else
					t_2:SwitchToPage(t_2.LeaveGamePage, false, nil, true)
				end
				telemetryService:LogCounter(menuLeaveGameTelemetryConfigModule, { customFields = { source = p27 } })
			end,
			onRespawn = function(p28) --[[ line: 970 ]]
				-- upvalues: var123 (copy), t_2 (copy), telemetryService (copy), menuResetCharacterTelemetryConfigModule (copy)
				if var123(false) then
					t_2:AddToMenuStack(t_2.Pages.CurrentPage)
					t_2.HubBar.Visible = false
					t_2:SwitchToPage(t_2.ResetCharacterPage, false, nil, true)
					telemetryService:LogCounter(menuResetCharacterTelemetryConfigModule, { customFields = { source = p28 } })
					
					return
				end
			end,
			onResume = function(p29) --[[ line: 985 ]]
				-- upvalues: t (copy), t_2 (copy), rbxAnalyticsService (copy), constantsModule (copy), telemetryService (copy), menuResumeTelemetryConfigModule (copy)
				if t.FFlagAddUILessMode then
					t_2:SetVisibility(false, nil, nil, nil, p29)
				else
					t_2:SetVisibility(false)
				end
				if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 and t_2.uiLessStore.getUILessModeEnabled(false) then
					t_2.uiLessStore.setUIVisible(false)
				end
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsResumeGameName, constantsModule.AnalyticsMenuActionName, {
					source = p29,
					playsessionid = t_2.playSessionId,
					universeid = tostring(game.GameId)
				})
				telemetryService:LogCounter(menuResumeTelemetryConfigModule, { customFields = { source = p29 } })
			end
		}
	end
	
	local var127 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then function() --[[ line: 1017 ]]
		-- upvalues: t_2 (ref), reactRobloxModule (copy), reactModule (copy), menuButtonsContainerModule (copy), flagsModule (copy), t (copy), guiService (copy)
		if t_2.BottomButtonFrameRoot then
			return
		end
		local experienceControlStore = t_2:GetExperienceControlStore()
		t_2.BottomButtonFrameRoot = reactRobloxModule.createRoot(t_2.BottomButtonFrame)
		t_2.BottomButtonFrameRoot:render(reactModule.createElement(menuButtonsContainerModule, {
			onLeaveGame = experienceControlStore.onLeaveGame,
			onRespawn = experienceControlStore.onRespawn,
			onResume = experienceControlStore.onResume,
			setAddMenuKeyBindings = function(value) --[[ line: 1029 ]]
				-- upvalues: t_2 (copy)
				t_2.addMenuKeyBindings = value
			end,
			setRemoveMenuKeyBindings = function(value) --[[ line: 1033 ]]
				-- upvalues: t_2 (copy)
				t_2.removeMenuKeyBindings = value
			end,
			getVisibility = function() --[[ line: 1037 ]]
				-- upvalues: t_2 (copy)
				return t_2.GetVisibility()
			end,
			getCanRespawn = experienceControlStore.getCanRespawn,
			currentPageChangeSignal = if flagsModule.FFlagAddTraversalHistoryReactMenuButtons then t_2.CurrentPageSignal else nil,
			setResumeMenuButton = if t.FFlagIEMFocusNavSupportNewButtons then function(p30) --[[ line: 1042 ]]
				-- upvalues: t_2 (copy), t (copy), guiService (copy)
				t_2.ResumeMenuButton = p30
				
				if t.FFlagIEMFocusNavSupportNewButtons and (not guiService.SelectedCoreObject or not guiService.SelectedCoreObject:IsDescendantOf(t_2.Shield)) then
					guiService.SelectedCoreObject = p30
				end
			end else nil
		}))
	end else nil
	local var128 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then function() --[[ line: 1053 ]]
		-- upvalues: t_2 (ref)
		if t_2.BottomButtonFrameRoot then
			t_2.BottomButtonFrameRoot:unmount()
			t_2.BottomButtonFrameRoot = nil
		end
	end else nil
	
	local function createGui() --[[ line: 1061 ]]
		-- upvalues: utilityModule (copy), t_2 (ref), create (copy), uDim2_1 (copy), uDim2 (copy), robloxGui (copy), SHIELD_INACTIVE_POSITION (copy), SETTINGS_SHIELD_TRANSPARENCY (copy), SETTINGS_SHIELD (copy), var38 (copy), t (copy), themeModule (copy), var10 (copy), fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), GetServerChannelBlocking (copy), var65 (copy), var57 (copy), runService (copy), httpRbxApiService (copy), httpService (copy), cachedPolicyServiceModule (copy), baseUrl (copy), var61 (copy), starterPlayerService (copy), playersService (copy), rbxAnalyticsService (copy), constantsModule (copy), createReactPage (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), guiService (copy), getCamMicPermissionsModule (copy), default (copy), roactModule (copy), roactAppExperimentModule (copy), IXPService (copy), appStyleProvider (copy), dark (copy), menuBackButtonModule (copy), menuFrontButtonModule (copy), appFonts (copy), otterModule (copy), t_1 (copy), userInputService (copy), setVisibilityInternal (write), var127 (ref), corePackagesService (copy), inExperienceAppChatModalModule (copy), removeBottomBarBindings (ref), constantsModule_1 (copy), inExperienceCapabilities (copy), addBottomBarButtonOld (ref), text_1 (write), var119 (write), var108 (ref), text_2 (write), buttonStartImageForKeyCode (ref), text (write), reactRobloxModule (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utilsModule (copy), switchTabHint (copy), isSubjectToDesktopPolicies (copy), settingsFullScreenTitleBarModule (copy)
		local var199 = if utilityModule:IsSmallTouchScreen() then 5 else 0
		t_2.ClippingShield = create("Frame")({
			Name = "SettingsClippingShield",
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Visible = true,
			ZIndex = 2,
			Size = uDim2_1,
			Position = uDim2,
			Parent = robloxGui
		})
		t_2.CanvasGroup = create("CanvasGroup")({
			Name = "CanvasGroup",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = t_2.ClippingShield
		})
		t_2.Shield = create("ImageButton")({
			Name = "SettingsShield",
			BorderSizePixel = 0,
			Visible = false,
			Active = true,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0),
			Position = SHIELD_INACTIVE_POSITION,
			BackgroundTransparency = SETTINGS_SHIELD_TRANSPARENCY,
			BackgroundColor3 = SETTINGS_SHIELD,
			Parent = t_2.ClippingShield
		})
		t_2.VRShield = create("Frame")({
			Name = "VRBackground",
			BorderSizePixel = 0,
			Visible = false,
			Parent = t_2.Shield,
			BackgroundColor3 = SETTINGS_SHIELD,
			BackgroundTransparency = SETTINGS_SHIELD_TRANSPARENCY,
			Position = UDim2.new(0, -4, 0, 24),
			Size = UDim2.new(1, 8, 1, -40)
		})
		local coreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
		
		if coreScriptVersionEnabledEngineFeature then
			t_2.VersionContainer = create("ScrollingFrame")({
				Name = "VersionContainer",
				BorderSizePixel = 0,
				AutoLocalize = false,
				ScrollBarThickness = 0,
				ZIndex = 5,
				Visible = false,
				Parent = t_2.Shield,
				CanvasSize = UDim2.new(0, 0, 0, var38),
				BackgroundColor3 = SETTINGS_SHIELD,
				BackgroundTransparency = SETTINGS_SHIELD_TRANSPARENCY,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, var38),
				AnchorPoint = Vector2.new(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X
			})
		else
			t_2.VersionContainer = create("Frame")({
				Name = "VersionContainer",
				BorderSizePixel = 0,
				AutoLocalize = false,
				ZIndex = 5,
				Visible = false,
				Parent = t_2.Shield,
				BackgroundColor3 = SETTINGS_SHIELD,
				BackgroundTransparency = SETTINGS_SHIELD_TRANSPARENCY,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, var38),
				AnchorPoint = Vector2.new(0, 1)
			})
		end
		local var201 = create("UIListLayout")({
			Name = "VersionContainer",
			Parent = t_2.VersionContainer,
			Padding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		local function _(p31) --[[ line: 1171 | named "addSizeToLabel" ]]
			-- upvalues: coreScriptVersionEnabledEngineFeature (ref), var38 (copy)
			p31.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, p31.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
		end
		
		if t.GetFFlagDisplayServerChannel() then
			t_2.ServerChannelLabel = create("TextLabel")({
				Name = "ServerChannelLabel",
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Text = "Server Channel: ...",
				ZIndex = 5,
				Parent = t_2.VersionContainer,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			spawn(function() --[[ line: 1190 ]]
				-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), GetServerChannelBlocking (copy), coreScriptVersionEnabledEngineFeature (ref), var38 (copy)
				local var220 = "Server Channel: "
				
				if fFlagLocalizeVersionLabels then
					if robloxTranslatorModule then
						local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ServerChannel")
						var220 = if ok then status else "Server Channel: "
					else
						var220 = "Server Channel: "
					end
				end
				t_2.ServerChannelLabel.Text = var220 .. GetServerChannelBlocking()
				local serverChannelLabel = t_2.ServerChannelLabel
				serverChannelLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, serverChannelLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
				t_2.ServerChannelLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.ServerChannelLabel.TextFits)
			end)
		end
		t_2.ServerVersionLabel = create("TextLabel")({
			Name = "ServerVersionLabel",
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = "Server Version: ...",
			ZIndex = 5,
			Parent = t_2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function() --[[ line: 1214 ]]
			-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), var65 (copy), var57 (copy), coreScriptVersionEnabledEngineFeature (ref), var38 (copy)
			local var221 = "Server Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ServerVersion")
					var221 = if ok then status else "Server Version: "
				else
					var221 = "Server Version: "
				end
			end
			local var222
			local serverVersionLabel = t_2.ServerVersionLabel
			
			if var65 then
				var222 = var65
			elseif not var57 then
				repeat
					wait()
				until var57
			end
			var65 = var57:InvokeServer()
			var222 = var65
			serverVersionLabel.Text = var221 .. var222
			local serverVersionLabel_1 = t_2.ServerVersionLabel
			serverVersionLabel_1.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, serverVersionLabel_1.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
			t_2.ServerVersionLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.ServerVersionLabel.TextFits)
		end)
		local var202 = "Client Version: "
		
		if fFlagLocalizeVersionLabels then
			if robloxTranslatorModule then
				local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ClientVersion")
				var202 = if ok then status else "Client Version: "
			else
				var202 = "Client Version: "
			end
		end
		local robloxVersion = runService:GetRobloxVersion()
		local ok, status = pcall(function() --[[ line: 1230 ]]
			-- upvalues: runService (copy)
			return runService.ClientGitHash
		end)
		
		if ok then
			robloxVersion = string.format("%s (%.6s)", robloxVersion, status)
		end
		t_2.ClientVersionLabel = create("TextLabel")({
			Name = "ClientVersionLabel",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = t_2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Text = var202 .. robloxVersion,
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		local clientVersionLabel = t_2.ClientVersionLabel
		clientVersionLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, clientVersionLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
		t_2.ClientVersionLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.ClientVersionLabel.TextFits)
		t_2.PlaceVersionLabel = create("TextLabel")({
			Name = "PlaceVersionLabel",
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Text = "Place Version: ...",
			ZIndex = 5,
			Parent = t_2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		
		local function setPlaceVersionText() --[[ line: 1267 ]]
			-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), t (copy), httpRbxApiService (copy), httpService (copy), coreScriptVersionEnabledEngineFeature (ref), var38 (copy)
			local var223 = "Place Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.PlaceVersion")
					var223 = if ok then status else "Place Version: "
				else
					var223 = "Place Version: "
				end
			end
			local placeVersion
			local placeVersionLabel = t_2.PlaceVersionLabel
			
			if t.GetFFlagRemoveAssetVersionEndpoint() then
				placeVersion = game.PlaceVersion
			else
				local placeVersion_1 = game.PlaceVersion
				pcall(function() --[[ line: 364 ]]
					-- upvalues: httpRbxApiService (copy), httpService (copy), placeVersion_1 (write)
					placeVersion_1 = string.format("%s (Latest: %d)", placeVersion_1, httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber)
				end)
				placeVersion = placeVersion_1
			end
			placeVersionLabel.Text = var223 .. placeVersion
			local placeVersionLabel_1 = t_2.PlaceVersionLabel
			placeVersionLabel_1.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, placeVersionLabel_1.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
			t_2.PlaceVersionLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.PlaceVersionLabel.TextFits)
		end
		
		game:GetPropertyChangedSignal("PlaceVersion"):Connect(setPlaceVersionText)
		spawn(setPlaceVersionText)
		
		if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			t_2.EnvironmentLabel = create("TextLabel")({
				Name = "EnvironmentLabel",
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				ZIndex = 5,
				Parent = t_2.VersionContainer,
				AnchorPoint = Vector2.new(0.5, 0),
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = baseUrl,
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Visible = var61
			})
			local environmentLabel = t_2.EnvironmentLabel
			environmentLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, environmentLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
			t_2.EnvironmentLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.EnvironmentLabel.TextFits)
		end
		if game:GetEngineFeature("GetPlaySessionIdEnabled") then
			local playSessionId = game:GetPlaySessionId()
			
			if playSessionId ~= "" then
				t_2.PlaySessionIdLabel = create("TextLabel")({
					Name = "PlaySessionIdLabel",
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					ZIndex = 5,
					Parent = t_2.VersionContainer,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
					Text = if robloxTranslatorModule then robloxTranslatorModule:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", { RBX_STR = playSessionId }) else "PlaySessionId: " .. playSessionId,
					Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
				local playSessionIdLabel = t_2.PlaySessionIdLabel
				playSessionIdLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, playSessionIdLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
				t_2.PlaySessionIdLabel.TextScaled = not t_2.PlaySessionIdLabel.TextFits
			end
		end
		local function getOverridesPlayerScripts() --[[ line: 1329 ]]
			-- upvalues: t (copy), starterPlayerService (copy), fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy)
			if t.EngineFeaturePlayerScriptStatusProperty then
				return ({
					[0] = "Unknown",
					[1] = "v3 Custom",
					[2] = "v3 Default",
					[3] = "v1 Custom",
					[4] = "v2 Default",
					[5] = "v2 Custom"
				})[starterPlayerService.PlayerModuleStatus]
			end
			local starterPlayerScripts = starterPlayerService:WaitForChild("StarterPlayerScripts", if t.FFlagRemoveLoadingTimeout then 1e999 else nil)
			local playerScriptsLoader = starterPlayerScripts:FindFirstChild("PlayerScriptsLoader")
			local playerModule = starterPlayerScripts:FindFirstChild("PlayerModule")
			
			if playerModule and playerScriptsLoader and not playerModule.Archivable then
				if playerScriptsLoader.Archivable then
					if fFlagLocalizeVersionLabels then
						if not robloxTranslatorModule then
							return "Possibly Custom"
						end
						local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.PossiblyCustom")
						
						return if ok then status else "Possibly Custom"
					else
						return "Possibly Custom"
					end
				elseif fFlagLocalizeVersionLabels then
					if not robloxTranslatorModule then
						return "Default"
					end
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.Default")
					
					return if ok then status else "Default"
				else
					return "Default"
				end
			elseif starterPlayerScripts:FindFirstChild("CameraScript") or starterPlayerScripts:FindFirstChild("ControlScript") then
				if fFlagLocalizeVersionLabels then
					if not robloxTranslatorModule then
						return "Custom Old"
					end
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.CustomOld")
					
					return if ok then status else "Custom Old"
				else
					return "Custom Old"
				end
			elseif not fFlagLocalizeVersionLabels then
				return "Custom"
			elseif not robloxTranslatorModule then
				return "Custom"
			end
			local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.Custom")
			
			return if ok then status else "Custom"
		end
		
		t_2.OverridesPlayerScriptsLabel = create("TextLabel")({
			Name = "OverridesPlayerScriptsLabel",
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Text = "PlayerScripts: ",
			ZIndex = 5,
			Visible = false,
			Parent = t_2.VersionContainer,
			AnchorPoint = Vector2.new(0.5, 0),
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function() --[[ line: 1396 ]]
			-- upvalues: robloxGui (copy), playersService (copy), fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), getOverridesPlayerScripts (ref), t (copy), rbxAnalyticsService (copy), constantsModule (copy), t_2 (copy), var61 (copy), coreScriptVersionEnabledEngineFeature (ref), var38 (copy)
			local playerPermissionsModule = require(robloxGui.Modules.PlayerPermissionsModule)
			
			if not playersService.LocalPlayer then
				playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			end
			local var228 = "PlayerScripts: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.PlayerScripts")
					var228 = if ok then status else "PlayerScripts: "
				else
					var228 = "PlayerScripts: "
				end
			end
			local var230
			local var229 = getOverridesPlayerScripts()
			
			if t.EngineFeaturePlayerScriptStatusProperty then
				var230 = var229 == "v3 Default"
				var230 = nil
			else
				var230 = var229 == "Default"
			end
			rbxAnalyticsService:setRBXEventStream(constantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
				defaultPlayerScripts = var230,
				placeID = tostring(game.PlaceId),
				rawValue = if t.GetFFlagNewEventIngestPlayerScriptsDimensions() then var229 else nil,
				context = if t.GetFFlagNewEventIngestPlayerScriptsDimensions() then "IGMv1" else nil
			})
			t_2.OverridesPlayerScriptsLabel.Text = var228 .. var229
			t_2.OverridesPlayerScriptsLabel.Visible = var61 or playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer)
			local overridesPlayerScriptsLabel = t_2.OverridesPlayerScriptsLabel
			overridesPlayerScriptsLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, overridesPlayerScriptsLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
			t_2.OverridesPlayerScriptsLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.OverridesPlayerScriptsLabel.TextFits)
		end)
		
		if coreScriptVersionEnabledEngineFeature then
			local var207 = "Client CoreScript Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok_1, status_1 = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ClientCoreScriptVersion")
					var207 = if ok_1 then status_1 else "Client CoreScript Version: "
				else
					var207 = "Client CoreScript Version: "
				end
			end
			t_2.CoreScriptVersionLabel = create("TextLabel")({
				Name = "CoreScriptVersionLabel",
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = t_2.VersionContainer,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = themeModule.textSize(if var10 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = var207 .. runService:GetCoreScriptVersion(),
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			local coreScriptVersionLabel = t_2.CoreScriptVersionLabel
			coreScriptVersionLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, coreScriptVersionLabel.TextBounds.X + 6, 0, var38) or UDim2.new(0.2, -6, 1, 0)
			local versionContainer = t_2.VersionContainer
			var201:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ line: 1446 ]]
				-- upvalues: versionContainer (ref), var201 (ref), var38 (copy)
				versionContainer.CanvasSize = UDim2.new(0, var201.AbsoluteContentSize.X, 0, var38)
			end)
		end
		t_2.Modal = create("TextButton")({
			Name = "Modal",
			BackgroundTransparency = 1,
			Modal = true,
			Text = "",
			Selectable = false,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 1, 0),
			Parent = t_2.Shield
		})
		
		if t.FFlagSettingsHubIndependentBackgroundVisibility then
			t_2.DarkenBackground = create("ImageButton")({
				Name = "DarkenBackground",
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Visible = false,
				ZIndex = t_2.Shield.ZIndex - 1,
				BackgroundColor3 = if t.isInExperienceUIVREnabled then t_2.SettingsUIDelegate:getDarkBackgroundTheme().Color else themeModule.color("DarkenBackground"),
				Size = UDim2.new(1, 0, 1, 0),
				Parent = t_2.ClippingShield
			})
		else
			t_2.DarkenBackground = create("Frame")({
				Name = "DarkenBackground",
				BackgroundTransparency = 1,
				ZIndex = t_2.Shield.ZIndex - 1,
				BackgroundColor3 = themeModule.color("DarkenBackground"),
				Size = UDim2.new(1, 0, 1, 0),
				Parent = t_2.ClippingShield
			})
		end
		local var208 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		t_2.MenuContainer = create("ImageButton")({
			Name = "MenuContainer",
			ZIndex = t_2.Shield.ZIndex,
			BackgroundTransparency = themeModule.transparency("MenuContainer", 1),
			BackgroundColor3 = themeModule.color("MenuContainer"),
			Position = var208.Position,
			Size = var208.Size,
			AnchorPoint = var208.AnchorPoint,
			AutomaticSize = var208.AutomaticSize,
			Parent = t_2.Shield
		})
		
		if t.FFlagCreateInExperienceMenuReact then
			t_2.ReactPage.Parent = t_2.MenuContainer
		else
			t_2.ReactPage = createReactPage(t_2.MenuContainer)
		end
		t_2.Page = create("Frame")({
			Name = "Page",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Parent = t_2.MenuContainer
		})
		
		if fFlagIEMFocusNavPeoplePageToButtons then
			t_2.Page.SelectionGroup = true
			t_2.Page.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			t_2.Page.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			t_2.Page.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			t_2.Page.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		end
		local page = t_2.Page
		t_2.MenuContainerPadding = create("UIPadding")({ Parent = page })
		
		if not var10 then
			local _ = guiService:GetGuiInset().Y
			t_2.MenuContainerPadding.PaddingTop = UDim.new(0, 0)
		end
		local var209 = themeModule.HubPadding()
		t_2.MenuContainer.AutoButtonColor = false
		t_2.MenuContainerPadding.PaddingLeft = var209.PaddingLeft
		t_2.MenuContainerPadding.PaddingRight = var209.PaddingRight
		t_2.MenuContainerPadding.PaddingBottom = var209.PaddingBottom
		t_2.MenuContainerPadding.PaddingTop = var209.PaddingTop
		create("UICorner")({
			CornerRadius = themeModule.MenuContainerCornerRadius,
			Parent = t_2.MenuContainer
		})
		getCamMicPermissionsModule(function(p32) --[[ line: 1556 ]]
			-- upvalues: t_2 (copy)
			t_2.hasMicPermissions = p32.hasMicPermissions
			t_2.isFetchingMicPermissions = false
		end, nil, true)
		t_2.SettingsShowSignal:connect(function(p33) --[[ line: 1562 ]]
			-- upvalues: default (copy), t (copy), t_2 (copy)
			if p33 then
				if default:IsSeamlessVoice() and not default.voiceUIVisible then
					if t.FFlagVoiceRewarmTelemetry then
						local var231, var232, var233, var234 = default:GetConnectDisconnectButtonAnalyticsData(true)
						default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", var231, var232, var233, var234, default.joinVoiceButtonContext)
					else
						default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", default:GetConnectDisconnectButtonAnalyticsData(true))
					end
				elseif default:IsSeamlessVoice() and default.voiceUIVisible then
					default.Analytics:reportLeaveVoiceButtonEvent("shown", default:GetConnectDisconnectButtonAnalyticsData(true))
				end
				if default:UserVoiceEnabled() and t_2.isFetchingMicPermissions then return end
				if default:UserOnlyEligibleForVoice() or default:UserVoiceEnabled() and not t_2.hasMicPermissions then
					return
				else
				end
			end
		end)
		t_2.MenuListLayout = create("UIListLayout")({
			Name = "MenuListLayout",
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = page
		})
		t_2.HubBar = create("ImageLabel")({
			Name = "HubBar",
			BorderSizePixel = 0,
			LayoutOrder = 0,
			BackgroundColor3 = themeModule.color("HubBarContainer"),
			BackgroundTransparency = themeModule.transparency("HubBarContainerTransparency"),
			ZIndex = t_2.Shield.ZIndex + 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Parent = page
		})
		
		if not t.FFlagEnableSideSheet then
			create("Frame")({
				BorderSizePixel = 0,
				BackgroundColor3 = themeModule.color("Divider"),
				BackgroundTransparency = themeModule.transparency("Divider"),
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Parent = t_2.HubBar
			})
		end
		if t.FFlagEnableSideSheet then
			t_2.PageTitleHeader = create("Frame")({
				Name = "PageTitleHeader",
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Parent = t_2.HubBar,
				ZIndex = t_2.Shield.ZIndex + 1
			})
			create("UIPadding")({
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				Parent = t_2.PageTitleHeader
			})
			
			if not t.FFlagImprovePageTitleCloseButton then
				t_2.PageTitleCloseButton = create("ImageButton")({
					Name = "PageTitleCloseButton",
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/InspectMenu/x.png",
					Size = UDim2.new(0, 16, 0, 16),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, 0, 0.5, 0),
					Parent = t_2.PageTitleHeader
				})
			end
			t_2.PageTitleLabel = create("TextLabel")({
				Name = "Title",
				BackgroundTransparency = 1,
				Text = "",
				Size = UDim2.new(1, -36, 0, 0),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Color3.new(1, 1, 1),
				Font = themeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
				Parent = t_2.PageTitleHeader
			})
		end
		t_2.HubBarListLayout = create("UIListLayout")({
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t_2.HubBar
		})
		
		if not t.FFlagAddTraversalBackButton then
			if t.EngineFeatureTeleportHistoryButtons then
				t_2.BackBarRef = roactModule.createRef()
				t_2.FrontBarRef = roactModule.createRef()
				t_2.BackBar = roactModule.createElement(roactAppExperimentModule.Provider, { value = IXPService }, {
					AppStyleProvider = roactModule.createElement(appStyleProvider, { style = { themeName = dark } }, {
						ButtonsFrame = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = -1,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, 0)
						}, {
							BackButton = roactModule.createElement(menuBackButtonModule, {
								LayoutOrder = 1,
								BackBarRef = t_2.BackBarRef,
								HubBar = t_2.HubBar
							}),
							FrontButton = roactModule.createElement(menuFrontButtonModule, {
								LayoutOrder = 2,
								FrontBarRef = t_2.FrontBarRef,
								HubBar = t_2.HubBar
							})
						})
					})
				})
				roactModule.mount(t_2.BackBar, page, "BackBar")
			else
				t_2.BackBarRef = roactModule.createRef()
				t_2.BackBar = roactModule.createElement(roactAppExperimentModule.Provider, { value = IXPService }, {
					AppStyleProvider = roactModule.createElement(appStyleProvider, { style = { themeName = dark } }, {
						BackButton = roactModule.createElement(menuBackButtonModule, { BackBarRef = t_2.BackBarRef, HubBar = t_2.HubBar })
					})
				})
				roactModule.mount(t_2.BackBar, page, "BackBar")
			end
		end
		if utilityModule:IsSmallTouchScreen() then
			t_2.HubBar.Size = UDim2.new(0, robloxGui.AbsoluteSize.X - 100, 0, 50)
			t_2.HubBar.Position = UDim2.new(0.5, 0, 0, 6)
		elseif var10 then
			t_2.HubBar.Size = UDim2.new(0, 1200, 0, 100)
			t_2.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		else
			t_2.HubBar.Size = UDim2.new(0, 800, 0, 60)
			t_2.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		end
		t_2.VoiceRecordingIndicatorFrame = create("Frame")({
			BackgroundTransparency = 1,
			Size = if t.ChromeEnabled then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = t_2.HubBar
		})
		t_2.VoiceRecordingText = create("TextLabel")({
			Text = "",
			Visible = false,
			TextSize = 12,
			BackgroundTransparency = 1,
			Parent = t_2.VoiceRecordingIndicatorFrame,
			Position = UDim2.new(0, 60, 0, 0),
			Font = appFonts.default:getMedium(),
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = Color3.fromRGB(255, 255, 255)
		})
		
		if utilityModule:IsSmallTouchScreen() then
			t_2.VoiceRecordingText.Size = UDim2.fromScale(1, 1)
			t_2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0)
			
			if t.ChromeEnabled then
				t_2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t_2.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60)
			else
				t_2.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60)
			end
		elseif var10 then
			t_2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			
			if t.ChromeEnabled then
				t_2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t_2.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100)
				t_2.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				t_2.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100)
				t_2.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		else
			t_2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			
			if t.ChromeEnabled then
				t_2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t_2.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60)
				t_2.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				t_2.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60)
				t_2.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		end
		t_2.voiceRecordingIndicatorTextMotor = otterModule.createSingleMotor(0)
		t_2.voiceRecordingIndicatorTextMotor:onStep(function(p34) --[[ line: 1803 ]]
			-- upvalues: t_2 (copy)
			t_2.VoiceRecordingText.TextTransparency = p34
		end)
		spawn(function() --[[ line: 1807 ]]
			-- upvalues: runService (copy), t_2 (copy), otterModule (copy), t_1 (copy)
			runService:BindToRenderStep("VoiceRecordingIndicator", 1, function() --[[ line: 1808 ]]
				-- upvalues: t_2 (copy), otterModule (copy), t_1 (copy)
				if t_2.isMuted ~= nil and t_2.lastVoiceRecordingIndicatorTextUpdated ~= nil and (tick() - t_2.lastVoiceRecordingIndicatorTextUpdated >= 5 and t_2.isMuted) then
					t_2.voiceRecordingIndicatorTextMotor:setGoal(otterModule.spring(1, t_1))
					t_2.voiceRecordingIndicatorTextMotor:start()
				end
			end)
		end)
		t_2.PageViewClipper = create("Frame")({
			Name = "PageViewClipper",
			BackgroundTransparency = 1,
			Size = UDim2.new(t_2.HubBar.Size.X.Scale, t_2.HubBar.Size.X.Offset, 1, (-t_2.HubBar.Size.Y.Offset) - t_2.HubBar.Position.Y.Offset - var199),
			Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, t_2.HubBar.Position.Y.Scale, t_2.HubBar.Position.Y.Offset + t_2.HubBar.Size.Y.Offset + 1),
			AnchorPoint = Vector2.new(0.5, 0),
			ClipsDescendants = true,
			LayoutOrder = 1,
			Parent = page,
			SelectionGroup = if t.FFlagIGMSelectionGroup then true else nil,
			SelectionBehaviorLeft = if t.FFlagIGMSelectionGroup then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if t.FFlagIGMSelectionGroup then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if t.FFlagIGMSelectionGroup then Enum.SelectionBehavior.Escape else nil,
			SelectionBehaviorUp = if t.FFlagIGMSelectionGroup then Enum.SelectionBehavior.Escape else nil,
			if t.FFlagIGMSelectionGroup then nil else create("ImageButton")({
				Name = "InputCapture",
				BackgroundTransparency = 1,
				Image = "",
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
		
		if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then
			t_2.PageViewPadding = create("UIPadding")({ Parent = t_2.PageViewClipper })
			local serviceModule = require(robloxGui.Modules.Chrome.Service)
			serviceModule:onShortcutBarChanged():connect(function() --[[ line: 1854 ]]
				-- upvalues: utilityModule (copy), serviceModule (ref), t_2 (copy), themeModule (copy)
				if utilityModule:IsSmallTouchScreen() and serviceModule:getCurrentShortcutBar():get() ~= nil then
					t_2.PageViewPadding.PaddingBottom = UDim.new(0, themeModule.ExtraPageBottomPaddingMobile)
					
					return
				end
				t_2.PageViewPadding.PaddingBottom = UDim.new(0, 0)
			end)
		end
		t_2.PageView = create("ScrollingFrame")({
			Name = "PageView",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 2),
			Size = UDim2.new(1, 0, 1, -20),
			CanvasSize = UDim2.new(1, 0, 1, 0),
			ZIndex = t_2.Shield.ZIndex,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = themeModule.DefaultScrollBarThickness,
			Parent = t_2.PageViewClipper
		})
		t_2.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		t_2.PageViewInnerFrame = create("Frame")({
			Name = "PageViewInnerFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			LayoutOrder = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = t_2.Shield.ZIndex,
			Parent = t_2.PageView
		})
		create("UIPadding")({
			PaddingTop = UDim.new(0, 5),
			Parent = t_2.PageViewInnerFrame
		})
		t_2.InnerCanvasGroupShow = create("CanvasGroup")({
			Name = "InnerCanvasGroupShow",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = t_2.PageViewInnerFrame
		})
		t_2.InnerCanvasGroupHide = create("CanvasGroup")({
			Name = "InnerCanvasGroupHide",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = t_2.PageViewInnerFrame
		})
		
		if userInputService.MouseEnabled then
			t_2.PageViewClipper.Size = UDim2.new(t_2.HubBar.Size.X.Scale, t_2.HubBar.Size.X.Offset, 0.5, -(t_2.HubBar.Position.Y.Offset - t_2.HubBar.Size.Y.Offset))
		end
		t_2.BottomButtonFrame = create("Frame")({
			Name = "BottomButtonFrame",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = t_2.HubBar.Size,
			Position = UDim2.new(0.5, -t_2.HubBar.Size.X.Offset / 2, 1 - t_2.HubBar.Position.Y.Scale - t_2.HubBar.Size.Y.Scale, (-t_2.HubBar.Position.Y.Offset) - t_2.HubBar.Size.Y.Offset),
			ZIndex = t_2.Shield.ZIndex + 1,
			Parent = page,
			Selectable = if t.FFlagIEMFocusNavToButtons then false else nil,
			SelectionGroup = if t.FFlagIEMFocusNavToButtons then true else nil,
			SelectionBehaviorLeft = if t.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if t.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if t.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil
		})
		t_2.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ line: 1939 ]]
			-- upvalues: t_2 (copy)
			t_2.setShowBottomBarSignal(t_2.BottomButtonFrame.Visible)
		end)
		
		local var211 = function(p35) --[[ line: 1943 ]]
			-- upvalues: t (copy), setVisibilityInternal (copy), t_2 (copy), rbxAnalyticsService (copy), constantsModule (copy), guiService (copy)
			if t.FFlagAddUILessMode then
				setVisibilityInternal(false, nil, nil, nil, p35)
			else
				setVisibilityInternal(false)
			end
			if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 and t_2.uiLessStore.getUILessModeEnabled(false) then
				t_2.uiLessStore.setUIVisible(false)
			end
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsResumeGameName, constantsModule.AnalyticsMenuActionName, {
				source = p35,
				playsessionid = t_2.playSessionId,
				universeid = tostring(game.GameId)
			})
			
			if t.FFlagIEMResumeButtonPressBugfix then
				guiService.SelectedCoreObject = nil
			end
		end
		
		if t.FFlagEnableSideSheet then
			if t.FFlagImprovePageTitleCloseButton then
				t_2.PageTitleCloseButton = utilityModule:MakeStyledImageButton("PageTitleClose", "rbxasset://textures/ui/InspectMenu/x.png", UDim2.new(0, 40, 0, 40), UDim2.new(0, 16, 0, 16), function() --[[ line: 1976 ]]
					-- upvalues: var211 (ref), constantsModule (copy)
					var211(constantsModule.AnalyticsResumeXButtonSource)
				end, nil, t_2, "DefaultButton")
				t_2.PageTitleCloseButton.AnchorPoint = Vector2.new(1, 0.5)
				t_2.PageTitleCloseButton.Position = UDim2.new(1, 0, 0.5, 0)
				local border = t_2.PageTitleCloseButton:FindFirstChild("Border")
				
				if border then
					border.Parent = nil
				end
				t_2.PageTitleCloseButton.Parent = t_2.PageTitleHeader
			else
				t_2.PageTitleCloseButton.Activated:Connect(function() --[[ line: 1993 ]]
					-- upvalues: var211 (ref), constantsModule (copy)
					var211(constantsModule.AnalyticsResumeXButtonSource)
				end)
			end
		end
		if not t.FFlagMenuButtonsMountWithIEM and t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
			var127()
		end
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2 and utilityModule:IsSmallTouchScreen() then
			t_2.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80)
		end
		t_2.MenuListLayout = create("UIListLayout")({
			Padding = UDim.new(0, 12),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t_2.BottomButtonFrame
		})
		
		if t.FFlagEnableSystemScrimInSettingsHub then
			local var213 = require(corePackagesService.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false)
			var213.backgroundScrimActivated.Event:Connect(function() --[[ line: 2021 ]]
				-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var211 (ref)
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
					
					return
				end
				var211(constantsModule.AnalyticsResumeShieldSource)
			end)
			t_2.Shield:GetPropertyChangedSignal("Visible"):Connect(function() --[[ line: 2029 ]]
				-- upvalues: var213 (ref), t_2 (copy)
				var213.setTransparency(1)
				var213.setAutoDismiss(true)
				var213.setVisibility(t_2.Shield.Visible)
			end)
		end
		t_2.Shield.Activated:Connect(function() --[[ line: 2036 ]]
			-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var211 (ref)
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
				
				return
			end
			var211(constantsModule.AnalyticsResumeShieldSource)
		end)
		
		if t.FFlagSettingsHubIndependentBackgroundVisibility then
			t_2.DarkenBackground.Activated:Connect(function() --[[ line: 2046 ]]
				-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var211 (ref), inExperienceAppChatModalModule (copy)
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
				else
					var211(constantsModule.AnalyticsResumeShieldSource)
				end
				inExperienceAppChatModalModule.default:setVisible(false)
			end)
		end
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local var214 = function() --[[ line: 2057 ]]
				-- upvalues: t (copy), t_2 (copy), removeBottomBarBindings (copy), constantsModule_1 (copy)
				if t.FFlagPreventHiddenSwitchPage and t_2:GetVisibility() == false then return end
				t_2:AddToMenuStack(t_2.Pages.CurrentPage)
				t_2.HubBar.Visible = false
				removeBottomBarBindings()
				
				if t.GetFFlagEnableLeaveGameUpsellEntrypoint() and t_2.leaveGameUpsellProp ~= constantsModule_1.PHONE_UPSELL_VALUE_PROP.None then
					t_2:SwitchToPage(t_2.LeaveGameUpsellPage, nil, 1, true)
					
					return
				end
				t_2:SwitchToPage(t_2.LeaveGamePage, nil, 1, true)
			end
			
			if inExperienceCapabilities.canNavigateHome then
				addBottomBarButtonOld("LeaveGame", "Leave", text_1, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, if var10 then -160 else -130, 0.5, -25), var214, {
					Enum.KeyCode.L,
					if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then nil else Enum.KeyCode.ButtonX
				}, var214)
			end
			local var215 = function() --[[ line: 2081 ]]
				-- upvalues: var119 (copy), t_2 (copy), removeBottomBarBindings (copy)
				if var119 then
					t_2:AddToMenuStack(t_2.Pages.CurrentPage)
					t_2.HubBar.Visible = false
					removeBottomBarBindings()
					t_2:SwitchToPage(t_2.ResetCharacterPage, nil, 1, true)
				end
			end
			
			addBottomBarButtonOld("ResetCharacter", var108:Format(constantsModule.RespawnLocalizedKey), text_2, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, if var10 then -550 else -400, 0.5, -25), var215, {
				Enum.KeyCode.R,
				if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then nil else Enum.KeyCode.ButtonY
			}, var215)
			addBottomBarButtonOld("Resume", "Resume", if t.FFlagEnableConsoleExpControls then buttonStartImageForKeyCode else text, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, if var10 then 200 else 140, 0.5, -25), function() --[[ line: 2097 ]]
				-- upvalues: var211 (ref), constantsModule (copy)
				var211(constantsModule.AnalyticsResumeButtonSource)
			end, if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then {} else { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart }, function() --[[ line: 2100 ]]
				-- upvalues: var211 (ref), constantsModule (copy)
				var211(constantsModule.AnalyticsResumeGamepadSource)
			end)
		end
		if t.FFlagAddSwitchTabHintsToIEM then
			local function MountSwitchTabHint(p36) --[[ line: 2110 ]]
				-- upvalues: create (copy), reactRobloxModule (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utilsModule (copy), switchTabHint (copy)
				reactRobloxModule.createRoot(create("Frame")({
					Name = "SwitchTabHintContainer",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					LayoutOrder = p36.layoutOrder,
					Parent = p36.parent
				})):render(reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement("UIListLayout", {
					Name = "SwitchTabHintCenterAlign",
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}), reactModule.createElement(foundationProvider, {
					theme = foundationModule.Enums.Theme.Dark,
					device = utilsModule.getDeviceType()
				}, {
					["SwitchTabHint" .. p36.keycode.Name] = reactModule.createElement(switchTabHint, { keycode = p36.keycode })
				})))
			end
			
			t_2.TabHeaderContainer = create("Frame")({
				Name = "TabHeaderContainer",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Parent = t_2.HubBar,
				Visible = not t.FFlagEnableSideSheet
			})
			t_2.TabHeaderContainerListLayout = create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = t_2.TabHeaderContainer
			})
			MountSwitchTabHint({
				layoutOrder = -999,
				keycode = Enum.KeyCode.ButtonL1,
				parent = t_2.TabHeaderContainer
			})
			MountSwitchTabHint({
				layoutOrder = 999,
				keycode = Enum.KeyCode.ButtonR1,
				parent = t_2.TabHeaderContainer
			})
		end
		t_2.HubBarContainer = create("ImageLabel")({
			Name = "HubBarContainer",
			BorderSizePixel = 0,
			ZIndex = t_2.Shield.ZIndex + 2,
			BackgroundColor3 = themeModule.color("HubBarContainer"),
			BackgroundTransparency = themeModule.transparency("HubBarContainerTransparency"),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = if t.FFlagAddSwitchTabHintsToIEM then t_2.TabHeaderContainer else t_2.HubBar,
			Selectable = if t.FFlagIEMTabFocusNav then false else nil,
			SelectionGroup = if t.FFlagIEMTabFocusNav then true else nil,
			SelectionBehaviorUp = if t.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if t.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if t.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil
		})
		t_2.HubBar.ImageTransparency = 1
		t_2.HubBarListLayout.Parent = t_2.HubBarContainer
		
		if isSubjectToDesktopPolicies() then
			t_2.FullScreenTitleBar = settingsFullScreenTitleBarModule.mount({}, t_2.Shield, "FullScreenTitleBar")
		end
		local function cameraViewportChanged() --[[ line: 2197 ]]
			-- upvalues: themeModule (copy), utilityModule (copy)
			themeModule.viewportResized()
			utilityModule:FireOnResized()
		end
		
		local var218 = nil
		
		local function onWorkspaceChanged(p37) --[[ line: 2203 ]]
			-- upvalues: themeModule (copy), utilityModule (copy), var218 (write), cameraViewportChanged (ref)
			if p37 == "CurrentCamera" then
				themeModule.viewportResized()
				utilityModule:FireOnResized()
				
				if var218 then
					var218:disconnect()
				end
				var218 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
			end
		end
		
		themeModule.viewportResized()
		utilityModule:FireOnResized()
		var218 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
		workspace.Changed:Connect(onWorkspaceChanged)
	end
	
	local function resizeBottomBarButtons() --[[ line: 2215 ]]
		-- upvalues: t_2 (ref), t (copy)
		local x = t_2.BottomButtonFrame.AbsoluteSize.X
		local bottomBarButtonsCount = #t_2.BottomBarButtons
		
		if bottomBarButtonsCount == 4 then
			x = x - 48 - 12
			bottomBarButtonsCount -= 1
		end
		local var236 = (x - (bottomBarButtonsCount - 1) * 12 - 12) / bottomBarButtonsCount
		
		if t.isInExperienceUIVREnabled then
			var236 = t_2.SettingsUIDelegate:getBottomButtonSize(var236)
		end
		for i = 1, #t_2.BottomBarButtons do
			local var237 = t_2.BottomBarButtons[i]
			local var238 = var237[1]
			
			if var238 ~= "MuteButtonButton" then
				t_2[var238].Size = UDim2.fromOffset(var236, t_2[var237[1]].Size.Y.Offset)
			end
		end
	end
	
	local function onScreenSizeChanged() --[[ line: 2238 ]]
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), themeModule (copy), var127 (ref), var128 (ref), robloxGui (copy), var10 (copy), VRService (copy), runService (copy), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), removeBottomBarBindings (ref)
		local function _() --[[ line: 2239 | named "getBackBarVisible" ]]
			-- upvalues: t_2 (copy)
			return if t_2.BackBarRef:getValue() then t_2.BackBarRef:getValue().Visible else false
		end
		
		local _ = function() --[[ line: 2246 | named "getFrontBarVisible" ]]
			-- upvalues: t_2 (copy)
			return if t_2.FrontBarRef:getValue() then t_2.FrontBarRef:getValue().Visible else false
		end
		
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.Visible then
			if (utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar() then
				if t_2.BottomButtonFrameRoot then
					var128()
				end
				if t_2.PlayersPage then
					t_2.PlayersPage:CreateMenuButtonsContainer()
				end
			elseif not t_2.BottomButtonFrameRoot then
				var127()
			end
			if t_2.PlayersPage then
				t_2.PlayersPage:UnmountMenuButtonsContainer()
			end
		end
		local var239 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		local var240 = 600
		local var241 = if t.isInExperienceUIVREnabled then t_2.SettingsUIDelegate:getFullScreenSize() else robloxGui.AbsoluteSize.y
		local var242 = 0.05 * var241
		local var243 = utilityModule:IsPortrait()
		
		if var10 then
			var240 = 800
			var242 = 0.07 * var241
		elseif utilityModule:IsSmallTouchScreen() then
			var242 = math.min(10, 0.01 * var241)
		elseif t.isInExperienceUIVREnabled and VRService.VREnabled then
			var242 = 0
		end
		t_2.MenuContainer.Size = var239.Size
		t_2.MenuContainer.Position = var239.Position
		t_2.MenuContainer.AnchorPoint = var239.AnchorPoint
		local _ = var242 * 2 + t_2.HubBar.Size.Y.Offset * 2
		local var244 = 0
		
		if not t.FFlagAddTraversalBackButton then
			if (if not t_2.BackBarRef:getValue() then false else t_2.BackBarRef:getValue().Visible) and t_2.BackBarRef:getValue() then
				var244 = t_2.BackBarRef:getValue().Size.Y.Offset
			end
			if t.EngineFeatureTeleportHistoryButtons and (if not t_2.FrontBarRef:getValue() then false else t_2.FrontBarRef:getValue().Visible) and t_2.FrontBarRef:getValue() then
				var244 += t_2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		if var243 then
			t_2.HubBar.Position = UDim2.new(0.5, 0, 0, 10)
			t_2.HubBar.Size = UDim2.new(0, robloxGui.AbsoluteSize.X - 40, 0, 54)
		elseif var10 then
			t_2.HubBar.Size = UDim2.new(0, 1200, 0, 100)
		elseif utilityModule:IsSmallTouchScreen() then
			t_2.HubBar.Size = UDim2.new(0, robloxGui.AbsoluteSize.X - 60, 0, 52)
		elseif t.isInExperienceUIVREnabled then
			t_2.HubBar.Size = UDim2.new(0, t_2.SettingsUIDelegate:getHubBarSize(), 0, 60)
		else
			t_2.HubBar.Size = UDim2.new(0, 800, 0, 60)
		end
		local var245 = if t.FFlagEnableSideSheet or not themeModule.AlwaysShowBottomBar() then t_2.HubBar.Size.Y.Offset else t_2.HubBar.Size.Y.Offset + t_2.BottomButtonFrame.Size.Y.Offset
		local var246 = var242 * 2 + (if t.FFlagFixDisableTopPaddingError and t_2.Pages.CurrentPage == nil or not t_2.Pages.CurrentPage.DisableTopPadding then var245 else 0)
		
		if not t.FFlagAddTraversalBackButton then
			var244 = if (if not t_2.BackBarRef:getValue() then false else t_2.BackBarRef:getValue().Visible) and t_2.BackBarRef:getValue() then t_2.BackBarRef:getValue().Size.Y.Offset else 0
			
			if t.EngineFeatureTeleportHistoryButtons and (if not t_2.FrontBarRef:getValue() then false else t_2.FrontBarRef:getValue().Visible) and t_2.FrontBarRef:getValue() then
				var244 += t_2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		runService.Heartbeat:wait()
		
		if shouldShowBottomBar() then
			setBottomBarBindings()
			
			if t.FFlagIEMFocusNavToButtons then
				setBottomBarSelection(t_2.Pages.CurrentPage)
			end
		else
			removeBottomBarBindings()
		end
		if t.isInExperienceUIVREnabled then
			var246 += t_2.SettingsUIDelegate:getMenuContainerExtraSpace()
		end
		local var247 = var241 - var246 - var244
		
		if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3) and utilityModule:IsSmallTouchScreen() then
			var247 -= themeModule.ExtraHubBottomPaddingMobile
		end
		local var248
		local _ = nil
		
		if var243 then
			var248 = var247
		elseif var240 < var247 then
			var248 = var240
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0.5, -var240 / 2 - t_2.HubBar.Size.Y.Offset)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 0.5, var240 / 2)
			end
		elseif var247 < 150 then
			var248 = 150
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0.5, -75 - t_2.HubBar.Size.Y.Offset)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 0.5, 75)
			end
		else
			var248 = var247
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0, var242)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 1, -(var242 + var245))
			end
		end
		local _ = nil
		local var249 = if var10 then UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var248) elseif not utilityModule:IsSmallTouchScreen() then if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var248 + 0 + 0 - t_2.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var248 + 0 + 0) else UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var248)
		
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 and t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Size = UDim2.new(0, t_2.HubBar.Size.X.Offset, 0, t_2.HubBar.Size.Y.Offset)
		end
		local var250 = themeModule.HubPadding()
		t_2.ReactPage.Size = UDim2.new(0, t_2.HubBar.AbsoluteSize.X + (var250.PaddingLeft.Offset + var250.PaddingRight.Offset), 0, var248 + var245 + (var250.PaddingTop.Offset + var250.PaddingBottom.Offset))
		t_2.PageViewClipper.Size = var249
		
		if var243 then
			t_2.PageViewClipper.Position = UDim2.new(0.5, 0, 0, t_2.HubBar.Position.Y.Offset + t_2.HubBar.AbsoluteSize.Y)
			
			return
		end
		t_2.PageViewClipper.Position = UDim2.new(t_2.PageViewClipper.Position.X.Scale, t_2.PageViewClipper.Position.X.Offset, 0.5, -var248 / 2)
	end
	
	local _ = function() --[[ line: 2490 | named "onPreferredTransparencyChanged" ]]
		-- upvalues: t_2 (ref), themeModule (copy), guiService (copy)
		t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
	end
	
	local function toggleQuickProfilerFromHotkey(p38, p39, _) --[[ line: 2494 ]]
		-- upvalues: userInputService (copy), gameSettings (copy)
		if not userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not userInputService:IsKeyDown(Enum.KeyCode.RightControl) then return end
		if p38 == "Show Quick Profiler" and p39 and p39 == Enum.UserInputState.Begin then
			gameSettings.PerformanceStatsVisible = not gameSettings.PerformanceStatsVisible
		end
	end
	
	local function toggleDevConsole(p40, p41, _) --[[ line: 2510 ]]
		-- upvalues: devConsoleMasterModule (copy)
		if p40 == "Open Dev Console" and p41 and p41 == Enum.UserInputState.Begin then
			devConsoleMasterModule:ToggleVisibility()
		end
	end
	
	local var134 = var10
	local t_3 = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true,
		[Enum.KeyCode.Left] = true,
		[Enum.KeyCode.Right] = true,
		[Enum.KeyCode.Up] = true,
		[Enum.KeyCode.Down] = true,
		[Enum.KeyCode.Tab] = true,
		[Enum.UserInputType.Touch] = false,
		[Enum.UserInputType.MouseButton1] = false,
		[Enum.UserInputType.MouseButton2] = false
	}
	userInputService.InputBegan:connect(function(p42) --[[ line: 2536 ]]
		-- upvalues: t_3 (ref), var134 (write)
		if p42.UserInputType and t_3[p42.UserInputType] ~= nil then
			var134 = t_3[p42.UserInputType]
			
			return
		elseif p42.KeyCode and t_3[p42.KeyCode] then
			var134 = t_3[p42.KeyCode]
		end
	end)
	userInputService.InputChanged:connect(function(p43) --[[ line: 2543 ]]
		-- upvalues: var134 (write)
		if p43.KeyCode == Enum.KeyCode.Thumbstick1 or p43.KeyCode == Enum.KeyCode.Thumbstick2 then
			if p43.Position.magnitude >= 0.25 then
				var134 = true
				
				return
			end
		elseif p43.UserInputType == Enum.UserInputType.Touch or p43.UserInputType == Enum.UserInputType.MouseMovement then
			var134 = false
		end
	end)
	local GetHeaderPosition = nil
	
	local var137 = function(p44, p45) --[[ line: 2555 ]]
		-- upvalues: t (copy), t_2 (ref), GetHeaderPosition (write)
		if t.FFlagInExperienceReportClosingBugfix and not t_2.HubBar.Visible then return end
		local var251 = GetHeaderPosition(t_2.Pages.CurrentPage)
		
		if var251 < 0 then return end
		local var252 = var251 + p44
		
		if p45 then
			if #t_2.TabHeaders < var252 then
				var252 = 1
			elseif var252 < 1 then
				var252 = #t_2.TabHeaders
			end
		end
		local var253 = t_2.TabHeaders[var252]
		
		if var253 then
			for i, v in pairs(t_2.Pages.PageTable) do
				if i:GetTabHeader() == var253 then
					t_2:SwitchToPage(i, true, p44)
					
					return
				end
			end
		end
	end
	
	local var138 = function(_, p46, p47) --[[ line: 2582 ]]
		-- upvalues: var137 (ref)
		if p46 ~= Enum.UserInputState.Begin then return end
		local var254 = 0
		
		if p47.KeyCode == Enum.KeyCode.ButtonR1 then
			var254 = 1
		elseif p47.KeyCode == Enum.KeyCode.ButtonL1 then
			var254 = -1
		end
		var137(var254, true)
	end
	
	local var139 = function(p48) --[[ line: 2595 ]]
		-- upvalues: userInputService (copy), var137 (ref)
		if p48.KeyCode == Enum.KeyCode.Tab then
			local _ = 0
			var137(if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then -1 else 1, true)
		end
	end
	
	local var140 = function(_, p49, p50) --[[ line: 2608 ]]
		-- upvalues: t_2 (ref)
		if p49 ~= Enum.UserInputState.Begin then return end
		local var255 = 0
		
		if p50.KeyCode == Enum.KeyCode.PageUp then
			var255 = -100
		elseif p50.KeyCode == Enum.KeyCode.PageDown then
			var255 = 100
		end
		t_2:ScrollPixels(var255)
	end
	
	if t.isInExperienceUIVREnabled or t.FFlagEnableSettingsHubUIDelegateRollout then
		t_2.SettingsUIDelegate = require(robloxGui.Modules.Settings.SettingsUIDelegate).new(t_2)
	end
	createGui()
	
	if settingsHubRaceConditionFix then
		setupVoiceListeners()
	end
	GetHeaderPosition = function(p51) --[[ line: 2632 | named "GetHeaderPosition" ]]
		-- upvalues: t_2 (ref)
		local tabHeader = p51:GetTabHeader()
		
		if not tabHeader then
			return -1
		end
		for i, v in pairs(t_2.TabHeaders) do
			if v == tabHeader then
				return i
			end
		end
		return -1
	end
	
	local _ = nil
	
	local var141 = function(p52, p53) --[[ line: 2646 ]]
		-- upvalues: var141 (write)
		if p53:IsA("GuiObject") then
			p53.ZIndex = p52
			local children = p53:GetChildren()
			
			for i = 1, #children do
				var141(p52, children[i])
			end
		end
	end
	
	local function AddHeader(p54, p55) --[[ line: 2656 ]]
		-- upvalues: t_2 (ref), var141 (write)
		if not p54 then return end
		table.insert(t_2.TabHeaders, p54)
		p55.TabPosition = #t_2.TabHeaders
		local var258 = 1 / #t_2.TabHeaders
		
		for i = 1, #t_2.TabHeaders do
			t_2.TabHeaders[i].Size = UDim2.new(var258, 0, 1, 0)
		end
		var141(3, p54)
		p54.Parent = t_2.HubBarContainer
	end
	
	local function RemoveHeader(p56) --[[ line: 2672 ]]
		-- upvalues: t_2 (ref)
		local var259 = nil
		
		for i = 1, #t_2.TabHeaders do
			if t_2.TabHeaders[i] ~= p56 then
				continue
			end
			var259 = i
			table.remove(t_2.TabHeaders, i)
			break
		end
		if var259 then
			for i_1 = var259, #t_2.TabHeaders do
				local var260 = t_2.TabHeaders[i_1]
				var260.Position = UDim2.new(var260.Position.X.Scale, var260.Position.X.Offset - p56.AbsoluteSize.X, var260.Position.Y.Scale, var260.Position.Y.Offset)
			end
		end
		p56.Parent = nil
	end
	
	function t_2.AddPage(_, p57) --[[ line: 2695 ]]
		-- upvalues: t_2 (ref), AddHeader (ref), t (copy), setBottomBarSelection (ref)
		t_2.Pages.PageTable[p57] = true
		AddHeader(p57:GetTabHeader(), p57)
		p57.Page.Position = UDim2.new(p57.TabPosition - 1, 0, 0, 0)
		
		if t.FFlagIEMFocusNavToButtons then
			p57.LastSelectableObjectsUpdated:connect(function() --[[ line: 2700 ]]
				-- upvalues: setBottomBarSelection (copy), p57 (ref)
				setBottomBarSelection(p57)
			end)
		end
		if t.FFlagIEMTabFocusNav then
			if t.FFlagIEMTabFocusNav then
				local tabHeader = p57:GetTabHeader()
				
				if tabHeader then
					for i, v in p57.FirstSelectableObjects do
						v.NextSelectionUp = tabHeader
						tabHeader.NextSelectionDown = v
					end
				end
			end
			if t.FFlagIEMTabFocusNav then
				for i, v in t_2.TabHeaders do
					v.NextSelectionLeft = nil
					v.NextSelectionRight = nil
				end
				local tabHeadersCount = #t_2.TabHeaders
				
				if tabHeadersCount >= 2 then
					t_2.TabHeaders[1].NextSelectionLeft = t_2.TabHeaders[tabHeadersCount]
					t_2.TabHeaders[tabHeadersCount].NextSelectionRight = t_2.TabHeaders[1]
				end
			end
			p57.FirstSelectableObjectsUpdated:connect(function() --[[ line: 2707 ]]
				-- upvalues: p57 (ref), t (copy)
				if not t.FFlagIEMTabFocusNav then return end
				local tabHeader = p57:GetTabHeader()
				
				if not tabHeader then return end
				for i, v in p57.FirstSelectableObjects do
					v.NextSelectionUp = tabHeader
					tabHeader.NextSelectionDown = v
				end
			end)
		end
	end
	
	function t_2.RemovePage(_, p58) --[[ line: 2713 ]]
		-- upvalues: t_2 (ref), RemoveHeader (ref), t (copy)
		t_2.Pages.PageTable[p58] = nil
		RemoveHeader(p58:GetTabHeader())
		
		if t.FFlagIEMFocusNavToButtons then
			p58.LastSelectableObjectsUpdated:disconnect()
		end
		if t.FFlagIEMTabFocusNav then
			p58.FirstSelectableObjectsUpdated:disconnect()
			
			if not t.FFlagIEMTabFocusNav then return end
			for i, v in t_2.TabHeaders do
				v.NextSelectionLeft = nil
				v.NextSelectionRight = nil
			end
			local tabHeadersCount = #t_2.TabHeaders
			
			if tabHeadersCount < 2 then return end
			t_2.TabHeaders[1].NextSelectionLeft = t_2.TabHeaders[tabHeadersCount]
			t_2.TabHeaders[tabHeadersCount].NextSelectionRight = t_2.TabHeaders[1]
		end
	end
	
	function t_2.HideBar(_) --[[ line: 2725 ]]
		-- upvalues: t_2 (ref), removeBottomBarBindings (ref)
		t_2.HubBar.Visible = false
		t_2.PageViewClipper.Visible = false
		
		if t_2.BottomButtonFrame then
			removeBottomBarBindings()
		end
	end
	
	function t_2.ShowBar(_) --[[ line: 2733 ]]
		-- upvalues: t_2 (ref), shouldShowBottomBar (ref), setBottomBarBindings (ref), t (copy), setBottomBarSelection (ref)
		t_2.HubBar.Visible = true
		t_2.PageViewClipper.Visible = true
		
		if t_2.BottomButtonFrame and shouldShowBottomBar() then
			setBottomBarBindings()
			
			if t.FFlagIEMFocusNavToButtons then
				setBottomBarSelection(t_2.Pages.CurrentPage)
			end
		end
	end
	
	function t_2.ScrollPixels(_, p59) --[[ line: 2744 ]]
		-- upvalues: t_2 (ref)
		t_2.PageView.CanvasPosition = Vector2.new(0, math.max(0, math.min(t_2.PageView.CanvasPosition.Y + p59, t_2.PageView.CanvasSize.Y.Offset - t_2.PageViewClipper.AbsoluteSize.y)))
	end
	
	function t_2.ScrollToFrame(_, p60, p61) --[[ line: 2752 ]]
		-- upvalues: var134 (write), t_2 (ref), constantsModule (copy)
		if var134 or p61 then
			local var265 = p60.AbsolutePosition.y - t_2.Pages.CurrentPage.Page.AbsolutePosition.y
			local var266 = var265 + p60.AbsoluteSize.y
			
			if var265 < t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var265)
				
				return
			elseif t_2.Pages.CurrentPage.Page.Name == constantsModule.PeoplePageKey and t_2.PageView.AbsoluteSize.Y - constantsModule.PeoplePageScrollBuffer < var266 - t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var266 - t_2.PageView.AbsoluteSize.Y + constantsModule.PeoplePageScrollBuffer)
				
				return
			elseif t_2.PageViewClipper.Size.Y.Offset < var266 - t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var266 - t_2.PageViewClipper.Size.Y.Offset)
			end
		end
	end
	
	function t_2.GetFirstPageWithTabHeader(_) --[[ line: 2767 ]]
		-- upvalues: t_2 (ref)
		local var267 = nil
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i:GetTabHeader() ~= nil and i.TabPosition == 1 then
				var267 = i
				break
			end
		end
		if var267 == nil then
			error("No page with tab header found")
			
			return nil
		end
		return var267
	end
	
	function t_2.InitInPage(_, p62) --[[ line: 2786 ]]
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), var101 (write)
		local tabPosition = p62.TabPosition
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i ~= p62 then
				i:Hide(-1, tabPosition, true, nil, t_2.PageViewInnerFrame)
			end
		end
		if (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2 and utilityModule:IsSmallTouchScreen()) and t_2.BottomButtonFrame then
			if shouldShowBottomBar(p62) then
				setBottomBarBindings()
				
				if t.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(p62)
				end
			else
				t_2.BottomButtonFrame.Visible = false
			end
			local var269
			local hubBar = t_2.HubBar
			p62 = p62 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var269 = p62.ShouldShowHubBar == true
				var269 = nil
			else
				var269 = p62.ShouldShowBottomBar == true
			end
			hubBar.Visible = var269
		end
		local var270 = p62.IsPageClipped == true
		t_2.PageViewClipper.ClipsDescendants = var270
		t_2.PageView.ClipsDescendants = var270
		t_2.PageViewInnerFrame.ClipsDescendants = var270
		t_2.Pages.CurrentPage = p62
		t_2.Pages.CurrentPage.Active = true
		t_2.CurrentPageSignal:fire(if t_2.Pages.CurrentPage then t_2.Pages.CurrentPage.Page.Name else nil)
		
		if t.FFlagEnableSideSheet then
			local var272
			local currentPage = t_2.Pages.CurrentPage
			local currentPage_1 = currentPage or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var272 = currentPage_1.ShouldShowHubBar == true
				var272 = nil
			else
				var272 = currentPage_1.ShouldShowBottomBar == true
			end
			if var272 and currentPage.TabHeader then
				t_2.PageTitleLabel.Text = currentPage.TabHeader.TabLabel.Title.Text
			else
				t_2.PageTitleLabel.Text = ""
			end
		end
		t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
		var101 = t_2.Pages.CurrentPage.Page.Changed:connect(function(p63) --[[ line: 2829 ]]
			-- upvalues: t_2 (copy)
			if p63 == "AbsoluteSize" then
				t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
			end
		end)
	end
	
	function t_2.SwitchToPage(_, p64, p65, p66, p67, _, p68) --[[ line: 2837 ]]
		-- upvalues: t_2 (ref), t (copy), fixReportButtonCutOff (copy), utilityModule (copy), themeModule (copy), shouldShowBottomBar (ref), var101 (write), var102 (write), setBottomBarBindings (ref), setBottomBarSelection (ref), onScreenSizeChanged (ref), cryoModule (copy), IXPServiceWrapper (copy), rbxAnalyticsService (copy), constantsModule (copy), flagsModule (copy), experienceMenuSessionManagerInstance (copy), reactPageSignalModule (copy)
		if t_2.Pages.PageTable[p64] == nil then return end
		if t.FFlagPreventHiddenSwitchPage and t_2:GetVisibility() == false then return end
		if fixReportButtonCutOff then
			if p64.Page.Name == "ReportAbuseMenuNewContainerPage" then
				t_2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0)
			else
				t_2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5)
			end
		end
		local uDim = UDim.new(0, 0)
		local uDim_1 = UDim.new(0, 0)
		local var275 = if utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen() then themeModule.AlwaysShowBottomBar() else not (utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen())
		
		if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
			var275 = true
		end
		if t_2.HubBar then
			local var277
			p64 = p64 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var277 = p64.ShouldShowHubBar == true
				var277 = nil
			else
				var277 = p64.ShouldShowBottomBar == true
			end
			if not var277 and not p64.DisableTopPadding then
				uDim = UDim.new(0, t_2.HubBar.AbsoluteSize.Y)
			end
		end
		if not t.FFlagEnableSideSheet and t_2.BottomButtonFrame and (var275 and not shouldShowBottomBar(p64)) then
			uDim_1 = UDim.new(0, t_2.BottomButtonFrame.AbsoluteSize.Y)
		end
		local var278 = themeModule.HubPadding()
		t_2.MenuContainerPadding.PaddingLeft = var278.PaddingLeft
		t_2.MenuContainerPadding.PaddingRight = var278.PaddingRight
		t_2.MenuContainerPadding.PaddingBottom = var278.PaddingBottom + uDim_1
		t_2.MenuContainerPadding.PaddingTop = var278.PaddingTop + uDim
		local var279 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		t_2.MenuContainer.Position = var279.Position
		t_2.MenuContainer.Size = var279.Size
		t_2.MenuContainer.AnchorPoint = var279.AnchorPoint
		
		if p66 == nil and t_2.Pages.CurrentPage and (t_2.Pages.CurrentPage.TabHeader and p64) and p64.TabHeader then
			p66 = if t_2.Pages.CurrentPage.TabHeader.AbsolutePosition.x < p64.TabHeader.AbsolutePosition.x then 1 else -1
		end
		if p66 == nil then
			p66 = 1
		end
		if t_2.Pages.CurrentPage and var101 ~= nil then
			var101:disconnect()
			t_2.Pages.CurrentPage.Active = false
		end
		if t.FFlagFixDisabledScrollOnIos and var102 ~= nil then
			var102:Disconnect()
			var102 = nil
		end
		local tabPosition = p64.TabPosition
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i ~= p64 then
				i:Hide(-p66, tabPosition, p67, nil, t_2.PageViewInnerFrame, i == t_2.Pages.CurrentPage)
			end
		end
		if t_2.BottomButtonFrame then
			if shouldShowBottomBar(p64) then
				setBottomBarBindings()
				
				if t.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(p64)
				end
			else
				t_2.BottomButtonFrame.Visible = false
			end
			local var281
			local hubBar = t_2.HubBar
			p64 = p64 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var281 = p64.ShouldShowHubBar == true
				var281 = nil
			else
				var281 = p64.ShouldShowBottomBar == true
			end
			hubBar.Visible = var281
		end
		if t.FFlagIEMTabFocusNav and t.FFlagIEMTabFocusNav then
			local tabHeader = p64:GetTabHeader()
			
			if tabHeader then
				for i_1, v_1 in p64.FirstSelectableObjects do
					v_1.NextSelectionUp = tabHeader
					tabHeader.NextSelectionDown = v_1
				end
			end
		end
		local var285
		local var283 = p64.IsPageClipped == true
		t_2.PageViewClipper.ClipsDescendants = var283
		t_2.PageView.ClipsDescendants = var283
		t_2.PageViewInnerFrame.ClipsDescendants = var283
		t_2.Pages.CurrentPage = p64
		t_2.Pages.CurrentPage:Display(t_2.PageViewInnerFrame, p67)
		t_2.Pages.CurrentPage.Active = true
		t_2.CurrentPageSignal:fire(if t_2.Pages.CurrentPage then t_2.Pages.CurrentPage.Page.Name else nil)
		
		if t.FFlagEnableSideSheet then
			local currentPage = t_2.Pages.CurrentPage
			local currentPage_1 = currentPage or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var285 = currentPage_1.ShouldShowHubBar == true
				var285 = nil
			else
				var285 = currentPage_1.ShouldShowBottomBar == true
			end
			if var285 and currentPage.TabHeader then
				t_2.PageTitleLabel.Text = currentPage.TabHeader.TabLabel.Title.Text
			else
				t_2.PageTitleLabel.Text = ""
			end
		end
		if t.FFlagAddAbilityToDisableIGMScroll then
			local _ = nil
			local _ = t_2.Pages.CurrentPage
			
			if u9761 ~= nil and u9761.ShouldDisableDefaultScroll == true then
				t_2.PageView.ScrollBarThickness = 0
				t_2.PageView.ScrollingEnabled = false
				t_2.PageView.CanvasPosition = Vector2.new(0, 0)
				t_2.PageView.CanvasSize = UDim2.new(1, 0, 1, 0)
				
				if t.FFlagFixDisabledScrollOnIos then
					var102 = t_2.PageView:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 2951 ]]
						-- upvalues: t_2 (copy)
						if t_2.PageView.CanvasPosition.Magnitude > 0 then
							t_2.PageView.CanvasPosition = Vector2.new(0, 0)
						end
					end)
				end
			else
				t_2.PageView.ScrollBarThickness = themeModule.DefaultScrollBarThickness
				t_2.PageView.ScrollingEnabled = true
			end
		end
		if t.FFlagAddAbilityToDisableIGMScroll then
			local _ = nil
			local _ = t_2.Pages.CurrentPage
			var285 = u9764
			
			if not (var285 ~= nil and var285.ShouldDisableDefaultScroll == true) then
				t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
			end
		else
			t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
		end
		var101 = t_2.Pages.CurrentPage.Page.Changed:connect(function(p69) --[[ line: 2973 ]]
			-- upvalues: t (copy), t_2 (copy)
			if p69 == "AbsoluteSize" then
				if t.FFlagAddAbilityToDisableIGMScroll then
					local _ = nil
					local _ = t_2.Pages.CurrentPage
					local var287 = u10306
					
					if not (var287 ~= nil and var287.ShouldDisableDefaultScroll == true) then
						t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
					end
				end
			end
		end)
		
		if t_2.MenuStack[#t_2.MenuStack] ~= t_2.Pages.CurrentPage and not p65 then
			t_2.MenuStack[#t_2.MenuStack + 1] = t_2.Pages.CurrentPage
		end
		if p64.DisableTopPadding then
			onScreenSizeChanged()
		end
		local t_1 = { universeid = tostring(game.GameId) }
		
		if t.GetFFlagReportAbuseMenuEntrypointAnalytics() and p68 then
			t_1 = cryoModule.Dictionary.join(t_1, p68)
		end
		if t.FFlagRespawnChromeShortcutTelemetry and t_1.used_shortcut == nil then
			t_1.used_shortcut = false
		end
		if t_1.playsessionid == nil then
			t_1.playsessionid = t_2.playSessionId
		end
		if p64 then
			if t.FFlagHelpPageIXPExposure and t_2.HelpPage == p64 and not t_2.HelpPageIXPFetched then
				IXPServiceWrapper:LogUserLayerExposure(t.FStringHelpPageIXPLayer)
				t_2.HelpPageIXPFetched = true
			end
			if t_2.GameSettingsPage == p64 then
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_GameSettings_tab", constantsModule.AnalyticsMenuActionName, t_1)
				
				if flagsModule.FFlagIEMSettingsLogExposureIXPFlags and not t_2.GameSettingsPageReorderIXPFetched then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringInExperienceMenuIXPLayer())
					t_2.GameSettingsPageReorderIXPFetched = true
				end
			else
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_" .. p64.Page.Name .. "_tab", constantsModule.AnalyticsMenuActionName, t_1)
			end
			experienceMenuSessionManagerInstance:MenuSwitchToPage(p64.Page)
		else
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_unknown_tab", constantsModule.AnalyticsMenuActionName, t_1)
			experienceMenuSessionManagerInstance:CloseOpenedMenuTab()
		end
		if t.FFlagAddTraversalHistory and t.FFlagIntegrateTraversalHistoryInSideSheet then
			reactPageSignalModule(false).setCurrentReactPage(nil)
		end
	end
	
	function t_2.SetActive(_, p70) --[[ line: 3031 ]]
		-- upvalues: t_2 (ref)
		t_2.Active = p70
		
		if t_2.Pages.CurrentPage then
			t_2.Pages.CurrentPage.Active = p70
		end
	end
	
	function clearMenuStack() --[[ line: 3039 ]]
		-- upvalues: t_2 (ref)
		while t_2.MenuStack and #t_2.MenuStack > 0 do
			t_2:PopMenu()
		end
	end
	
	function setOverrideMouseIconBehavior() --[[ line: 3045 ]]
		-- upvalues: t_2 (ref), userInputService (copy), VRService (copy), mouseIconOverrideService (copy), settingsHubCursorOverride (copy)
		if not t_2.Visible then return end
		if userInputService:GetLastInputType() == Enum.UserInputType.Gamepad1 or VRService.VREnabled then
			mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		end
		mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
	end
	
	function checkLeaveGameUpsell() --[[ line: 3057 ]]
		-- upvalues: t (copy), t_2 (ref), constantsModule_1 (copy), default (copy), checkLeaveGameUpsellCooldown (copy)
		if not t.GetFFlagEnableLeaveGameUpsellEntrypoint() then return end
		if not t_2.sessionStartTime then
			t_2.sessionStartTime = os.time()
		end
		if not t_2.sessionStartTime then return end
		if not t_2.checkedUpsell and t_2.leaveGameUpsellProp == constantsModule_1.PHONE_UPSELL_VALUE_PROP.None then
			t_2.checkedUpsell = true
			t_2.leaveGameUpsellProp = default:FetchPhoneVerificationUpsell(constantsModule_1.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, t_2.sessionStartTime, true)
			t_2.LeaveGameUpsellPage:SetUpsellProp(t_2.leaveGameUpsellProp)
			task.delay(checkLeaveGameUpsellCooldown, function() --[[ line: 3078 ]]
				-- upvalues: t_2 (copy)
				t_2.checkedUpsell = false
			end)
			
			return
		elseif t_2.checkedUpsell then
			local exit_confirmation_phone_upsell_ixp_layer = default:FetchPhoneVerificationUpsell(constantsModule_1.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, t_2.sessionStartTime, false)
			
			if t_2.leaveGameUpsellProp ~= exit_confirmation_phone_upsell_ixp_layer then
				t_2.leaveGameUpsellProp = exit_confirmation_phone_upsell_ixp_layer
				t_2.LeaveGameUpsellPage:SetUpsellProp(t_2.leaveGameUpsellProp)
			end
		end
	end
	
	local var144 = if t.FFlagSettingsHubIndependentBackgroundVisibility then function(p71, p72) --[[ line: 3093 ]]
		-- upvalues: t_2 (ref), inExperienceAppChatModalModule (copy), constantsModule (copy), t (copy), themeModule (copy), tweenService (copy)
		if not t_2.DarkenBackground then return end
		if not p71 and t_2.DarkenBackground.Visible and (inExperienceAppChatModalModule:getVisible() or t_2.Visible) then return end
		local var289 = 1
		local quart = Enum.EasingStyle.Quart
		local var290 = if constantsModule then constantsModule.ShieldCloseAnimationTweenTime else 0.4
		
		if p71 then
			var289 = if t.isInExperienceUIVREnabled then t_2.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else themeModule.transparency("DarkenBackground")
			quart = Enum.EasingStyle.Quad
			var290 = if constantsModule then constantsModule.ShieldOpenAnimationTweenTime else 0.5
		end
		if p72 then
			if t_2.DarkenBackgroundTween then
				t_2.DarkenBackgroundTween:Cancel()
				t_2.DarkenBackgroundTween = nil
			end
			t_2.DarkenBackground.BackgroundTransparency = var289
		else
			local tweenInfo = TweenInfo.new(var290, quart, Enum.EasingDirection.Out)
			
			if t_2.DarkenBackgroundTween then
				t_2.DarkenBackgroundTween:Cancel()
			end
			t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, { BackgroundTransparency = var289 })
			t_2.DarkenBackgroundTween:Play()
		end
		t_2.DarkenBackground.Visible = p71
	end else nil
	
	setVisibilityInternal = function(value, p73, p74, _, p75) --[[ line: 3140 | named "setVisibilityInternal" ]]
		-- upvalues: t (copy), t_2 (ref), perfUtilsModule (copy), robloxGui (copy), var144 (write), onScreenSizeChanged (ref), utilityModule (copy), var127 (ref), guiService (copy), themeModule (copy), experienceMenuSessionManagerInstance (copy), constantsModule (copy), gameSettings (copy), tweenService (copy), contextActionService (copy), var138 (ref), var140 (ref), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), userInputService (copy), var139 (ref), var63 (copy), VRService (copy), mouseIconOverrideService (copy), settingsHubCursorOverride (copy), removeBottomBarBindings (ref), chatSelectorModule (copy), fFlagEnableNewBackpack (copy), var3 (copy), inExperienceAppChatModalModule (copy), var64 (copy), var128 (ref), SHIELD_INACTIVE_POSITION (copy), rbxAnalyticsService (copy)
		local _ = nil
		local var292 = if t.isInExperienceUIVREnabled then p73 or not t_2.SettingsUIDelegate:isOpenCloseAnimationAllowed() else p73
		t_2.OpenStateChangedCount += 1
		local var293 = value ~= t_2.Visible
		t_2.Visible = value
		
		if t.FFlagEnableInGameMenuDurationLogger and var293 and not value then
			perfUtilsModule.menuClose()
		end
		if t_2.ResizedConnection then
			t_2.ResizedConnection:disconnect()
			t_2.ResizedConnection = nil
		end
		if t_2.BackBarVisibleConnection then
			t_2.BackBarVisibleConnection:disconnect()
			t_2.BackBarVisibleConnection = nil
		end
		if t.EngineFeatureTeleportHistoryButtons and t_2.FrontBarVisibleConnection then
			t_2.FrontBarVisibleConnection:disconnect()
			t_2.FrontBarVisibleConnection = nil
		end
		if t_2.PreferredTransparencyChangedConnection then
			t_2.PreferredTransparencyChangedConnection:disconnect()
			t_2.PreferredTransparencyChangedConnection = nil
		end
		t_2.Modal.Visible = t_2.Visible
		
		if t_2.TabConnection then
			t_2.TabConnection:disconnect()
			t_2.TabConnection = nil
		end
		local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
		
		if t.FFlagSettingsHubIndependentBackgroundVisibility then
			var144(t_2.Visible, var292)
		end
		if t_2.Visible then
			t_2.ResizedConnection = robloxGui.Changed:connect(function(p76) --[[ line: 3190 ]]
				-- upvalues: onScreenSizeChanged (copy)
				if p76 == "AbsoluteSize" then
					onScreenSizeChanged()
				end
			end)
			
			if t.FFlagMenuButtonsMountWithIEM then
				if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
					var127()
				end
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 and (utilityModule:IsSmallTouchScreen() and t_2.PlayersPage) then
					t_2.PlayersPage:CreateMenuButtonsContainer()
				end
			end
			if not t.FFlagAddTraversalBackButton then
				if t_2.BackBarRef:getValue() then
					t_2.BackBarVisibleConnection = t_2.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ line: 3210 ]]
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end
				if t.EngineFeatureTeleportHistoryButtons and t_2.FrontBarRef:getValue() then
					t_2.FrontBarVisibleConnection = t_2.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ line: 3215 ]]
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end
			end
			onScreenSizeChanged()
			t_2.PreferredTransparencyChangedConnection = guiService:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ line: 3222 ]]
				-- upvalues: t_2 (copy), themeModule (copy), guiService (copy)
				t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
			end)
			t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
			t_2.SettingsShowSignal:fire(t_2.Visible)
			guiService:SetMenuIsOpen(true, "SettingsHub")
			experienceMenuSessionManagerInstance:OpenExperienceMenu()
			t_2.Shield.Visible = t_2.Visible
			guiService:CloseInspectMenu()
			
			if var292 or not t_2.Shield:IsDescendantOf(game) then
				t_2.Shield.Position = UDim2.new(0, 0, 0, 0)
				
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
						t_2.DarkenBackgroundTween = nil
					end
					t_2.DarkenBackground.BackgroundTransparency = themeModule.transparency("DarkenBackground")
				end
			else
				local var295 = if constantsModule then constantsModule.ShieldOpenAnimationTweenTime else 0.5
				
				if gameSettings.ReducedMotion then
					if t_2.ReducedMotionOpenTween then
						t_2.ReducedMotionOpenTween:Cancel()
						t_2.ReducedMotionOpenTween = nil
					end
					if t_2.ReducedMotionCloseTween then
						t_2.ReducedMotionCloseTween:Cancel()
						t_2.ReducedMotionCloseTween = nil
					end
					t_2.Shield.Parent = t_2.CanvasGroup
					t_2.CanvasGroup.GroupTransparency = 1
					t_2.CanvasGroup.Visible = true
					t_2.Shield.Position = UDim2.new(0, 0, 0, 0)
					t_2.ReducedMotionOpenTween = tweenService:Create(t_2.CanvasGroup, TweenInfo.new(0.25), { GroupTransparency = 0 })
					t_2.ReducedMotionOpenTween:Play()
					t_2.ReducedMotionOpenTween.Completed:Connect(function(p77) --[[ line: 3271 ]]
						-- upvalues: t_2 (copy)
						if p77 == Enum.PlaybackState.Completed then
							t_2.Shield.Parent = t_2.ClippingShield
							t_2.ReducedMotionOpenTween = nil
						end
						t_2.CanvasGroup.Visible = false
					end)
					
					if t.FFlagEnableInGameMenuDurationLogger then
						perfUtilsModule.menuOpenComplete()
					end
				else
					t_2.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, var295, true, function() --[[ line: 3290 ]]
						-- upvalues: t (copy), perfUtilsModule (copy)
						if t.FFlagEnableInGameMenuDurationLogger then
							perfUtilsModule.menuOpenComplete()
						end
					end)
				end
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					local tweenInfo = TweenInfo.new(var295, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
					end
					t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, {
						BackgroundTransparency = themeModule.transparency("DarkenBackground")
					})
					t_2.DarkenBackgroundTween:Play()
				end
			end
			contextActionService:BindCoreAction("RbxSettingsHubStopCharacter", if t.isInExperienceUIVREnabled then function(p78, p79, p80) --[[ line: 3316 ]]
				-- upvalues: t_2 (copy)
				return if t_2.SettingsUIDelegate:isInputEventNeededBySettings(p78, p79, p80) then Enum.ContextActionResult.Pass else nil
			end else function() --[[ line: 3314 ]] end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			
			if not t.FFlagEnableSideSheet then
				contextActionService:BindCoreAction("RbxSettingsHubSwitchTab", var138, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			end
			contextActionService:BindCoreAction("RbxSettingsScrollHotkey", var140, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown)
			
			if shouldShowBottomBar() then
				setBottomBarBindings()
				
				if t.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(t_2.Pages.CurrentPage)
				end
			end
			if t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
			end
			if not t.FFlagEnableSideSheet then
				t_2.TabConnection = userInputService.InputBegan:connect(var139)
			end
			setOverrideMouseIconBehavior()
			var63 = userInputService.LastInputTypeChanged:connect(setOverrideMouseIconBehavior)
			
			if userInputService.MouseEnabled and not VRService.VREnabled then
				mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
			end
			t_2:CloseReactPage()
			
			if p74 then
				removeBottomBarBindings()
				t_2:SwitchToPage(p74, nil, 1, true)
			else
				t_2:SwitchToPage(t_2:GetFirstPageWithTabHeader(), nil, 1, true)
			end
			local var297 = if t.isInExperienceUIVREnabled and not t.InExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true
			
			if var297 then
				if not t.FFlagAddNewPlayerListMobileFocusNav then
					playerListManagerModule:HideTemp("SettingsMenu", true)
				elseif playerListManagerModule:GetIsModal() then
					playerListManagerModule:SetVisibility(false)
				else
					playerListManagerModule:HideTemp("SettingsMenu", true)
				end
				if not t.isInExperienceUIVREnabled or not t.InExperienceUIVRIXP:isMovePanelToCenter() or (not t.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled) then
					chatSelectorModule:HideTemp("SettingsMenu", true)
				end
				if fFlagEnableNewBackpack then
					var3.setVisibility(var3.FeatureName.Backpack, false)
				else
					var297 = require(robloxGui.Modules.BackpackScript)
					
					if var297.IsOpen then
						var297:OpenClose()
					end
				end
			end
			if t.GetFFlagEnableAppChatInExperience() and inExperienceAppChatModalModule:getVisible() then
				var64 = true
				inExperienceAppChatModalModule.default:setVisible(false)
			end
			if not t.isInExperienceUIVREnabled then
				if fFlagEnableNewBackpack then
					var3.setVisibility(var3.FeatureName.Backpack, false)
				else
					local backpackScriptModule = require(robloxGui.Modules.BackpackScript)
					
					if backpackScriptModule.IsOpen then
						backpackScriptModule:OpenClose()
					end
				end
			end
			t_2.GameSettingsPage:OpenSettingsPage()
		else
			t_2.CurrentPageSignal:fire("")
			
			if t.FFlagMenuButtonsMountWithIEM and t.FFlagRelocateMobileMenuButtons then
				if t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					var128()
				end
				if t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.PlayersPage then
					t_2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			if t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(nil)
			end
			if t.GetFFlagEnableAppChatInExperience() and var64 then
				var64 = false
			end
			if t.isInExperienceUIVREnabled and t.InExperienceUIVRIXP:isMovePanelToCenter() then
				playerListManagerModule:HideTemp("SettingsMenu", false)
				
				if not t.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled then
					chatSelectorModule:HideTemp("SettingsMenu", false)
				end
			end
			if var292 then
				t_2.Shield.Position = SHIELD_INACTIVE_POSITION
				t_2.Shield.Visible = t_2.Visible
				t_2.SettingsShowSignal:fire(t_2.Visible)
				guiService:SetMenuIsOpen(false, "SettingsHub")
				experienceMenuSessionManagerInstance:CloseExperienceMenu()
				
				if t.FFlagEnableInGameMenuDurationLogger then
					perfUtilsModule.menuCloseComplete()
				end
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
						t_2.DarkenBackgroundTween = nil
					end
					t_2.DarkenBackground.BackgroundTransparency = 1
				end
			else
				local var299 = if constantsModule then constantsModule.ShieldCloseAnimationTweenTime else 0.4
				
				local function handleShieldClose() --[[ line: 3475 ]]
					-- upvalues: t (copy), t_2 (copy), guiService (copy), experienceMenuSessionManagerInstance (copy), perfUtilsModule (copy)
					if not t.FFlagAddTraversalBackButton then
						t_2.SettingsShowSignal:fire(t_2.Visible)
					end
					if not t_2.Visible then
						guiService:SetMenuIsOpen(false, "SettingsHub")
						experienceMenuSessionManagerInstance:CloseExperienceMenu()
					end
					if t.FFlagEnableInGameMenuDurationLogger then
						perfUtilsModule.menuCloseComplete()
					end
				end
				
				if t.FFlagAddTraversalBackButton then
					t_2.SettingsShowSignal:fire(t_2.Visible)
				end
				if gameSettings.ReducedMotion then
					if t_2.ReducedMotionOpenTween then
						t_2.ReducedMotionOpenTween:Cancel()
						t_2.ReducedMotionOpenTween = nil
					end
					if t_2.ReducedMotionCloseTween then
						t_2.ReducedMotionCloseTween:Cancel()
						t_2.ReducedMotionCloseTween = nil
					end
					t_2.Shield.Parent = t_2.CanvasGroup
					t_2.CanvasGroup.Visible = true
					t_2.ReducedMotionCloseTween = tweenService:Create(t_2.CanvasGroup, TweenInfo.new(0.25), { GroupTransparency = 1 })
					t_2.ReducedMotionCloseTween:Play()
					t_2.ReducedMotionCloseTween.Completed:Connect(function(p81) --[[ line: 3511 ]]
						-- upvalues: t_2 (copy), SHIELD_INACTIVE_POSITION (copy)
						if p81 == Enum.PlaybackState.Completed then
							t_2.Shield.Position = SHIELD_INACTIVE_POSITION
							t_2.Shield.Visible = t_2.Visible
							t_2.Shield.Parent = t_2.ClippingShield
							t_2.ReducedMotionCloseTween = nil
						end
						t_2.CanvasGroup.Visible = false
					end)
					handleShieldClose()
				elseif t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
					require(robloxGui.Modules.Chrome.Service):setShortcutBar(nil)
				end
				t_2.Shield:TweenPositionInternal(SHIELD_INACTIVE_POSITION, Enum.EasingDirection.In, Enum.EasingStyle.Quad, var299, true, function() --[[ line: 3534 ]]
					-- upvalues: t_2 (copy), handleShieldClose (ref)
					t_2.Shield.Visible = t_2.Visible
					handleShieldClose()
				end)
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					local tweenInfo = TweenInfo.new(var299, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
					end
					t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, { BackgroundTransparency = 1 })
					t_2.DarkenBackgroundTween:Play()
				end
			end
			if var63 then
				var63:disconnect()
			end
			if not t.isInExperienceUIVREnabled then
				playerListManagerModule:HideTemp("SettingsMenu", false)
				chatSelectorModule:HideTemp("SettingsMenu", false)
			elseif not t.InExperienceUIVRIXP:isMovePanelToCenter() and not VRService.VREnabled then
				playerListManagerModule:HideTemp("SettingsMenu", false)
				chatSelectorModule:HideTemp("SettingsMenu", false)
			end
			if not VRService.VREnabled then
				mouseIconOverrideService.pop(settingsHubCursorOverride)
			end
			t_2:CloseReactPage()
			clearMenuStack()
			
			if not t.FFlagEnableSideSheet then
				contextActionService:UnbindCoreAction("RbxSettingsHubSwitchTab")
			end
			contextActionService:UnbindCoreAction("RbxSettingsHubStopCharacter")
			contextActionService:UnbindCoreAction("RbxSettingsScrollHotkey")
			removeBottomBarBindings(0.4)
			guiService.SelectedCoreObject = nil
			t_2.GameSettingsPage:CloseSettingsPage()
			
			if t_2.ShareGamePage then
				t_2.ShareGamePage:ClearShareInviteLink(t_2.ShareGameApp)
			end
		end
		local t_1 = {
			source = p75,
			playsessionid = t_2.playSessionId,
			universeid = tostring(game.GameId)
		}
		
		if var293 then
			if value then
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsMenuOpenName, constantsModule.AnalyticsMenuActionName, t_1)
				
				if t.GetFFlagEnableLeaveGameUpsellEntrypoint() then
					task.spawn(checkLeaveGameUpsell)
					
					return
				end
			else
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsMenuCloseName, constantsModule.AnalyticsMenuActionName, t_1)
			end
		end
	end
	
	function t_2.SetVisibility(_, p82, p83, p84, p85, p86) --[[ line: 3616 ]]
		-- upvalues: t_2 (ref), setVisibilityInternal (write)
		if t_2.Visible == p82 then
			return
		end
		setVisibilityInternal(p82, p83, p84, p85, p86)
	end
	
	function t_2.SetBackgroundVisibility(_, p87, p88) --[[ line: 3622 ]]
		-- upvalues: t_2 (ref), var144 (write)
		if t_2.DarkenBackground.Visible == p87 then
			return
		end
		var144(p87, p88)
	end
	
	function t_2.GetVisibility(_) --[[ line: 3628 ]]
		-- upvalues: t_2 (ref)
		return t_2.Visible
	end
	
	function t_2.ToggleVisibility(_, p89, p90) --[[ line: 3632 ]]
		-- upvalues: setVisibilityInternal (write), t_2 (ref)
		setVisibilityInternal(not t_2.Visible, nil, nil, p89, p90)
	end
	
	function t_2.AddToMenuStack(_, p91) --[[ line: 3636 ]]
		-- upvalues: t_2 (ref)
		if t_2.MenuStack[#t_2.MenuStack] ~= p91 then
			t_2.MenuStack[#t_2.MenuStack + 1] = p91
		end
	end
	
	function t_2.InviteToGame(_) --[[ line: 3642 ]]
		-- upvalues: t (copy), IXPServiceWrapper (copy), gameInviteInviteExperimentVariant (copy), var56 (copy), userInputService (copy), var55 (copy), t_2 (ref), gameInviteModalManager (copy), gameInviteConstants (copy), robloxGui (copy)
		local var303 = false
		
		if t.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and t.FFlagLuaEnableGameInviteModalSettingsHub then
			local fStringGameInviteMenuLayer = t.GetFStringGameInviteMenuLayer()
			local var305 = IXPServiceWrapper:GetLayerData(fStringGameInviteMenuLayer)
			IXPServiceWrapper:LogUserLayerExposure(fStringGameInviteMenuLayer)
			
			if var305 and var305.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.UxRefresh then
				var303 = var305.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.InviteLimit
			end
		end
		if game:GetEngineFeature("PlatformFriendsService") and var56 and var56:IsInviteFriendsEnabled() then
			var56:ShowInviteFriendsUI()
			
			return
		elseif userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			if var55 then
				var55:PopupGameInviteUI()
				
				return
			end
		elseif var303 then
			if not t.FFlagAddInviteFriendsIntegration or t_2.Visible then
				t_2:ToggleVisibility()
			end
			gameInviteModalManager:openModal({ trigger = gameInviteConstants.Triggers.GameMenu })
			
			if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(nil)
				
				return
			end
		else
			t_2:AddToMenuStack(t_2.Pages.CurrentPage)
			t_2:SwitchToPage(t_2.ShareGamePage, nil, 1, true)
		end
	end
	
	function t_2.PopMenu(_, _, p92, p93) --[[ line: 3675 ]]
		-- upvalues: t_2 (ref), poppedMenu (ref), t (copy), robloxGui (copy)
		if t_2.MenuStack and #t_2.MenuStack > 0 then
			local var306 = t_2.MenuStack[#t_2.MenuStack]
			
			if type(var306) ~= "table" then
				poppedMenu:Fire(var306)
			end
			table.remove(t_2.MenuStack, #t_2.MenuStack)
			t_2:SwitchToPage(t_2.MenuStack[#t_2.MenuStack], true, 1, p92)
			
			if #t_2.MenuStack == 0 then
				if t.FFlagAddUILessMode then
					t_2:SetVisibility(false, nil, nil, nil, p93)
				else
					t_2:SetVisibility(false)
				end
				t_2.Pages.CurrentPage:Hide(0, 0, nil, nil, t_2.PageViewInnerFrame)
				
				return
			elseif t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
				
				return
			end
		else
			t_2.MenuStack = {}
			poppedMenu:Fire()
			
			if t.FFlagAddUILessMode then
				t_2:ToggleVisibility(nil, p93)
				
				return
			end
			t_2:ToggleVisibility(p93)
		end
	end
	
	function t_2.ShowShield(_) --[[ line: 3709 ]]
		-- upvalues: userInputService (copy), SETTINGS_SHIELD_TRANSPARENCY (copy), t_2 (ref)
		t_2.Shield.BackgroundTransparency = if userInputService.VREnabled then 1 else SETTINGS_SHIELD_TRANSPARENCY
	end
	
	function t_2.HideShield(_) --[[ line: 3719 ]]
		-- upvalues: t_2 (ref)
		t_2.Shield.BackgroundTransparency = 1
	end
	
	function t_2.ShowReactPage(_) --[[ line: 3723 ]]
		-- upvalues: t_2 (ref)
		if t_2.reactPage then
			t_2.reactPageAnalytics:openPage(t_2.reactPage.name)
		end
		t_2.ReactPage.Visible = true
		t_2.Page.Visible = false
	end
	
	function t_2.HideReactPage(_) --[[ line: 3732 ]]
		-- upvalues: t_2 (ref), t (copy)
		if t_2.reactPage then
			t_2.reactPageAnalytics:closePage(t_2.reactPage.name)
		end
		local visible = t_2.ReactPage.Visible
		t_2.ReactPage.Visible = false
		t_2.Page.Visible = true
		
		if t.FFlagCreateInExperienceMenuReact and t.FFlagIEMFocusNavToButtons and (t_2.Pages.CurrentPage and visible) and t_2.Visible then
			t_2.Pages.CurrentPage:SelectARow(true)
		end
	end
	
	function t_2.MountReactPage(_) --[[ line: 3746 ]]
		-- upvalues: t (copy), reactPageSignalModule (copy), t_2 (ref), reactRobloxModule (copy)
		if t.FFlagCreateInExperienceMenuReact then
			reactPageSignalModule(false).setCurrentReactPage(nil)
		end
		if t_2.reactPageRoot then
			t_2:UnmountReactPage()
		end
		t_2.reactPageRoot = reactRobloxModule.createRoot(t_2.ReactPage)
	end
	
	function t_2.UnmountReactPage(_) --[[ line: 3756 ]]
		-- upvalues: t_2 (ref)
		if t_2.reactPageRoot then
			t_2.reactPageRoot:unmount()
			t_2.reactPageRoot = nil
		end
	end
	
	function t_2.CloseReactPage(_) --[[ line: 3763 ]]
		-- upvalues: t_2 (ref)
		t_2:HideReactPage()
		t_2:UnmountReactPage()
	end
	
	function t_2.SwitchToReactPage(_, p94, p95, p96) --[[ line: 3768 ]]
		-- upvalues: t (copy), t_2 (ref)
		if t.FFlagCreateInExperienceMenuReact and p96 then
			t_2:UnmountReactPage()
		elseif p94 then
			t_2.reactPage = p94
			
			if not t_2.reactPageRoot then
				t_2:MountReactPage()
			end
			t_2.reactPageRoot:render(p94:createPage(p95))
		end
		t_2:ShowReactPage()
	end
	
	t_2.GameSettingsPageReorderIXPFetched = false
	local var145 = nil
	local var146 = nil
	
	local function enableVR() --[[ line: 3786 ]]
		-- upvalues: corePackagesService (copy), t_2 (ref), var145 (write)
		local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
		local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
		local settingsMenu = panel3D.Get("SettingsMenu")
		settingsMenu:ResizeStuds(4, 4, 250)
		settingsMenu:SetType(panel3D.Type.Standard)
		settingsMenu:SetVisible(false)
		settingsMenu:SetCanFade(false)
		t_2.ClippingShield.Parent = settingsMenu:GetGUI()
		t_2.Shield.Parent.ClipsDescendants = false
		t_2.VRShield.Visible = true
		t_2:HideShield()
		var145 = t_2.SettingsShowSignal:connect(function(p97) --[[ line: 3800 ]]
			-- upvalues: settingsMenu (ref), VRHub (ref)
			if p97 then
				settingsMenu:SetVisible(true)
				VRHub:FireModuleOpened("SettingsMenu")
				
				return
			end
			settingsMenu:SetVisible(false)
			VRHub:FireModuleClosed("SettingsMenu")
		end)
		VRHub.ModuleOpened.Event:connect(function(p98) --[[ line: 3812 ]]
			-- upvalues: t_2 (copy)
			if p98 ~= "SettingsMenu" then
				t_2:SetVisibility(false)
			end
		end)
	end
	
	local function disableVR() --[[ line: 3818 ]]
		-- upvalues: t_2 (ref), robloxGui (copy), var145 (write), var146 (write), corePackagesService (copy)
		t_2.ClippingShield.Parent = robloxGui
		t_2.Shield.Parent.ClipsDescendants = true
		t_2.VRShield.Visible = false
		t_2:ShowShield()
		
		if var145 then
			var145:disconnect()
			var145 = nil
		end
		if var146 then
			var146:disconnect()
			var146 = nil
		end
		require(corePackagesService.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false)
	end
	
	local _ = function() --[[ line: 3838 | named "refreshForSpatialUI" ]]
		-- upvalues: onScreenSizeChanged (ref), t_2 (ref), themeModule (copy), guiService (copy), resizeBottomBarButtons (ref)
		onScreenSizeChanged()
		t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
		resizeBottomBarButtons()
	end
	
	local function OnVREnabled(p99) --[[ line: 3844 ]]
		-- upvalues: userInputService (copy), t (copy), t_2 (ref), onScreenSizeChanged (ref), themeModule (copy), guiService (copy), resizeBottomBarButtons (ref), enableVR (ref), disableVR (ref)
		if p99 == "VREnabled" then
			if userInputService.VREnabled then
				if t.isInExperienceUIVREnabled then
					t_2.SettingsUIDelegate:enableVR()
					onScreenSizeChanged()
					t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
					resizeBottomBarButtons()
					
					return
				end
				enableVR()
				
				return
			elseif t.isInExperienceUIVREnabled then
				t_2.SettingsUIDelegate:disableVR()
				onScreenSizeChanged()
				t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
				resizeBottomBarButtons()
				
				return
			end
			disableVR()
		end
	end
	
	userInputService.Changed:connect(OnVREnabled)
	OnVREnabled("VREnabled")
	t_2.ResetCharacterPage:SetHub(t_2)
	
	if inExperienceCapabilities.canNavigateHome then
		t_2.LeaveGamePage:SetHub(t_2)
	end
	if t.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		t_2.LeaveGameUpsellPage:SetHub(t_2)
	end
	t_2.GameSettingsPage = require(robloxGui.Modules.Settings.Pages.GameSettingsWrapper)
	t_2.GameSettingsPage:SetHub(t_2)
	t_2.ReportAbusePage = require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage)
	t_2.ReportAbusePage:SetHub(t_2)
	t_2.ReportSentPage = require(robloxGui.Modules.Settings.Pages.ReportSentPage)
	t_2.ReportSentPage:SetHub(t_2)
	t_2.ReportSentPageV2 = require(robloxGui.Modules.Settings.Pages.ReportSentPageV2)
	t_2.ReportSentPageV2:SetHub(t_2)
	t_2.HelpPage = require(robloxGui.Modules.Settings.Pages.HelpWrapper)
	t_2.HelpPage:SetHub(t_2)
	
	if t.FFlagHelpPageIXPExposure then
		t_2.HelpPageIXPFetched = false
	end
	if not t.FFlagRemoveRecordPage then
		if platform == Enum.Platform.Windows and not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			t_2.RecordPage = require(robloxGui.Modules.Settings.Pages.Record)
			t_2.RecordPage:SetHub(t_2)
		end
	end
	if inExperienceCapabilities.canListPeopleInSameServer then
		t_2.PlayersPage = require(robloxGui.Modules.Settings.Pages.PeopleWrapper)
		t_2.PlayersPage:SetHub(t_2)
		
		if not t.FFlagMenuButtonsMountWithIEM and t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 2 and utilityModule:IsSmallTouchScreen()) then
			t_2.PlayersPage:CreateMenuButtonsContainer()
		end
	end
	if t.FFlagAddIEMProfilePage then
		t_2.PlayerProfilePage = require(robloxGui.Modules.Settings.Pages.PlayerProfile)
	end
	if not t.FFlagRemoveExitModal and isSubjectToDesktopPolicies() then
		t_2.ExitModalPage = require(robloxGui.Modules.Settings.Pages.ExitModal)
		t_2.ExitModalPage:SetHub(t_2)
	end
	if isSubjectToDesktopPolicies() and inExperienceCapabilities.canNavigateHome then
		t_2.LeaveGameToHomePage = require(robloxGui.Modules.Settings.Pages.LeaveGameToHome)
		t_2.LeaveGameToHomePage:SetHub(t_2)
	end
	if not var10 and GetCorePackagesLoaded({ "Roact", "Rodux", "RoactRodux" }) then
		local corePackagesService_1 = game:GetService("CorePackages")
		t_2.ShareGameApp = require(robloxGui.Modules.Settings.ShareGameMaster).createApp(t_2.PageViewClipper, gameInviteAnalytics.new():withEventStream(require(corePackagesService_1.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new(rbxAnalyticsService)):withDiag(require(corePackagesService_1.Workspace.Packages.Analytics).AnalyticsReporters.Diag.new(rbxAnalyticsService)):withButtonName(gameInviteAnalytics.ButtonName.SettingsHub))
		t_2.ShareGamePage = require(robloxGui.Modules.Settings.Pages.ShareGamePlaceholderPage)
		t_2.ShareGamePage:ConnectHubToApp(t_2, t_2.ShareGameApp)
		t_2:AddPage(t_2.ShareGamePage)
	end
	local var151 = capturesPolicy.PolicyImplementation.read()
	
	if (if var151 then capturesPolicy.Mapper(var151).eligibleForCapturesFeature() else false) and (if t.isInExperienceUIVREnabled and t.FFlagFixSpatialUICaptures then not isSpatial() else true) then
		local capturesPageWrapperModule = require(robloxGui.Modules.Settings.Pages.CapturesPageWrapper)
		
		local function closeSettingsMenu() --[[ line: 3968 ]]
			-- upvalues: t_2 (ref)
			t_2:SetVisibility(false, true)
		end
		
		t_2.CapturesApp = capturesAppModule
		t_2.CapturesApp.mountMenuPage(capturesPageWrapperModule.Page, closeSettingsMenu, t.ChromeEnabled)
		t_2.CapturesPage = capturesPageWrapperModule
		t_2.CapturesPage:ConnectHubToApp(t_2, t_2.PageViewClipper, t_2.CapturesApp)
	end
	if t.FFlagIntegrateTraversalHistoryInSideSheet then
		t_2.TraversalHistoryPage = require(robloxGui.Modules.Settings.Pages.TraversalHistoryWrapper)()
		t_2.TraversalHistoryPage:SetHub(t_2)
	end
	if t_2.PlayersPage then
		t_2:AddPage(t_2.PlayersPage)
	end
	t_2:AddPage(t_2.ResetCharacterPage)
	
	if t_2.LeaveGamePage then
		t_2:AddPage(t_2.LeaveGamePage)
	end
	if t.GetFFlagEnableLeaveGameUpsellEntrypoint() and t_2.LeaveGameUpsellPage then
		t_2:AddPage(t_2.LeaveGameUpsellPage)
	end
	t_2:AddPage(t_2.GameSettingsPage)
	
	if t_2.CapturesPage then
		t_2:AddPage(t_2.CapturesPage)
	end
	if t_2.ReportAbusePage then
		t_2:AddPage(t_2.ReportAbusePage)
	end
	if t_2.ReportSentPage then
		t_2:AddPage(t_2.ReportSentPage)
	end
	if t_2.ReportSentPageV2 then
		t_2:AddPage(t_2.ReportSentPageV2)
	end
	t_2:AddPage(t_2.HelpPage)
	
	if not t.FFlagRemoveRecordPage and t_2.RecordPage and not t_2.CapturesPage then
		t_2:AddPage(t_2.RecordPage)
	end
	if not t.FFlagRemoveExitModal and t_2.ExitModalPage then
		t_2:AddPage(t_2.ExitModalPage)
	end
	if t_2.LeaveGameToHomePage then
		t_2:AddPage(t_2.LeaveGameToHomePage)
	end
	if t_2.TraversalHistoryPage then
		t_2:AddPage(t_2.TraversalHistoryPage)
	end
	t_2:InitInPage(t_2:GetFirstPageWithTabHeader())
	
	if not t.isNewInGameMenuEnabled() and (not t.FFlagAddUILessMode or t.FIntAddUILessModeVariant == 0) then
		contextActionService:BindCoreAction("RBXEscapeMainMenu", function(_, p100, _) --[[ line: 4038 ]]
			-- upvalues: t (copy), getSideSheetVisibility (copy), toggleSideSheet (copy), t_2 (ref), constantsModule (copy)
			if p100 ~= Enum.UserInputState.Begin then return end
			if t.FFlagEnableSideSheet then
				if getSideSheetVisibility() then
					toggleSideSheet(false)
					
					return
				elseif t_2.MenuStack and #t_2.MenuStack > 0 then
					if t.FFlagAddUILessMode then
						t_2:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
						
						return
					end
					t_2:PopMenu(false, true)
					
					return
				else
					toggleSideSheet(true)
					
					return
				end
			elseif t.FFlagAddUILessMode then
				t_2:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
				
				return
			end
			t_2:PopMenu(false, true)
		end, false, Enum.KeyCode.Escape)
	end
	guiService.ShowLeaveConfirmation:connect(function() --[[ line: 4069 ]]
		-- upvalues: t (copy), getSideSheetVisibility (copy), toggleSideSheet (copy), t_2 (ref), constantsModule (copy)
		if t.FFlagEnableSideSheet and t.FFlagSideSheetAndroidBack then
			if getSideSheetVisibility() then
				toggleSideSheet(false)
				
				return
			elseif #t_2.MenuStack > 0 then
				t_2:PopMenu(false, true)
				
				return
			end
			toggleSideSheet(true)
			
			return
		elseif #t_2.MenuStack == 0 then
			t_2:SetVisibility(true, nil, nil, nil, constantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame)
			t_2:SwitchToPage(t_2:GetFirstPageWithTabHeader(), nil, 1)
			
			return
		end
		t_2:PopMenu(false, true)
	end)
	contextActionService:BindCoreAction("Open Dev Console", toggleDevConsole, false, Enum.KeyCode.F9)
	contextActionService:BindCoreAction("Show Quick Profiler", toggleQuickProfilerFromHotkey, false, Enum.KeyCode.F7)
	userInputService.InputBegan:connect(function(p101) --[[ line: 4105 ]]
		-- upvalues: t_2 (ref), guiService (copy)
		if (p101.KeyCode == Enum.KeyCode.Left or p101.KeyCode == Enum.KeyCode.Right or (p101.KeyCode == Enum.KeyCode.Up or p101.KeyCode == Enum.KeyCode.Down)) and (t_2.Visible and t_2.Active and (t_2.Pages.CurrentPage and guiService.SelectedCoreObject == nil)) then
			t_2.Pages.CurrentPage:SelectARow()
		end
	end)
	local var154 = false
	
	local _ = function() --[[ line: 4119 | named "logExitModalIXPExposureOnce" ]]
		-- upvalues: var154 (write), IXPServiceWrapper (copy), t (copy)
		if var154 then
			return
		end
		var154 = true
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
	end
	
	if t.FFlagRemoveExitModal and isSubjectToDesktopPolicies() then
		game:GetService("GuiService").NativeClose:Connect(function() --[[ line: 4128 ]]
			-- upvalues: t (copy), var154 (write), IXPServiceWrapper (copy), leaveGameModule (copy)
			if t.FFlagEnableExitModalExposure and not var154 then
				var154 = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
			end
			leaveGameModule(false, { shouldNativeExit = true })
		end)
		
		if t_2.FullScreenTitleBar then
			t_2.FullScreenTitleBar = settingsFullScreenTitleBarModule.update(t_2.FullScreenTitleBar, {
				onClose = function() --[[ line: 4137 ]]
					-- upvalues: t (copy), var154 (write), IXPServiceWrapper (copy), leaveGameModule (copy)
					if t.FFlagEnableExitModalExposure and not var154 then
						var154 = true
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
					end
					leaveGameModule(false, { shouldNativeExit = true })
				end
			})
		end
	elseif t_2.ExitModalPage then
		local buttonsContainer
		local function showExitModal() --[[ line: 4146 ]]
			-- upvalues: t (copy), var154 (write), IXPServiceWrapper (copy), t_2 (ref), removeBottomBarBindings (ref)
			if t.FFlagEnableExitModalExposure and not var154 then
				var154 = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
			end
			t_2.HubBar.Visible = false
			removeBottomBarBindings()
			
			if t_2:GetVisibility() then
				t_2:AddToMenuStack(t_2.Pages.CurrentPage)
				t_2:SwitchToPage(t_2.ExitModalPage, nil, 1, true)
				
				return
			end
			t_2:SetVisibility(true, nil, t_2.ExitModalPage, false)
		end
		
		local function handleNativeExit() --[[ line: 4159 ]]
			-- upvalues: t_2 (ref), t (copy), perfUtilsModule (copy), var128 (ref), showExitModal (ref)
			if not t_2:GetVisibility() or t_2.Pages.CurrentPage ~= t_2.ExitModalPage then
				showExitModal()
				
				return
			elseif t.FFlagEnableInGameMenuDurationLogger then
				perfUtilsModule.leavingGame()
			end
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				var128()
				
				if t.FFlagMenuButtonsMountWithIEM and t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.PlayersPage then
					t_2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			t_2.ExitModalPage.LeaveAppFunc(true)
		end
		
		game:GetService("GuiService").NativeClose:Connect(handleNativeExit)
		
		if t_2.FullScreenTitleBar then
			t_2.FullScreenTitleBar = settingsFullScreenTitleBarModule.update(t_2.FullScreenTitleBar, { onClose = handleNativeExit })
		end
	end
	if t.GetFFlagEnableAppChatInExperience() then
		buttonsContainer = nil
		t_2.SettingsShowSignal:connect(function(p102) --[[ line: 4188 ]]
			-- upvalues: buttonsContainer (write), inExperienceAppChatModalModule (copy), t_2 (ref)
			if p102 then
				buttonsContainer = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p103) --[[ line: 4190 ]]
					-- upvalues: t_2 (copy)
					if p103 and t_2.Visible then
						t_2:SetVisibility(false, true)
					end
				end)
				
				return
			elseif buttonsContainer then
				buttonsContainer:Disconnect()
				buttonsContainer = nil
			end
		end)
	end
	if t.FFlagCreateInExperienceMenuReact then
		t_2.InExperienceMenuReact = create("Folder")({
			Name = "InExperienceMenuReact",
			Parent = t_2.ClippingShield
		})
		buttonsContainer = t_2.PlayersPage.ButtonsContainer
		
		local var157 = function(p104) --[[ line: 4218 ]]
			-- upvalues: reactModule (copy), t_2 (ref), signalsModule (copy), t (copy), isSpatial (copy), portalWithFoundationStylelinkModule (copy), traversalHistoryMenu (copy)
			local var308, var309 = reactModule.useState(p104.showSignal(false) and t_2.Visible)
			reactModule.useEffect(function() --[[ line: 4220 ]]
				-- upvalues: signalsModule (copy), var309 (ref), p104 (ref), t_2 (copy)
				local var310 = signalsModule.createEffect(function(p105) --[[ line: 4221 ]]
					-- upvalues: var309 (copy), p104 (copy), t_2 (copy)
					var309(p104.showSignal(p105) and t_2.Visible)
				end)
				local settingsShowSignalConnection = t_2.SettingsShowSignal:connect(function(p106) --[[ line: 4224 ]]
					-- upvalues: var309 (copy), p104 (copy)
					var309(p104.showSignal(false) and p106)
				end)
				
				return function() --[[ line: 4228 ]]
					-- upvalues: var310 (ref), settingsShowSignalConnection (ref)
					var310()
					settingsShowSignalConnection:Disconnect()
				end
			end, {})
			
			return t.FFlagAddTraversalHistory and (not (t.isInExperienceUIVREnabled and isSpatial()) and (p104.parent and (var308 and reactModule.createElement(portalWithFoundationStylelinkModule, { parent = p104.parent }, {
				TraversalHistoryMenu = reactModule.createElement(traversalHistoryMenu, {
					anchorParent = p104.parent,
					currentPageChangeSignal = p104.currentPageChangeSignal,
					menuSide = p104.menuSide
				})
			}))))
		end
		
		reactRobloxModule.createRoot(t_2.InExperienceMenuReact):render(reactModule.createElement(inExperienceMenuReactModule, nil, {
			InExperienceMenuReactPage = reactModule.createElement(inExperienceMenuReactPageModule, {
				onMount = function() --[[ line: 4249 ]]
					-- upvalues: t_2 (ref)
					t_2:SwitchToReactPage(nil, nil, true)
				end,
				onUnmount = function() --[[ line: 4250 ]]
					-- upvalues: t_2 (ref), reactPageSignalModule (copy)
					t_2:CloseReactPage()
					reactPageSignalModule(false).setCurrentReactPage(nil)
				end,
				mountTo = t_2.ReactPage
			}),
			TraversalHistoryMenuBottomBar = reactModule.createElement(var157, {
				showSignal = t_2.showBottomBarSignal,
				parent = if t.FFlagAddTraversalHistory then t_2.LeaveGameButton else nil,
				menuSide = foundationModule.Enums.PopoverSide.Top,
				currentPageChangeSignal = t_2.CurrentPageSignal
			}),
			TraversalHistoryMenuMobileButton = reactModule.createElement(var157, {
				showSignal = signalsModule.createComputed(function(p107) --[[ line: 4263 ]]
					-- upvalues: t_2 (ref)
					return not t_2.showBottomBarSignal(p107)
				end),
				parent = if buttonsContainer then buttonsContainer:FindFirstChild("LeaveButtonButton", true) else nil,
				menuSide = foundationModule.Enums.PopoverSide.Bottom,
				currentPageChangeSignal = t_2.CurrentPageSignal
			})
		}))
	end
	return t_2
end

local t_2 = {
	ModuleName = "SettingsMenu",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	SetVisibility = nil
}
VRHub:RegisterModule(t_2)
VRHub.ModuleOpened.Event:connect(function(p108) --[[ line: 4288 ]]
	-- upvalues: t_2 (ref), VRHub (ref)
	if p108 ~= t_2.ModuleName and VRHub:GetModule(p108).VRIsExclusive then
		t_2:SetVisibility(false)
	end
end)
local var95 = CreateSettingsHub()

function t_2.GetExperienceControlStore(_) --[[ line: 4299 ]]
	-- upvalues: var95 (ref)
	return var95:GetExperienceControlStore()
end

function t_2.SetVisibility(_, p109, p110, p111, p112, p113) --[[ line: 4303 ]]
	-- upvalues: var95 (ref)
	var95:SetVisibility(p109, p110, p111, p112, p113)
end

function t_2.SetBackgroundVisibility(_, p114, p115) --[[ line: 4307 ]]
	-- upvalues: var95 (ref)
	var95:SetBackgroundVisibility(p114, p115)
end

function t_2.ToggleVisibility(_, p116, p117) --[[ line: 4311 ]]
	-- upvalues: var95 (ref)
	var95:ToggleVisibility(p116, p117)
end

function t_2.SwitchToPage(_, p118, p119) --[[ line: 4315 ]]
	-- upvalues: var95 (ref)
	var95:SwitchToPage(p118, p119, 1)
end

if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 then
	function t_2.PopMenu(_, p120, p121, p122) --[[ line: 4320 ]]
		-- upvalues: var95 (ref)
		return var95:PopMenu(p120, p121, p122)
	end
end
function t_2.GetVisibility(_) --[[ line: 4325 ]]
	-- upvalues: var95 (ref)
	return var95.Visible
end

function t_2.ShowShield(_) --[[ line: 4329 ]]
	-- upvalues: var95 (ref)
	var95:ShowShield()
end

function t_2.HideShield(_) --[[ line: 4333 ]]
	-- upvalues: var95 (ref)
	var95:HideShield()
end

function t_2.GetRespawnBehaviour(_) --[[ line: 4337 ]]
	-- upvalues: var95 (ref)
	return var95:GetRespawnBehaviour()
end

function t_2.CloseReactPage(_) --[[ line: 4341 ]]
	-- upvalues: var95 (ref)
	var95:CloseReactPage()
end

function t_2.SwitchToReactPage(_, p123, p124, p125) --[[ line: 4345 ]]
	-- upvalues: var95 (ref)
	var95:SwitchToReactPage(p123, p124, p125)
end

if t.FFlagAddInviteFriendsIntegration then
	function t_2.InviteToGame(_) --[[ line: 4350 ]]
		-- upvalues: var95 (ref)
		var95:InviteToGame()
	end
end
t_2.RespawnBehaviourChangedEvent = var95.RespawnBehaviourChangedEvent
t_2.SettingsShowSignal = var95.SettingsShowSignal
t_2.CurrentPageSignal = var95.CurrentPageSignal
t_2.SettingsShowEvent = Instance.new("BindableEvent")
var95.SettingsShowSignal:connect(function(p126) --[[ line: 4363 ]]
	-- upvalues: t_2 (ref)
	t_2.SettingsShowEvent:Fire(p126)
end)
t_2.Instance = var95

return t_2