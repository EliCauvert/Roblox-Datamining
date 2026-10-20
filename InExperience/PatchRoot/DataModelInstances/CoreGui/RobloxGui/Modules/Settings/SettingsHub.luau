local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local TelemetryService = game:GetService("TelemetryService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local PortalWithFoundationStylelinkModule = require(script.Parent.Components.PortalWithFoundationStylelink)
local InExperienceMenuReactModule = require(script.Parent.InExperienceMenuReact)
local InExperienceMenuReactPageModule = require(script.Parent.Pages.InExperienceMenuReactPage)
local ReactPageSignalModule = require(script.Parent.ReactPageSignal)
local UtilsModule = require(script.Parent.Integrations.Utils)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local PerfUtilsModule = require(RobloxGui.Modules.Common.PerfUtils)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local SwitchTabHint = require(RobloxGui.Modules.Settings.Components.TabHeader).SwitchTabHint
local TraversalHistoryMenu = require(RobloxGui.Modules.Settings.Components.Traversal).TraversalHistoryMenu
local MenuBackButtonModule = require(RobloxGui.Modules.Settings.Components.MenuBackButton)
local MenuFrontButtonModule = require(RobloxGui.Modules.Settings.Components.MenuFrontButton)
local MenuButtonsContainerModule = require(RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local GetCamMicPermissionsModule = require(CoreGui.RobloxGui.Modules.Settings.getCamMicPermissions)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local SignalsModule = require(CorePackages.Packages.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local AppStyleProvider = require(CorePackages.Packages.UIBlox).App.Style.AppStyleProvider
local Dark = require(CorePackages.Packages.Foundation).Enums.ColorMode.Dark
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local HelpPageModule = require(CorePackages.Workspace.Packages.HelpPage)
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local ThemeModule = require(script.Parent.Theme)
local SETTINGSSHIELD = ThemeModule.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902))
local SETTINGSSHIELDTRANSPARENCY = ThemeModule.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2)
local SHIELDINACTIVEPOSITION = ThemeModule.SHIELD_INACTIVE_POSITION
local SettingsHubCursorOverride = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol.named("SettingsHubCursorOverride")
local YOffset: number = if IsEnabled then 32 elseif UtilityModule:IsSmallTouchScreen() then 24 else 26
local CheckLeaveGameUpsellCooldown = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300)
local GetServerChannelRetries = game:DefineFastInt("GetServerChannelRetries", 10)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FlagsModule = require(script.Parent.Flags)
local config = {
	EngineFeatureRbxAnalyticsServiceExposePlaySessionId = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId"),
	EngineFeatureTeleportHistoryButtons = game:GetEngineFeature("TeleportHistoryButtons"),
	EngineFeaturePlayerScriptStatusProperty = game:GetEngineFeature("PlayerScriptStatusProperty"),
	FFlagPreventHiddenSwitchPage = game:DefineFastFlag("PreventHiddenSwitchPage", false),
	FFlagLuaEnableGameInviteModalSettingsHub = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false),
	FFlagFixDisableTopPaddingError = game:DefineFastFlag("FixDisableTopPaddingError", false),
	FFlagWaitPlayerModuleStatus = game:DefineFastFlag("WaitPlayerModuleStatus", false),
	GetFFlagLuaInExperienceCoreScriptsGameInviteUnification = require(RobloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification),
	FFlagEnableInGameMenuDurationLogger = require(RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)(),
	isNewInGameMenuEnabled = require(RobloxGui.Modules.isNewInGameMenuEnabled),
	GetFFlagRemoveAssetVersionEndpoint = require(RobloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint),
	GetFFlagNewEventIngestPlayerScriptsDimensions = require(RobloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions),
	GetFFlagReportAbuseMenuEntrypointAnalytics = require(RobloxGui.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics),
	GetFFlagEnableLeaveGameUpsellEntrypoint = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint),
	GetFStringInExperienceMenuIXPLayer = require(RobloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer),
	GetFStringExitModalIXPLayer = require(RobloxGui.Modules.Settings.Flags.GetFStringExitModalIXPLayer),
	GetFStringInExperienceMenuIXPVar = require(RobloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPVar),
	FFlagRelocateMobileMenuButtons = require(RobloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons),
	FIntRelocateMobileMenuButtonsVariant = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant),
	FFlagMenuButtonsMountWithIEM = require(RobloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM),
	FFlagSpatialUIFixMenuPanelChatExclusive = require(RobloxGui.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive),
	FFlagRemoveLoadingTimeout = require(RobloxGui.Modules.Flags.FFlagRemoveLoadingTimeout),
	FFlagAddNewPlayerListMobileFocusNav = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav,
	ChromeEnabled = require(CorePackages.Workspace.Packages.Chrome).Enabled(),
	FFlagRespawnChromeShortcutTelemetry = require(RobloxGui.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry),
	FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"),
	isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled,
	InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP,
	FFlagAddSwitchTabHintsToIEM = SharedFlagsModule.FFlagAddSwitchTabHintsToIEM,
	GetFStringGameInviteMenuLayer = SharedFlagsModule.GetFStringGameInviteMenuLayer,
	GetFFlagEnableAppChatInExperience = SharedFlagsModule.GetFFlagEnableAppChatInExperience,
	GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = SharedFlagsModule.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints,
	GetFFlagDisplayServerChannel = SharedFlagsModule.GetFFlagDisplayServerChannel,
	FFlagSettingsHubIndependentBackgroundVisibility = SharedFlagsModule.getFFlagSettingsHubIndependentBackgroundVisibility(),
	GetFFlagPackagifySettingsShowSignal = SharedFlagsModule.GetFFlagPackagifySettingsShowSignal,
	FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls,
	FFlagIEMTabFocusNav = SharedFlagsModule.FFlagIEMTabFocusNav,
	FFlagIEMFocusNavSupportNewButtons = FlagsModule.FFlagIEMFocusNavSupportNewButtons,
	FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode,
	FIntAddUILessModeVariant = SharedFlagsModule.FIntAddUILessModeVariant,
	FFlagInExperienceReportClosingBugfix = SharedFlagsModule.FFlagInExperienceReportClosingBugfix,
	FFlagEnableSettingsHubUIDelegateRollout = SharedFlagsModule.FFlagEnableSettingsHubUIDelegateRollout,
	FFlagAddIEMProfilePage = SharedFlagsModule.FFlagAddIEMProfilePage,
	FFlagFixSpatialUICaptures = SharedFlagsModule.FFlagFixSpatialUICaptures,
	FFlagVoiceRewarmTelemetry = SharedFlagsModule.FFlagVoiceRewarmTelemetry,
	FFlagAddTraversalBackButton = Traversal.Flags.FFlagAddTraversalBackButton,
	FFlagAddTraversalHistory = Traversal.Flags.FFlagAddTraversalHistory,
	FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false),
	FFlagHelpPageIXPExposure = HelpPageModule.Flags.FFlagHelpPageIXPExposure,
	FStringHelpPageIXPLayer = HelpPageModule.Flags.FStringHelpPageIXPLayer,
	FFlagFixDisabledScrollOnIos = game:DefineFastFlag("FixDisabledScrollOnIos", false),
	FFlagSideSheetAndroidBack = game:DefineFastFlag("SideSheetAndroidBack", false),
	FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration,
	FFlagIntegrateTraversalHistoryInSideSheet = SharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet,
	FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton,
	isExitModalRemoved = require(RobloxGui.Modules.Settings.Flags.isExitModalRemoved),
	FFlagEnableExitModalExposure = game:DefineFastFlag("EnableExitModalExposure", false)
}
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local GameSettings = UserSettings().GameSettings
local ExperienceMenuSessionManagerInstance = require(CorePackages.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local PlatformFriendsService = nil
pcall(function()
	-- upvalues: PlatformFriendsService (ref)
	PlatformFriendsService = game:GetService("PlatformFriendsService")
end)
local GetServerVersion = nil
spawn(function()
	-- upvalues: GetServerVersion (ref), RobloxReplicatedStorage (copy)
	GetServerVersion = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999)
end)
local GetServerChannel = nil

if config.GetFFlagDisplayServerChannel() then
	spawn(function()
		-- upvalues: GetServerChannel (ref), RobloxReplicatedStorage (copy)
		GetServerChannel = RobloxReplicatedStorage:WaitForChild("GetServerChannel", 1e999)
	end)
end
local IsPreferredInputMatch = UserInputService.PreferredInput == Enum.PreferredInput.Touch
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local Platform = UserInputService:GetPlatform()
local BaseUrl: string = ContentProvider.BaseUrl
local Inverted = not string.find(BaseUrl, "www.roblox.com")
local DevConsoleMasterModule = require(RobloxGui.Modules.DevConsoleMaster)
local LastInputTypeChangedConnection = nil
local Flag = false
local ServerResult = nil
local ServerResult1 = nil
local SettingsFullScreenTitleBarModule = require(RobloxGui.Modules.Settings.Components.SettingsFullScreenTitleBar)
local MenuLeaveGameTelemetryConfigModule = require(RobloxGui.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig)
local MenuResetCharacterTelemetryConfigModule = require(RobloxGui.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig)
local MenuResumeTelemetryConfigModule = require(RobloxGui.Modules.Settings.Analytics.MenuResumeTelemetryConfig)
local ReactPageAnalyticsModule = require(RobloxGui.Modules.Settings.Analytics.ReactPageAnalytics)
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local GameInviteModalManager = nil
local GameInviteInviteExperimentVariant = nil
local GameInviteConstants = nil

if config.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
	local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
	GameInviteModalManager = GameInviteModule.GameInviteModalManager
	GameInviteInviteExperimentVariant = GameInviteModule.GameInviteInviteExperimentVariant
	GameInviteConstants = GameInviteModule.GameInviteConstants
end
local CapturesAppModule = require(RobloxGui.Modules.Captures.CapturesApp)
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local IsSubjectToChinaPolicies = CachedPolicyServiceModule:IsSubjectToChinaPolicies()
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local SettingsHubRaceConditionFix = game:DefineFastFlag("SettingsHubRaceConditionFix", false)
local FixReportButtonCutOff = game:DefineFastFlag("FixReportButtonCutOff", false)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local SettingsShowSignal = if config.GetFFlagPackagifySettingsShowSignal() then require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil
local SettingsUtility = if config.GetFFlagPackagifySettingsShowSignal() then require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil
local config1 = { frequency = 4, dampingRatio = 1 }
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local GetDidSideSheetOpenWithPeoplePageFunction = InExperienceSideSheetModule.getDidSideSheetOpenWithPeoplePage
local GetHasRoomForPeoplePageFunction = InExperienceSideSheetModule.getHasRoomForPeoplePage
local GetIsPeoplePageOpenFunction = InExperienceSideSheetModule.getIsPeoplePageOpen
local GetSideSheetAnimationDurationFunction = InExperienceSideSheetModule.getSideSheetAnimationDuration
local GetSideSheetDrawerWidthFunction = InExperienceSideSheetModule.getSideSheetDrawerWidth
local GetSideSheetMenuPageHeightFunction = InExperienceSideSheetModule.getSideSheetMenuPageHeight
local GetSideSheetMenuPageWidthFunction = InExperienceSideSheetModule.getSideSheetMenuPageWidth
local ToggleSideSheetFunction = InExperienceSideSheetModule.toggleSideSheet
local GetSideSheetVisibilityFunction = InExperienceSideSheetModule.getSideSheetVisibility
local SetupInGameMenuPeoplePageActionsFunction: (any) -> () = InExperienceSideSheetModule.setupInGameMenuPeoplePageActions
local SetupPeoplePageOpenTrackingFunction: (any) -> () = InExperienceSideSheetModule.setupPeoplePageOpenTracking
local ClosePeoplePageWhenNoRoomBesideSideSheetFunction = InExperienceSideSheetModule.closePeoplePageWhenNoRoomBesideSideSheet
local FFlagSideSheetOpenPeoplePage = InExperienceSideSheetModule.Flags.FFlagSideSheetOpenPeoplePage
local FFlagClosePeoplePageWhenNoRoomBesideSideSheet = InExperienceSideSheetModule.Flags.FFlagClosePeoplePageWhenNoRoomBesideSideSheet
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local GetSwitchServerStoreFunction = require(CorePackages.Workspace.Packages.SwitchServer).GetSwitchServerStore
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local _ = require(RobloxGui.Modules.Settings.ReactPageFactory)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local FFlagLocalizeVersionLabels = config.FFlagLocalizeVersionLabels or IsSubjectToChinaPolicies
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)

local function _(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy)
	if RobloxTranslatorModule then
		local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, p1)
		
		return if Success then Result else p2
	else
		return p2
	end
end

local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
local GuiInset, _ = GuiService:GetGuiInset()
local _UDim2 = UDim2.new(0, 0, 0, -GuiInset.Y)
local _UDim2_1 = UDim2.new(1, 0, 1, GuiInset.Y)

local function GetCorePackagesLoaded(ChildNames): boolean
	local CorePackages = game:GetService("CorePackages")
	
	for _, childName in pairs(ChildNames) do
		if not CorePackages:FindFirstChild(childName) then
			return false
		end
	end
	return true
end

local _ = function()
	-- upvalues: ServerResult (ref), GetServerVersion (ref)
	if ServerResult then
		return ServerResult
	end
	if not GetServerVersion then
		repeat
			wait()
		until GetServerVersion
	end
	ServerResult = GetServerVersion:InvokeServer()
	
	return ServerResult
end

local function GetServerChannelBlocking()
	-- upvalues: ServerResult1 (ref), GetServerChannelRetries (copy), GetServerChannel (ref)
	if ServerResult1 then
		return ServerResult1
	end
	local Count: number = GetServerChannelRetries
	
	if not GetServerChannel then
		repeat
			task.wait()
			Count -= 1
		until GetServerChannel or Count == 0
	end
	if GetServerChannel then
		ServerResult1 = GetServerChannel:InvokeServer()
	else
		warn("GetServerChannelRemote not available")
		ServerResult1 = "Unknown"
	end
	return ServerResult1
end

local _ = function()
	-- upvalues: config (copy), HttpRbxApiService (copy), HttpService (copy)
	if config.GetFFlagRemoveAssetVersionEndpoint() then
		return game.PlaceVersion
	else
		local PlaceVersion = game.PlaceVersion
		pcall(function()
			-- upvalues: HttpRbxApiService (upval), HttpService (upval), PlaceVersion (ref)
			PlaceVersion = string.format("%s (Latest: %d)", PlaceVersion, HttpService:JSONDecode((HttpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber)
		end)
		
		return PlaceVersion
	end
end

local function createReactPage(Parent)
	-- upvalues: CreateFunction (copy)
	return CreateFunction("Frame")({
		Name = "InExperienceMenuPage",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.fromScale(0, 0),
		Parent = Parent
	})
end

local function CreateSettingsHub()
	-- upvalues: config (copy), RobloxGui (copy), SettingsShowSignal (copy), UtilityModule (copy), SettingsUtility (copy), CreateSignalFunction (copy), ConstantsModule1 (copy), Stores (copy), RbxAnalyticsService (copy), ReactPageAnalyticsModule (copy), createReactPage (copy), IsSideSheetEnabledModule (copy), ThemeModule (copy), ContextActionService (copy), LocalizationService (copy), Localization (copy), IsEnabled (copy), CreateFunction (copy), IsPreferredInputMatch (copy), UserInputService (copy), Platform (copy), Default (copy), GetCamMicPermissionsModule (copy), OtterModule (copy), RobloxTranslatorModule (copy), SettingsHubRaceConditionFix (copy), StarterGui (copy), InExperienceSideSheetModule (copy), TelemetryService (copy), MenuLeaveGameTelemetryConfigModule (copy), MenuResetCharacterTelemetryConfigModule (copy), ConstantsModule (copy), MenuResumeTelemetryConfigModule (copy), ReactRobloxModule (copy), ReactModule (copy), MenuButtonsContainerModule (copy), FlagsModule (copy), GuiService (copy), _UDim2_1 (copy), _UDim2 (copy), SHIELDINACTIVEPOSITION (copy), SETTINGSSHIELDTRANSPARENCY (copy), SETTINGSSHIELD (copy), YOffset (copy), FFlagLocalizeVersionLabels (copy), GetServerChannelBlocking (copy), ServerResult (ref), GetServerVersion (ref), RunService (copy), HttpRbxApiService (copy), HttpService (copy), CachedPolicyServiceModule (copy), BaseUrl (copy), Inverted (copy), StarterPlayer (copy), Players (copy), RoactModule (copy), RoactAppExperimentModule (copy), IXPService (copy), AppStyleProvider (copy), Dark (copy), MenuBackButtonModule (copy), MenuFrontButtonModule (copy), AppFonts (copy), config1 (copy), CorePackages (copy), InExperienceAppChatModalModule (copy), InExperienceCapabilities (copy), FoundationProvider (copy), FoundationModule (copy), UtilsModule (copy), SwitchTabHint (copy), IsSubjectToDesktopPoliciesFunction (copy), SettingsFullScreenTitleBarModule (copy), FFlagSideSheetOpenPeoplePage (copy), GetDidSideSheetOpenWithPeoplePageFunction (copy), GetSideSheetVisibilityFunction (copy), GetHasRoomForPeoplePageFunction (copy), GetIsPeoplePageOpenFunction (copy), GetSideSheetAnimationDurationFunction (copy), GetSideSheetDrawerWidthFunction (copy), GetSideSheetMenuPageWidthFunction (copy), FFlagClosePeoplePageWhenNoRoomBesideSideSheet (copy), ClosePeoplePageWhenNoRoomBesideSideSheetFunction (copy), VRService (copy), GetSideSheetMenuPageHeightFunction (copy), SignalsModule (copy), GameSettings (copy), DevConsoleMasterModule (copy), FixReportButtonCutOff (copy), CryoModule (copy), IXPServiceWrapper (copy), ExperienceMenuSessionManagerInstance (copy), ReactPageSignalModule (copy), MouseIconOverrideService (copy), SettingsHubCursorOverride (copy), CheckLeaveGameUpsellCooldown (copy), TweenService (copy), ToggleSideSheetFunction (copy), PerfUtilsModule (copy), LastInputTypeChangedConnection (ref), ChatSelectorModule (copy), FFlagEnableNewBackpack (copy), Features (copy), Flag (ref), GameInviteInviteExperimentVariant (ref), PlatformFriendsService (ref), PlatformService (ref), GameInviteModalManager (ref), GameInviteConstants (ref), GetCorePackagesLoaded (copy), GameInviteAnalytics (copy), CapturesPolicy (copy), IsSpatialFunction (copy), CapturesAppModule (copy), IsPioneerLaunchFunction (copy), GetSwitchServerStoreFunction (copy), LeaveGameModule (copy), PortalWithFoundationStylelinkModule (copy), TraversalHistoryMenu (copy), InExperienceMenuReactModule (copy), InExperienceMenuReactPageModule (copy)
	local config2 = {
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
	
	if config.EngineFeatureTeleportHistoryButtons then
		config2.FrontBarVisibleConnection = nil
	end
	config2.PreferredTransparencyChangedConnection = nil
	config2.TabConnection = nil
	config2.LeaveGamePage = require(RobloxGui.Modules.Settings.Pages.LeaveGame)
	config2.LeaveGameUpsellPage = if config.GetFFlagEnableLeaveGameUpsellEntrypoint() then require(RobloxGui.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil
	config2.ResetCharacterPage = require(RobloxGui.Modules.Settings.Pages.ResetCharacter)
	config2.SettingsShowSignal = if config.GetFFlagPackagifySettingsShowSignal() then SettingsShowSignal else UtilityModule:CreateSignal()
	config2.CurrentPageSignal = if config.GetFFlagPackagifySettingsShowSignal() then SettingsUtility.CreateSignal() else UtilityModule:CreateSignal()
	config2.showBottomBarSignal, config2.setShowBottomBarSignal = CreateSignalFunction(false)
	config2.OpenStateChangedCount = 0
	config2.BottomButtonFrame = nil
	
	if config.FFlagRelocateMobileMenuButtons then
		config2.addMenuKeyBindings = nil
		config2.removeMenuKeyBindings = nil
	end
	if config.FFlagIEMFocusNavSupportNewButtons then
		config2.ResumeMenuButton = nil
	end
	config2.hasMicPermissions = false
	
	if config.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		config2.checkedUpsell = false
		config2.leaveGameUpsellProp = ConstantsModule1.PHONE_UPSELL_VALUE_PROP.None
		config2.sessionStartTime = os.time()
	end
	config2.isFetchingMicPermissions = true
	
	if config.FFlagAddUILessMode and config.FIntAddUILessModeVariant ~= 0 then
		config2.uiLessStore = Stores.GetUILessStore(false)
	end
	config2.PageTitleLabel = nil
	config2.PageTitleCloseButton = nil
	config2.PageTitleHeader = nil
	config2.isMuted = nil
	config2.lastVoiceRecordingIndicatorTextUpdated = nil
	config2.playSessionId = ""
	
	if config.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
		config2.playSessionId = RbxAnalyticsService:GetPlaySessionId()
	end
	config2.reactPageAnalytics = ReactPageAnalyticsModule.new()
	local ChangedConnection = nil
	local Connection = nil
	local PoppedMenu = Instance.new("BindableEvent")
	PoppedMenu.Name = "PoppedMenu"
	config2.PoppedMenu = PoppedMenu.Event
	config2.ReactPage = nil
	config2.ReactPage = createReactPage()
	
	local function _(p1): boolean
		-- upvalues: config2 (copy), IsSideSheetEnabledModule (upval)
		local P4 = p1 or config2.Pages.CurrentPage
		
		return if IsSideSheetEnabledModule then P4.ShouldShowHubBar == true else P4.ShouldShowBottomBar == true
	end
	
	local _ = function(p1)
		-- upvalues: config2 (copy), IsSideSheetEnabledModule (upval)
		local P5 = p1 or config2.Pages.CurrentPage
		
		if (if IsSideSheetEnabledModule then P5.ShouldShowHubBar == true else P5.ShouldShowBottomBar == true) and p1.TabHeader then
			config2.PageTitleLabel.Text = p1.TabHeader.TabLabel.Title.Text
			
			return
		else
			config2.PageTitleLabel.Text = ""
		end
	end
	
	local _ = function(p1)
		-- upvalues: config (upval)
		if not config.FFlagIEMTabFocusNav then return end
		local TabHeader = p1:GetTabHeader()
		
		if not TabHeader then return end
		for _, firstSelectableObject in p1.FirstSelectableObjects do
			firstSelectableObject.NextSelectionUp = TabHeader
			TabHeader.NextSelectionDown = firstSelectableObject
		end
	end
	
	local _ = function()
		-- upvalues: config (upval), config2 (copy)
		if not config.FFlagIEMTabFocusNav then return end
		for _, tabHeader in config2.TabHeaders do
			tabHeader.NextSelectionLeft = nil
			tabHeader.NextSelectionRight = nil
		end
		local CountTabHeaders = #config2.TabHeaders
		
		if CountTabHeaders >= 2 then
			config2.TabHeaders[1].NextSelectionLeft = config2.TabHeaders[CountTabHeaders]
			config2.TabHeaders[CountTabHeaders].NextSelectionRight = config2.TabHeaders[1]
			
			return
		end
	end
	
	local function setBottomBarSelection(CurrentPage)
		-- upvalues: config2 (copy), config (upval)
		if not config2.BottomButtonFrame and not CurrentPage and (not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 or config.FIntRelocateMobileMenuButtonsVariant == 2) then return end
		if config2.ResumeButton then
			CurrentPage.PageNextSelectionDown = config2.ResumeButton
		elseif config.FFlagIEMFocusNavSupportNewButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 and config2.ResumeMenuButton then
			CurrentPage.PageNextSelectionDown = config2.ResumeMenuButton
		end
		if config.FFlagIEMTabFocusNav and config2.BottomButtonFrame then
			local TabHeader = CurrentPage:GetTabHeader()
			local ResumeButton = config2.ResumeButton or config2.ResumeMenuButton
			
			if ResumeButton then
				for i, _ in pairs(config2.Pages.PageTable) do
					local TabHeader1 = i:GetTabHeader()
					
					if TabHeader1 then
						TabHeader1.NextSelectionUp = ResumeButton
					end
				end
			end
			for _, Gui in config2.BottomButtonFrame:GetDescendants() do
				if Gui:IsA("GuiObject") and Gui.Selectable then
					Gui.NextSelectionDown = TabHeader
				end
			end
		end
		for _, lastSelectableObject in CurrentPage.LastSelectableObjects do
			config2.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
			config2.BottomButtonFrame.NextSelectionUp = lastSelectableObject
			lastSelectableObject.NextSelectionDown = CurrentPage.PageNextSelectionDown
			local LeaveGameButton = config2.LeaveGameButton
			
			if LeaveGameButton then
				LeaveGameButton.NextSelectionUp = lastSelectableObject
			end
			if config.FFlagIEMFocusNavSupportNewButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 then
				for _, Gui1 in config2.BottomButtonFrame:GetDescendants() do
					if Gui1:IsA("GuiObject") and Gui1.Selectable then
						Gui1.NextSelectionUp = lastSelectableObject
					end
				end
			end
		end
		if #CurrentPage.LastSelectableObjects < 1 then
			config2.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			config2.BottomButtonFrame.NextSelectionUp = nil
			local LeaveGameButton = config2.LeaveGameButton
			
			if LeaveGameButton then
				LeaveGameButton.NextSelectionUp = nil
			end
			if config.FFlagIEMFocusNavSupportNewButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 then
				for _, Gui2 in config2.BottomButtonFrame:GetDescendants() do
					if Gui2:IsA("GuiObject") and Gui2.Selectable then
						Gui2.NextSelectionUp = if config.FFlagIEMTabFocusNav then CurrentPage:GetTabHeader() else nil
					end
				end
			end
		end
	end
	
	local function shouldShowBottomBar(CurrentPage): boolean
		-- upvalues: config2 (copy), config (upval), UtilityModule (upval), ThemeModule (upval)
		local CurrentPage1 = CurrentPage or config2.Pages.CurrentPage
		
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 and config.FIntRelocateMobileMenuButtonsVariant ~= 2 or not UtilityModule:IsPortrait() and not UtilityModule:IsSmallTouchScreen() or ThemeModule.AlwaysShowBottomBar() then
			return CurrentPage1 ~= nil and CurrentPage1.ShouldShowBottomBar == true
		else
			return false
		end
	end
	
	local _ = function(p2): boolean
		-- upvalues: config2 (copy)
		local P9 = p2 or config2.Pages.CurrentPage
		
		return P9 ~= nil and P9.ShouldDisableDefaultScroll == true
	end
	
	local function setBottomBarBindings()
		-- upvalues: config2 (copy), config (upval), ContextActionService (upval)
		if not config2.Visible then return end
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			if config2.addMenuKeyBindings then
				config2.addMenuKeyBindings()
			end
		else
			for i = 1, #config2.BottomBarButtons do
				local BottomBarButton = config2.BottomBarButtons[i]
				local BottomBarButtonEntry = BottomBarButton[2]
				ContextActionService:BindCoreAction(BottomBarButton[1], BottomBarButtonEntry[1], false, unpack(BottomBarButtonEntry[2]))
			end
		end
		if config2.BottomButtonFrame then
			config2.BottomButtonFrame.Visible = true
		end
	end
	
	local function removeBottomBarBindings(p2)
		-- upvalues: config (upval), config2 (copy), ContextActionService (upval)
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			if config2.removeMenuKeyBindings then
				config2.removeMenuKeyBindings()
			end
		else
			for _, bottomBarButton in pairs(config2.BottomBarButtons) do
				ContextActionService:UnbindCoreAction(bottomBarButton[1])
			end
		end
		local OpenStateChangedCount = config2.OpenStateChangedCount
		
		local function v225()
			-- upvalues: config2 (upval), OpenStateChangedCount (copy)
			if config2.OpenStateChangedCount == OpenStateChangedCount and config2.BottomButtonFrame then
				config2.BottomButtonFrame.Visible = false
			end
		end
		
		if p2 then
			delay(p2, v225)
			
			return
		end
		if config2.OpenStateChangedCount == OpenStateChangedCount and config2.BottomButtonFrame then
			config2.BottomButtonFrame.Visible = false
		end
	end
	
	local _ = function(Text, Position, Size)
		-- upvalues: config (upval), config2 (copy)
		if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
			local Child = config2.BottomButtonFrame:FindFirstChild(Text .. "ButtonButton", true)
			
			if not Child then return end
			Child.Position = Position
			Child.Size = Size
		end
	end
	
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	local function hideVoiceUx()
		-- upvalues: config2 (copy), IsEnabled (upval), ThemeModule (upval), config (upval)
		local MuteButtonButton = config2.MuteButtonButton
		
		if MuteButtonButton then
			MuteButtonButton.Visible = false
			MuteButtonButton:Destroy()
		end
		local _UDim2: UDim2 = if IsEnabled then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, ThemeModule.LargeButtonHeight)
		
		if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
			local _UDim2_1 = UDim2.new(0.5, if IsEnabled then -160 else -130, 0.5, -25)
			
			if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
				local LeaveGameButtonButton = config2.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true)
				
				if LeaveGameButtonButton then
					LeaveGameButtonButton.Position = _UDim2_1
					LeaveGameButtonButton.Size = _UDim2
				end
			end
			local _UDim2_2 = UDim2.new(0.5, if IsEnabled then -550 else -400, 0.5, -25)
			
			if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
				local ResetCharacterButtonButton = config2.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true)
				
				if ResetCharacterButtonButton then
					ResetCharacterButtonButton.Position = _UDim2_2
					ResetCharacterButtonButton.Size = _UDim2
				end
			end
			local _UDim2_3 = UDim2.new(0.5, if IsEnabled then 200 else 140, 0.5, -25)
			
			if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
				local ResumeButtonButton = config2.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true)
				
				if not ResumeButtonButton then return end
				ResumeButtonButton.Position = _UDim2_3
				ResumeButtonButton.Size = _UDim2
			end
		end
	end
	
	local function addBottomBarButtonOld(Text, FormatResult, ImageForKeyCode, Image, Position, p3, p4, Callback)
		-- upvalues: config (upval), ThemeModule (upval), IsEnabled (upval), config2 (copy), UtilityModule (upval), CreateFunction (upval), IsPreferredInputMatch (upval), UserInputService (upval), Platform (upval)
		if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
			local Text1 = Text .. "Button"
			local Text2 = Text .. "Text"
			config2[Text1], config2[Text2] = UtilityModule:MakeStyledButton(Text .. "Button", FormatResult, if IsEnabled then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, ThemeModule.LargeButtonHeight), p3, nil, config2)
			CreateFunction("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Parent = config2[Text1]
			})
			CreateFunction("UIPadding")({
				PaddingLeft = UDim.new(0.025, 0),
				Parent = config2[Text1]
			})
			config2[Text2].Size = UDim2.new(0, 0, 1, 0)
			CreateFunction("UIFlexItem")({ FlexMode = Enum.UIFlexMode.Grow, Parent = config2[Text2] })
			config2[Text1].Position = Position
			config2[Text1].Parent = config2.BottomButtonFrame
			
			if IsEnabled then
				config2[Text1].ImageTransparency = 1
			end
			config2[Text2].FontSize = Enum.FontSize.Size24
			local Image1 = nil
			
			if not IsPreferredInputMatch then
				local ImageForKeyCode1 = if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) or Platform == Enum.Platform.XBoxOne then ImageForKeyCode else Image
				Image1 = CreateFunction("ImageLabel")({
					BackgroundTransparency = 1,
					LayoutOrder = -1,
					Name = Text .. "Hint",
					ZIndex = config2.Shield.ZIndex + 2,
					Image = ImageForKeyCode1,
					Parent = config2[Text1]
				})
				
				if ImageForKeyCode1 == Image then
					Image1.ImageColor3 = ThemeModule.color("WhiteButtonText", Color3.new(1, 1, 1))
					Image1.ImageTransparency = ThemeModule.transparency("WhiteButtonText", 1)
				end
				Image1.Position = UDim2.new(0, 9, 0.5, 0)
				Image1.Size = UDim2.new(0, 33, 0, 33)
				Image1.AnchorPoint = Vector2.new(0, 0.5)
			end
			if IsEnabled then
				config2[Text2].FontSize = Enum.FontSize.Size36
			end
			UserInputService.InputBegan:connect(function(Input)
				-- upvalues: Image1 (ref), ImageForKeyCode (copy), Image (copy)
				if Input.UserInputType == Enum.UserInputType.Gamepad1 or Input.UserInputType == Enum.UserInputType.Gamepad2 or Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4 then
					if Image1 then
						Image1.Image = ImageForKeyCode
						
						return
					end
				elseif Input.UserInputType == Enum.UserInputType.Keyboard and Image1 then
					Image1.Image = Image
				end
			end)
			config2.BottomBarButtons[#config2.BottomBarButtons + 1] = {
				Text1,
				{
					function(_, UserInputState, _)
						-- upvalues: Callback (copy)
						if UserInputState == Enum.UserInputState.Begin then
							Callback()
						end
					end,
					p4
				}
			}
		end
	end
	
	local v1: string = if IsEnabled then "@2x" else ""
	local ImageForKeyCode = nil
	local ImageForKeyCode1 = nil
	local ImageForKeyCode2 = nil
	
	if config.FFlagEnableConsoleExpControls then
		ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		ImageForKeyCode1 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
		ImageForKeyCode2 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY)
	else
		ImageForKeyCode = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v1 .. ".png"
		ImageForKeyCode1 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v1 .. ".png"
		ImageForKeyCode2 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v1 .. ".png"
	end
	local ImageForKeyCode3 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	local Flag1 = false
	local Connection1 = nil
	
	local function setupVoiceListeners()
		-- upvalues: Flag1 (ref), config2 (copy), Default (upval), GetCamMicPermissionsModule (upval), Connection1 (ref), OtterModule (upval), RobloxTranslatorModule (upval), hideVoiceUx (copy)
		if game:GetEngineFeature("VoiceChatSupported") and not Flag1 then
			Flag1 = true
			
			local function showUI()
				-- upvalues: config2 (upval), Default (upval), GetCamMicPermissionsModule (upval), Connection1 (upval), OtterModule (upval), RobloxTranslatorModule (upval)
				config2.VoiceRecordingText.Visible = true
				Default:getService().StateChanged:Connect(function(_, NewState)
					-- upvalues: config2 (upval)
					if NewState == Enum.VoiceChatState.Joined then
						config2.VoiceRecordingText.Visible = true
					end
				end)
				Default:SetupParticipantListeners()
				GetCamMicPermissionsModule(function(p3)
					-- upvalues: config2 (upval)
					config2.hasMicPermissions = p3.hasMicPermissions
				end, nil, true, "PermissionsButtons.getPermissions")
				Connection1 = Default.muteChanged.Event:Connect(function(IsMuted)
					-- upvalues: config2 (upval), OtterModule (upval), RobloxTranslatorModule (upval)
					config2.isMuted = IsMuted
					config2.lastVoiceRecordingIndicatorTextUpdated = tick()
					config2.voiceRecordingIndicatorTextMotor:setGoal(OtterModule.instant(0))
					
					if config2.isMuted then
						local VoiceRecordingText = config2.VoiceRecordingText
						local MicOff = nil
						
						if RobloxTranslatorModule then
							local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.MicOff")
							MicOff = if Success then Result else "Mic Off"
						else
							MicOff = "Mic Off"
						end
						VoiceRecordingText.Text = MicOff
						
						return
					else
						local VoiceRecordingText1 = config2.VoiceRecordingText
						local MicOnRecordingAudio = nil
						
						if RobloxTranslatorModule then
							local Success1, Result1 = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.MicOnRecording")
							MicOnRecordingAudio = if Success1 then Result1 else "Mic On (recording audio)"
						else
							MicOnRecordingAudio = "Mic On (recording audio)"
						end
						VoiceRecordingText1.Text = MicOnRecordingAudio
					end
				end)
			end
			
			local function hideUI()
				-- upvalues: config2 (upval), hideVoiceUx (upval), Connection1 (upval)
				config2.VoiceRecordingText.Visible = false
				hideVoiceUx()
				
				if Connection1 then
					Connection1:Disconnect()
				end
			end
			
			if Default.voiceUIVisible then
				showUI()
			end
			Default.showVoiceUI.Event:Connect(showUI)
			Default.hideVoiceUI.Event:Connect(hideUI)
		end
	end
	
	if not SettingsHubRaceConditionFix then
		setupVoiceListeners()
	end
	local ResetEnabled = true
	
	local function setResetEnabled(Value)
		-- upvalues: ResetEnabled (ref), config2 (copy)
		ResetEnabled = Value
		
		if config2.ResetCharacterButton then
			config2.ResetCharacterButton.Selectable = Value
			config2.ResetCharacterButton.Active = Value
			config2.ResetCharacterButton.Enabled.Value = Value
			local ResetCharacterHint = config2.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
			
			if ResetCharacterHint then
				ResetCharacterHint.ImageColor3 = Value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
			local ResetCharacterButtonTextLabel = config2.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
			
			if ResetCharacterButtonTextLabel then
				ResetCharacterButtonTextLabel.TextColor3 = Value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
		end
	end
	
	local v2 = nil
	
	function config2:GetRespawnBehaviour()
		-- upvalues: config (upval), config2 (copy), ResetEnabled (ref), v2 (ref)
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			return config2:GetExperienceControlStore().getCanRespawn(false), config2:GetExperienceControlStore().getCustomRespawnCallback(false)
		else
			return ResetEnabled, v2
		end
	end
	
	config2.RespawnBehaviourChangedEvent = Instance.new("BindableEvent")
	StarterGui:RegisterSetCore("ResetButtonCallback", function(Enabled)
		-- upvalues: config2 (copy), config (upval), ResetEnabled (ref), setResetEnabled (copy), IsSideSheetEnabledModule (upval), InExperienceSideSheetModule (upval), v2 (ref)
		local IsBindableEvent = typeof(Enabled) == "Instance" and Enabled:IsA("BindableEvent")
		
		if IsBindableEvent or type(Enabled) == "boolean" then
			config2.ResetCharacterPage:SetResetCallback(Enabled)
		else
			warn("ResetButtonCallback must be set to a BindableEvent or a boolean")
		end
		local CanRespawn = if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then config2:GetExperienceControlStore().getCanRespawn(false) else ResetEnabled
		
		if Enabled == false then
			if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				config2:GetExperienceControlStore().setCanRespawn(false)
			else
				setResetEnabled(false)
			end
			if IsSideSheetEnabledModule then
				InExperienceSideSheetModule.setIsRespawnEnabled(false)
			end
		elseif not CanRespawn and (IsBindableEvent or Enabled == true) then
			if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				config2:GetExperienceControlStore().setCanRespawn(true)
			else
				setResetEnabled(true)
			end
			if IsSideSheetEnabledModule then
				InExperienceSideSheetModule.setIsRespawnEnabled(true)
			end
		end
		if IsBindableEvent then
			if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				config2:GetExperienceControlStore().setCustomRespawnCallback(Enabled)
			else
				v2 = Enabled
			end
		end
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			config2.RespawnBehaviourChangedEvent:Fire(config2:GetExperienceControlStore().getCanRespawn(false), config2:GetExperienceControlStore().getCustomRespawnCallback(false))
			
			return
		else
			config2.RespawnBehaviourChangedEvent:Fire(ResetEnabled, v2)
		end
	end)
	StarterGui:RegisterGetCore("ResetButtonCallback", function()
		-- upvalues: config2 (copy)
		local RespawnBehaviour, _ = config2:GetRespawnBehaviour()
		
		return RespawnBehaviour
	end)
	local Callback = nil
	local Signal, Signal2 = CreateSignalFunction(true)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	function config2:GetExperienceControlStore()
		-- upvalues: Signal2 (copy), config2 (copy), Signal (copy), Signal1 (copy), Signal2_1 (copy), config (upval), ConstantsModule1 (upval), TelemetryService (upval), MenuLeaveGameTelemetryConfigModule (upval), MenuResetCharacterTelemetryConfigModule (upval), RbxAnalyticsService (upval), ConstantsModule (upval), MenuResumeTelemetryConfigModule (upval)
		return {
			getCanRespawn = Signal,
			getCustomRespawnCallback = Signal1,
			setCanRespawn = function(Active)
				-- upvalues: Signal2 (upval), config2 (upval)
				Signal2(Active)
				
				if config2.ResetCharacterButton then
					config2.ResetCharacterButton.Selectable = Active
					config2.ResetCharacterButton.Active = Active
					config2.ResetCharacterButton.Enabled.Value = Active
					local ResetCharacterHint = config2.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
					
					if ResetCharacterHint then
						ResetCharacterHint.ImageColor3 = Active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
					local ResetCharacterButtonTextLabel = config2.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
					
					if ResetCharacterButtonTextLabel then
						ResetCharacterButtonTextLabel.TextColor3 = Active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
				end
			end,
			setCustomRespawnCallback = Signal2_1,
			onLeaveGame = function(Source)
				-- upvalues: config2 (upval), config (upval), ConstantsModule1 (upval), TelemetryService (upval), MenuLeaveGameTelemetryConfigModule (upval)
				if not config2:GetVisibility() then return end
				config2:AddToMenuStack(config2.Pages.CurrentPage)
				config2.HubBar.Visible = false
				
				if config.GetFFlagEnableLeaveGameUpsellEntrypoint() and config2.leaveGameUpsellProp ~= ConstantsModule1.PHONE_UPSELL_VALUE_PROP.None then
					config2:SwitchToPage(config2.LeaveGameUpsellPage, false)
				else
					config2:SwitchToPage(config2.LeaveGamePage, false, nil, true)
				end
				TelemetryService:LogCounter(MenuLeaveGameTelemetryConfigModule, { customFields = { source = Source } })
			end,
			onRespawn = function(Source)
				-- upvalues: Signal (upval), config2 (upval), TelemetryService (upval), MenuResetCharacterTelemetryConfigModule (upval)
				if Signal(false) then
					config2:AddToMenuStack(config2.Pages.CurrentPage)
					config2.HubBar.Visible = false
					config2:SwitchToPage(config2.ResetCharacterPage, false, nil, true)
					TelemetryService:LogCounter(MenuResetCharacterTelemetryConfigModule, { customFields = { source = Source } })
					
					return
				end
			end,
			onResume = function(Source)
				-- upvalues: config (upval), config2 (upval), RbxAnalyticsService (upval), ConstantsModule (upval), TelemetryService (upval), MenuResumeTelemetryConfigModule (upval)
				if config.FFlagAddUILessMode then
					config2:SetVisibility(false, nil, nil, nil, Source)
				else
					config2:SetVisibility(false)
				end
				if config.FFlagAddUILessMode and config.FIntAddUILessModeVariant ~= 0 and config2.uiLessStore.getUILessModeEnabled(false) then
					config2.uiLessStore.setUIVisible(false)
				end
				RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsResumeGameName, ConstantsModule.AnalyticsMenuActionName, {
					source = Source,
					playsessionid = config2.playSessionId,
					universeid = tostring(game.GameId)
				})
				TelemetryService:LogCounter(MenuResumeTelemetryConfigModule, { customFields = { source = Source } })
			end
		}
	end
	
	local Callback1 = if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then function()
		-- upvalues: config2 (copy), ReactRobloxModule (upval), ReactModule (upval), MenuButtonsContainerModule (upval), FlagsModule (upval), config (upval), GuiService (upval)
		if not config2.BottomButtonFrameRoot then
			local ExperienceControlStore = config2:GetExperienceControlStore()
			config2.BottomButtonFrameRoot = ReactRobloxModule.createRoot(config2.BottomButtonFrame)
			config2.BottomButtonFrameRoot:render(ReactModule.createElement(MenuButtonsContainerModule, {
				onLeaveGame = ExperienceControlStore.onLeaveGame,
				onRespawn = ExperienceControlStore.onRespawn,
				onResume = ExperienceControlStore.onResume,
				setAddMenuKeyBindings = function(AddMenuKeyBindings)
					-- upvalues: config2 (upval)
					config2.addMenuKeyBindings = AddMenuKeyBindings
				end,
				setRemoveMenuKeyBindings = function(RemoveMenuKeyBindings)
					-- upvalues: config2 (upval)
					config2.removeMenuKeyBindings = RemoveMenuKeyBindings
				end,
				getVisibility = function()
					-- upvalues: config2 (upval)
					return config2.GetVisibility()
				end,
				getCanRespawn = ExperienceControlStore.getCanRespawn,
				currentPageChangeSignal = if FlagsModule.FFlagAddTraversalHistoryReactMenuButtons then config2.CurrentPageSignal else nil,
				setResumeMenuButton = if config.FFlagIEMFocusNavSupportNewButtons then function(ResumeMenuButton)
					-- upvalues: config2 (upval), config (upval), GuiService (upval)
					config2.ResumeMenuButton = ResumeMenuButton
					
					if config.FFlagIEMFocusNavSupportNewButtons and (not GuiService.SelectedCoreObject or not GuiService.SelectedCoreObject:IsDescendantOf(config2.Shield)) then
						GuiService.SelectedCoreObject = ResumeMenuButton
					end
				end else nil
			}))
			
			return
		end
	end else nil
	local Callback2 = if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then function()
		-- upvalues: config2 (copy)
		if config2.BottomButtonFrameRoot then
			config2.BottomButtonFrameRoot:unmount()
			config2.BottomButtonFrameRoot = nil
		end
	end else nil
	
	local function createGui()
		-- upvalues: UtilityModule (upval), config2 (copy), CreateFunction (upval), _UDim2_1 (upval), _UDim2 (upval), RobloxGui (upval), SHIELDINACTIVEPOSITION (upval), SETTINGSSHIELDTRANSPARENCY (upval), SETTINGSSHIELD (upval), YOffset (upval), config (upval), ThemeModule (upval), IsEnabled (upval), FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval), GetServerChannelBlocking (upval), ServerResult (upval), GetServerVersion (upval), RunService (upval), HttpRbxApiService (upval), HttpService (upval), CachedPolicyServiceModule (upval), BaseUrl (upval), Inverted (upval), StarterPlayer (upval), Players (upval), RbxAnalyticsService (upval), ConstantsModule (upval), GuiService (upval), GetCamMicPermissionsModule (upval), Default (upval), IsSideSheetEnabledModule (upval), RoactModule (upval), RoactAppExperimentModule (upval), IXPService (upval), AppStyleProvider (upval), Dark (upval), MenuBackButtonModule (upval), MenuFrontButtonModule (upval), AppFonts (upval), OtterModule (upval), config1 (upval), UserInputService (upval), Callback (ref), Callback1 (copy), CorePackages (upval), InExperienceAppChatModalModule (upval), removeBottomBarBindings (copy), ConstantsModule1 (upval), InExperienceCapabilities (upval), addBottomBarButtonOld (copy), ImageForKeyCode1 (ref), ResetEnabled (ref), NewLocalization (copy), ImageForKeyCode2 (ref), ImageForKeyCode3 (copy), ImageForKeyCode (ref), ReactRobloxModule (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), UtilsModule (upval), SwitchTabHint (upval), IsSubjectToDesktopPoliciesFunction (upval), SettingsFullScreenTitleBarModule (upval)
		local v3: number = if UtilityModule:IsSmallTouchScreen() then 5 else 0
		config2.ClippingShield = CreateFunction("Frame")({
			Name = "SettingsClippingShield",
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Visible = true,
			ZIndex = 2,
			Size = _UDim2_1,
			Position = _UDim2,
			Parent = RobloxGui
		})
		config2.CanvasGroup = CreateFunction("CanvasGroup")({
			Name = "CanvasGroup",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = config2.ClippingShield
		})
		config2.Shield = CreateFunction("ImageButton")({
			Name = "SettingsShield",
			BorderSizePixel = 0,
			Visible = false,
			Active = true,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0),
			Position = SHIELDINACTIVEPOSITION,
			BackgroundTransparency = SETTINGSSHIELDTRANSPARENCY,
			BackgroundColor3 = SETTINGSSHIELD,
			Parent = config2.ClippingShield
		})
		config2.VRShield = CreateFunction("Frame")({
			Name = "VRBackground",
			BorderSizePixel = 0,
			Visible = false,
			Parent = config2.Shield,
			BackgroundColor3 = SETTINGSSHIELD,
			BackgroundTransparency = SETTINGSSHIELDTRANSPARENCY,
			Position = UDim2.new(0, -4, 0, 24),
			Size = UDim2.new(1, 8, 1, -40)
		})
		local CoreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
		
		if CoreScriptVersionEnabledEngineFeature then
			config2.VersionContainer = CreateFunction("ScrollingFrame")({
				Name = "VersionContainer",
				BorderSizePixel = 0,
				AutoLocalize = false,
				ScrollBarThickness = 0,
				ZIndex = 5,
				Visible = false,
				Parent = config2.Shield,
				CanvasSize = UDim2.new(0, 0, 0, YOffset),
				BackgroundColor3 = SETTINGSSHIELD,
				BackgroundTransparency = SETTINGSSHIELDTRANSPARENCY,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, YOffset),
				AnchorPoint = Vector2.new(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X
			})
		else
			config2.VersionContainer = CreateFunction("Frame")({
				Name = "VersionContainer",
				BorderSizePixel = 0,
				AutoLocalize = false,
				ZIndex = 5,
				Visible = false,
				Parent = config2.Shield,
				BackgroundColor3 = SETTINGSSHIELD,
				BackgroundTransparency = SETTINGSSHIELDTRANSPARENCY,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, YOffset),
				AnchorPoint = Vector2.new(0, 1)
			})
		end
		local Object = CreateFunction("UIListLayout")({
			Name = "VersionContainer",
			Parent = config2.VersionContainer,
			Padding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		local function _(Label)
			-- upvalues: CoreScriptVersionEnabledEngineFeature (copy), YOffset (upval)
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			Label.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, Label.TextBounds.X + 6, 0, YOffset) or _UDim2
		end
		
		if config.GetFFlagDisplayServerChannel() then
			config2.ServerChannelLabel = CreateFunction("TextLabel")({
				Name = "ServerChannelLabel",
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Text = "Server Channel: ...",
				ZIndex = 5,
				Parent = config2.VersionContainer,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
				Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			spawn(function()
				-- upvalues: FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval), config2 (upval), GetServerChannelBlocking (upval), CoreScriptVersionEnabledEngineFeature (copy), YOffset (upval)
				local ServerChannel = "Server Channel: "
				
				if FFlagLocalizeVersionLabels then
					if RobloxTranslatorModule then
						local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.ServerChannel")
						ServerChannel = if Success then Result else "Server Channel: "
					else
						ServerChannel = "Server Channel: "
					end
				end
				config2.ServerChannelLabel.Text = ServerChannel .. GetServerChannelBlocking()
				local ServerChannelLabel = config2.ServerChannelLabel
				local _UDim2 = UDim2.new(0.2, -6, 1, 0)
				ServerChannelLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, ServerChannelLabel.TextBounds.X + 6, 0, YOffset) or _UDim2
				config2.ServerChannelLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.ServerChannelLabel.TextFits)
			end)
		end
		config2.ServerVersionLabel = CreateFunction("TextLabel")({
			Name = "ServerVersionLabel",
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = "Server Version: ...",
			ZIndex = 5,
			Parent = config2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval), config2 (upval), ServerResult (upval), GetServerVersion (upval), CoreScriptVersionEnabledEngineFeature (copy), YOffset (upval)
			local ServerVersion = "Server Version: "
			
			if FFlagLocalizeVersionLabels then
				if RobloxTranslatorModule then
					local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.ServerVersion")
					ServerVersion = if Success then Result else "Server Version: "
				else
					ServerVersion = "Server Version: "
				end
			end
			local ServerVersionLabel = config2.ServerVersionLabel
			local ServerVersion1: string = ServerVersion
			local ServerResult1 = nil
			
			if ServerResult then
				ServerResult1 = ServerResult
			else
				if not GetServerVersion then
					repeat
						wait()
					until GetServerVersion
				end
				ServerResult = GetServerVersion:InvokeServer()
				ServerResult1 = ServerResult
			end
			ServerVersionLabel.Text = ServerVersion1 .. ServerResult1
			local ServerVersionLabel1 = config2.ServerVersionLabel
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			ServerVersionLabel1.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, ServerVersionLabel1.TextBounds.X + 6, 0, YOffset) or _UDim2
			config2.ServerVersionLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.ServerVersionLabel.TextFits)
		end)
		local ClientVersion = "Client Version: "
		
		if FFlagLocalizeVersionLabels then
			if RobloxTranslatorModule then
				local Success2, Result2 = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.ClientVersion")
				ClientVersion = if Success2 then Result2 else "Client Version: "
			else
				ClientVersion = "Client Version: "
			end
		end
		local RobloxVersion = RunService:GetRobloxVersion()
		local Success1, Result1 = pcall(function()
			-- upvalues: RunService (upval)
			return RunService.ClientGitHash
		end)
		
		if Success1 then
			RobloxVersion = string.format("%s (%.6s)", RobloxVersion, Result1)
		end
		config2.ClientVersionLabel = CreateFunction("TextLabel")({
			Name = "ClientVersionLabel",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = config2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
			Text = ClientVersion .. RobloxVersion,
			Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		local ClientVersionLabel = config2.ClientVersionLabel
		local _UDim2_3 = UDim2.new(0.2, -6, 1, 0)
		ClientVersionLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, ClientVersionLabel.TextBounds.X + 6, 0, YOffset) or _UDim2_3
		config2.ClientVersionLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.ClientVersionLabel.TextFits)
		config2.PlaceVersionLabel = CreateFunction("TextLabel")({
			Name = "PlaceVersionLabel",
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Text = "Place Version: ...",
			ZIndex = 5,
			Parent = config2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		
		local function setPlaceVersionText()
			-- upvalues: FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval), config2 (upval), config (upval), HttpRbxApiService (upval), HttpService (upval), CoreScriptVersionEnabledEngineFeature (copy), YOffset (upval)
			local PlaceVersion = "Place Version: "
			
			if FFlagLocalizeVersionLabels then
				if RobloxTranslatorModule then
					local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.PlaceVersion")
					PlaceVersion = if Success then Result else "Place Version: "
				else
					PlaceVersion = "Place Version: "
				end
			end
			local PlaceVersionLabel = config2.PlaceVersionLabel
			local PlaceVersion1: string = PlaceVersion
			local PlaceVersion2 = nil
			
			if config.GetFFlagRemoveAssetVersionEndpoint() then
				PlaceVersion2 = game.PlaceVersion
			else
				local PlaceVersion21 = game.PlaceVersion
				pcall(function()
					-- upvalues: HttpRbxApiService (upval), HttpService (upval), PlaceVersion21 (ref)
					PlaceVersion21 = string.format("%s (Latest: %d)", PlaceVersion21, HttpService:JSONDecode((HttpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber)
				end)
				PlaceVersion2 = PlaceVersion21
			end
			PlaceVersionLabel.Text = PlaceVersion1 .. PlaceVersion2
			local PlaceVersionLabel1 = config2.PlaceVersionLabel
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			PlaceVersionLabel1.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, PlaceVersionLabel1.TextBounds.X + 6, 0, YOffset) or _UDim2
			config2.PlaceVersionLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.PlaceVersionLabel.TextFits)
		end
		
		game:GetPropertyChangedSignal("PlaceVersion"):Connect(setPlaceVersionText)
		spawn(setPlaceVersionText)
		
		if not CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			config2.EnvironmentLabel = CreateFunction("TextLabel")({
				Name = "EnvironmentLabel",
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				ZIndex = 5,
				Parent = config2.VersionContainer,
				AnchorPoint = Vector2.new(0.5, 0),
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = BaseUrl,
				Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Visible = Inverted
			})
			local EnvironmentLabel = config2.EnvironmentLabel
			local _UDim2_4 = UDim2.new(0.2, -6, 1, 0)
			EnvironmentLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, EnvironmentLabel.TextBounds.X + 6, 0, YOffset) or _UDim2_4
			config2.EnvironmentLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.EnvironmentLabel.TextFits)
		end
		if game:GetEngineFeature("GetPlaySessionIdEnabled") then
			local PlaySessionId = game:GetPlaySessionId()
			
			if PlaySessionId ~= "" then
				config2.PlaySessionIdLabel = CreateFunction("TextLabel")({
					Name = "PlaySessionIdLabel",
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					ZIndex = 5,
					Parent = config2.VersionContainer,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
					Text = if RobloxTranslatorModule then RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", { RBX_STR = PlaySessionId }) else "PlaySessionId: " .. PlaySessionId,
					Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
				local PlaySessionIdLabel = config2.PlaySessionIdLabel
				local _UDim2_2 = UDim2.new(0.2, -6, 1, 0)
				PlaySessionIdLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, PlaySessionIdLabel.TextBounds.X + 6, 0, YOffset) or _UDim2_2
				config2.PlaySessionIdLabel.TextScaled = not config2.PlaySessionIdLabel.TextFits
			end
		end
		local function getOverridesPlayerScripts()
			-- upvalues: config (upval), StarterPlayer (upval), FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval)
			if config.EngineFeaturePlayerScriptStatusProperty then
				return ({
					[0] = "Unknown",
					[1] = "v3 Custom",
					[2] = "v3 Default",
					[3] = "v1 Custom",
					[4] = "v2 Default",
					[5] = "v2 Custom"
				})[StarterPlayer.PlayerModuleStatus]
			end
			local StarterPlayerScripts = StarterPlayer:WaitForChild("StarterPlayerScripts", if config.FFlagRemoveLoadingTimeout then 1e999 else nil)
			local PlayerScriptsLoader = StarterPlayerScripts:FindFirstChild("PlayerScriptsLoader")
			local PlayerModule = StarterPlayerScripts:FindFirstChild("PlayerModule")
			
			if not PlayerModule or not PlayerScriptsLoader or PlayerModule.Archivable then
				local ControlScript = StarterPlayerScripts:FindFirstChild("ControlScript")
				
				if StarterPlayerScripts:FindFirstChild("CameraScript") or ControlScript then
					if not FFlagLocalizeVersionLabels then
						return "Custom Old"
					elseif RobloxTranslatorModule then
						local Success2, Result2 = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.CustomOld")
						
						return if Success2 then Result2 else "Custom Old"
					else
						return "Custom Old"
					end
				elseif not FFlagLocalizeVersionLabels then
					return "Custom"
				elseif RobloxTranslatorModule then
					local Success3, Result3 = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.Custom")
					
					return if Success3 then Result3 else "Custom"
				else
					return "Custom"
				end
			elseif PlayerScriptsLoader.Archivable then
				if not FFlagLocalizeVersionLabels then
					return "Possibly Custom"
				elseif RobloxTranslatorModule then
					local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.PossiblyCustom")
					
					return if Success then Result else "Possibly Custom"
				else
					return "Possibly Custom"
				end
			elseif not FFlagLocalizeVersionLabels then
				return "Default"
			elseif RobloxTranslatorModule then
				local Success1, Result1 = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.CommonUI.Label.Default")
				
				return if Success1 then Result1 else "Default"
			else
				return "Default"
			end
		end
		
		config2.OverridesPlayerScriptsLabel = CreateFunction("TextLabel")({
			Name = "OverridesPlayerScriptsLabel",
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Text = "PlayerScripts: ",
			ZIndex = 5,
			Visible = false,
			Parent = config2.VersionContainer,
			AnchorPoint = Vector2.new(0.5, 0),
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: RobloxGui (upval), Players (upval), config (upval), StarterPlayer (upval), FFlagLocalizeVersionLabels (upval), RobloxTranslatorModule (upval), getOverridesPlayerScripts (copy), RbxAnalyticsService (upval), ConstantsModule (upval), config2 (upval), Inverted (upval), CoreScriptVersionEnabledEngineFeature (copy), YOffset (upval)
			local PlayerPermissionsModule = require(RobloxGui.Modules.PlayerPermissionsModule)
			
			if not Players.LocalPlayer then
				Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			end
			if config.FFlagWaitPlayerModuleStatus and StarterPlayer.PlayerModuleStatus == 0 then
				StarterPlayer:GetPropertyChangedSignal("PlayerModuleStatus"):Wait()
			end
			local PlayerScripts = "PlayerScripts: "
			
			if FFlagLocalizeVersionLabels then
				if RobloxTranslatorModule then
					local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.PlayerScripts")
					PlayerScripts = if Success then Result else "PlayerScripts: "
				else
					PlayerScripts = "PlayerScripts: "
				end
			end
			local OverridesPlayerScripts = getOverridesPlayerScripts()
			RbxAnalyticsService:setRBXEventStream(ConstantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
				defaultPlayerScripts = if config.EngineFeaturePlayerScriptStatusProperty then OverridesPlayerScripts == "v3 Default" else OverridesPlayerScripts == "Default",
				placeID = tostring(game.PlaceId),
				rawValue = if config.GetFFlagNewEventIngestPlayerScriptsDimensions() then OverridesPlayerScripts else nil,
				context = if config.GetFFlagNewEventIngestPlayerScriptsDimensions() then "IGMv1" else nil
			})
			config2.OverridesPlayerScriptsLabel.Text = PlayerScripts .. OverridesPlayerScripts
			config2.OverridesPlayerScriptsLabel.Visible = Inverted or PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer)
			local OverridesPlayerScriptsLabel = config2.OverridesPlayerScriptsLabel
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			OverridesPlayerScriptsLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, OverridesPlayerScriptsLabel.TextBounds.X + 6, 0, YOffset) or _UDim2
			config2.OverridesPlayerScriptsLabel.TextScaled = not (CoreScriptVersionEnabledEngineFeature or config2.OverridesPlayerScriptsLabel.TextFits)
		end)
		
		if CoreScriptVersionEnabledEngineFeature then
			local ClientCoreScriptVersion = "Client CoreScript Version: "
			
			if FFlagLocalizeVersionLabels then
				if RobloxTranslatorModule then
					local Success, Result = pcall(RobloxTranslatorModule.FormatByKey, RobloxTranslatorModule, "InGame.HelpMenu.Label.ClientCoreScriptVersion")
					ClientCoreScriptVersion = if Success then Result else "Client CoreScript Version: "
				else
					ClientCoreScriptVersion = "Client CoreScript Version: "
				end
			end
			config2.CoreScriptVersionLabel = CreateFunction("TextLabel")({
				Name = "CoreScriptVersionLabel",
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = config2.VersionContainer,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = ThemeModule.textSize(if IsEnabled then 28 elseif UtilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = ClientCoreScriptVersion .. RunService:GetCoreScriptVersion(),
				Font = ThemeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			local CoreScriptVersionLabel = config2.CoreScriptVersionLabel
			local _UDim2_5 = UDim2.new(0.2, -6, 1, 0)
			CoreScriptVersionLabel.Size = CoreScriptVersionEnabledEngineFeature and UDim2.new(0, CoreScriptVersionLabel.TextBounds.X + 6, 0, YOffset) or _UDim2_5
			local VersionContainer = config2.VersionContainer
			Object:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: VersionContainer (copy), Object (copy), YOffset (upval)
				VersionContainer.CanvasSize = UDim2.new(0, Object.AbsoluteContentSize.X, 0, YOffset)
			end)
		end
		config2.Modal = CreateFunction("TextButton")({
			Name = "Modal",
			BackgroundTransparency = 1,
			Modal = true,
			Text = "",
			Selectable = false,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 1, 0),
			Parent = config2.Shield
		})
		
		if config.FFlagSettingsHubIndependentBackgroundVisibility then
			config2.DarkenBackground = CreateFunction("ImageButton")({
				Name = "DarkenBackground",
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Visible = false,
				ZIndex = config2.Shield.ZIndex - 1,
				BackgroundColor3 = if config.isInExperienceUIVREnabled then config2.SettingsUIDelegate:getDarkBackgroundTheme().Color else ThemeModule.color("DarkenBackground"),
				Size = UDim2.new(1, 0, 1, 0),
				Parent = config2.ClippingShield
			})
		else
			config2.DarkenBackground = CreateFunction("Frame")({
				Name = "DarkenBackground",
				BackgroundTransparency = 1,
				ZIndex = config2.Shield.ZIndex - 1,
				BackgroundColor3 = ThemeModule.color("DarkenBackground"),
				Size = UDim2.new(1, 0, 1, 0),
				Parent = config2.ClippingShield
			})
		end
		local MenuContainerPositionResult = ThemeModule.MenuContainerPosition(config2.SettingsUIDelegate)
		config2.MenuContainer = CreateFunction("ImageButton")({
			Name = "MenuContainer",
			ZIndex = config2.Shield.ZIndex,
			BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1),
			BackgroundColor3 = ThemeModule.color("MenuContainer"),
			Position = MenuContainerPositionResult.Position,
			Size = MenuContainerPositionResult.Size,
			AnchorPoint = MenuContainerPositionResult.AnchorPoint,
			AutomaticSize = MenuContainerPositionResult.AutomaticSize,
			Parent = config2.Shield
		})
		config2.ReactPage.Parent = config2.MenuContainer
		config2.Page = CreateFunction("Frame")({
			Name = "Page",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Parent = config2.MenuContainer
		})
		config2.Page.SelectionGroup = true
		config2.Page.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		config2.Page.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		config2.Page.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
		config2.Page.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		local Page = config2.Page
		config2.MenuContainerPadding = CreateFunction("UIPadding")({ Parent = Page })
		
		if not IsEnabled then
			local _ = GuiService:GetGuiInset().Y
			config2.MenuContainerPadding.PaddingTop = UDim.new(0, 0)
		end
		local HubPaddingResult = ThemeModule.HubPadding()
		config2.MenuContainer.AutoButtonColor = false
		config2.MenuContainerPadding.PaddingLeft = HubPaddingResult.PaddingLeft
		config2.MenuContainerPadding.PaddingRight = HubPaddingResult.PaddingRight
		config2.MenuContainerPadding.PaddingBottom = HubPaddingResult.PaddingBottom
		config2.MenuContainerPadding.PaddingTop = HubPaddingResult.PaddingTop
		CreateFunction("UICorner")({
			CornerRadius = ThemeModule.MenuContainerCornerRadius,
			Parent = config2.MenuContainer
		})
		GetCamMicPermissionsModule(function(p3)
			-- upvalues: config2 (upval)
			config2.hasMicPermissions = p3.hasMicPermissions
			config2.isFetchingMicPermissions = false
		end, nil, true)
		config2.SettingsShowSignal:connect(function(p3)
			-- upvalues: Default (upval), config (upval), config2 (upval)
			if p3 then
				if Default:IsSeamlessVoice() and not Default.voiceUIVisible then
					if config.FFlagVoiceRewarmTelemetry then
						local ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4 = Default:GetConnectDisconnectButtonAnalyticsData(true)
						Default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", ConnectDisconnectButtonAnalyticsData, ConnectDisconnectButtonAnalyticsData2, ConnectDisconnectButtonAnalyticsData3, ConnectDisconnectButtonAnalyticsData4, Default.joinVoiceButtonContext)
					else
						Default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", Default:GetConnectDisconnectButtonAnalyticsData(true))
					end
				elseif Default:IsSeamlessVoice() and Default.voiceUIVisible then
					Default.Analytics:reportLeaveVoiceButtonEvent("shown", Default:GetConnectDisconnectButtonAnalyticsData(true))
				end
				if Default:UserVoiceEnabled() and config2.isFetchingMicPermissions then return end
				if not Default:UserOnlyEligibleForVoice() and (not Default:UserVoiceEnabled() or config2.hasMicPermissions) then return end
			end
		end)
		config2.MenuListLayout = CreateFunction("UIListLayout")({
			Name = "MenuListLayout",
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Page
		})
		config2.HubBar = CreateFunction("ImageLabel")({
			Name = "HubBar",
			BorderSizePixel = 0,
			LayoutOrder = 0,
			BackgroundColor3 = ThemeModule.color("HubBarContainer"),
			BackgroundTransparency = ThemeModule.transparency("HubBarContainerTransparency"),
			ZIndex = config2.Shield.ZIndex + 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Parent = Page
		})
		
		if not IsSideSheetEnabledModule then
			CreateFunction("Frame")({
				BorderSizePixel = 0,
				BackgroundColor3 = ThemeModule.color("Divider"),
				BackgroundTransparency = ThemeModule.transparency("Divider"),
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Parent = config2.HubBar
			})
		end
		if IsSideSheetEnabledModule then
			config2.PageTitleHeader = CreateFunction("Frame")({
				Name = "PageTitleHeader",
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Parent = config2.HubBar,
				ZIndex = config2.Shield.ZIndex + 1
			})
			CreateFunction("UIPadding")({
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				Parent = config2.PageTitleHeader
			})
			config2.PageTitleLabel = CreateFunction("TextLabel")({
				Name = "Title",
				BackgroundTransparency = 1,
				Text = "",
				Size = UDim2.new(1, -36, 0, 0),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Color3.new(1, 1, 1),
				Font = ThemeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
				Parent = config2.PageTitleHeader
			})
		end
		config2.HubBarListLayout = CreateFunction("UIListLayout")({
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = config2.HubBar
		})
		
		if not config.FFlagAddTraversalBackButton then
			if config.EngineFeatureTeleportHistoryButtons then
				config2.BackBarRef = RoactModule.createRef()
				config2.FrontBarRef = RoactModule.createRef()
				config2.BackBar = RoactModule.createElement(RoactAppExperimentModule.Provider, { value = IXPService }, {
					AppStyleProvider = RoactModule.createElement(AppStyleProvider, { style = { themeName = Dark } }, {
						ButtonsFrame = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = -1,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, 0)
						}, {
							BackButton = RoactModule.createElement(MenuBackButtonModule, {
								LayoutOrder = 1,
								BackBarRef = config2.BackBarRef,
								HubBar = config2.HubBar
							}),
							FrontButton = RoactModule.createElement(MenuFrontButtonModule, {
								LayoutOrder = 2,
								FrontBarRef = config2.FrontBarRef,
								HubBar = config2.HubBar
							})
						})
					})
				})
				RoactModule.mount(config2.BackBar, Page, "BackBar")
			else
				config2.BackBarRef = RoactModule.createRef()
				config2.BackBar = RoactModule.createElement(RoactAppExperimentModule.Provider, { value = IXPService }, {
					AppStyleProvider = RoactModule.createElement(AppStyleProvider, { style = { themeName = Dark } }, {
						BackButton = RoactModule.createElement(MenuBackButtonModule, { BackBarRef = config2.BackBarRef, HubBar = config2.HubBar })
					})
				})
				RoactModule.mount(config2.BackBar, Page, "BackBar")
			end
		end
		if UtilityModule:IsSmallTouchScreen() then
			config2.HubBar.Size = UDim2.new(0, RobloxGui.AbsoluteSize.X - 100, 0, 50)
			config2.HubBar.Position = UDim2.new(0.5, 0, 0, 6)
		elseif IsEnabled then
			config2.HubBar.Size = UDim2.new(0, 1200, 0, 100)
			config2.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		else
			config2.HubBar.Size = UDim2.new(0, 800, 0, 60)
			config2.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		end
		config2.VoiceRecordingIndicatorFrame = CreateFunction("Frame")({
			BackgroundTransparency = 1,
			Size = if config.ChromeEnabled then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = config2.HubBar
		})
		config2.VoiceRecordingText = CreateFunction("TextLabel")({
			Text = "",
			Visible = false,
			TextSize = 12,
			BackgroundTransparency = 1,
			Parent = config2.VoiceRecordingIndicatorFrame,
			Position = UDim2.new(0, 60, 0, 0),
			Font = AppFonts.default:getMedium(),
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = Color3.fromRGB(255, 255, 255)
		})
		
		if UtilityModule:IsSmallTouchScreen() then
			config2.VoiceRecordingText.Size = UDim2.fromScale(1, 1)
			config2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0)
			
			if config.ChromeEnabled then
				config2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				config2.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60)
			else
				config2.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60)
			end
		elseif IsEnabled then
			config2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			
			if config.ChromeEnabled then
				config2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				config2.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100)
				config2.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				config2.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100)
				config2.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		else
			config2.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			
			if config.ChromeEnabled then
				config2.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				config2.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60)
				config2.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				config2.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60)
				config2.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		end
		config2.voiceRecordingIndicatorTextMotor = OtterModule.createSingleMotor(0)
		config2.voiceRecordingIndicatorTextMotor:onStep(function(TextTransparency)
			-- upvalues: config2 (upval)
			config2.VoiceRecordingText.TextTransparency = TextTransparency
		end)
		spawn(function()
			-- upvalues: RunService (upval), config2 (upval), OtterModule (upval), config1 (upval)
			RunService:BindToRenderStep("VoiceRecordingIndicator", 1, function()
				-- upvalues: config2 (upval), OtterModule (upval), config1 (upval)
				if config2.isMuted ~= nil and config2.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - config2.lastVoiceRecordingIndicatorTextUpdated >= 5 and config2.isMuted then
					config2.voiceRecordingIndicatorTextMotor:setGoal(OtterModule.spring(1, config1))
					config2.voiceRecordingIndicatorTextMotor:start()
				end
			end)
		end)
		config2.PageViewClipper = CreateFunction("Frame")({
			Name = "PageViewClipper",
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 1,
			SelectionGroup = true,
			Size = UDim2.new(config2.HubBar.Size.X.Scale, config2.HubBar.Size.X.Offset, 1, -config2.HubBar.Size.Y.Offset - config2.HubBar.Position.Y.Offset - v3),
			Position = UDim2.new(config2.HubBar.Position.X.Scale, config2.HubBar.Position.X.Offset, config2.HubBar.Position.Y.Scale, config2.HubBar.Position.Y.Offset + config2.HubBar.Size.Y.Offset + 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Parent = Page,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Escape,
			SelectionBehaviorUp = Enum.SelectionBehavior.Escape
		})
		
		if config.FFlagEnableConsoleExpControls and config.ChromeEnabled then
			config2.PageViewPadding = CreateFunction("UIPadding")({ Parent = config2.PageViewClipper })
			local ServiceModule = require(RobloxGui.Modules.Chrome.Service)
			ServiceModule:onShortcutBarChanged():connect(function()
				-- upvalues: UtilityModule (upval), ServiceModule (copy), config2 (upval), ThemeModule (upval)
				if UtilityModule:IsSmallTouchScreen() and ServiceModule:getCurrentShortcutBar():get() ~= nil then
					config2.PageViewPadding.PaddingBottom = UDim.new(0, ThemeModule.ExtraPageBottomPaddingMobile)
					
					return
				else
					config2.PageViewPadding.PaddingBottom = UDim.new(0, 0)
				end
			end)
		end
		config2.PageView = CreateFunction("ScrollingFrame")({
			Name = "PageView",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 2),
			Size = UDim2.new(1, 0, 1, -20),
			CanvasSize = UDim2.new(1, 0, 1, 0),
			ZIndex = config2.Shield.ZIndex,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = ThemeModule.DefaultScrollBarThickness,
			Parent = config2.PageViewClipper
		})
		config2.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		config2.PageViewInnerFrame = CreateFunction("Frame")({
			Name = "PageViewInnerFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			LayoutOrder = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = config2.Shield.ZIndex,
			Parent = config2.PageView
		})
		CreateFunction("UIPadding")({
			PaddingTop = UDim.new(0, 5),
			Parent = config2.PageViewInnerFrame
		})
		config2.InnerCanvasGroupShow = CreateFunction("CanvasGroup")({
			Name = "InnerCanvasGroupShow",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = config2.PageViewInnerFrame
		})
		config2.InnerCanvasGroupHide = CreateFunction("CanvasGroup")({
			Name = "InnerCanvasGroupHide",
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Size = UDim2.fromScale(1, 1),
			Parent = config2.PageViewInnerFrame
		})
		
		if UserInputService.MouseEnabled then
			config2.PageViewClipper.Size = UDim2.new(config2.HubBar.Size.X.Scale, config2.HubBar.Size.X.Offset, 0.5, -(config2.HubBar.Position.Y.Offset - config2.HubBar.Size.Y.Offset))
		end
		config2.BottomButtonFrame = CreateFunction("Frame")({
			Name = "BottomButtonFrame",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Selectable = false,
			SelectionGroup = true,
			Size = config2.HubBar.Size,
			Position = UDim2.new(0.5, -config2.HubBar.Size.X.Offset / 2, 1 - config2.HubBar.Position.Y.Scale - config2.HubBar.Size.Y.Scale, -config2.HubBar.Position.Y.Offset - config2.HubBar.Size.Y.Offset),
			ZIndex = config2.Shield.ZIndex + 1,
			Parent = Page,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		})
		config2.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: config2 (upval)
			config2.setShowBottomBarSignal(config2.BottomButtonFrame.Visible)
		end)
		
		local function v263(AnalyticsResumeShieldSource)
			-- upvalues: config (upval), Callback (upval), config2 (upval), RbxAnalyticsService (upval), ConstantsModule (upval), GuiService (upval)
			if config.FFlagAddUILessMode then
				Callback(false, nil, nil, nil, AnalyticsResumeShieldSource)
			else
				Callback(false)
			end
			if config.FFlagAddUILessMode and config.FIntAddUILessModeVariant ~= 0 and config2.uiLessStore.getUILessModeEnabled(false) then
				config2.uiLessStore.setUIVisible(false)
			end
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsResumeGameName, ConstantsModule.AnalyticsMenuActionName, {
				source = AnalyticsResumeShieldSource,
				playsessionid = config2.playSessionId,
				universeid = tostring(game.GameId)
			})
			GuiService.SelectedCoreObject = nil
		end
		
		if IsSideSheetEnabledModule then
			config2.PageTitleCloseButton = UtilityModule:MakeStyledImageButton("PageTitleClose", "rbxasset://textures/ui/InspectMenu/x.png", UDim2.new(0, 40, 0, 40), UDim2.new(0, 16, 0, 16), function()
				-- upvalues: v263 (copy), ConstantsModule (upval)
				v263(ConstantsModule.AnalyticsResumeXButtonSource)
			end, nil, config2, "DefaultButton")
			config2.PageTitleCloseButton.AnchorPoint = Vector2.new(1, 0.5)
			config2.PageTitleCloseButton.Position = UDim2.new(1, 0, 0.5, 0)
			local Border = config2.PageTitleCloseButton:FindFirstChild("Border")
			
			if Border then
				Border.Parent = nil
			end
			config2.PageTitleCloseButton.Parent = config2.PageTitleHeader
		end
		if not config.FFlagMenuButtonsMountWithIEM and config.FFlagRelocateMobileMenuButtons and (config.FIntRelocateMobileMenuButtonsVariant == 1 or config.FIntRelocateMobileMenuButtonsVariant == 3 or config.FIntRelocateMobileMenuButtonsVariant == 2 and not UtilityModule:IsSmallTouchScreen()) then
			Callback1()
		end
		if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 or config.FIntRelocateMobileMenuButtonsVariant == 2 and UtilityModule:IsSmallTouchScreen() then
			config2.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80)
		end
		config2.MenuListLayout = CreateFunction("UIListLayout")({
			Padding = UDim.new(0, 12),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = config2.BottomButtonFrame
		})
		
		if config.FFlagEnableSystemScrimInSettingsHub then
			local SystemScrimSignalStoreResult = require(CorePackages.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false)
			SystemScrimSignalStoreResult.backgroundScrimActivated.Event:Connect(function()
				-- upvalues: config (upval), config2 (upval), ConstantsModule (upval), v263 (copy)
				if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					config2:GetExperienceControlStore().onResume(ConstantsModule.AnalyticsResumeShieldSource)
					
					return
				else
					v263(ConstantsModule.AnalyticsResumeShieldSource)
				end
			end)
			config2.Shield:GetPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: SystemScrimSignalStoreResult (copy), config2 (upval)
				SystemScrimSignalStoreResult.setTransparency(1)
				SystemScrimSignalStoreResult.setAutoDismiss(true)
				SystemScrimSignalStoreResult.setVisibility(config2.Shield.Visible)
			end)
		end
		config2.Shield.Activated:Connect(function()
			-- upvalues: config (upval), config2 (upval), ConstantsModule (upval), v263 (copy)
			if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				config2:GetExperienceControlStore().onResume(ConstantsModule.AnalyticsResumeShieldSource)
				
				return
			else
				v263(ConstantsModule.AnalyticsResumeShieldSource)
			end
		end)
		
		if config.FFlagSettingsHubIndependentBackgroundVisibility then
			config2.DarkenBackground.Activated:Connect(function()
				-- upvalues: config (upval), config2 (upval), ConstantsModule (upval), v263 (copy), InExperienceAppChatModalModule (upval)
				if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					config2:GetExperienceControlStore().onResume(ConstantsModule.AnalyticsResumeShieldSource)
				else
					v263(ConstantsModule.AnalyticsResumeShieldSource)
				end
				InExperienceAppChatModalModule.default:setVisible(false)
			end)
		end
		if not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 then
			local function v296()
				-- upvalues: config (upval), config2 (upval), removeBottomBarBindings (upval), ConstantsModule1 (upval)
				if config.FFlagPreventHiddenSwitchPage and config2:GetVisibility() == false then return end
				config2:AddToMenuStack(config2.Pages.CurrentPage)
				config2.HubBar.Visible = false
				removeBottomBarBindings()
				
				if config.GetFFlagEnableLeaveGameUpsellEntrypoint() and config2.leaveGameUpsellProp ~= ConstantsModule1.PHONE_UPSELL_VALUE_PROP.None then
					config2:SwitchToPage(config2.LeaveGameUpsellPage, nil, 1, true)
					
					return
				else
					config2:SwitchToPage(config2.LeaveGamePage, nil, 1, true)
				end
			end
			
			if InExperienceCapabilities.canNavigateHome then
				addBottomBarButtonOld("LeaveGame", "Leave", ImageForKeyCode1, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, if IsEnabled then -160 else -130, 0.5, -25), v296, {
					Enum.KeyCode.L,
					if config.FFlagEnableConsoleExpControls and config.ChromeEnabled then nil else Enum.KeyCode.ButtonX
				}, v296)
			end
			local function v267()
				-- upvalues: ResetEnabled (upval), config2 (upval), removeBottomBarBindings (upval)
				if ResetEnabled then
					config2:AddToMenuStack(config2.Pages.CurrentPage)
					config2.HubBar.Visible = false
					removeBottomBarBindings()
					config2:SwitchToPage(config2.ResetCharacterPage, nil, 1, true)
				end
			end
			
			addBottomBarButtonOld("ResetCharacter", NewLocalization:Format(ConstantsModule.RespawnLocalizedKey), ImageForKeyCode2, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, if IsEnabled then -550 else -400, 0.5, -25), v267, {
				Enum.KeyCode.R,
				if config.FFlagEnableConsoleExpControls and config.ChromeEnabled then nil else Enum.KeyCode.ButtonY
			}, v267)
			addBottomBarButtonOld("Resume", "Resume", if config.FFlagEnableConsoleExpControls then ImageForKeyCode3 else ImageForKeyCode, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, if IsEnabled then 200 else 140, 0.5, -25), function()
				-- upvalues: v263 (copy), ConstantsModule (upval)
				v263(ConstantsModule.AnalyticsResumeButtonSource)
			end, if config.FFlagEnableConsoleExpControls and config.ChromeEnabled then {} else { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart }, function()
				-- upvalues: v263 (copy), ConstantsModule (upval)
				v263(ConstantsModule.AnalyticsResumeGamepadSource)
			end)
		end
		if config.FFlagAddSwitchTabHintsToIEM then
			local function MountSwitchTabHint(p3)
				-- upvalues: CreateFunction (upval), ReactRobloxModule (upval), ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), UtilsModule (upval), SwitchTabHint (upval)
				ReactRobloxModule.createRoot((CreateFunction("Frame")({
					Name = "SwitchTabHintContainer",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					LayoutOrder = p3.layoutOrder,
					Parent = p3.parent
				}))):render(ReactModule.createElement(ReactModule.Fragment, nil, ReactModule.createElement("UIListLayout", {
					Name = "SwitchTabHintCenterAlign",
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}), ReactModule.createElement(FoundationProvider, {
					colorMode = FoundationModule.Enums.ColorMode.Dark,
					device = UtilsModule.getDeviceType()
				}, {
					["SwitchTabHint" .. p3.keycode.Name] = ReactModule.createElement(SwitchTabHint, { keycode = p3.keycode })
				})))
			end
			
			config2.TabHeaderContainer = CreateFunction("Frame")({
				Name = "TabHeaderContainer",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Parent = config2.HubBar,
				Visible = not IsSideSheetEnabledModule
			})
			config2.TabHeaderContainerListLayout = CreateFunction("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = config2.TabHeaderContainer
			})
			MountSwitchTabHint({
				layoutOrder = -999,
				keycode = Enum.KeyCode.ButtonL1,
				parent = config2.TabHeaderContainer
			})
			MountSwitchTabHint({
				layoutOrder = 999,
				keycode = Enum.KeyCode.ButtonR1,
				parent = config2.TabHeaderContainer
			})
		end
		config2.HubBarContainer = CreateFunction("ImageLabel")({
			Name = "HubBarContainer",
			BorderSizePixel = 0,
			ZIndex = config2.Shield.ZIndex + 2,
			BackgroundColor3 = ThemeModule.color("HubBarContainer"),
			BackgroundTransparency = ThemeModule.transparency("HubBarContainerTransparency"),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = if config.FFlagAddSwitchTabHintsToIEM then config2.TabHeaderContainer else config2.HubBar,
			Selectable = not config.FFlagIEMTabFocusNav and nil,
			SelectionGroup = if config.FFlagIEMTabFocusNav then true else nil,
			SelectionBehaviorUp = if config.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if config.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if config.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil
		})
		config2.HubBar.ImageTransparency = 1
		config2.HubBarListLayout.Parent = config2.HubBarContainer
		
		if IsSubjectToDesktopPoliciesFunction() then
			config2.FullScreenTitleBar = SettingsFullScreenTitleBarModule.mount({}, config2.Shield, "FullScreenTitleBar")
		end
		local function cameraViewportChanged()
			-- upvalues: ThemeModule (upval), UtilityModule (upval)
			ThemeModule.viewportResized()
			UtilityModule:FireOnResized()
		end
		
		local Connection = nil
		
		local function onWorkspaceChanged(Property)
			-- upvalues: ThemeModule (upval), UtilityModule (upval), Connection (ref), cameraViewportChanged (copy)
			if Property == "CurrentCamera" then
				ThemeModule.viewportResized()
				UtilityModule:FireOnResized()
				
				if Connection then
					Connection:disconnect()
				end
				Connection = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
			end
		end
		
		ThemeModule.viewportResized()
		UtilityModule:FireOnResized()
		
		if Connection then
			Connection:disconnect()
		end
		Connection = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
		workspace.Changed:Connect(onWorkspaceChanged)
	end
	
	local function resizeBottomBarButtons()
		-- upvalues: config2 (copy), config (upval)
		local X = config2.BottomButtonFrame.AbsoluteSize.X
		local CountBottomBarButtons = #config2.BottomBarButtons
		
		if CountBottomBarButtons == 4 then
			X = X - 48 - 12
			CountBottomBarButtons -= 1
		end
		local XOffset = (X - (CountBottomBarButtons - 1) * 12 - 12) / CountBottomBarButtons
		
		if config.isInExperienceUIVREnabled then
			XOffset = config2.SettingsUIDelegate:getBottomButtonSize(XOffset)
		end
		for i = 1, #config2.BottomBarButtons do
			local BottomBarButton = config2.BottomBarButtons[i]
			local BottomBarButtonEntry = BottomBarButton[1]
			
			if BottomBarButtonEntry ~= "MuteButtonButton" then
				config2[BottomBarButtonEntry].Size = UDim2.fromOffset(XOffset, config2[BottomBarButton[1]].Size.Y.Offset)
			end
		end
	end
	
	local _ = function()
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval)
		return FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction()
	end
	
	local _ = function()
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetSideSheetVisibilityFunction (upval), GetHasRoomForPeoplePageFunction (upval)
		return FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() or GetHasRoomForPeoplePageFunction())
	end
	
	local _ = function()
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval)
		return FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
	end
	
	local _ = function(): boolean
		-- upvalues: config2 (copy), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval)
		return config2.Visible and not (if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()))
	end
	
	local _ = function(p3)
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetSideSheetAnimationDurationFunction (upval)
		local DidSideSheetOpenWithPeoplePage = FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction()
		
		return if DidSideSheetOpenWithPeoplePage and GetSideSheetVisibilityFunction() then GetSideSheetAnimationDurationFunction() else p3
	end
	
	local _ = function(p3)
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval)
		return if p3 == nil then FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else p3
	end
	
	local _ = function(p3, p4)
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetAnimationDurationFunction (upval)
		local IsPeoplePageOpen = if p4 == nil then if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else p4
		
		return if IsPeoplePageOpen then GetSideSheetAnimationDurationFunction() else p3
	end
	
	local _ = function()
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetDrawerWidthFunction (upval)
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		
		return if IsPeoplePageOpen then GetSideSheetDrawerWidthFunction() else 0
	end
	
	local _ = function(p3: number): number
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetDrawerWidthFunction (upval), ThemeModule (upval), GetSideSheetMenuPageWidthFunction (upval), RobloxGui (upval)
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		local SideSheetDrawerWidth = if IsPeoplePageOpen then GetSideSheetDrawerWidthFunction() else 0
		
		if SideSheetDrawerWidth <= 0 then
			return p3
		else
			local HubPaddingResult = ThemeModule.HubPadding()
			
			return (math.max(150, (math.min(p3, (GetSideSheetMenuPageWidthFunction(RobloxGui.AbsoluteSize.X, SideSheetDrawerWidth, HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset))))))
		end
	end
	
	local _ = function(p3, p4)
		-- upvalues: ThemeModule (upval)
		local HubPaddingResult = ThemeModule.HubPadding()
		
		return p3 + HubPaddingResult.PaddingTop.Offset + HubPaddingResult.PaddingBottom.Offset + p4
	end
	
	local _ = function(Vector, p3)
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetDrawerWidthFunction (upval)
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		local SideSheetDrawerWidth = if IsPeoplePageOpen then GetSideSheetDrawerWidthFunction() else 0
		
		if SideSheetDrawerWidth <= 0 then
			return Vector, p3
		else
			return UDim2.new(Vector.X.Scale, Vector.X.Offset + SideSheetDrawerWidth / 2, 0.5, 0), Vector2.new(p3.X, 0.5)
		end
	end
	
	local function onScreenSizeChanged()
		-- upvalues: FFlagClosePeoplePageWhenNoRoomBesideSideSheet (upval), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), ClosePeoplePageWhenNoRoomBesideSideSheetFunction (upval), RobloxGui (upval), config2 (copy), config (upval), UtilityModule (upval), ThemeModule (upval), Callback1 (copy), Callback2 (copy), IsEnabled (upval), VRService (upval), GetSideSheetDrawerWidthFunction (upval), GetSideSheetMenuPageWidthFunction (upval), IsSideSheetEnabledModule (upval), RunService (upval), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), removeBottomBarBindings (copy), GetSideSheetMenuPageHeightFunction (upval)
		if FFlagClosePeoplePageWhenNoRoomBesideSideSheet and (FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) and ClosePeoplePageWhenNoRoomBesideSideSheetFunction(RobloxGui.AbsoluteSize.X)) then return end
		local function _()
			-- upvalues: config2 (upval)
			return if config2.BackBarRef:getValue() then config2.BackBarRef:getValue().Visible else false
		end
		
		local _ = function()
			-- upvalues: config2 (upval)
			return if config2.FrontBarRef:getValue() then config2.FrontBarRef:getValue().Visible else false
		end
		
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 and config2.Visible then
			if (UtilityModule:IsPortrait() or UtilityModule:IsSmallTouchScreen()) and not ThemeModule.AlwaysShowBottomBar() then
				if config2.BottomButtonFrameRoot then
					Callback2()
				end
				if config2.PlayersPage then
					config2.PlayersPage:CreateMenuButtonsContainer()
				end
			else
				if not config2.BottomButtonFrameRoot then
					Callback1()
				end
				if config2.PlayersPage then
					config2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
		end
		local MenuContainerPositionResult = ThemeModule.MenuContainerPosition(config2.SettingsUIDelegate)
		local v3 = 600
		local FullScreenSize = if config.isInExperienceUIVREnabled then config2.SettingsUIDelegate:getFullScreenSize() else RobloxGui.AbsoluteSize.y
		local YOffset1 = 0.050000000000000044 * FullScreenSize
		local IsPortrait = UtilityModule:IsPortrait()
		
		if IsEnabled then
			v3 = 800
			YOffset1 = 0.07 * FullScreenSize
		elseif UtilityModule:IsSmallTouchScreen() then
			YOffset1 = math.min(10, 0.010000000000000009 * FullScreenSize)
		elseif config.isInExperienceUIVREnabled and VRService.VREnabled then
			YOffset1 = 0
		end
		local Position = MenuContainerPositionResult.Position
		local AnchorPoint = MenuContainerPositionResult.AnchorPoint
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		local SideSheetDrawerWidth = if IsPeoplePageOpen then GetSideSheetDrawerWidthFunction() else 0
		local AnchorPoint1 = nil
		local Position1 = nil
		
		if SideSheetDrawerWidth <= 0 then
			Position1 = Position
			AnchorPoint1 = AnchorPoint
		else
			Position1 = UDim2.new(Position.X.Scale, Position.X.Offset + SideSheetDrawerWidth / 2, 0.5, 0)
			AnchorPoint1 = Vector2.new(AnchorPoint.X, 0.5)
		end
		config2.MenuContainer.Size = MenuContainerPositionResult.Size
		config2.MenuContainer.Position = Position1
		config2.MenuContainer.AnchorPoint = AnchorPoint1
		local _ = YOffset1 * 2 + config2.HubBar.Size.Y.Offset * 2
		local NewOffset = 0
		
		if not config.FFlagAddTraversalBackButton then
			if (if config2.BackBarRef:getValue() then config2.BackBarRef:getValue().Visible else false) and config2.BackBarRef:getValue() then
				NewOffset = config2.BackBarRef:getValue().Size.Y.Offset
			end
			if config.EngineFeatureTeleportHistoryButtons and ((if config2.FrontBarRef:getValue() then config2.FrontBarRef:getValue().Visible else false) and config2.FrontBarRef:getValue()) then
				NewOffset += config2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		if IsPortrait then
			config2.HubBar.Position = UDim2.new(0.5, 0, 0, 10)
			local HubBar = config2.HubBar
			local NewFunction1 = UDim2.new
			local v4 = 0
			local XDelta = RobloxGui.AbsoluteSize.X - 40
			local IsPeoplePageOpen1 = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			local SideSheetDrawerWidth1 = if IsPeoplePageOpen1 then GetSideSheetDrawerWidthFunction() else 0
			local Largest = nil
			
			if SideSheetDrawerWidth1 <= 0 then
				Largest = XDelta
			else
				local HubPaddingResult = ThemeModule.HubPadding()
				Largest = math.max(150, (math.min(XDelta, (GetSideSheetMenuPageWidthFunction(RobloxGui.AbsoluteSize.X, SideSheetDrawerWidth1, HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset)))))
			end
			HubBar.Size = NewFunction1(v4, Largest, 0, 54)
		elseif IsEnabled then
			config2.HubBar.Size = UDim2.new(0, 1200, 0, 100)
		elseif UtilityModule:IsSmallTouchScreen() then
			local HubBar = config2.HubBar
			local NewFunction = UDim2.new
			local v5 = 0
			local XDelta = RobloxGui.AbsoluteSize.X - 60
			local IsPeoplePageOpen2 = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			local SideSheetDrawerWidth2 = if IsPeoplePageOpen2 then GetSideSheetDrawerWidthFunction() else 0
			local Largest1 = nil
			
			if SideSheetDrawerWidth2 <= 0 then
				Largest1 = XDelta
			else
				local HubPaddingResult = ThemeModule.HubPadding()
				Largest1 = math.max(150, (math.min(XDelta, (GetSideSheetMenuPageWidthFunction(RobloxGui.AbsoluteSize.X, SideSheetDrawerWidth2, HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset)))))
			end
			HubBar.Size = NewFunction(v5, Largest1, 0, 52)
		elseif config.isInExperienceUIVREnabled then
			local HubBar = config2.HubBar
			local NewFunction2 = UDim2.new
			local v6 = 0
			local HubBarSize: number = config2.SettingsUIDelegate:getHubBarSize()
			local IsPeoplePageOpen3 = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			local SideSheetDrawerWidth3 = if IsPeoplePageOpen3 then GetSideSheetDrawerWidthFunction() else 0
			local Largest = nil
			
			if SideSheetDrawerWidth3 <= 0 then
				Largest = HubBarSize
			else
				local HubPaddingResult = ThemeModule.HubPadding()
				Largest = math.max(150, (math.min(HubBarSize, (GetSideSheetMenuPageWidthFunction(RobloxGui.AbsoluteSize.X, SideSheetDrawerWidth3, HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset)))))
			end
			HubBar.Size = NewFunction2(v6, Largest, 0, 60)
		else
			local HubBar1 = config2.HubBar
			local NewFunction3 = UDim2.new
			local v7 = 0
			local IsPeoplePageOpen4 = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			local SideSheetDrawerWidth4 = if IsPeoplePageOpen4 then GetSideSheetDrawerWidthFunction() else 0
			local Largest = nil
			
			if SideSheetDrawerWidth4 <= 0 then
				Largest = 800
			else
				local HubPaddingResult = ThemeModule.HubPadding()
				Largest = math.max(150, (math.min(800, (GetSideSheetMenuPageWidthFunction(RobloxGui.AbsoluteSize.X, SideSheetDrawerWidth4, HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset)))))
			end
			HubBar1.Size = NewFunction3(v7, Largest, 0, 60)
		end
		local Offset = if IsSideSheetEnabledModule or not ThemeModule.AlwaysShowBottomBar() then config2.HubBar.Size.Y.Offset else config2.HubBar.Size.Y.Offset + config2.BottomButtonFrame.Size.Y.Offset
		local NewMenuContainerExtraSpace = YOffset1 * 2 + (if config.FFlagFixDisableTopPaddingError and config2.Pages.CurrentPage == nil then Offset elseif config2.Pages.CurrentPage.DisableTopPadding then 0 else Offset)
		
		if not config.FFlagAddTraversalBackButton then
			NewOffset = if (if config2.BackBarRef:getValue() then config2.BackBarRef:getValue().Visible else false) and config2.BackBarRef:getValue() then config2.BackBarRef:getValue().Size.Y.Offset else 0
			
			if config.EngineFeatureTeleportHistoryButtons and ((if config2.FrontBarRef:getValue() then config2.FrontBarRef:getValue().Visible else false) and config2.FrontBarRef:getValue()) then
				NewOffset += config2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		RunService.Heartbeat:wait()
		
		if shouldShowBottomBar() then
			setBottomBarBindings()
			setBottomBarSelection(config2.Pages.CurrentPage)
		else
			removeBottomBarBindings()
		end
		if config.isInExperienceUIVREnabled then
			NewMenuContainerExtraSpace += config2.SettingsUIDelegate:getMenuContainerExtraSpace()
		end
		local FullScreenSizeDelta = FullScreenSize - NewMenuContainerExtraSpace - NewOffset
		
		if config.FFlagRelocateMobileMenuButtons and (config.FIntRelocateMobileMenuButtonsVariant == 1 or config.FIntRelocateMobileMenuButtonsVariant == 3) and UtilityModule:IsSmallTouchScreen() then
			FullScreenSizeDelta -= ThemeModule.ExtraHubBottomPaddingMobile
		end
		if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) then
			local HubPaddingResult = ThemeModule.HubPadding()
			FullScreenSizeDelta = GetSideSheetMenuPageHeightFunction(config2.Shield.AbsoluteSize.Y, Offset + HubPaddingResult.PaddingTop.Offset + HubPaddingResult.PaddingBottom.Offset + NewOffset)
		end
		if FFlagSideSheetOpenPeoplePage then
			local IsPeoplePageOpen5 = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			config2.PageView.VerticalScrollBarInset = if IsPeoplePageOpen5 then Enum.ScrollBarInset.Always else Enum.ScrollBarInset.ScrollBar
		end
		local YOffset = nil
		if IsPortrait then
			YOffset = FullScreenSizeDelta
		elseif v3 < FullScreenSizeDelta then
			YOffset = v3
			config2.HubBar.Position = UDim2.new(config2.HubBar.Position.X.Scale, config2.HubBar.Position.X.Offset, 0.5, -v3 / 2 - config2.HubBar.Size.Y.Offset)
			
			if config2.BottomButtonFrame then
				config2.BottomButtonFrame.Position = UDim2.new(config2.BottomButtonFrame.Position.X.Scale, config2.BottomButtonFrame.Position.X.Offset, 0.5, v3 / 2)
			end
		elseif FullScreenSizeDelta < 150 then
			YOffset = 150
			config2.HubBar.Position = UDim2.new(config2.HubBar.Position.X.Scale, config2.HubBar.Position.X.Offset, 0.5, -75 - config2.HubBar.Size.Y.Offset)
			
			if config2.BottomButtonFrame then
				config2.BottomButtonFrame.Position = UDim2.new(config2.BottomButtonFrame.Position.X.Scale, config2.BottomButtonFrame.Position.X.Offset, 0.5, 75)
			end
		else
			YOffset = FullScreenSizeDelta
			config2.HubBar.Position = UDim2.new(config2.HubBar.Position.X.Scale, config2.HubBar.Position.X.Offset, 0, YOffset1)
			
			if config2.BottomButtonFrame then
				config2.BottomButtonFrame.Position = UDim2.new(config2.BottomButtonFrame.Position.X.Scale, config2.BottomButtonFrame.Position.X.Offset, 1, -(YOffset1 + Offset))
			end
		end
		local _UDim2: UDim2 = if IsEnabled then UDim2.new(0, config2.HubBar.AbsoluteSize.X, 0, YOffset) elseif UtilityModule:IsSmallTouchScreen() then if config.FFlagRelocateMobileMenuButtons and (config.FIntRelocateMobileMenuButtonsVariant == 1 or config.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, config2.HubBar.AbsoluteSize.X, 0, YOffset + 0 + 0 - config2.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, config2.HubBar.AbsoluteSize.X, 0, YOffset + 0 + 0) else UDim2.new(0, config2.HubBar.AbsoluteSize.X, 0, YOffset)
		
		if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 and config2.BottomButtonFrame then
			config2.BottomButtonFrame.Size = UDim2.new(0, config2.HubBar.Size.X.Offset, 0, config2.HubBar.Size.Y.Offset)
		end
		local HubPaddingResult = ThemeModule.HubPadding()
		config2.ReactPage.Size = UDim2.new(0, config2.HubBar.AbsoluteSize.X + (HubPaddingResult.PaddingLeft.Offset + HubPaddingResult.PaddingRight.Offset), 0, YOffset + Offset + (HubPaddingResult.PaddingTop.Offset + HubPaddingResult.PaddingBottom.Offset))
		config2.PageViewClipper.Size = _UDim2
		
		if IsPortrait then
			config2.PageViewClipper.Position = UDim2.new(0.5, 0, 0, config2.HubBar.Position.Y.Offset + config2.HubBar.AbsoluteSize.Y)
			
			return
		else
			config2.PageViewClipper.Position = UDim2.new(config2.PageViewClipper.Position.X.Scale, config2.PageViewClipper.Position.X.Offset, 0.5, -YOffset / 2)
		end
	end
	
	if FFlagSideSheetOpenPeoplePage then
		local function scheduleSideSheetPeoplePageLayoutRefresh()
			-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), config2 (copy), onScreenSizeChanged (copy)
			if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and not GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction() then return end
			local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
			local Escape = if IsPeoplePageOpen then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
			
			if config2.Modal then
				config2.Modal.Visible = config2.Visible and not (if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()))
			end
			if config2.Page then
				config2.Page.SelectionBehaviorLeft = Escape
			end
			if config2.PageViewClipper then
				config2.PageViewClipper.SelectionBehaviorLeft = Escape
			end
			if not config2._sideSheetLayoutRefreshScheduled then
				config2._sideSheetLayoutRefreshScheduled = true
				task.defer(function()
					-- upvalues: config2 (upval), onScreenSizeChanged (upval)
					config2._sideSheetLayoutRefreshScheduled = false
					
					if config2.Visible and config2.MenuContainer then
						onScreenSizeChanged()
					end
				end)
				
				return
			end
		end
		
		config2._sideSheetLayoutEffectDispose = SignalsModule.createEffect(function(p3)
			-- upvalues: GetSideSheetVisibilityFunction (upval), GetSideSheetDrawerWidthFunction (upval), GetIsPeoplePageOpenFunction (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), scheduleSideSheetPeoplePageLayoutRefresh (copy)
			GetSideSheetVisibilityFunction(p3)
			GetSideSheetDrawerWidthFunction(p3)
			GetIsPeoplePageOpenFunction(p3)
			GetDidSideSheetOpenWithPeoplePageFunction(p3)
			scheduleSideSheetPeoplePageLayoutRefresh()
		end)
	end
	local _ = function()
		-- upvalues: config2 (copy), ThemeModule (upval), GuiService (upval)
		config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
	end
	
	local function toggleQuickProfilerFromHotkey(p3, UserInputState, _)
		-- upvalues: UserInputService (upval), GameSettings (upval)
		if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then return end
		if p3 == "Show Quick Profiler" and UserInputState and UserInputState == Enum.UserInputState.Begin then
			GameSettings.PerformanceStatsVisible = not GameSettings.PerformanceStatsVisible
		end
	end
	
	local function toggleDevConsole(p3, UserInputState, _)
		-- upvalues: DevConsoleMasterModule (upval)
		if p3 == "Open Dev Console" and UserInputState and UserInputState == Enum.UserInputState.Begin then
			DevConsoleMasterModule:ToggleVisibility()
		end
	end
	
	local Flag2 = IsEnabled
	local config3 = {
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
	UserInputService.InputBegan:connect(function(Input)
		-- upvalues: config3 (copy), Flag2 (ref)
		if Input.UserInputType and config3[Input.UserInputType] ~= nil then
			Flag2 = config3[Input.UserInputType]
			
			return
		end
		if Input.KeyCode and config3[Input.KeyCode] then
			Flag2 = config3[Input.KeyCode]
		end
	end)
	UserInputService.InputChanged:connect(function(Input)
		-- upvalues: Flag2 (ref)
		if Input.KeyCode == Enum.KeyCode.Thumbstick1 or Input.KeyCode == Enum.KeyCode.Thumbstick2 then
			if Input.Position.magnitude >= 0.25 then
				Flag2 = true
				
				return
			end
		elseif Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseMovement then
			Flag2 = false
		end
	end)
	local Callback3 = nil
	
	local function v185(p3: number, p4)
		-- upvalues: config (upval), config2 (copy), Callback3 (ref)
		if config.FFlagInExperienceReportClosingBugfix and not config2.HubBar.Visible then return end
		local CallbackResult: number = Callback3(config2.Pages.CurrentPage)
		
		if CallbackResult < 0 then return end
		local NewCallbackResult = CallbackResult + p3
		
		if p4 then
			if #config2.TabHeaders < NewCallbackResult then
				NewCallbackResult = 1
			elseif NewCallbackResult < 1 then
				NewCallbackResult = #config2.TabHeaders
			end
		end
		local TabHeader = config2.TabHeaders[NewCallbackResult]
		
		if TabHeader then
			for i, _ in pairs(config2.Pages.PageTable) do
				if i:GetTabHeader() == TabHeader then
					config2:SwitchToPage(i, true, p3)
					break
				end
			end
		end
	end
	
	local function FunctionToBind(_, UserInputState, Input)
		-- upvalues: v185 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			v185(if Input.KeyCode == Enum.KeyCode.ButtonR1 then 1 elseif Input.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 0, true)
			
			return
		end
	end
	
	local function v187(Input)
		-- upvalues: UserInputService (upval), v185 (copy)
		if Input.KeyCode == Enum.KeyCode.Tab then
			v185(if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then -1 else 1, true)
		end
	end
	
	local function FunctionToBind1(_, UserInputState, Input)
		-- upvalues: config2 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			config2:ScrollPixels(if Input.KeyCode == Enum.KeyCode.PageUp then -100 elseif Input.KeyCode == Enum.KeyCode.PageDown then 100 else 0)
			
			return
		end
	end
	
	if config.isInExperienceUIVREnabled or config.FFlagEnableSettingsHubUIDelegateRollout then
		config2.SettingsUIDelegate = require(RobloxGui.Modules.Settings.SettingsUIDelegate).new(config2)
	end
	createGui()
	
	if SettingsHubRaceConditionFix then
		setupVoiceListeners()
	end
	Callback3 = function(CurrentPage)
		-- upvalues: config2 (copy)
		local TabHeader = CurrentPage:GetTabHeader()
		
		if not TabHeader then
			return -1
		end
		for i, tabHeader in pairs(config2.TabHeaders) do
			if tabHeader == TabHeader then
				return i
			end
		end
		return -1
	end
	
	local _ = nil
	
	local function v190(ZIndex, Gui)
		-- upvalues: v190 (ref)
		if Gui:IsA("GuiObject") then
			Gui.ZIndex = ZIndex
			local Children = Gui:GetChildren()
			
			for i = 1, #Children do
				v190(ZIndex, Children[i])
			end
		end
	end
	
	local function AddHeader(Gui, p5)
		-- upvalues: config2 (copy), v190 (ref)
		if not Gui then return end
		table.insert(config2.TabHeaders, Gui)
		p5.TabPosition = #config2.TabHeaders
		local XScale = 1 / #config2.TabHeaders
		
		for i = 1, #config2.TabHeaders do
			config2.TabHeaders[i].Size = UDim2.new(XScale, 0, 1, 0)
		end
		v190(3, Gui)
		Gui.Parent = config2.HubBarContainer
	end
	
	local function RemoveHeader(TabHeader)
		-- upvalues: config2 (copy)
		local v3: number? = nil
		
		for i = 1, #config2.TabHeaders do
			if config2.TabHeaders[i] ~= TabHeader then
				continue
			end
			v3 = i
			table.remove(config2.TabHeaders, i)
			break
		end
		if v3 then
			for i1 = v3, #config2.TabHeaders do
				local TabHeader1 = config2.TabHeaders[i1]
				TabHeader1.Position = UDim2.new(TabHeader1.Position.X.Scale, TabHeader1.Position.X.Offset - TabHeader.AbsoluteSize.X, TabHeader1.Position.Y.Scale, TabHeader1.Position.Y.Offset)
			end
		end
		TabHeader.Parent = nil
	end
	
	function config2:AddPage(CapturesPage)
		-- upvalues: config2 (copy), AddHeader (copy), setBottomBarSelection (copy), config (upval)
		config2.Pages.PageTable[CapturesPage] = true
		AddHeader(CapturesPage:GetTabHeader(), CapturesPage)
		CapturesPage.Page.Position = UDim2.new(CapturesPage.TabPosition - 1, 0, 0, 0)
		CapturesPage.LastSelectableObjectsUpdated:connect(function()
			-- upvalues: setBottomBarSelection (upval), CapturesPage (copy)
			setBottomBarSelection(CapturesPage)
		end)
		
		if config.FFlagIEMTabFocusNav then
			if config.FFlagIEMTabFocusNav then
				local TabHeader = CapturesPage:GetTabHeader()
				
				if TabHeader then
					for _, firstSelectableObject in CapturesPage.FirstSelectableObjects do
						firstSelectableObject.NextSelectionUp = TabHeader
						TabHeader.NextSelectionDown = firstSelectableObject
					end
				end
			end
			if config.FFlagIEMTabFocusNav then
				for _, tabHeader in config2.TabHeaders do
					tabHeader.NextSelectionLeft = nil
					tabHeader.NextSelectionRight = nil
				end
				local CountTabHeaders = #config2.TabHeaders
				
				if CountTabHeaders >= 2 then
					config2.TabHeaders[1].NextSelectionLeft = config2.TabHeaders[CountTabHeaders]
					config2.TabHeaders[CountTabHeaders].NextSelectionRight = config2.TabHeaders[1]
				end
			end
			CapturesPage.FirstSelectableObjectsUpdated:connect(function()
				-- upvalues: CapturesPage (copy), config (upval)
				if not config.FFlagIEMTabFocusNav then return end
				local TabHeader = CapturesPage:GetTabHeader()
				
				if not TabHeader then return end
				for _, firstSelectableObject in CapturesPage.FirstSelectableObjects do
					firstSelectableObject.NextSelectionUp = TabHeader
					TabHeader.NextSelectionDown = firstSelectableObject
				end
			end)
		end
	end
	
	function config2:RemovePage(p6)
		-- upvalues: config2 (copy), RemoveHeader (copy), config (upval)
		config2.Pages.PageTable[p6] = nil
		RemoveHeader(p6:GetTabHeader())
		p6.LastSelectableObjectsUpdated:disconnect()
		
		if config.FFlagIEMTabFocusNav then
			p6.FirstSelectableObjectsUpdated:disconnect()
			
			if not config.FFlagIEMTabFocusNav then return end
			for _, tabHeader in config2.TabHeaders do
				tabHeader.NextSelectionLeft = nil
				tabHeader.NextSelectionRight = nil
			end
			local CountTabHeaders = #config2.TabHeaders
			
			if CountTabHeaders < 2 then return end
			config2.TabHeaders[1].NextSelectionLeft = config2.TabHeaders[CountTabHeaders]
			config2.TabHeaders[CountTabHeaders].NextSelectionRight = config2.TabHeaders[1]
		end
	end
	
	function config2:HideBar()
		-- upvalues: config2 (copy), removeBottomBarBindings (copy)
		config2.HubBar.Visible = false
		config2.PageViewClipper.Visible = false
		
		if config2.BottomButtonFrame then
			removeBottomBarBindings()
		end
	end
	
	function config2:ShowBar()
		-- upvalues: config2 (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy)
		config2.HubBar.Visible = true
		config2.PageViewClipper.Visible = true
		
		if config2.BottomButtonFrame and shouldShowBottomBar() then
			setBottomBarBindings()
			setBottomBarSelection(config2.Pages.CurrentPage)
		end
	end
	
	function config2:ScrollPixels(p7)
		-- upvalues: config2 (copy)
		config2.PageView.CanvasPosition = Vector2.new(0, (math.max(0, (math.min(config2.PageView.CanvasPosition.Y + p7, config2.PageView.CanvasSize.Y.Offset - config2.PageViewClipper.AbsoluteSize.y)))))
	end
	
	function config2:ScrollToFrame(Frame: Frame, p7)
		-- upvalues: Flag2 (ref), config2 (copy), ConstantsModule (upval)
		if Flag2 or p7 then
			local YDelta = Frame.AbsolutePosition.y - config2.Pages.CurrentPage.Page.AbsolutePosition.y
			local NewYDelta = YDelta + Frame.AbsoluteSize.y
			
			if YDelta < config2.PageView.CanvasPosition.y then
				config2.PageView.CanvasPosition = Vector2.new(0, YDelta)
				
				return
			end
			if config2.Pages.CurrentPage.Page.Name == ConstantsModule.PeoplePageKey and config2.PageView.AbsoluteSize.Y - ConstantsModule.PeoplePageScrollBuffer < NewYDelta - config2.PageView.CanvasPosition.y then
				config2.PageView.CanvasPosition = Vector2.new(0, NewYDelta - config2.PageView.AbsoluteSize.Y + ConstantsModule.PeoplePageScrollBuffer)
				
				return
			end
			if config2.PageViewClipper.Size.Y.Offset < NewYDelta - config2.PageView.CanvasPosition.y then
				config2.PageView.CanvasPosition = Vector2.new(0, NewYDelta - config2.PageViewClipper.Size.Y.Offset)
			end
		end
	end
	
	function config2:GetFirstPageWithTabHeader()
		-- upvalues: config2 (copy)
		local v4 = nil
		
		for i, _ in pairs(config2.Pages.PageTable) do
			if i:GetTabHeader() ~= nil and i.TabPosition == 1 then
				v4 = i
				break
			end
		end
		if v4 == nil then
			error("No page with tab header found")
			
			return nil
		else
			return v4
		end
	end
	
	function config2:InitInPage(CurrentPage)
		-- upvalues: config2 (copy), config (upval), UtilityModule (upval), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), IsSideSheetEnabledModule (upval), ChangedConnection (ref)
		local TabPosition = CurrentPage.TabPosition
		
		for i, _ in pairs(config2.Pages.PageTable) do
			if i ~= CurrentPage then
				i:Hide(-1, TabPosition, true, nil, config2.PageViewInnerFrame)
			end
		end
		if (not config.FFlagRelocateMobileMenuButtons or config.FIntRelocateMobileMenuButtonsVariant == 0 or config.FIntRelocateMobileMenuButtonsVariant == 2 and UtilityModule:IsSmallTouchScreen()) and config2.BottomButtonFrame then
			if shouldShowBottomBar(CurrentPage) then
				setBottomBarBindings()
				setBottomBarSelection(CurrentPage)
			else
				config2.BottomButtonFrame.Visible = false
			end
			local CurrentPage1 = CurrentPage or config2.Pages.CurrentPage
			config2.HubBar.Visible = if IsSideSheetEnabledModule then CurrentPage1.ShouldShowHubBar == true else CurrentPage1.ShouldShowBottomBar == true
		end
		local IsIsPageClipped = CurrentPage.IsPageClipped == true
		config2.PageViewClipper.ClipsDescendants = IsIsPageClipped
		config2.PageView.ClipsDescendants = IsIsPageClipped
		config2.PageViewInnerFrame.ClipsDescendants = IsIsPageClipped
		config2.Pages.CurrentPage = CurrentPage
		config2.Pages.CurrentPage.Active = true
		config2.CurrentPageSignal:fire(config2.Pages.CurrentPage and config2.Pages.CurrentPage.Page.Name or nil)
		
		if IsSideSheetEnabledModule then
			local CurrentPage2 = config2.Pages.CurrentPage
			local CurrentPage2_1 = CurrentPage2 or config2.Pages.CurrentPage
			
			if (if IsSideSheetEnabledModule then CurrentPage2_1.ShouldShowHubBar == true else CurrentPage2_1.ShouldShowBottomBar == true) and CurrentPage2.TabHeader then
				config2.PageTitleLabel.Text = CurrentPage2.TabHeader.TabLabel.Title.Text
			else
				config2.PageTitleLabel.Text = ""
			end
		end
		config2.PageView.CanvasSize = UDim2.new(0, 0, 0, config2.Pages.CurrentPage:GetSize().Y)
		ChangedConnection = config2.Pages.CurrentPage.Page.Changed:connect(function(p7)
			-- upvalues: config2 (upval)
			if p7 == "AbsoluteSize" then
				config2.PageView.CanvasSize = UDim2.new(0, 0, 0, config2.Pages.CurrentPage:GetSize().Y)
			end
		end)
	end
	
	function config2:SwitchToPage(CurrentPage, p7, p8: number, p9, _, p10)
		-- upvalues: config2 (copy), config (upval), FixReportButtonCutOff (upval), UtilityModule (upval), ThemeModule (upval), IsSideSheetEnabledModule (upval), shouldShowBottomBar (copy), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetDrawerWidthFunction (upval), ChangedConnection (ref), Connection (ref), setBottomBarBindings (copy), setBottomBarSelection (copy), onScreenSizeChanged (copy), CryoModule (upval), IXPServiceWrapper (upval), RbxAnalyticsService (upval), ConstantsModule (upval), FlagsModule (upval), ExperienceMenuSessionManagerInstance (upval), ReactPageSignalModule (upval)
		if config2.Pages.PageTable[CurrentPage] == nil then return end
		if config.FFlagPreventHiddenSwitchPage and config2:GetVisibility() == false then return end
		if FixReportButtonCutOff then
			if CurrentPage.Page.Name == "ReportAbuseMenuNewContainerPage" then
				config2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0)
			else
				config2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5)
			end
		end
		local _UDim = UDim.new(0, 0)
		local _UDim1 = UDim.new(0, 0)
		local IsFIntRelocateMobileMenuButtonsVariantMatch = config.FFlagRelocateMobileMenuButtons and (config.FIntRelocateMobileMenuButtonsVariant == 1 or config.FIntRelocateMobileMenuButtonsVariant == 3 or config.FIntRelocateMobileMenuButtonsVariant == 2 and not UtilityModule:IsSmallTouchScreen()) or (not (UtilityModule:IsPortrait() or UtilityModule:IsSmallTouchScreen()) or ThemeModule.AlwaysShowBottomBar())
		
		if config2.HubBar then
			local CurrentPage1 = CurrentPage or config2.Pages.CurrentPage
			
			if not (if IsSideSheetEnabledModule then CurrentPage1.ShouldShowHubBar == true else CurrentPage1.ShouldShowBottomBar == true) and not CurrentPage.DisableTopPadding then
				_UDim = UDim.new(0, config2.HubBar.AbsoluteSize.Y)
			end
		end
		if not IsSideSheetEnabledModule and config2.BottomButtonFrame and IsFIntRelocateMobileMenuButtonsVariantMatch and not shouldShowBottomBar(CurrentPage) then
			_UDim1 = UDim.new(0, config2.BottomButtonFrame.AbsoluteSize.Y)
		end
		local HubPaddingResult = ThemeModule.HubPadding()
		config2.MenuContainerPadding.PaddingLeft = HubPaddingResult.PaddingLeft
		config2.MenuContainerPadding.PaddingRight = HubPaddingResult.PaddingRight
		config2.MenuContainerPadding.PaddingBottom = HubPaddingResult.PaddingBottom + _UDim1
		config2.MenuContainerPadding.PaddingTop = HubPaddingResult.PaddingTop + _UDim
		local MenuContainerPositionResult = ThemeModule.MenuContainerPosition(config2.SettingsUIDelegate)
		local Position = MenuContainerPositionResult.Position
		local AnchorPoint = MenuContainerPositionResult.AnchorPoint
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		local SideSheetDrawerWidth = if IsPeoplePageOpen then GetSideSheetDrawerWidthFunction() else 0
		local Position1 = nil
		local AnchorPoint1 = nil
		
		if SideSheetDrawerWidth <= 0 then
			Position1 = Position
			AnchorPoint1 = AnchorPoint
		else
			Position1 = UDim2.new(Position.X.Scale, Position.X.Offset + SideSheetDrawerWidth / 2, 0.5, 0)
			AnchorPoint1 = Vector2.new(AnchorPoint.X, 0.5)
		end
		config2.MenuContainer.Position = Position1
		config2.MenuContainer.Size = MenuContainerPositionResult.Size
		config2.MenuContainer.AnchorPoint = AnchorPoint1
		
		if p8 == nil and config2.Pages.CurrentPage and config2.Pages.CurrentPage.TabHeader and CurrentPage and CurrentPage.TabHeader then
			p8 = if config2.Pages.CurrentPage.TabHeader.AbsolutePosition.x < CurrentPage.TabHeader.AbsolutePosition.x then 1 else -1
		end
		if p8 == nil then
			p8 = 1
		end
		if config2.Pages.CurrentPage and ChangedConnection ~= nil then
			ChangedConnection:disconnect()
			config2.Pages.CurrentPage.Active = false
		end
		if config.FFlagFixDisabledScrollOnIos and Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
		local TabPosition = CurrentPage.TabPosition
		
		for CurrentPage2, _ in pairs(config2.Pages.PageTable) do
			if CurrentPage2 ~= CurrentPage then
				CurrentPage2:Hide(-p8, TabPosition, p9, nil, config2.PageViewInnerFrame, CurrentPage2 == config2.Pages.CurrentPage)
			end
		end
		if config2.BottomButtonFrame then
			if shouldShowBottomBar(CurrentPage) then
				setBottomBarBindings()
				setBottomBarSelection(CurrentPage)
			else
				config2.BottomButtonFrame.Visible = false
			end
			local CurrentPage3 = CurrentPage or config2.Pages.CurrentPage
			config2.HubBar.Visible = if IsSideSheetEnabledModule then CurrentPage3.ShouldShowHubBar == true else CurrentPage3.ShouldShowBottomBar == true
		end
		if config.FFlagIEMTabFocusNav and config.FFlagIEMTabFocusNav then
			local TabHeader = CurrentPage:GetTabHeader()
			
			if TabHeader then
				for _, firstSelectableObject in CurrentPage.FirstSelectableObjects do
					firstSelectableObject.NextSelectionUp = TabHeader
					TabHeader.NextSelectionDown = firstSelectableObject
				end
			end
		end
		local IsIsPageClipped = CurrentPage.IsPageClipped == true
		config2.PageViewClipper.ClipsDescendants = IsIsPageClipped
		config2.PageView.ClipsDescendants = IsIsPageClipped
		config2.PageViewInnerFrame.ClipsDescendants = IsIsPageClipped
		config2.Pages.CurrentPage = CurrentPage
		config2.Pages.CurrentPage:Display(config2.PageViewInnerFrame, p9)
		config2.Pages.CurrentPage.Active = true
		config2.CurrentPageSignal:fire(config2.Pages.CurrentPage and config2.Pages.CurrentPage.Page.Name or nil)
		
		if IsSideSheetEnabledModule then
			local CurrentPage4 = config2.Pages.CurrentPage
			local CurrentPage4_1 = CurrentPage4 or config2.Pages.CurrentPage
			
			if (if IsSideSheetEnabledModule then CurrentPage4_1.ShouldShowHubBar == true else CurrentPage4_1.ShouldShowBottomBar == true) and CurrentPage4.TabHeader then
				config2.PageTitleLabel.Text = CurrentPage4.TabHeader.TabLabel.Title.Text
			else
				config2.PageTitleLabel.Text = ""
			end
		end
		local CurrentPage5 = config2.Pages.CurrentPage
		
		if CurrentPage5 ~= nil and CurrentPage5.ShouldDisableDefaultScroll == true then
			config2.PageView.ScrollBarThickness = 0
			config2.PageView.ScrollingEnabled = false
			config2.PageView.CanvasPosition = Vector2.new(0, 0)
			config2.PageView.CanvasSize = UDim2.new(1, 0, 1, 0)
			
			if config.FFlagFixDisabledScrollOnIos then
				Connection = config2.PageView:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: config2 (upval)
					if config2.PageView.CanvasPosition.Magnitude > 0 then
						config2.PageView.CanvasPosition = Vector2.new(0, 0)
					end
				end)
			end
		else
			config2.PageView.ScrollBarThickness = ThemeModule.DefaultScrollBarThickness
			config2.PageView.ScrollingEnabled = true
			config2.PageView.CanvasSize = UDim2.new(0, 0, 0, config2.Pages.CurrentPage:GetSize().Y)
		end
		ChangedConnection = config2.Pages.CurrentPage.Page.Changed:connect(function(p11)
			-- upvalues: config2 (upval)
			if p11 == "AbsoluteSize" then
				local CurrentPage = config2.Pages.CurrentPage
				
				if CurrentPage == nil or CurrentPage.ShouldDisableDefaultScroll ~= true then
					config2.PageView.CanvasSize = UDim2.new(0, 0, 0, config2.Pages.CurrentPage:GetSize().Y)
				end
			end
		end)
		
		if config2.MenuStack[#config2.MenuStack] ~= config2.Pages.CurrentPage and not p7 then
			config2.MenuStack[#config2.MenuStack + 1] = config2.Pages.CurrentPage
		end
		if CurrentPage.DisableTopPadding then
			onScreenSizeChanged()
		end
		local JoinResult = { universeid = tostring(game.GameId) }
		
		if config.GetFFlagReportAbuseMenuEntrypointAnalytics() and p10 then
			JoinResult = CryoModule.Dictionary.join(JoinResult, p10)
		end
		if config.FFlagRespawnChromeShortcutTelemetry and JoinResult.used_shortcut == nil then
			JoinResult.used_shortcut = false
		end
		if JoinResult.playsessionid == nil then
			JoinResult.playsessionid = config2.playSessionId
		end
		if CurrentPage then
			if config.FFlagHelpPageIXPExposure and config2.HelpPage == CurrentPage and not config2.HelpPageIXPFetched then
				IXPServiceWrapper:LogUserLayerExposure(config.FStringHelpPageIXPLayer)
				config2.HelpPageIXPFetched = true
			end
			if config2.GameSettingsPage == CurrentPage then
				RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, "open_GameSettings_tab", ConstantsModule.AnalyticsMenuActionName, JoinResult)
				
				if FlagsModule.FFlagIEMSettingsLogExposureIXPFlags and not config2.GameSettingsPageReorderIXPFetched then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(config.GetFStringInExperienceMenuIXPLayer())
					config2.GameSettingsPageReorderIXPFetched = true
				end
			else
				RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, "open_" .. CurrentPage.Page.Name .. "_tab", ConstantsModule.AnalyticsMenuActionName, JoinResult)
			end
			ExperienceMenuSessionManagerInstance:MenuSwitchToPage(CurrentPage.Page)
		else
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, "open_unknown_tab", ConstantsModule.AnalyticsMenuActionName, JoinResult)
			ExperienceMenuSessionManagerInstance:CloseOpenedMenuTab()
		end
		if config.FFlagAddTraversalHistory and config.FFlagIntegrateTraversalHistoryInSideSheet then
			ReactPageSignalModule(false).setCurrentReactPage(nil)
		end
	end
	
	function config2:SetActive(Active)
		-- upvalues: config2 (copy)
		config2.Active = Active
		
		if config2.Pages.CurrentPage then
			config2.Pages.CurrentPage.Active = Active
		end
	end
	
	function clearMenuStack()
		-- upvalues: config2 (copy)
		while config2.MenuStack and #config2.MenuStack > 0 do
			config2:PopMenu()
		end
	end
	
	function setOverrideMouseIconBehavior()
		-- upvalues: config2 (copy), UserInputService (upval), VRService (upval), MouseIconOverrideService (upval), SettingsHubCursorOverride (upval)
		if not config2.Visible then return end
		if UserInputService:GetLastInputType() == Enum.UserInputType.Gamepad1 or VRService.VREnabled then
			MouseIconOverrideService.push(SettingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		else
			MouseIconOverrideService.push(SettingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
		end
	end
	
	function checkLeaveGameUpsell()
		-- upvalues: config (upval), config2 (copy), ConstantsModule1 (upval), Default (upval), CheckLeaveGameUpsellCooldown (upval)
		if not config.GetFFlagEnableLeaveGameUpsellEntrypoint() then return end
		if not config2.sessionStartTime then
			config2.sessionStartTime = os.time()
		end
		if not config2.sessionStartTime then return end
		if not config2.checkedUpsell and config2.leaveGameUpsellProp == ConstantsModule1.PHONE_UPSELL_VALUE_PROP.None then
			config2.checkedUpsell = true
			config2.leaveGameUpsellProp = Default:FetchPhoneVerificationUpsell(ConstantsModule1.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, config2.sessionStartTime, true)
			config2.LeaveGameUpsellPage:SetUpsellProp(config2.leaveGameUpsellProp)
			task.delay(CheckLeaveGameUpsellCooldown, function()
				-- upvalues: config2 (upval)
				config2.checkedUpsell = false
			end)
			
			return
		end
		if config2.checkedUpsell then
			local PhoneVerificationUpsell = Default:FetchPhoneVerificationUpsell(ConstantsModule1.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, config2.sessionStartTime, false)
			
			if config2.leaveGameUpsellProp ~= PhoneVerificationUpsell then
				config2.leaveGameUpsellProp = PhoneVerificationUpsell
				config2.LeaveGameUpsellPage:SetUpsellProp(config2.leaveGameUpsellProp)
			end
		end
	end
	
	local Callback4 = if config.FFlagSettingsHubIndependentBackgroundVisibility then function(Visible, p11, p12)
		-- upvalues: config2 (copy), InExperienceAppChatModalModule (upval), ConstantsModule (upval), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), GetSideSheetAnimationDurationFunction (upval), config (upval), ThemeModule (upval), TweenService (upval)
		if not config2.DarkenBackground then return end
		if not Visible and config2.DarkenBackground.Visible and (InExperienceAppChatModalModule:getVisible() or config2.Visible) then return end
		local BackgroundTransparency = 1
		local Quart = Enum.EasingStyle.Quart
		local ShieldCloseAnimationTweenTime = if ConstantsModule then ConstantsModule.ShieldCloseAnimationTweenTime else 0.4
		local IsPeoplePageOpen = if p12 == nil then if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else p12
		local SideSheetAnimationDuration = if IsPeoplePageOpen then GetSideSheetAnimationDurationFunction() else ShieldCloseAnimationTweenTime
		
		if Visible then
			BackgroundTransparency = if config.isInExperienceUIVREnabled then config2.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else ThemeModule.transparency("DarkenBackground")
			Quart = Enum.EasingStyle.Quad
			local ShieldOpenAnimationTweenTime = if ConstantsModule then ConstantsModule.ShieldOpenAnimationTweenTime else 0.5
			local DidSideSheetOpenWithPeoplePage = FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction()
			SideSheetAnimationDuration = if DidSideSheetOpenWithPeoplePage and GetSideSheetVisibilityFunction() then GetSideSheetAnimationDurationFunction() else ShieldOpenAnimationTweenTime
		end
		if p11 then
			if config2.DarkenBackgroundTween then
				config2.DarkenBackgroundTween:Cancel()
				config2.DarkenBackgroundTween = nil
			end
			config2.DarkenBackground.BackgroundTransparency = BackgroundTransparency
		else
			local _TweenInfo = TweenInfo.new(SideSheetAnimationDuration, Quart, Enum.EasingDirection.Out)
			
			if config2.DarkenBackgroundTween then
				config2.DarkenBackgroundTween:Cancel()
			end
			config2.DarkenBackgroundTween = TweenService:Create(config2.DarkenBackground, _TweenInfo, { BackgroundTransparency = BackgroundTransparency })
			config2.DarkenBackgroundTween:Play()
		end
		config2.DarkenBackground.Visible = Visible
	end else nil
	
	Callback = function(Visible, p11, CurrentPage, _, Source)
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetSideSheetVisibilityFunction (upval), GetIsPeoplePageOpenFunction (upval), config2 (copy), ToggleSideSheetFunction (upval), config (upval), PerfUtilsModule (upval), RobloxGui (upval), Callback4 (ref), onScreenSizeChanged (copy), UtilityModule (upval), Callback1 (copy), GuiService (upval), ThemeModule (upval), ExperienceMenuSessionManagerInstance (upval), ConstantsModule (upval), GetSideSheetAnimationDurationFunction (upval), GameSettings (upval), TweenService (upval), ContextActionService (upval), IsSideSheetEnabledModule (upval), FunctionToBind (copy), FunctionToBind1 (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), UserInputService (upval), v187 (copy), LastInputTypeChangedConnection (upval), VRService (upval), MouseIconOverrideService (upval), SettingsHubCursorOverride (upval), removeBottomBarBindings (copy), ChatSelectorModule (upval), FFlagEnableNewBackpack (upval), Features (upval), InExperienceAppChatModalModule (upval), Flag (upval), Callback2 (copy), SHIELDINACTIVEPOSITION (upval), RbxAnalyticsService (upval)
		local IsPeoplePageOpen = if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())
		
		if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and not Visible and config2.Visible then
			ToggleSideSheetFunction(false)
		end
		local P108 = if config.isInExperienceUIVREnabled then p11 or not config2.SettingsUIDelegate:isOpenCloseAnimationAllowed() else p11
		config2.OpenStateChangedCount += 1
		local IsNotVisibleMatch = Visible ~= config2.Visible
		config2.Visible = Visible
		
		if config.FFlagEnableInGameMenuDurationLogger and IsNotVisibleMatch and not Visible then
			PerfUtilsModule.menuClose()
		end
		if config2.ResizedConnection then
			config2.ResizedConnection:disconnect()
			config2.ResizedConnection = nil
		end
		if config2.BackBarVisibleConnection then
			config2.BackBarVisibleConnection:disconnect()
			config2.BackBarVisibleConnection = nil
		end
		if config.EngineFeatureTeleportHistoryButtons and config2.FrontBarVisibleConnection then
			config2.FrontBarVisibleConnection:disconnect()
			config2.FrontBarVisibleConnection = nil
		end
		if config2.PreferredTransparencyChangedConnection then
			config2.PreferredTransparencyChangedConnection:disconnect()
			config2.PreferredTransparencyChangedConnection = nil
		end
		config2.Modal.Visible = if FFlagSideSheetOpenPeoplePage then config2.Visible and not (if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction())) else config2.Visible
		
		if config2.TabConnection then
			config2.TabConnection:disconnect()
			config2.TabConnection = nil
		end
		local PlayerListManagerModule = require(RobloxGui.Modules.PlayerList.PlayerListManager)
		
		if config.FFlagSettingsHubIndependentBackgroundVisibility then
			Callback4(config2.Visible, P108, IsPeoplePageOpen)
		end
		if config2.Visible then
			config2.ResizedConnection = RobloxGui.Changed:connect(function(p12)
				-- upvalues: onScreenSizeChanged (upval)
				if p12 == "AbsoluteSize" then
					onScreenSizeChanged()
				end
			end)
			
			if config.FFlagMenuButtonsMountWithIEM then
				if config.FFlagRelocateMobileMenuButtons and (config.FIntRelocateMobileMenuButtonsVariant == 1 or config.FIntRelocateMobileMenuButtonsVariant == 3 or config.FIntRelocateMobileMenuButtonsVariant == 2 and not UtilityModule:IsSmallTouchScreen()) then
					Callback1()
				end
				if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 and UtilityModule:IsSmallTouchScreen() and config2.PlayersPage then
					config2.PlayersPage:CreateMenuButtonsContainer()
				end
			end
			if not config.FFlagAddTraversalBackButton then
				if config2.BackBarRef:getValue() then
					config2.BackBarVisibleConnection = config2.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: onScreenSizeChanged (upval)
						onScreenSizeChanged()
					end)
				end
				if config.EngineFeatureTeleportHistoryButtons and config2.FrontBarRef:getValue() then
					config2.FrontBarVisibleConnection = config2.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: onScreenSizeChanged (upval)
						onScreenSizeChanged()
					end)
				end
			end
			onScreenSizeChanged()
			config2.PreferredTransparencyChangedConnection = GuiService:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
				-- upvalues: config2 (upval), ThemeModule (upval), GuiService (upval)
				config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
			end)
			config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
			config2.SettingsShowSignal:fire(config2.Visible)
			GuiService:SetMenuIsOpen(true, "SettingsHub")
			ExperienceMenuSessionManagerInstance:OpenExperienceMenu()
			config2.Shield.Visible = config2.Visible
			GuiService:CloseInspectMenu()
			
			if P108 or not config2.Shield:IsDescendantOf(game) then
				config2.Shield.Position = UDim2.new(0, 0, 0, 0)
				
				if not config.FFlagSettingsHubIndependentBackgroundVisibility and config2.DarkenBackground then
					if config2.DarkenBackgroundTween then
						config2.DarkenBackgroundTween:Cancel()
						config2.DarkenBackgroundTween = nil
					end
					config2.DarkenBackground.BackgroundTransparency = ThemeModule.transparency("DarkenBackground")
				end
			else
				local ShieldOpenAnimationTweenTime = if ConstantsModule then ConstantsModule.ShieldOpenAnimationTweenTime else 0.5
				local DidSideSheetOpenWithPeoplePage = FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction()
				local SideSheetAnimationDuration = if DidSideSheetOpenWithPeoplePage and GetSideSheetVisibilityFunction() then GetSideSheetAnimationDurationFunction() else ShieldOpenAnimationTweenTime
				
				if GameSettings.ReducedMotion then
					if config2.ReducedMotionOpenTween then
						config2.ReducedMotionOpenTween:Cancel()
						config2.ReducedMotionOpenTween = nil
					end
					if config2.ReducedMotionCloseTween then
						config2.ReducedMotionCloseTween:Cancel()
						config2.ReducedMotionCloseTween = nil
					end
					config2.Shield.Parent = config2.CanvasGroup
					config2.CanvasGroup.GroupTransparency = 1
					config2.CanvasGroup.Visible = true
					config2.Shield.Position = UDim2.new(0, 0, 0, 0)
					config2.ReducedMotionOpenTween = TweenService:Create(config2.CanvasGroup, TweenInfo.new(0.25), { GroupTransparency = 0 })
					config2.ReducedMotionOpenTween:Play()
					config2.ReducedMotionOpenTween.Completed:Connect(function(PlaybackState)
						-- upvalues: config2 (upval)
						if PlaybackState == Enum.PlaybackState.Completed then
							config2.Shield.Parent = config2.ClippingShield
							config2.ReducedMotionOpenTween = nil
						end
						config2.CanvasGroup.Visible = false
					end)
					
					if config.FFlagEnableInGameMenuDurationLogger then
						PerfUtilsModule.menuOpenComplete()
					end
				else
					config2.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, SideSheetAnimationDuration, true, function()
						-- upvalues: config (upval), PerfUtilsModule (upval)
						if config.FFlagEnableInGameMenuDurationLogger then
							PerfUtilsModule.menuOpenComplete()
						end
					end)
				end
				if not config.FFlagSettingsHubIndependentBackgroundVisibility and config2.DarkenBackground then
					local _TweenInfo1 = TweenInfo.new(SideSheetAnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					
					if config2.DarkenBackgroundTween then
						config2.DarkenBackgroundTween:Cancel()
					end
					config2.DarkenBackgroundTween = TweenService:Create(config2.DarkenBackground, _TweenInfo1, {
						BackgroundTransparency = ThemeModule.transparency("DarkenBackground")
					})
					config2.DarkenBackgroundTween:Play()
				end
			end
			ContextActionService:BindCoreAction("RbxSettingsHubStopCharacter", if config.isInExperienceUIVREnabled then function(p12, p13, p14)
				-- upvalues: config2 (upval)
				return if config2.SettingsUIDelegate:isInputEventNeededBySettings(p12, p13, p14) then Enum.ContextActionResult.Pass else nil
			end else function() end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			
			if not IsSideSheetEnabledModule then
				ContextActionService:BindCoreAction("RbxSettingsHubSwitchTab", FunctionToBind, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			end
			ContextActionService:BindCoreAction("RbxSettingsScrollHotkey", FunctionToBind1, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown)
			
			if shouldShowBottomBar() then
				setBottomBarBindings()
				setBottomBarSelection(config2.Pages.CurrentPage)
			end
			if config.ChromeEnabled and config.FFlagEnableConsoleExpControls then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
			end
			if not IsSideSheetEnabledModule then
				config2.TabConnection = UserInputService.InputBegan:connect(v187)
			end
			setOverrideMouseIconBehavior()
			LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:connect(setOverrideMouseIconBehavior)
			
			if UserInputService.MouseEnabled and not VRService.VREnabled then
				MouseIconOverrideService.push(SettingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
			end
			config2:CloseReactPage()
			
			if CurrentPage then
				removeBottomBarBindings()
				config2:SwitchToPage(CurrentPage, nil, 1, true)
			else
				config2:SwitchToPage(config2:GetFirstPageWithTabHeader(), nil, 1, true)
			end
			if not config.isInExperienceUIVREnabled or config.InExperienceUIVRIXP:isMovePanelToCenter() or not VRService.VREnabled then
				if config.FFlagAddNewPlayerListMobileFocusNav then
					if PlayerListManagerModule:GetIsModal() then
						PlayerListManagerModule:SetVisibility(false)
					else
						PlayerListManagerModule:HideTemp("SettingsMenu", true)
					end
				else
					PlayerListManagerModule:HideTemp("SettingsMenu", true)
				end
				if not config.isInExperienceUIVREnabled or not config.InExperienceUIVRIXP:isMovePanelToCenter() or (not config.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled) then
					ChatSelectorModule:HideTemp("SettingsMenu", true)
				end
				if FFlagEnableNewBackpack then
					Features.setVisibility(Features.FeatureName.Backpack, false)
				else
					local BackpackScriptModule = require(RobloxGui.Modules.BackpackScript)
					
					if BackpackScriptModule.IsOpen then
						BackpackScriptModule:OpenClose()
					end
				end
			end
			if config.GetFFlagEnableAppChatInExperience() and InExperienceAppChatModalModule:getVisible() then
				Flag = true
				InExperienceAppChatModalModule.default:setVisible(false)
			end
			if not config.isInExperienceUIVREnabled then
				if FFlagEnableNewBackpack then
					Features.setVisibility(Features.FeatureName.Backpack, false)
				else
					local BackpackScriptModule = require(RobloxGui.Modules.BackpackScript)
					
					if BackpackScriptModule.IsOpen then
						BackpackScriptModule:OpenClose()
					end
				end
			end
			config2.GameSettingsPage:OpenSettingsPage()
		else
			config2.CurrentPageSignal:fire("")
			
			if config.FFlagMenuButtonsMountWithIEM and config.FFlagRelocateMobileMenuButtons then
				if config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					Callback2()
				end
				if config.FIntRelocateMobileMenuButtonsVariant == 2 and config2.PlayersPage then
					config2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			if config.ChromeEnabled and config.FFlagEnableConsoleExpControls then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(nil)
			end
			if config.GetFFlagEnableAppChatInExperience() and Flag then
				Flag = false
			end
			if config.isInExperienceUIVREnabled and config.InExperienceUIVRIXP:isMovePanelToCenter() then
				PlayerListManagerModule:HideTemp("SettingsMenu", false)
				
				if not config.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled then
					ChatSelectorModule:HideTemp("SettingsMenu", false)
				end
			end
			if P108 then
				config2.Shield.Position = SHIELDINACTIVEPOSITION
				config2.Shield.Visible = config2.Visible
				config2.SettingsShowSignal:fire(config2.Visible)
				GuiService:SetMenuIsOpen(false, "SettingsHub")
				ExperienceMenuSessionManagerInstance:CloseExperienceMenu()
				
				if config.FFlagEnableInGameMenuDurationLogger then
					PerfUtilsModule.menuCloseComplete()
				end
				if not config.FFlagSettingsHubIndependentBackgroundVisibility and config2.DarkenBackground then
					if config2.DarkenBackgroundTween then
						config2.DarkenBackgroundTween:Cancel()
						config2.DarkenBackgroundTween = nil
					end
					config2.DarkenBackground.BackgroundTransparency = 1
				end
			else
				local ShieldCloseAnimationTweenTime = if ConstantsModule then ConstantsModule.ShieldCloseAnimationTweenTime else 0.4
				local IsPeoplePageOpen1 = if IsPeoplePageOpen == nil then if FFlagSideSheetOpenPeoplePage then GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else IsPeoplePageOpen
				local SideSheetAnimationDuration = if IsPeoplePageOpen1 then GetSideSheetAnimationDurationFunction() else ShieldCloseAnimationTweenTime
				
				local function handleShieldClose()
					-- upvalues: config (upval), config2 (upval), GuiService (upval), ExperienceMenuSessionManagerInstance (upval), PerfUtilsModule (upval)
					if not config.FFlagAddTraversalBackButton then
						config2.SettingsShowSignal:fire(config2.Visible)
					end
					if not config2.Visible then
						GuiService:SetMenuIsOpen(false, "SettingsHub")
						ExperienceMenuSessionManagerInstance:CloseExperienceMenu()
					end
					if config.FFlagEnableInGameMenuDurationLogger then
						PerfUtilsModule.menuCloseComplete()
					end
				end
				
				if config.FFlagAddTraversalBackButton then
					config2.SettingsShowSignal:fire(config2.Visible)
				end
				if GameSettings.ReducedMotion then
					if config2.ReducedMotionOpenTween then
						config2.ReducedMotionOpenTween:Cancel()
						config2.ReducedMotionOpenTween = nil
					end
					if config2.ReducedMotionCloseTween then
						config2.ReducedMotionCloseTween:Cancel()
						config2.ReducedMotionCloseTween = nil
					end
					config2.Shield.Parent = config2.CanvasGroup
					config2.CanvasGroup.Visible = true
					config2.ReducedMotionCloseTween = TweenService:Create(config2.CanvasGroup, TweenInfo.new(0.25), { GroupTransparency = 1 })
					config2.ReducedMotionCloseTween:Play()
					config2.ReducedMotionCloseTween.Completed:Connect(function(PlaybackState)
						-- upvalues: config2 (upval), SHIELDINACTIVEPOSITION (upval)
						if PlaybackState == Enum.PlaybackState.Completed then
							config2.Shield.Position = SHIELDINACTIVEPOSITION
							config2.Shield.Visible = config2.Visible
							config2.Shield.Parent = config2.ClippingShield
							config2.ReducedMotionCloseTween = nil
						end
						config2.CanvasGroup.Visible = false
					end)
					handleShieldClose()
				else
					if config.ChromeEnabled and config.FFlagEnableConsoleExpControls then
						require(RobloxGui.Modules.Chrome.Service):setShortcutBar(nil)
					end
					local In = Enum.EasingDirection.In
					local Quad = Enum.EasingStyle.Quad
					
					if if IsPeoplePageOpen == nil then FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and (GetSideSheetVisibilityFunction() and GetIsPeoplePageOpenFunction()) else IsPeoplePageOpen then
						In = Enum.EasingDirection.Out
						Quad = Enum.EasingStyle.Quart
					end
					config2.Shield:TweenPositionInternal(SHIELDINACTIVEPOSITION, In, Quad, SideSheetAnimationDuration, true, function()
						-- upvalues: config2 (upval), handleShieldClose (copy)
						config2.Shield.Visible = config2.Visible
						handleShieldClose()
					end)
				end
				if not config.FFlagSettingsHubIndependentBackgroundVisibility and config2.DarkenBackground then
					local _TweenInfo = TweenInfo.new(SideSheetAnimationDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					
					if config2.DarkenBackgroundTween then
						config2.DarkenBackgroundTween:Cancel()
					end
					config2.DarkenBackgroundTween = TweenService:Create(config2.DarkenBackground, _TweenInfo, { BackgroundTransparency = 1 })
					config2.DarkenBackgroundTween:Play()
				end
			end
			if LastInputTypeChangedConnection then
				LastInputTypeChangedConnection:disconnect()
			end
			if config.isInExperienceUIVREnabled then
				if not config.InExperienceUIVRIXP:isMovePanelToCenter() and not VRService.VREnabled then
					PlayerListManagerModule:HideTemp("SettingsMenu", false)
					ChatSelectorModule:HideTemp("SettingsMenu", false)
				end
			else
				PlayerListManagerModule:HideTemp("SettingsMenu", false)
				ChatSelectorModule:HideTemp("SettingsMenu", false)
			end
			if not VRService.VREnabled then
				MouseIconOverrideService.pop(SettingsHubCursorOverride)
			end
			config2:CloseReactPage()
			clearMenuStack()
			
			if not IsSideSheetEnabledModule then
				ContextActionService:UnbindCoreAction("RbxSettingsHubSwitchTab")
			end
			ContextActionService:UnbindCoreAction("RbxSettingsHubStopCharacter")
			ContextActionService:UnbindCoreAction("RbxSettingsScrollHotkey")
			removeBottomBarBindings(0.4)
			GuiService.SelectedCoreObject = nil
			config2.GameSettingsPage:CloseSettingsPage()
			
			if config2.ShareGamePage then
				config2.ShareGamePage:ClearShareInviteLink(config2.ShareGameApp)
			end
		end
		local config1 = {
			source = Source,
			playsessionid = config2.playSessionId,
			universeid = tostring(game.GameId)
		}
		
		if IsNotVisibleMatch then
			if Visible then
				RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsMenuOpenName, ConstantsModule.AnalyticsMenuActionName, config1)
				
				if config.GetFFlagEnableLeaveGameUpsellEntrypoint() then
					task.spawn(checkLeaveGameUpsell)
					
					return
				end
			else
				RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsMenuCloseName, ConstantsModule.AnalyticsMenuActionName, config1)
			end
		end
	end
	
	function config2:SetVisibility(Visible, p11, ExitModalPage, p12, Source)
		-- upvalues: config2 (copy), Callback (ref)
		if config2.Visible ~= Visible then
			Callback(Visible, p11, ExitModalPage, p12, Source)
			
			return
		end
	end
	
	function config2:SetBackgroundVisibility(Visible, p11)
		-- upvalues: config2 (copy), Callback4 (ref)
		if config2.DarkenBackground.Visible ~= Visible then
			Callback4(Visible, p11)
			
			return
		end
	end
	
	function config2:GetVisibility()
		-- upvalues: config2 (copy)
		return config2.Visible
	end
	
	function config2:ToggleVisibility(p11, Source)
		-- upvalues: Callback (ref), config2 (copy)
		Callback(not config2.Visible, nil, nil, p11, Source)
	end
	
	function config2:AddToMenuStack(CurrentPage)
		-- upvalues: config2 (copy)
		if config2.MenuStack[#config2.MenuStack] ~= CurrentPage then
			config2.MenuStack[#config2.MenuStack + 1] = CurrentPage
		end
	end
	
	function config2:InviteToGame()
		-- upvalues: config (upval), IXPServiceWrapper (upval), GameInviteInviteExperimentVariant (upval), PlatformFriendsService (upval), UserInputService (upval), PlatformService (upval), config2 (copy), GameInviteModalManager (upval), GameInviteConstants (upval), RobloxGui (upval), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), ToggleSideSheetFunction (upval)
		local IsInExperienceGameInviteUXRefreshMatch = false
		
		if config.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and config.FFlagLuaEnableGameInviteModalSettingsHub then
			local FStringGameInviteMenuLayer = config.GetFStringGameInviteMenuLayer()
			local LayerData = IXPServiceWrapper:GetLayerData(FStringGameInviteMenuLayer)
			IXPServiceWrapper:LogUserLayerExposure(FStringGameInviteMenuLayer)
			IsInExperienceGameInviteUXRefreshMatch = LayerData and (LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.UxRefresh or LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.InviteLimit) or false
		end
		if game:GetEngineFeature("PlatformFriendsService") and PlatformFriendsService and PlatformFriendsService:IsInviteFriendsEnabled() then
			PlatformFriendsService:ShowInviteFriendsUI()
		elseif UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			if PlatformService then
				PlatformService:PopupGameInviteUI()
			end
		elseif IsInExperienceGameInviteUXRefreshMatch then
			if not config.FFlagAddInviteFriendsIntegration or config2.Visible then
				config2:ToggleVisibility()
			end
			GameInviteModalManager:openModal({ trigger = GameInviteConstants.Triggers.GameMenu })
			
			if config.FFlagEnableConsoleExpControls and config.ChromeEnabled then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(nil)
			end
		else
			config2:AddToMenuStack(config2.Pages.CurrentPage)
			config2:SwitchToPage(config2.ShareGamePage, nil, 1, true)
		end
		if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() then
			ToggleSideSheetFunction(false)
		end
	end
	
	function config2:PopMenu(_, p11, Keyboard)
		-- upvalues: config2 (copy), PoppedMenu (copy), config (upval), RobloxGui (upval)
		if config2.MenuStack and #config2.MenuStack > 0 then
			local MenuStackEntry = config2.MenuStack[#config2.MenuStack]
			
			if type(MenuStackEntry) ~= "table" then
				PoppedMenu:Fire(MenuStackEntry)
			end
			table.remove(config2.MenuStack, #config2.MenuStack)
			config2:SwitchToPage(config2.MenuStack[#config2.MenuStack], true, 1, p11)
			
			if #config2.MenuStack == 0 then
				if config.FFlagAddUILessMode then
					config2:SetVisibility(false, nil, nil, nil, Keyboard)
				else
					config2:SetVisibility(false)
				end
				config2.Pages.CurrentPage:Hide(0, 0, nil, nil, config2.PageViewInnerFrame)
				
				return
			elseif config.ChromeEnabled and config.FFlagEnableConsoleExpControls then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
				
				return
			end
		else
			config2.MenuStack = {}
			PoppedMenu:Fire()
			
			if config.FFlagAddUILessMode then
				config2:ToggleVisibility(nil, Keyboard)
				
				return
			end
			config2:ToggleVisibility(Keyboard)
		end
	end
	
	function config2:ShowShield()
		-- upvalues: UserInputService (upval), SETTINGSSHIELDTRANSPARENCY (upval), config2 (copy)
		config2.Shield.BackgroundTransparency = if UserInputService.VREnabled then 1 else SETTINGSSHIELDTRANSPARENCY
	end
	
	function config2:HideShield()
		-- upvalues: config2 (copy)
		config2.Shield.BackgroundTransparency = 1
	end
	
	function config2:ShowReactPage()
		-- upvalues: config2 (copy)
		if config2.reactPage then
			config2.reactPageAnalytics:openPage(config2.reactPage.name)
		end
		config2.ReactPage.Visible = true
		config2.Page.Visible = false
	end
	
	function config2:HideReactPage()
		-- upvalues: config2 (copy)
		if config2.reactPage then
			config2.reactPageAnalytics:closePage(config2.reactPage.name)
		end
		local Visible = config2.ReactPage.Visible
		config2.ReactPage.Visible = false
		config2.Page.Visible = true
		
		if config2.Pages.CurrentPage and Visible and config2.Visible then
			config2.Pages.CurrentPage:SelectARow(true)
		end
	end
	
	function config2:MountReactPage()
		-- upvalues: ReactPageSignalModule (upval), config2 (copy), ReactRobloxModule (upval)
		ReactPageSignalModule(false).setCurrentReactPage(nil)
		
		if config2.reactPageRoot then
			config2:UnmountReactPage()
		end
		config2.reactPageRoot = ReactRobloxModule.createRoot(config2.ReactPage)
	end
	
	function config2:UnmountReactPage()
		-- upvalues: config2 (copy)
		if config2.reactPageRoot then
			config2.reactPageRoot:unmount()
			config2.reactPageRoot = nil
		end
	end
	
	function config2:CloseReactPage()
		-- upvalues: config2 (copy)
		config2:HideReactPage()
		config2:UnmountReactPage()
	end
	
	function config2:SwitchToReactPage(ReactPage, p11, p12)
		-- upvalues: config2 (copy)
		if p12 then
			config2:UnmountReactPage()
		elseif ReactPage then
			config2.reactPage = ReactPage
			
			if not config2.reactPageRoot then
				config2:MountReactPage()
			end
			config2.reactPageRoot:render(ReactPage:createPage(p11))
		end
		config2:ShowReactPage()
	end
	
	config2.GameSettingsPageReorderIXPFetched = false
	local SettingsShowSignalConnection = nil
	local v5 = nil
	
	local function enableVR()
		-- upvalues: CorePackages (upval), config2 (copy), SettingsShowSignalConnection (ref)
		local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
		local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
		local SettingsMenu = Panel3D.Get("SettingsMenu")
		SettingsMenu:ResizeStuds(4, 4, 250)
		SettingsMenu:SetType(Panel3D.Type.Standard)
		SettingsMenu:SetVisible(false)
		SettingsMenu:SetCanFade(false)
		config2.ClippingShield.Parent = SettingsMenu:GetGUI()
		config2.Shield.Parent.ClipsDescendants = false
		config2.VRShield.Visible = true
		config2:HideShield()
		SettingsShowSignalConnection = config2.SettingsShowSignal:connect(function(p11)
			-- upvalues: SettingsMenu (copy), VRHub (copy)
			if p11 then
				SettingsMenu:SetVisible(true)
				VRHub:FireModuleOpened("SettingsMenu")
				
				return
			else
				SettingsMenu:SetVisible(false)
				VRHub:FireModuleClosed("SettingsMenu")
			end
		end)
		VRHub.ModuleOpened.Event:connect(function(p11)
			-- upvalues: config2 (upval)
			if p11 ~= "SettingsMenu" then
				config2:SetVisibility(false)
			end
		end)
	end
	
	local function disableVR()
		-- upvalues: config2 (copy), RobloxGui (upval), SettingsShowSignalConnection (ref), v5 (ref), CorePackages (upval)
		config2.ClippingShield.Parent = RobloxGui
		config2.Shield.Parent.ClipsDescendants = true
		config2.VRShield.Visible = false
		config2:ShowShield()
		
		if SettingsShowSignalConnection then
			SettingsShowSignalConnection:disconnect()
			SettingsShowSignalConnection = nil
		end
		if v5 then
			v5:disconnect()
			v5 = nil
		end
		require(CorePackages.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false)
	end
	
	local _ = function()
		-- upvalues: onScreenSizeChanged (copy), config2 (copy), ThemeModule (upval), GuiService (upval), resizeBottomBarButtons (copy)
		onScreenSizeChanged()
		config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
		resizeBottomBarButtons()
	end
	
	local function OnVREnabled(p11)
		-- upvalues: UserInputService (upval), config (upval), config2 (copy), onScreenSizeChanged (copy), ThemeModule (upval), GuiService (upval), resizeBottomBarButtons (copy), enableVR (copy), disableVR (copy)
		if p11 == "VREnabled" then
			if UserInputService.VREnabled then
				if config.isInExperienceUIVREnabled then
					config2.SettingsUIDelegate:enableVR()
					onScreenSizeChanged()
					config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
					resizeBottomBarButtons()
					
					return
				else
					enableVR()
					
					return
				end
			elseif config.isInExperienceUIVREnabled then
				config2.SettingsUIDelegate:disableVR()
				onScreenSizeChanged()
				config2.MenuContainer.BackgroundTransparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
				resizeBottomBarButtons()
				
				return
			else
				disableVR()
			end
		end
	end
	
	UserInputService.Changed:connect(OnVREnabled)
	OnVREnabled("VREnabled")
	config2.ResetCharacterPage:SetHub(config2)
	
	if InExperienceCapabilities.canNavigateHome then
		config2.LeaveGamePage:SetHub(config2)
	end
	if config.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		config2.LeaveGameUpsellPage:SetHub(config2)
	end
	config2.GameSettingsPage = require(RobloxGui.Modules.Settings.Pages.GameSettingsWrapper)
	config2.GameSettingsPage:SetHub(config2)
	config2.ReportAbusePage = require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuContainerPage)
	config2.ReportAbusePage:SetHub(config2)
	config2.ReportSentPage = require(RobloxGui.Modules.Settings.Pages.ReportSentPage)
	config2.ReportSentPage:SetHub(config2)
	config2.ReportSentPageV2 = require(RobloxGui.Modules.Settings.Pages.ReportSentPageV2)
	config2.ReportSentPageV2:SetHub(config2)
	config2.HelpPage = require(RobloxGui.Modules.Settings.Pages.HelpWrapper)
	config2.HelpPage:SetHub(config2)
	
	if config.FFlagHelpPageIXPExposure then
		config2.HelpPageIXPFetched = false
	end
	if InExperienceCapabilities.canListPeopleInSameServer then
		config2.PlayersPage = require(RobloxGui.Modules.Settings.Pages.PeopleWrapper)
		config2.PlayersPage:SetHub(config2)
		
		if not config.FFlagMenuButtonsMountWithIEM and (config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant == 2 and UtilityModule:IsSmallTouchScreen()) then
			config2.PlayersPage:CreateMenuButtonsContainer()
		end
	end
	if config.FFlagAddIEMProfilePage then
		config2.PlayerProfilePage = require(RobloxGui.Modules.Settings.Pages.PlayerProfile)
	end
	if not config.isExitModalRemoved and IsSubjectToDesktopPoliciesFunction() then
		config2.ExitModalPage = require(RobloxGui.Modules.Settings.Pages.ExitModal)
		config2.ExitModalPage:SetHub(config2)
	end
	if IsSubjectToDesktopPoliciesFunction() and InExperienceCapabilities.canNavigateHome then
		config2.LeaveGameToHomePage = require(RobloxGui.Modules.Settings.Pages.LeaveGameToHome)
		config2.LeaveGameToHomePage:SetHub(config2)
	end
	if not IsEnabled and GetCorePackagesLoaded({ "Roact", "Rodux", "RoactRodux" }) then
		local CorePackages1 = game:GetService("CorePackages")
		config2.ShareGameApp = require(RobloxGui.Modules.Settings.ShareGameMaster).createApp(config2.PageViewClipper, (GameInviteAnalytics.new():withEventStream((require(CorePackages1.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new(RbxAnalyticsService))):withDiag(require(CorePackages1.Workspace.Packages.Analytics).AnalyticsReporters.Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.SettingsHub)))
		config2.ShareGamePage = require(RobloxGui.Modules.Settings.Pages.ShareGamePlaceholderPage)
		config2.ShareGamePage:ConnectHubToApp(config2, config2.ShareGameApp)
		config2:AddPage(config2.ShareGamePage)
	end
	local ReadResult = CapturesPolicy.PolicyImplementation.read()
	local FFlagFixSpatialUICaptures = config.isInExperienceUIVREnabled and config.FFlagFixSpatialUICaptures
	
	if (if ReadResult then CapturesPolicy.Mapper(ReadResult).eligibleForCapturesFeature() else false) and (not FFlagFixSpatialUICaptures or not IsSpatialFunction()) then
		local CapturesPageWrapperModule = require(RobloxGui.Modules.Settings.Pages.CapturesPageWrapper)
		config2.CapturesApp = CapturesAppModule
		config2.CapturesApp.mountMenuPage(CapturesPageWrapperModule.Page, function()
			-- upvalues: config2 (copy)
			config2:SetVisibility(false, true)
		end, config.ChromeEnabled)
		config2.CapturesPage = CapturesPageWrapperModule
		config2.CapturesPage:ConnectHubToApp(config2, config2.PageViewClipper, config2.CapturesApp)
	end
	if config.FFlagIntegrateTraversalHistoryInSideSheet then
		config2.TraversalHistoryPage = require(RobloxGui.Modules.Settings.Pages.TraversalHistoryWrapper)()
		config2.TraversalHistoryPage:SetHub(config2)
	end
	if config2.PlayersPage then
		config2:AddPage(config2.PlayersPage)
	end
	config2:AddPage(config2.ResetCharacterPage)
	
	if config2.LeaveGamePage then
		config2:AddPage(config2.LeaveGamePage)
	end
	if config.GetFFlagEnableLeaveGameUpsellEntrypoint() and config2.LeaveGameUpsellPage then
		config2:AddPage(config2.LeaveGameUpsellPage)
	end
	config2:AddPage(config2.GameSettingsPage)
	
	if config2.CapturesPage then
		config2:AddPage(config2.CapturesPage)
	end
	if config2.ReportAbusePage then
		config2:AddPage(config2.ReportAbusePage)
	end
	if config2.ReportSentPage then
		config2:AddPage(config2.ReportSentPage)
	end
	if config2.ReportSentPageV2 then
		config2:AddPage(config2.ReportSentPageV2)
	end
	config2:AddPage(config2.HelpPage)
	
	if not config.isExitModalRemoved and config2.ExitModalPage then
		config2:AddPage(config2.ExitModalPage)
	end
	if config2.LeaveGameToHomePage then
		config2:AddPage(config2.LeaveGameToHomePage)
	end
	if config2.TraversalHistoryPage then
		config2:AddPage(config2.TraversalHistoryPage)
	end
	config2:InitInPage(config2:GetFirstPageWithTabHeader())
	
	if not config.isNewInGameMenuEnabled() and (not config.FFlagAddUILessMode or config.FIntAddUILessModeVariant == 0) then
		ContextActionService:BindCoreAction("RBXEscapeMainMenu", function(_, UserInputState, _)
			-- upvalues: config (upval), IsPioneerLaunchFunction (upval), GetSwitchServerStoreFunction (upval), IsSideSheetEnabledModule (upval), GetSideSheetVisibilityFunction (upval), FFlagSideSheetOpenPeoplePage (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetIsPeoplePageOpenFunction (upval), config2 (copy), ToggleSideSheetFunction (upval), ConstantsModule (upval)
			if UserInputState ~= Enum.UserInputState.Begin then return end
			if (config.FFlagShowSwitchServerButton or IsPioneerLaunchFunction()) and GetSwitchServerStoreFunction(false).isConfirmationOpen(false) then return end
			if IsSideSheetEnabledModule then
				if GetSideSheetVisibilityFunction() then
					if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and GetIsPeoplePageOpenFunction() then
						config2:SetVisibility(false)
						
						return
					else
						ToggleSideSheetFunction(false)
						
						return
					end
				elseif not config2.MenuStack or #config2.MenuStack <= 0 then
					ToggleSideSheetFunction(true)
					
					return
				else
					if config.FFlagAddUILessMode then
						config2:PopMenu(false, true, ConstantsModule.AnalyticsMenuOpenTypes.Keyboard)
						
						return
					else
						config2:PopMenu(false, true)
						
						return
					end
				end
			elseif config.FFlagAddUILessMode then
				config2:PopMenu(false, true, ConstantsModule.AnalyticsMenuOpenTypes.Keyboard)
				
				return
			else
				config2:PopMenu(false, true)
			end
		end, false, Enum.KeyCode.Escape)
	end
	local IsViewer = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer()
	GuiService.ShowLeaveConfirmation:connect(function()
		-- upvalues: IsViewer (copy), IsSideSheetEnabledModule (upval), config (upval), FFlagSideSheetOpenPeoplePage (upval), GetSideSheetVisibilityFunction (upval), GetHasRoomForPeoplePageFunction (upval), GetDidSideSheetOpenWithPeoplePageFunction (upval), GetIsPeoplePageOpenFunction (upval), config2 (copy), ToggleSideSheetFunction (upval), ConstantsModule (upval)
		if IsViewer then return end
		if IsSideSheetEnabledModule and (config.FFlagSideSheetAndroidBack or FFlagSideSheetOpenPeoplePage and (GetSideSheetVisibilityFunction() or GetHasRoomForPeoplePageFunction())) then
			if GetSideSheetVisibilityFunction() then
				if FFlagSideSheetOpenPeoplePage and GetDidSideSheetOpenWithPeoplePageFunction() and GetIsPeoplePageOpenFunction() then
					config2:SetVisibility(false)
					
					return
				else
					ToggleSideSheetFunction(false)
					
					return
				end
			elseif #config2.MenuStack > 0 then
				config2:PopMenu(false, true)
				
				return
			else
				ToggleSideSheetFunction(true)
				
				return
			end
		elseif #config2.MenuStack == 0 then
			config2:SetVisibility(true, nil, nil, nil, ConstantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame)
			config2:SwitchToPage(config2:GetFirstPageWithTabHeader(), nil, 1)
			
			return
		else
			config2:PopMenu(false, true)
		end
	end)
	ContextActionService:BindCoreAction("Open Dev Console", toggleDevConsole, false, Enum.KeyCode.F9)
	ContextActionService:BindCoreAction("Show Quick Profiler", toggleQuickProfilerFromHotkey, false, Enum.KeyCode.F7)
	UserInputService.InputBegan:connect(function(Input)
		-- upvalues: config2 (copy), GuiService (upval)
		if (Input.KeyCode == Enum.KeyCode.Left or Input.KeyCode == Enum.KeyCode.Right or Input.KeyCode == Enum.KeyCode.Up or Input.KeyCode == Enum.KeyCode.Down) and config2.Visible and config2.Active and config2.Pages.CurrentPage and GuiService.SelectedCoreObject == nil then
			config2.Pages.CurrentPage:SelectARow()
		end
	end)
	local Flag3 = false
	
	local _ = function()
		-- upvalues: Flag3 (ref), IXPServiceWrapper (upval), config (upval)
		if not Flag3 then
			Flag3 = true
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(config.GetFStringExitModalIXPLayer())
			
			return
		end
	end
	
	if config.isExitModalRemoved and IsSubjectToDesktopPoliciesFunction() then
		game:GetService("GuiService").NativeClose:Connect(function()
			-- upvalues: config (upval), Flag3 (ref), IXPServiceWrapper (upval), LeaveGameModule (upval)
			if config.FFlagEnableExitModalExposure and not Flag3 then
				Flag3 = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(config.GetFStringExitModalIXPLayer())
			end
			LeaveGameModule(false, { shouldNativeExit = true })
		end)
		
		if config2.FullScreenTitleBar then
			config2.FullScreenTitleBar = SettingsFullScreenTitleBarModule.update(config2.FullScreenTitleBar, {
				onClose = function()
					-- upvalues: config (upval), Flag3 (ref), IXPServiceWrapper (upval), LeaveGameModule (upval)
					if config.FFlagEnableExitModalExposure and not Flag3 then
						Flag3 = true
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(config.GetFStringExitModalIXPLayer())
					end
					LeaveGameModule(false, { shouldNativeExit = true })
				end
			})
		end
	elseif config2.ExitModalPage then
		local function showExitModal()
			-- upvalues: config (upval), Flag3 (ref), IXPServiceWrapper (upval), config2 (copy), removeBottomBarBindings (copy)
			if config.FFlagEnableExitModalExposure and not Flag3 then
				Flag3 = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(config.GetFStringExitModalIXPLayer())
			end
			config2.HubBar.Visible = false
			removeBottomBarBindings()
			
			if config2:GetVisibility() then
				config2:AddToMenuStack(config2.Pages.CurrentPage)
				config2:SwitchToPage(config2.ExitModalPage, nil, 1, true)
				
				return
			else
				config2:SetVisibility(true, nil, config2.ExitModalPage, false)
			end
		end
		
		local function handleNativeExit()
			-- upvalues: config2 (copy), config (upval), PerfUtilsModule (upval), Callback2 (copy), showExitModal (copy)
			if not config2:GetVisibility() or config2.Pages.CurrentPage ~= config2.ExitModalPage then
				showExitModal()
				
				return
			end
			if config.FFlagEnableInGameMenuDurationLogger then
				PerfUtilsModule.leavingGame()
			end
			if config.FFlagRelocateMobileMenuButtons and config.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				Callback2()
				
				if config.FFlagMenuButtonsMountWithIEM and config.FIntRelocateMobileMenuButtonsVariant == 2 and config2.PlayersPage then
					config2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			config2.ExitModalPage.LeaveAppFunc(true)
		end
		
		game:GetService("GuiService").NativeClose:Connect(handleNativeExit)
		
		if config2.FullScreenTitleBar then
			config2.FullScreenTitleBar = SettingsFullScreenTitleBarModule.update(config2.FullScreenTitleBar, { onClose = handleNativeExit })
		end
	end
	if config.GetFFlagEnableAppChatInExperience() then
		local EventConnection = nil
		config2.SettingsShowSignal:connect(function(p11)
			-- upvalues: EventConnection (ref), InExperienceAppChatModalModule (upval), config2 (copy)
			if p11 then
				EventConnection = InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p12)
					-- upvalues: config2 (upval)
					if p12 and config2.Visible then
						config2:SetVisibility(false, true)
					end
				end)
				
				return
			end
			if EventConnection then
				EventConnection:Disconnect()
				EventConnection = nil
			end
		end)
	end
	config2.InExperienceMenuReact = CreateFunction("Folder")({
		Name = "InExperienceMenuReact",
		Parent = config2.ClippingShield
	})
	local ButtonsContainer = config2.PlayersPage.ButtonsContainer
	
	local function v210(p11)
		-- upvalues: ReactModule (upval), config2 (copy), SignalsModule (upval), config (upval), IsSpatialFunction (upval), PortalWithFoundationStylelinkModule (upval), TraversalHistoryMenu (upval)
		local UseStateResult, UseStateResult2 = ReactModule.useState(p11.showSignal(false) and config2.Visible)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), UseStateResult2 (copy), p11 (copy), config2 (upval)
			local Effect = SignalsModule.createEffect(function(p12)
				-- upvalues: UseStateResult2 (upval), p11 (upval), config2 (upval)
				UseStateResult2(p11.showSignal(p12) and config2.Visible)
			end)
			local SettingsShowSignalConnection = config2.SettingsShowSignal:connect(function(p12)
				-- upvalues: UseStateResult2 (upval), p11 (upval)
				UseStateResult2(p11.showSignal(false) and p12)
			end)
			
			return function()
				-- upvalues: Effect (copy), SettingsShowSignalConnection (copy)
				Effect()
				SettingsShowSignalConnection:Disconnect()
			end
		end, {})
		
		return config.FFlagAddTraversalHistory and (not (config.isInExperienceUIVREnabled and IsSpatialFunction()) and (p11.parent and (UseStateResult and ReactModule.createElement(PortalWithFoundationStylelinkModule, { parent = p11.parent }, {
			TraversalHistoryMenu = ReactModule.createElement(TraversalHistoryMenu, {
				anchorParent = p11.parent,
				currentPageChangeSignal = p11.currentPageChangeSignal,
				menuSide = p11.menuSide
			})
		}))))
	end
	
	ReactRobloxModule.createRoot(config2.InExperienceMenuReact):render(ReactModule.createElement(InExperienceMenuReactModule, nil, {
		InExperienceMenuReactPage = ReactModule.createElement(InExperienceMenuReactPageModule, {
			onMount = function()
				-- upvalues: config2 (copy)
				config2:SwitchToReactPage(nil, nil, true)
			end,
			onUnmount = function()
				-- upvalues: config2 (copy), ReactPageSignalModule (upval)
				config2:CloseReactPage()
				ReactPageSignalModule(false).setCurrentReactPage(nil)
			end,
			mountTo = config2.ReactPage
		}),
		TraversalHistoryMenuBottomBar = ReactModule.createElement(v210, {
			showSignal = config2.showBottomBarSignal,
			parent = if config.FFlagAddTraversalHistory then config2.LeaveGameButton else nil,
			menuSide = FoundationModule.Enums.PopoverSide.Top,
			currentPageChangeSignal = config2.CurrentPageSignal
		}),
		TraversalHistoryMenuMobileButton = ReactModule.createElement(v210, {
			showSignal = SignalsModule.createComputed(function(p11): boolean
				-- upvalues: config2 (copy)
				return not config2.showBottomBarSignal(p11)
			end),
			parent = if ButtonsContainer then ButtonsContainer:FindFirstChild("LeaveButtonButton", true) else nil,
			menuSide = FoundationModule.Enums.PopoverSide.Bottom,
			currentPageChangeSignal = config2.CurrentPageSignal
		})
	}))
	
	return config2
end

local SettingsHubModule = {
	ModuleName = "SettingsMenu",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	SetVisibility = nil
}
VRHub:RegisterModule(SettingsHubModule)
VRHub.ModuleOpened.Event:connect(function(ModuleName)
	-- upvalues: SettingsHubModule (copy), VRHub (copy)
	if ModuleName ~= SettingsHubModule.ModuleName and VRHub:GetModule(ModuleName).VRIsExclusive then
		SettingsHubModule:SetVisibility(false)
	end
end)
local SettingsHub = CreateSettingsHub()

if FFlagSideSheetOpenPeoplePage then
	SetupPeoplePageOpenTrackingFunction(SettingsHub)
	SetupInGameMenuPeoplePageActionsFunction(SettingsHub)
end
function SettingsHubModule:GetExperienceControlStore()
	-- upvalues: SettingsHub (copy)
	return SettingsHub:GetExperienceControlStore()
end

function SettingsHubModule:SetVisibility(p11, p12, p13, p14, p15)
	-- upvalues: SettingsHub (copy)
	SettingsHub:SetVisibility(p11, p12, p13, p14, p15)
end

function SettingsHubModule:SetBackgroundVisibility(p11, p12)
	-- upvalues: SettingsHub (copy)
	SettingsHub:SetBackgroundVisibility(p11, p12)
end

function SettingsHubModule:ToggleVisibility(p11, p12)
	-- upvalues: SettingsHub (copy)
	SettingsHub:ToggleVisibility(p11, p12)
end

function SettingsHubModule:SwitchToPage(p11, p12)
	-- upvalues: SettingsHub (copy)
	SettingsHub:SwitchToPage(p11, p12, 1)
end

if config.FFlagAddUILessMode and config.FIntAddUILessModeVariant ~= 0 then
	function SettingsHubModule:PopMenu(p11, p12, p13)
		-- upvalues: SettingsHub (copy)
		return SettingsHub:PopMenu(p11, p12, p13)
	end
end
function SettingsHubModule:GetVisibility()
	-- upvalues: SettingsHub (copy)
	return SettingsHub.Visible
end

function SettingsHubModule:ShowShield()
	-- upvalues: SettingsHub (copy)
	SettingsHub:ShowShield()
end

function SettingsHubModule:HideShield()
	-- upvalues: SettingsHub (copy)
	SettingsHub:HideShield()
end

function SettingsHubModule:GetRespawnBehaviour()
	-- upvalues: SettingsHub (copy)
	return SettingsHub:GetRespawnBehaviour()
end

function SettingsHubModule:CloseReactPage()
	-- upvalues: SettingsHub (copy)
	SettingsHub:CloseReactPage()
end

function SettingsHubModule:SwitchToReactPage(p11, p12, p13)
	-- upvalues: SettingsHub (copy)
	SettingsHub:SwitchToReactPage(p11, p12, p13)
end

if config.FFlagAddInviteFriendsIntegration then
	function SettingsHubModule:InviteToGame()
		-- upvalues: SettingsHub (copy)
		SettingsHub:InviteToGame()
	end
end
SettingsHubModule.RespawnBehaviourChangedEvent = SettingsHub.RespawnBehaviourChangedEvent
SettingsHubModule.SettingsShowSignal = SettingsHub.SettingsShowSignal
SettingsHubModule.CurrentPageSignal = SettingsHub.CurrentPageSignal
SettingsHubModule.SettingsShowEvent = Instance.new("BindableEvent")
SettingsHub.SettingsShowSignal:connect(function(p11)
	-- upvalues: SettingsHubModule (copy)
	SettingsHubModule.SettingsShowEvent:Fire(p11)
end)
SettingsHubModule.Instance = SettingsHub

return SettingsHubModule