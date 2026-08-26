local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var1 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local playersService = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local telemetryService = game:GetService("TelemetryService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local var2 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
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
local dark = require(corePackagesService.Packages.Foundation).Enums.ColorMode.Dark
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local themeModule = require(script.Parent.Theme)
local SETTINGS_SHIELD = themeModule.color("SETTINGS_SHIELD", Color3.new(0.160784313725, 0.160784313725, 0.160784313725))
local SETTINGS_SHIELD_TRANSPARENCY = themeModule.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2)
local SHIELD_INACTIVE_POSITION = themeModule.SHIELD_INACTIVE_POSITION
local settingsHubCursorOverride = symbol.named("SettingsHubCursorOverride")
local var3 = if var2 then 32 elseif utilityModule:IsSmallTouchScreen() then 24 else 26
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
	FFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav,
	FFlagIEMFocusNavSupportNewButtons = flagsModule.FFlagIEMFocusNavSupportNewButtons,
	FFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode,
	FIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant,
	FFlagInExperienceReportClosingBugfix = sharedFlagsModule.FFlagInExperienceReportClosingBugfix,
	FFlagEnableSettingsHubUIDelegateRollout = sharedFlagsModule.FFlagEnableSettingsHubUIDelegateRollout,
	FFlagAddIEMProfilePage = sharedFlagsModule.FFlagAddIEMProfilePage,
	FFlagFixSpatialUICaptures = sharedFlagsModule.FFlagFixSpatialUICaptures,
	FFlagVoiceRewarmTelemetry = sharedFlagsModule.FFlagVoiceRewarmTelemetry,
	FFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton,
	FFlagAddTraversalHistory = traversal.Flags.FFlagAddTraversalHistory,
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
local var4 = nil
pcall(function()
	-- upvalues: var4 (write)
	var4 = game:GetService("PlatformService")
end)
local var5 = nil
pcall(function()
	-- upvalues: var5 (write)
	var5 = game:GetService("PlatformFriendsService")
end)
local var6 = nil
spawn(function()
	-- upvalues: var6 (write), robloxReplicatedStorageService (ref)
	var6 = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999)
end)
local var7 = nil

if t.GetFFlagDisplayServerChannel() then
	spawn(function()
		-- upvalues: var7 (write), robloxReplicatedStorageService (ref)
		var7 = robloxReplicatedStorageService:WaitForChild("GetServerChannel", 1e999)
	end)
end
local var8 = userInputService.PreferredInput == Enum.PreferredInput.Touch
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local platform = userInputService:GetPlatform()
local baseUrl = contentProviderService.BaseUrl
local var9 = not string.find(baseUrl, "www.roblox.com")
local devConsoleMasterModule = require(robloxGui.Modules.DevConsoleMaster)
local var10 = nil
local var11 = false
local var12 = nil
local var13 = nil
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
local var14 = cachedPolicyServiceModule:IsSubjectToChinaPolicies()
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local settingsHubRaceConditionFix = game:DefineFastFlag("SettingsHubRaceConditionFix", false)
local fixReportButtonCutOff = game:DefineFastFlag("FixReportButtonCutOff", false)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local var15 = if t.GetFFlagPackagifySettingsShowSignal() then require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil
local var16 = if t.GetFFlagPackagifySettingsShowSignal() then require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil
local t_1 = { frequency = 4, dampingRatio = 1 }
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
local getSideSheetVisibility = inExperienceSideSheetModule.getSideSheetVisibility
local _ = require(robloxGui.Modules.Settings.ReactPageFactory)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local fFlagLocalizeVersionLabels = t.FFlagLocalizeVersionLabels or var14
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	if not robloxTranslatorModule then
		return p2
	end
	local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, p1)
	
	return if ok then status else p2
end

local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local guiInset, _ = guiService:GetGuiInset()
local uDim2 = UDim2.new(0, 0, 0, -guiInset.Y)
local uDim2_1 = UDim2.new(1, 0, 1, guiInset.Y)

local function GetCorePackagesLoaded(p1)
	local corePackagesService = game:GetService("CorePackages")
	
	for i, v in pairs(p1) do
		if not corePackagesService:FindFirstChild(v) then
			return false
		end
	end
	return true
end

local _ = function()
	-- upvalues: var12 (write), var6 (write)
	if var12 then
		return var12
	elseif not var6 then
		repeat
			wait()
		until var6
	end
	var12 = var6:InvokeServer()
	
	return var12
end

local function GetServerChannelBlocking()
	-- upvalues: var13 (write), getServerChannelRetries (ref), var7 (write)
	if var13 then
		return var13
	end
	local var17 = getServerChannelRetries
	
	if not var7 then
		repeat
			task.wait()
			var17 -= 1
		until var7 or var17 == 0
	end
	if var7 then
		var13 = var7:InvokeServer()
	else
		warn("GetServerChannelRemote not available")
		var13 = "Unknown"
	end
	return var13
end

local _ = function()
	-- upvalues: t (ref), httpRbxApiService (ref), httpService (ref)
	if t.GetFFlagRemoveAssetVersionEndpoint() then
		return game.PlaceVersion
	end
	local placeVersion = game.PlaceVersion
	pcall(function()
		-- upvalues: httpRbxApiService (copy), httpService (copy), placeVersion (write)
		placeVersion = string.format("%s (Latest: %d)", placeVersion, httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber)
	end)
	
	return placeVersion
end

local function createReactPage(p2)
	-- upvalues: create (ref)
	return create("Frame")({
		Name = "InExperienceMenuPage",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.fromScale(0, 0),
		Parent = p2
	})
end

local function CreateSettingsHub()
	-- upvalues: t (ref), robloxGui (ref), var15 (ref), utilityModule (ref), var16 (ref), createSignal (ref), constantsModule_1 (ref), stores (ref), rbxAnalyticsService (ref), reactPageAnalyticsModule (ref), createReactPage (ref), themeModule (ref), contextActionService (ref), localizationService (ref), localization (ref), var2 (ref), create (ref), var8 (ref), userInputService (ref), platform (ref), default (ref), getCamMicPermissionsModule (ref), otterModule (ref), robloxTranslatorModule (ref), settingsHubRaceConditionFix (ref), starterGuiService (ref), inExperienceSideSheetModule (ref), telemetryService (ref), menuLeaveGameTelemetryConfigModule (ref), menuResetCharacterTelemetryConfigModule (ref), constantsModule (ref), menuResumeTelemetryConfigModule (ref), reactRobloxModule (ref), reactModule (ref), menuButtonsContainerModule (ref), flagsModule (ref), guiService (ref), uDim2_1 (ref), uDim2 (ref), SHIELD_INACTIVE_POSITION (ref), SETTINGS_SHIELD_TRANSPARENCY (ref), SETTINGS_SHIELD (ref), var3 (ref), fFlagLocalizeVersionLabels (ref), GetServerChannelBlocking (ref), var12 (write), var6 (write), runService (ref), httpRbxApiService (ref), httpService (ref), cachedPolicyServiceModule (ref), baseUrl (ref), var9 (ref), starterPlayerService (ref), playersService (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), roactModule (ref), roactAppExperimentModule (ref), IXPService (ref), appStyleProvider (ref), dark (ref), menuBackButtonModule (ref), menuFrontButtonModule (ref), appFonts (ref), t_1 (ref), corePackagesService (ref), inExperienceAppChatModalModule (ref), inExperienceCapabilities (ref), foundationProvider (ref), foundationModule (ref), utilsModule (ref), switchTabHint (ref), isSubjectToDesktopPolicies (ref), settingsFullScreenTitleBarModule (ref), VRService (ref), gameSettings (ref), devConsoleMasterModule (ref), fixReportButtonCutOff (ref), cryoModule (ref), IXPServiceWrapper (ref), experienceMenuSessionManagerInstance (ref), reactPageSignalModule (ref), mouseIconOverrideService (ref), settingsHubCursorOverride (ref), checkLeaveGameUpsellCooldown (ref), tweenService (ref), perfUtilsModule (ref), var10 (write), chatSelectorModule (ref), fFlagEnableNewBackpack (ref), var1 (ref), var11 (write), gameInviteInviteExperimentVariant (write), var5 (write), var4 (write), gameInviteModalManager (write), gameInviteConstants (write), GetCorePackagesLoaded (ref), gameInviteAnalytics (ref), capturesPolicy (ref), isSpatial (ref), capturesAppModule (ref), getSideSheetVisibility (ref), toggleSideSheet (ref), leaveGameModule (ref), signalsModule (ref), portalWithFoundationStylelinkModule (ref), traversalHistoryMenu (ref), inExperienceMenuReactModule (ref), inExperienceMenuReactPageModule (ref)
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
	t_2.SettingsShowSignal = if t.GetFFlagPackagifySettingsShowSignal() then var15 else utilityModule:CreateSignal()
	t_2.CurrentPageSignal = if t.GetFFlagPackagifySettingsShowSignal() then var16.CreateSignal() else utilityModule:CreateSignal()
	local var17, var18 = createSignal(false)
	t_2.showBottomBarSignal = var17
	t_2.setShowBottomBarSignal = var18
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
	local text, text_1, text_2
	t_2.reactPageAnalytics = reactPageAnalyticsModule.new()
	local var19 = nil
	local var20 = nil
	local poppedMenu = Instance.new("BindableEvent")
	poppedMenu.Name = "PoppedMenu"
	t_2.PoppedMenu = poppedMenu.Event
	t_2.ReactPage = nil
	t_2.ReactPage = createReactPage()
	
	local function _(p2)
		-- upvalues: t_2 (ref), t (copy)
		p2 = p2 or t_2.Pages.CurrentPage
		
		return if t.FFlagEnableSideSheet then p2.ShouldShowHubBar == true else p2.ShouldShowBottomBar == true
	end
	
	local _ = function(p2)
		-- upvalues: t_2 (ref), t (copy)
		local var21
		p2 = p2 or t_2.Pages.CurrentPage
		
		if t.FFlagEnableSideSheet then
			var21 = p2.ShouldShowHubBar == true
			var21 = nil
		else
			var21 = p2.ShouldShowBottomBar == true
		end
		if var21 and p2.TabHeader then
			t_2.PageTitleLabel.Text = p2.TabHeader.TabLabel.Title.Text
			
			return
		end
		t_2.PageTitleLabel.Text = ""
	end
	
	local _ = function(value)
		-- upvalues: t (copy)
		if not t.FFlagIEMTabFocusNav then return end
		local tabHeader = value:GetTabHeader()
		
		if not tabHeader then return end
		for i, v in value.FirstSelectableObjects do
			v.NextSelectionUp = tabHeader
			tabHeader.NextSelectionDown = v
		end
	end
	
	local _ = function()
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
	
	local function setBottomBarSelection(value)
		-- upvalues: t_2 (ref), t (copy)
		if not t_2.BottomButtonFrame and not value and (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2) then return end
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
	
	local function shouldShowBottomBar(p2)
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), themeModule (copy)
		p2 = p2 or t_2.Pages.CurrentPage
		
		if (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2) and ((utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar()) then
			return false
		end
		p2 = false
		
		if p2 ~= nil then
			p2 = p2.ShouldShowBottomBar == true
		end
		return p2
	end
	
	local _ = function(p2)
		-- upvalues: t_2 (ref)
		p2 = p2 or t_2.Pages.CurrentPage
		p2 = false
		
		if p2 ~= nil then
			p2 = p2.ShouldDisableDefaultScroll == true
		end
		return p2
	end
	
	local function setBottomBarBindings()
		-- upvalues: t_2 (ref), t (copy), contextActionService (copy)
		if not t_2.Visible then return end
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			for i = 1, #t_2.BottomBarButtons do
				local var21 = t_2.BottomBarButtons[i]
				local var22 = var21[2]
				contextActionService:BindCoreAction(var21[1], var22[1], false, unpack(var22[2]))
			end
		elseif t_2.addMenuKeyBindings then
			t_2.addMenuKeyBindings()
		end
		if t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Visible = true
		end
	end
	
	local function removeBottomBarBindings(p2)
		-- upvalues: t (copy), t_2 (ref), contextActionService (copy)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			for i, v in pairs(t_2.BottomBarButtons) do
				contextActionService:UnbindCoreAction(v[1])
			end
		elseif t_2.removeMenuKeyBindings then
			t_2.removeMenuKeyBindings()
		end
		local openStateChangedCount = t_2.OpenStateChangedCount
		
		local var23 = function()
			-- upvalues: t_2 (copy), openStateChangedCount (ref)
			if t_2.OpenStateChangedCount == openStateChangedCount and t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Visible = false
			end
		end
		
		if p2 then
			delay(p2, var23)
			
			return
		elseif t_2.OpenStateChangedCount == openStateChangedCount and t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Visible = false
		end
	end
	
	local _ = function(p3, p4, p5)
		-- upvalues: t (copy), t_2 (ref)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local var24 = t_2.BottomButtonFrame:FindFirstChild(p3 .. "ButtonButton", true)
			
			if not var24 then return end
			var24.Position = p4
			var24.Size = p5
		end
	end
	
	local var24 = localization.new(localizationService.RobloxLocaleId)
	
	local function hideVoiceUx()
		-- upvalues: t_2 (ref), var2 (copy), themeModule (copy), t (copy)
		local muteButtonButton = t_2.MuteButtonButton
		
		if muteButtonButton then
			muteButtonButton.Visible = false
			muteButtonButton:Destroy()
		end
		local var25 = if var2 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, themeModule.LargeButtonHeight)
		
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local uDim2 = UDim2.new(0.5, if var2 then -160 else -130, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local leaveGameButtonButton = t_2.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true)
				
				if leaveGameButtonButton then
					leaveGameButtonButton.Position = uDim2
					leaveGameButtonButton.Size = var25
				end
			end
			local uDim2_1 = UDim2.new(0.5, if var2 then -550 else -400, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local resetCharacterButtonButton = t_2.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true)
				
				if resetCharacterButtonButton then
					resetCharacterButtonButton.Position = uDim2_1
					resetCharacterButtonButton.Size = var25
				end
			end
			local uDim2_2 = UDim2.new(0.5, if var2 then 200 else 140, 0.5, -25)
			
			if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
				local resumeButtonButton = t_2.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true)
				
				if not resumeButtonButton then return end
				resumeButtonButton.Position = uDim2_2
				resumeButtonButton.Size = var25
			end
		end
	end
	
	local function addBottomBarButtonOld(p3, p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: t (copy), themeModule (copy), var2 (copy), t_2 (ref), utilityModule (copy), create (copy), var8 (copy), userInputService (copy), platform (copy)
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local text = p3 .. "Button"
			local text_1 = p3 .. "Text"
			local var25 = t_2
			local var26, var27 = utilityModule:MakeStyledButton(p3 .. "Button", p4, if var2 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, themeModule.LargeButtonHeight), p8, nil, t_2)
			var25[text] = var26
			t_2[text_1] = var27
			create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Parent = t_2[text]
			})
			create("UIPadding")({ PaddingLeft = UDim.new(0.025, 0), Parent = t_2[text] })
			t_2[text_1].Size = UDim2.new(0, 0, 1, 0)
			create("UIFlexItem")({ FlexMode = Enum.UIFlexMode.Grow, Parent = t_2[text_1] })
			t_2[text].Position = p7
			t_2[text].Parent = t_2.BottomButtonFrame
			
			if var2 then
				t_2[text].ImageTransparency = 1
			end
			t_2[text_1].FontSize = Enum.FontSize.Size24
			local var28 = nil
			
			if not var8 then
				local text_2 = p3 .. "Hint"
				local _ = ""
				local var29 = if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) or platform == Enum.Platform.XBoxOne then p5 else p6
				var28 = create("ImageLabel")({
					BackgroundTransparency = 1,
					LayoutOrder = -1,
					Name = text_2,
					ZIndex = t_2.Shield.ZIndex + 2,
					Image = var29,
					Parent = t_2[text]
				})
				
				if var29 == p6 then
					var28.ImageColor3 = themeModule.color("WhiteButtonText", Color3.new(1, 1, 1))
					var28.ImageTransparency = themeModule.transparency("WhiteButtonText", 1)
				end
				var28.Position = UDim2.new(0, 9, 0.5, 0)
				var28.Size = UDim2.new(0, 33, 0, 33)
				var28.AnchorPoint = Vector2.new(0, 0.5)
			end
			if var2 then
				t_2[text_1].FontSize = Enum.FontSize.Size36
			end
			userInputService.InputBegan:connect(function(p11)
				-- upvalues: var28 (write), p5 (ref), p6 (ref)
				if p11.UserInputType == Enum.UserInputType.Gamepad1 or p11.UserInputType == Enum.UserInputType.Gamepad2 or (p11.UserInputType == Enum.UserInputType.Gamepad3 or p11.UserInputType == Enum.UserInputType.Gamepad4) then
					if var28 then
						var28.Image = p5
						
						return
					end
				elseif p11.UserInputType == Enum.UserInputType.Keyboard and var28 then
					var28.Image = p6
				end
			end)
			t_2.BottomBarButtons[#t_2.BottomBarButtons + 1] = {
				text,
				{
					function(_, p11, _)
						-- upvalues: p10 (ref)
						if p11 == Enum.UserInputState.Begin then
							p10()
						end
					end,
					p9
				}
			}
		end
	end
	
	local var25 = if var2 then "@2x" else ""
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
	local var26 = false
	local var27 = nil
	
	local function setupVoiceListeners()
		-- upvalues: var26 (write), t_2 (ref), default (copy), getCamMicPermissionsModule (copy), var27 (write), otterModule (copy), robloxTranslatorModule (copy), hideVoiceUx (ref)
		if game:GetEngineFeature("VoiceChatSupported") and not var26 then
			var26 = true
			
			local function showUI()
				-- upvalues: t_2 (copy), default (copy), getCamMicPermissionsModule (copy), var27 (copy), otterModule (copy), robloxTranslatorModule (copy)
				t_2.VoiceRecordingText.Visible = true
				default:getService().StateChanged:Connect(function(_, p3)
					-- upvalues: t_2 (copy)
					if p3 == Enum.VoiceChatState.Joined then
						t_2.VoiceRecordingText.Visible = true
					end
				end)
				default:SetupParticipantListeners()
				getCamMicPermissionsModule(function(p3)
					-- upvalues: t_2 (copy)
					t_2.hasMicPermissions = p3.hasMicPermissions
				end, nil, true, "PermissionsButtons.getPermissions")
				var27 = default.muteChanged.Event:Connect(function(p3)
					-- upvalues: t_2 (copy), otterModule (copy), robloxTranslatorModule (copy)
					t_2.isMuted = p3
					t_2.lastVoiceRecordingIndicatorTextUpdated = tick()
					t_2.voiceRecordingIndicatorTextMotor:setGoal(otterModule.instant(0))
					
					if t_2.isMuted then
						local var28
						local voiceRecordingText = t_2.VoiceRecordingText
						
						if robloxTranslatorModule then
							local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.MicOff")
							var28 = if ok then status else "Mic Off"
						else
							var28 = "Mic Off"
						end
						voiceRecordingText.Text = var28
						
						return
					else
						local var29
						local voiceRecordingText = t_2.VoiceRecordingText
						
						if robloxTranslatorModule then
							local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.CommonUI.Label.MicOnRecording")
							var29 = if ok then status else "Mic On (recording audio)"
						else
							var29 = "Mic On (recording audio)"
						end
						voiceRecordingText.Text = var29
					end
				end)
			end
			
			local function hideUI()
				-- upvalues: t_2 (copy), hideVoiceUx (copy), var27 (copy)
				t_2.VoiceRecordingText.Visible = false
				hideVoiceUx()
				
				if var27 then
					var27:Disconnect()
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
	local var28 = true
	
	local function setResetEnabled(value)
		-- upvalues: var28 (write), t_2 (ref)
		var28 = value
		
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
	
	local var29 = nil
	
	function t_2.GetRespawnBehaviour(_)
		-- upvalues: t (copy), t_2 (ref), var28 (write), var29 (write)
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			return t_2:GetExperienceControlStore().getCanRespawn(false), t_2:GetExperienceControlStore().getCustomRespawnCallback(false)
		end
		return var28, var29
	end
	
	t_2.RespawnBehaviourChangedEvent = Instance.new("BindableEvent")
	starterGuiService:RegisterSetCore("ResetButtonCallback", function(p3)
		-- upvalues: t_2 (ref), t (copy), var28 (write), setResetEnabled (ref), inExperienceSideSheetModule (copy), var29 (write)
		local var30 = typeof(p3) == "Instance" and p3:IsA("BindableEvent")
		
		if var30 or type(p3) == "boolean" then
			t_2.ResetCharacterPage:SetResetCallback(p3)
		else
			warn("ResetButtonCallback must be set to a BindableEvent or a boolean")
		end
		local var31 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then t_2:GetExperienceControlStore().getCanRespawn(false) else var28
		
		if p3 == false then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCanRespawn(false)
			else
				setResetEnabled(false)
			end
			if t.FFlagEnableSideSheet then
				inExperienceSideSheetModule.setIsRespawnEnabled(false)
			end
		elseif not var31 and (var30 or p3 == true) then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCanRespawn(true)
			else
				setResetEnabled(true)
			end
			if t.FFlagEnableSideSheet then
				inExperienceSideSheetModule.setIsRespawnEnabled(true)
			end
		end
		if var30 then
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().setCustomRespawnCallback(p3)
			else
				var29 = p3
			end
		end
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			t_2.RespawnBehaviourChangedEvent:Fire(t_2:GetExperienceControlStore().getCanRespawn(false), t_2:GetExperienceControlStore().getCustomRespawnCallback(false))
			
			return
		end
		t_2.RespawnBehaviourChangedEvent:Fire(var28, var29)
	end)
	starterGuiService:RegisterGetCore("ResetButtonCallback", function()
		-- upvalues: t_2 (ref)
		local respawnBehaviour, _ = t_2:GetRespawnBehaviour()
		
		return respawnBehaviour
	end)
	local setVisibilityInternal = nil
	local var30, var31 = createSignal(true)
	local var32, var33 = createSignal(nil)
	
	function t_2.GetExperienceControlStore(_)
		-- upvalues: var31 (ref), t_2 (ref), var30 (ref), var32 (ref), var33 (ref), t (copy), constantsModule_1 (copy), telemetryService (copy), menuLeaveGameTelemetryConfigModule (copy), menuResetCharacterTelemetryConfigModule (copy), rbxAnalyticsService (copy), constantsModule (copy), menuResumeTelemetryConfigModule (copy)
		return {
			getCanRespawn = var30,
			getCustomRespawnCallback = var32,
			setCanRespawn = function(p3)
				-- upvalues: var31 (copy), t_2 (copy)
				var31(p3)
				
				if t_2.ResetCharacterButton then
					t_2.ResetCharacterButton.Selectable = p3
					t_2.ResetCharacterButton.Active = p3
					t_2.ResetCharacterButton.Enabled.Value = p3
					local resetCharacterHint = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
					
					if resetCharacterHint then
						resetCharacterHint.ImageColor3 = p3 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
					local resetCharacterButtonTextLabel = t_2.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
					
					if resetCharacterButtonTextLabel then
						resetCharacterButtonTextLabel.TextColor3 = p3 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
				end
			end,
			setCustomRespawnCallback = var33,
			onLeaveGame = function(p3)
				-- upvalues: t_2 (copy), t (copy), constantsModule_1 (copy), telemetryService (copy), menuLeaveGameTelemetryConfigModule (copy)
				if not t_2:GetVisibility() then return end
				t_2:AddToMenuStack(t_2.Pages.CurrentPage)
				t_2.HubBar.Visible = false
				
				if t.GetFFlagEnableLeaveGameUpsellEntrypoint() and t_2.leaveGameUpsellProp ~= constantsModule_1.PHONE_UPSELL_VALUE_PROP.None then
					t_2:SwitchToPage(t_2.LeaveGameUpsellPage, false)
				else
					t_2:SwitchToPage(t_2.LeaveGamePage, false, nil, true)
				end
				telemetryService:LogCounter(menuLeaveGameTelemetryConfigModule, { customFields = { source = p3 } })
			end,
			onRespawn = function(p3)
				-- upvalues: var30 (copy), t_2 (copy), telemetryService (copy), menuResetCharacterTelemetryConfigModule (copy)
				if var30(false) then
					t_2:AddToMenuStack(t_2.Pages.CurrentPage)
					t_2.HubBar.Visible = false
					t_2:SwitchToPage(t_2.ResetCharacterPage, false, nil, true)
					telemetryService:LogCounter(menuResetCharacterTelemetryConfigModule, { customFields = { source = p3 } })
					
					return
				end
			end,
			onResume = function(p3)
				-- upvalues: t (copy), t_2 (copy), rbxAnalyticsService (copy), constantsModule (copy), telemetryService (copy), menuResumeTelemetryConfigModule (copy)
				if t.FFlagAddUILessMode then
					t_2:SetVisibility(false, nil, nil, nil, p3)
				else
					t_2:SetVisibility(false)
				end
				if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 and t_2.uiLessStore.getUILessModeEnabled(false) then
					t_2.uiLessStore.setUIVisible(false)
				end
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsResumeGameName, constantsModule.AnalyticsMenuActionName, {
					source = p3,
					playsessionid = t_2.playSessionId,
					universeid = tostring(game.GameId)
				})
				telemetryService:LogCounter(menuResumeTelemetryConfigModule, { customFields = { source = p3 } })
			end
		}
	end
	
	local var34 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then function()
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
			setAddMenuKeyBindings = function(value)
				-- upvalues: t_2 (copy)
				t_2.addMenuKeyBindings = value
			end,
			setRemoveMenuKeyBindings = function(value)
				-- upvalues: t_2 (copy)
				t_2.removeMenuKeyBindings = value
			end,
			getVisibility = function()
				-- upvalues: t_2 (copy)
				return t_2.GetVisibility()
			end,
			getCanRespawn = experienceControlStore.getCanRespawn,
			currentPageChangeSignal = if flagsModule.FFlagAddTraversalHistoryReactMenuButtons then t_2.CurrentPageSignal else nil,
			setResumeMenuButton = if t.FFlagIEMFocusNavSupportNewButtons then function(p3)
				-- upvalues: t_2 (copy), t (copy), guiService (copy)
				t_2.ResumeMenuButton = p3
				
				if t.FFlagIEMFocusNavSupportNewButtons and (not guiService.SelectedCoreObject or not guiService.SelectedCoreObject:IsDescendantOf(t_2.Shield)) then
					guiService.SelectedCoreObject = p3
				end
			end else nil
		}))
	end else nil
	local var35 = if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then function()
		-- upvalues: t_2 (ref)
		if t_2.BottomButtonFrameRoot then
			t_2.BottomButtonFrameRoot:unmount()
			t_2.BottomButtonFrameRoot = nil
		end
	end else nil
	
	local function createGui()
		-- upvalues: utilityModule (copy), t_2 (ref), create (copy), uDim2_1 (copy), uDim2 (copy), robloxGui (copy), SHIELD_INACTIVE_POSITION (copy), SETTINGS_SHIELD_TRANSPARENCY (copy), SETTINGS_SHIELD (copy), var3 (copy), t (copy), themeModule (copy), var2 (copy), fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), GetServerChannelBlocking (copy), var12 (copy), var6 (copy), runService (copy), httpRbxApiService (copy), httpService (copy), cachedPolicyServiceModule (copy), baseUrl (copy), var9 (copy), starterPlayerService (copy), playersService (copy), rbxAnalyticsService (copy), constantsModule (copy), fFlagIEMFocusNavPeoplePageToButtons (copy), guiService (copy), getCamMicPermissionsModule (copy), default (copy), roactModule (copy), roactAppExperimentModule (copy), IXPService (copy), appStyleProvider (copy), dark (copy), menuBackButtonModule (copy), menuFrontButtonModule (copy), appFonts (copy), otterModule (copy), t_1 (copy), userInputService (copy), setVisibilityInternal (write), var34 (ref), corePackagesService (copy), inExperienceAppChatModalModule (copy), removeBottomBarBindings (ref), constantsModule_1 (copy), inExperienceCapabilities (copy), addBottomBarButtonOld (ref), text_1 (write), var28 (write), var24 (ref), text_2 (write), buttonStartImageForKeyCode (ref), text (write), reactRobloxModule (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utilsModule (copy), switchTabHint (copy), isSubjectToDesktopPolicies (copy), settingsFullScreenTitleBarModule (copy)
		local var36 = if utilityModule:IsSmallTouchScreen() then 5 else 0
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
				CanvasSize = UDim2.new(0, 0, 0, var3),
				BackgroundColor3 = SETTINGS_SHIELD,
				BackgroundTransparency = SETTINGS_SHIELD_TRANSPARENCY,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, var3),
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
				Size = UDim2.new(1, 0, 0, var3),
				AnchorPoint = Vector2.new(0, 1)
			})
		end
		local var37 = create("UIListLayout")({
			Name = "VersionContainer",
			Parent = t_2.VersionContainer,
			Padding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		local function _(p3)
			-- upvalues: coreScriptVersionEnabledEngineFeature (ref), var3 (copy)
			p3.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, p3.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
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
				TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			spawn(function()
				-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), GetServerChannelBlocking (copy), coreScriptVersionEnabledEngineFeature (ref), var3 (copy)
				local var38 = "Server Channel: "
				
				if fFlagLocalizeVersionLabels then
					if robloxTranslatorModule then
						local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ServerChannel")
						var38 = if ok then status else "Server Channel: "
					else
						var38 = "Server Channel: "
					end
				end
				t_2.ServerChannelLabel.Text = var38 .. GetServerChannelBlocking()
				local serverChannelLabel = t_2.ServerChannelLabel
				serverChannelLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, serverChannelLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
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
			TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), var12 (copy), var6 (copy), coreScriptVersionEnabledEngineFeature (ref), var3 (copy)
			local var38 = "Server Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ServerVersion")
					var38 = if ok then status else "Server Version: "
				else
					var38 = "Server Version: "
				end
			end
			local var39
			local serverVersionLabel = t_2.ServerVersionLabel
			
			if var12 then
				var39 = var12
			elseif not var6 then
				repeat
					wait()
				until var6
			end
			var12 = var6:InvokeServer()
			var39 = var12
			serverVersionLabel.Text = var38 .. var222
			local serverVersionLabel_1 = t_2.ServerVersionLabel
			serverVersionLabel_1.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, serverVersionLabel_1.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
			t_2.ServerVersionLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.ServerVersionLabel.TextFits)
		end)
		local var38 = "Client Version: "
		
		if fFlagLocalizeVersionLabels then
			if robloxTranslatorModule then
				local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ClientVersion")
				var38 = if ok then status else "Client Version: "
			else
				var38 = "Client Version: "
			end
		end
		local robloxVersion = runService:GetRobloxVersion()
		local ok, status = pcall(function()
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
			TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Text = var38 .. robloxVersion,
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		local clientVersionLabel = t_2.ClientVersionLabel
		clientVersionLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, clientVersionLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
		t_2.ClientVersionLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.ClientVersionLabel.TextFits)
		t_2.PlaceVersionLabel = create("TextLabel")({
			Name = "PlaceVersionLabel",
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Text = "Place Version: ...",
			ZIndex = 5,
			Parent = t_2.VersionContainer,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		
		local function setPlaceVersionText()
			-- upvalues: fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), t_2 (copy), t (copy), httpRbxApiService (copy), httpService (copy), coreScriptVersionEnabledEngineFeature (ref), var3 (copy)
			local var39 = "Place Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.PlaceVersion")
					var39 = if ok then status else "Place Version: "
				else
					var39 = "Place Version: "
				end
			end
			local placeVersion
			local placeVersionLabel = t_2.PlaceVersionLabel
			
			if t.GetFFlagRemoveAssetVersionEndpoint() then
				placeVersion = game.PlaceVersion
			else
				local placeVersion_1 = game.PlaceVersion
				pcall(function()
					-- upvalues: httpRbxApiService (copy), httpService (copy), placeVersion_1 (write)
					placeVersion_1 = string.format("%s (Latest: %d)", placeVersion_1, httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber)
				end)
				placeVersion = placeVersion_1
			end
			placeVersionLabel.Text = var39 .. placeVersion
			local placeVersionLabel_1 = t_2.PlaceVersionLabel
			placeVersionLabel_1.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, placeVersionLabel_1.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
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
				TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = baseUrl,
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Visible = var9
			})
			local environmentLabel = t_2.EnvironmentLabel
			environmentLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, environmentLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
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
					TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
					Text = if robloxTranslatorModule then robloxTranslatorModule:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", { RBX_STR = playSessionId }) else "PlaySessionId: " .. playSessionId,
					Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
				local playSessionIdLabel = t_2.PlaySessionIdLabel
				playSessionIdLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, playSessionIdLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
				t_2.PlaySessionIdLabel.TextScaled = not t_2.PlaySessionIdLabel.TextFits
			end
		end
		local function getOverridesPlayerScripts()
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
			TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
			Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: robloxGui (copy), playersService (copy), fFlagLocalizeVersionLabels (copy), robloxTranslatorModule (copy), getOverridesPlayerScripts (ref), t (copy), rbxAnalyticsService (copy), constantsModule (copy), t_2 (copy), var9 (copy), coreScriptVersionEnabledEngineFeature (ref), var3 (copy)
			local playerPermissionsModule = require(robloxGui.Modules.PlayerPermissionsModule)
			
			if not playersService.LocalPlayer then
				playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			end
			local var39 = "PlayerScripts: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok, status = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.PlayerScripts")
					var39 = if ok then status else "PlayerScripts: "
				else
					var39 = "PlayerScripts: "
				end
			end
			local var40
			local var41 = getOverridesPlayerScripts()
			
			if t.EngineFeaturePlayerScriptStatusProperty then
				var40 = var41 == "v3 Default"
				var40 = nil
			else
				var40 = var41 == "Default"
			end
			rbxAnalyticsService:setRBXEventStream(constantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
				defaultPlayerScripts = var40,
				placeID = tostring(game.PlaceId),
				rawValue = if t.GetFFlagNewEventIngestPlayerScriptsDimensions() then var41 else nil,
				context = if t.GetFFlagNewEventIngestPlayerScriptsDimensions() then "IGMv1" else nil
			})
			t_2.OverridesPlayerScriptsLabel.Text = var39 .. var229
			t_2.OverridesPlayerScriptsLabel.Visible = var9 or playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer)
			local overridesPlayerScriptsLabel = t_2.OverridesPlayerScriptsLabel
			overridesPlayerScriptsLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, overridesPlayerScriptsLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
			t_2.OverridesPlayerScriptsLabel.TextScaled = not (coreScriptVersionEnabledEngineFeature or t_2.OverridesPlayerScriptsLabel.TextFits)
		end)
		
		if coreScriptVersionEnabledEngineFeature then
			local var39 = "Client CoreScript Version: "
			
			if fFlagLocalizeVersionLabels then
				if robloxTranslatorModule then
					local ok_1, status_1 = pcall(robloxTranslatorModule.FormatByKey, robloxTranslatorModule, "InGame.HelpMenu.Label.ClientCoreScriptVersion")
					var39 = if ok_1 then status_1 else "Client CoreScript Version: "
				else
					var39 = "Client CoreScript Version: "
				end
			end
			t_2.CoreScriptVersionLabel = create("TextLabel")({
				Name = "CoreScriptVersionLabel",
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = t_2.VersionContainer,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = themeModule.textSize(if var2 then 28 elseif utilityModule:IsSmallTouchScreen() then 14 else 20),
				Text = var39 .. runService:GetCoreScriptVersion(),
				Font = themeModule.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
			local coreScriptVersionLabel = t_2.CoreScriptVersionLabel
			coreScriptVersionLabel.Size = coreScriptVersionEnabledEngineFeature and UDim2.new(0, coreScriptVersionLabel.TextBounds.X + 6, 0, var3) or UDim2.new(0.2, -6, 1, 0)
			local versionContainer = t_2.VersionContainer
			var37:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: versionContainer (ref), var37 (ref), var3 (copy)
				versionContainer.CanvasSize = UDim2.new(0, var37.AbsoluteContentSize.X, 0, var3)
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
		local var40 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		t_2.MenuContainer = create("ImageButton")({
			Name = "MenuContainer",
			ZIndex = t_2.Shield.ZIndex,
			BackgroundTransparency = themeModule.transparency("MenuContainer", 1),
			BackgroundColor3 = themeModule.color("MenuContainer"),
			Position = var40.Position,
			Size = var40.Size,
			AnchorPoint = var40.AnchorPoint,
			AutomaticSize = var40.AutomaticSize,
			Parent = t_2.Shield
		})
		t_2.ReactPage.Parent = t_2.MenuContainer
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
		
		if not var2 then
			local _ = guiService:GetGuiInset().Y
			t_2.MenuContainerPadding.PaddingTop = UDim.new(0, 0)
		end
		local var41 = themeModule.HubPadding()
		t_2.MenuContainer.AutoButtonColor = false
		t_2.MenuContainerPadding.PaddingLeft = var41.PaddingLeft
		t_2.MenuContainerPadding.PaddingRight = var41.PaddingRight
		t_2.MenuContainerPadding.PaddingBottom = var41.PaddingBottom
		t_2.MenuContainerPadding.PaddingTop = var41.PaddingTop
		create("UICorner")({
			CornerRadius = themeModule.MenuContainerCornerRadius,
			Parent = t_2.MenuContainer
		})
		getCamMicPermissionsModule(function(p3)
			-- upvalues: t_2 (copy)
			t_2.hasMicPermissions = p3.hasMicPermissions
			t_2.isFetchingMicPermissions = false
		end, nil, true)
		t_2.SettingsShowSignal:connect(function(p3)
			-- upvalues: default (copy), t (copy), t_2 (copy)
			if p3 then
				if default:IsSeamlessVoice() and not default.voiceUIVisible then
					if t.FFlagVoiceRewarmTelemetry then
						local var42, var43, var44, var45 = default:GetConnectDisconnectButtonAnalyticsData(true)
						default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", var42, var43, var44, var45, default.joinVoiceButtonContext)
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
		elseif var2 then
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
		elseif var2 then
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
		t_2.voiceRecordingIndicatorTextMotor:onStep(function(p3)
			-- upvalues: t_2 (copy)
			t_2.VoiceRecordingText.TextTransparency = p3
		end)
		spawn(function()
			-- upvalues: runService (copy), t_2 (copy), otterModule (copy), t_1 (copy)
			runService:BindToRenderStep("VoiceRecordingIndicator", 1, function()
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
			Size = UDim2.new(t_2.HubBar.Size.X.Scale, t_2.HubBar.Size.X.Offset, 1, (-t_2.HubBar.Size.Y.Offset) - t_2.HubBar.Position.Y.Offset - var36),
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
			serviceModule:onShortcutBarChanged():connect(function()
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
			Selectable = false,
			SelectionGroup = true,
			Size = t_2.HubBar.Size,
			Position = UDim2.new(0.5, -t_2.HubBar.Size.X.Offset / 2, 1 - t_2.HubBar.Position.Y.Scale - t_2.HubBar.Size.Y.Scale, (-t_2.HubBar.Position.Y.Offset) - t_2.HubBar.Size.Y.Offset),
			ZIndex = t_2.Shield.ZIndex + 1,
			Parent = page,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		})
		t_2.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: t_2 (copy)
			t_2.setShowBottomBarSignal(t_2.BottomButtonFrame.Visible)
		end)
		
		local var42 = function(p3)
			-- upvalues: t (copy), setVisibilityInternal (copy), t_2 (copy), rbxAnalyticsService (copy), constantsModule (copy), guiService (copy)
			if t.FFlagAddUILessMode then
				setVisibilityInternal(false, nil, nil, nil, p3)
			else
				setVisibilityInternal(false)
			end
			if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 and t_2.uiLessStore.getUILessModeEnabled(false) then
				t_2.uiLessStore.setUIVisible(false)
			end
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsResumeGameName, constantsModule.AnalyticsMenuActionName, {
				source = p3,
				playsessionid = t_2.playSessionId,
				universeid = tostring(game.GameId)
			})
			guiService.SelectedCoreObject = nil
		end
		
		if t.FFlagEnableSideSheet then
			if t.FFlagImprovePageTitleCloseButton then
				t_2.PageTitleCloseButton = utilityModule:MakeStyledImageButton("PageTitleClose", "rbxasset://textures/ui/InspectMenu/x.png", UDim2.new(0, 40, 0, 40), UDim2.new(0, 16, 0, 16), function()
					-- upvalues: var42 (ref), constantsModule (copy)
					var42(constantsModule.AnalyticsResumeXButtonSource)
				end, nil, t_2, "DefaultButton")
				t_2.PageTitleCloseButton.AnchorPoint = Vector2.new(1, 0.5)
				t_2.PageTitleCloseButton.Position = UDim2.new(1, 0, 0.5, 0)
				local border = t_2.PageTitleCloseButton:FindFirstChild("Border")
				
				if border then
					border.Parent = nil
				end
				t_2.PageTitleCloseButton.Parent = t_2.PageTitleHeader
			else
				t_2.PageTitleCloseButton.Activated:Connect(function()
					-- upvalues: var42 (ref), constantsModule (copy)
					var42(constantsModule.AnalyticsResumeXButtonSource)
				end)
			end
		end
		if not t.FFlagMenuButtonsMountWithIEM and t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
			var34()
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
			local var43 = require(corePackagesService.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false)
			var43.backgroundScrimActivated.Event:Connect(function()
				-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var42 (ref)
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
					
					return
				end
				var42(constantsModule.AnalyticsResumeShieldSource)
			end)
			t_2.Shield:GetPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: var43 (ref), t_2 (copy)
				var43.setTransparency(1)
				var43.setAutoDismiss(true)
				var43.setVisibility(t_2.Shield.Visible)
			end)
		end
		t_2.Shield.Activated:Connect(function()
			-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var42 (ref)
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
				
				return
			end
			var42(constantsModule.AnalyticsResumeShieldSource)
		end)
		
		if t.FFlagSettingsHubIndependentBackgroundVisibility then
			t_2.DarkenBackground.Activated:Connect(function()
				-- upvalues: t (copy), t_2 (copy), constantsModule (copy), var42 (ref), inExperienceAppChatModalModule (copy)
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t_2:GetExperienceControlStore().onResume(constantsModule.AnalyticsResumeShieldSource)
				else
					var42(constantsModule.AnalyticsResumeShieldSource)
				end
				inExperienceAppChatModalModule.default:setVisible(false)
			end)
		end
		if not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 then
			local var44 = function()
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
				addBottomBarButtonOld("LeaveGame", "Leave", text_1, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, if var2 then -160 else -130, 0.5, -25), var44, {
					Enum.KeyCode.L,
					if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then nil else Enum.KeyCode.ButtonX
				}, var44)
			end
			local var45 = function()
				-- upvalues: var28 (copy), t_2 (copy), removeBottomBarBindings (copy)
				if var28 then
					t_2:AddToMenuStack(t_2.Pages.CurrentPage)
					t_2.HubBar.Visible = false
					removeBottomBarBindings()
					t_2:SwitchToPage(t_2.ResetCharacterPage, nil, 1, true)
				end
			end
			
			addBottomBarButtonOld("ResetCharacter", var24:Format(constantsModule.RespawnLocalizedKey), text_2, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, if var2 then -550 else -400, 0.5, -25), var45, {
				Enum.KeyCode.R,
				if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then nil else Enum.KeyCode.ButtonY
			}, var45)
			addBottomBarButtonOld("Resume", "Resume", if t.FFlagEnableConsoleExpControls then buttonStartImageForKeyCode else text, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, if var2 then 200 else 140, 0.5, -25), function()
				-- upvalues: var42 (ref), constantsModule (copy)
				var42(constantsModule.AnalyticsResumeButtonSource)
			end, if t.FFlagEnableConsoleExpControls and t.ChromeEnabled then {} else { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart }, function()
				-- upvalues: var42 (ref), constantsModule (copy)
				var42(constantsModule.AnalyticsResumeGamepadSource)
			end)
		end
		if t.FFlagAddSwitchTabHintsToIEM then
			local function MountSwitchTabHint(p3)
				-- upvalues: create (copy), reactRobloxModule (copy), reactModule (copy), foundationProvider (copy), foundationModule (copy), utilsModule (copy), switchTabHint (copy)
				reactRobloxModule.createRoot(create("Frame")({
					Name = "SwitchTabHintContainer",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					LayoutOrder = p3.layoutOrder,
					Parent = p3.parent
				})):render(reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement("UIListLayout", {
					Name = "SwitchTabHintCenterAlign",
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}), reactModule.createElement(foundationProvider, {
					colorMode = foundationModule.Enums.ColorMode.Dark,
					device = utilsModule.getDeviceType()
				}, {
					["SwitchTabHint" .. p36.keycode.Name] = reactModule.createElement(switchTabHint, { keycode = p3.keycode })
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
		local function cameraViewportChanged()
			-- upvalues: themeModule (copy), utilityModule (copy)
			themeModule.viewportResized()
			utilityModule:FireOnResized()
		end
		
		local var46 = nil
		
		local function onWorkspaceChanged(p3)
			-- upvalues: themeModule (copy), utilityModule (copy), var46 (write), cameraViewportChanged (ref)
			if p3 == "CurrentCamera" then
				themeModule.viewportResized()
				utilityModule:FireOnResized()
				
				if var46 then
					var46:disconnect()
				end
				var46 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
			end
		end
		
		themeModule.viewportResized()
		utilityModule:FireOnResized()
		var46 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
		workspace.Changed:Connect(onWorkspaceChanged)
	end
	
	local function resizeBottomBarButtons()
		-- upvalues: t_2 (ref), t (copy)
		local x = t_2.BottomButtonFrame.AbsoluteSize.X
		local bottomBarButtonsCount = #t_2.BottomBarButtons
		
		if bottomBarButtonsCount == 4 then
			x = x - 48 - 12
			bottomBarButtonsCount -= 1
		end
		local var36 = (x - (bottomBarButtonsCount - 1) * 12 - 12) / bottomBarButtonsCount
		
		if t.isInExperienceUIVREnabled then
			var36 = t_2.SettingsUIDelegate:getBottomButtonSize(var36)
		end
		for i = 1, #t_2.BottomBarButtons do
			local var37 = t_2.BottomBarButtons[i]
			local var38 = var37[1]
			
			if var38 ~= "MuteButtonButton" then
				t_2[var38].Size = UDim2.fromOffset(var36, t_2[var37[1]].Size.Y.Offset)
			end
		end
	end
	
	local function onScreenSizeChanged()
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), themeModule (copy), var34 (ref), var35 (ref), robloxGui (copy), var2 (copy), VRService (copy), runService (copy), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), removeBottomBarBindings (ref)
		local function _()
			-- upvalues: t_2 (copy)
			return if t_2.BackBarRef:getValue() then t_2.BackBarRef:getValue().Visible else false
		end
		
		local _ = function()
			-- upvalues: t_2 (copy)
			return if t_2.FrontBarRef:getValue() then t_2.FrontBarRef:getValue().Visible else false
		end
		
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.Visible then
			if (utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar() then
				if t_2.BottomButtonFrameRoot then
					var35()
				end
				if t_2.PlayersPage then
					t_2.PlayersPage:CreateMenuButtonsContainer()
				end
			elseif not t_2.BottomButtonFrameRoot then
				var34()
			end
			if t_2.PlayersPage then
				t_2.PlayersPage:UnmountMenuButtonsContainer()
			end
		end
		local var39 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		local var40 = 600
		local var41 = if t.isInExperienceUIVREnabled then t_2.SettingsUIDelegate:getFullScreenSize() else robloxGui.AbsoluteSize.y
		local var42 = 0.05 * var41
		local var43 = utilityModule:IsPortrait()
		
		if var2 then
			var40 = 800
			var42 = 0.07 * var41
		elseif utilityModule:IsSmallTouchScreen() then
			var42 = math.min(10, 0.01 * var41)
		elseif t.isInExperienceUIVREnabled and VRService.VREnabled then
			var42 = 0
		end
		t_2.MenuContainer.Size = var39.Size
		t_2.MenuContainer.Position = var39.Position
		t_2.MenuContainer.AnchorPoint = var39.AnchorPoint
		local _ = var42 * 2 + t_2.HubBar.Size.Y.Offset * 2
		local var44 = 0
		
		if not t.FFlagAddTraversalBackButton then
			if (if not t_2.BackBarRef:getValue() then false else t_2.BackBarRef:getValue().Visible) and t_2.BackBarRef:getValue() then
				var44 = t_2.BackBarRef:getValue().Size.Y.Offset
			end
			if t.EngineFeatureTeleportHistoryButtons and (if not t_2.FrontBarRef:getValue() then false else t_2.FrontBarRef:getValue().Visible) and t_2.FrontBarRef:getValue() then
				var44 += t_2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		if var43 then
			t_2.HubBar.Position = UDim2.new(0.5, 0, 0, 10)
			t_2.HubBar.Size = UDim2.new(0, robloxGui.AbsoluteSize.X - 40, 0, 54)
		elseif var2 then
			t_2.HubBar.Size = UDim2.new(0, 1200, 0, 100)
		elseif utilityModule:IsSmallTouchScreen() then
			t_2.HubBar.Size = UDim2.new(0, robloxGui.AbsoluteSize.X - 60, 0, 52)
		elseif t.isInExperienceUIVREnabled then
			t_2.HubBar.Size = UDim2.new(0, t_2.SettingsUIDelegate:getHubBarSize(), 0, 60)
		else
			t_2.HubBar.Size = UDim2.new(0, 800, 0, 60)
		end
		local var45 = if t.FFlagEnableSideSheet or not themeModule.AlwaysShowBottomBar() then t_2.HubBar.Size.Y.Offset else t_2.HubBar.Size.Y.Offset + t_2.BottomButtonFrame.Size.Y.Offset
		local var46 = var42 * 2 + (if t.FFlagFixDisableTopPaddingError and t_2.Pages.CurrentPage == nil or not t_2.Pages.CurrentPage.DisableTopPadding then var45 else 0)
		
		if not t.FFlagAddTraversalBackButton then
			var44 = if (if not t_2.BackBarRef:getValue() then false else t_2.BackBarRef:getValue().Visible) and t_2.BackBarRef:getValue() then t_2.BackBarRef:getValue().Size.Y.Offset else 0
			
			if t.EngineFeatureTeleportHistoryButtons and (if not t_2.FrontBarRef:getValue() then false else t_2.FrontBarRef:getValue().Visible) and t_2.FrontBarRef:getValue() then
				var44 += t_2.FrontBarRef:getValue().Size.Y.Offset
			end
		end
		runService.Heartbeat:wait()
		
		if shouldShowBottomBar() then
			setBottomBarBindings()
			setBottomBarSelection(t_2.Pages.CurrentPage)
		else
			removeBottomBarBindings()
		end
		if t.isInExperienceUIVREnabled then
			var46 += t_2.SettingsUIDelegate:getMenuContainerExtraSpace()
		end
		local var47 = var41 - var46 - var44
		
		if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3) and utilityModule:IsSmallTouchScreen() then
			var47 -= themeModule.ExtraHubBottomPaddingMobile
		end
		local var48
		local _ = nil
		
		if var43 then
			var48 = var47
		elseif var40 < var47 then
			var48 = var40
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0.5, -var40 / 2 - t_2.HubBar.Size.Y.Offset)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 0.5, var40 / 2)
			end
		elseif var47 < 150 then
			var48 = 150
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0.5, -75 - t_2.HubBar.Size.Y.Offset)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 0.5, 75)
			end
		else
			var48 = var47
			t_2.HubBar.Position = UDim2.new(t_2.HubBar.Position.X.Scale, t_2.HubBar.Position.X.Offset, 0, var42)
			
			if t_2.BottomButtonFrame then
				t_2.BottomButtonFrame.Position = UDim2.new(t_2.BottomButtonFrame.Position.X.Scale, t_2.BottomButtonFrame.Position.X.Offset, 1, -(var42 + var45))
			end
		end
		local _ = nil
		local var49 = if var2 then UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var48) elseif not utilityModule:IsSmallTouchScreen() then if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var48 + 0 + 0 - t_2.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var48 + 0 + 0) else UDim2.new(0, t_2.HubBar.AbsoluteSize.X, 0, var48)
		
		if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 and t_2.BottomButtonFrame then
			t_2.BottomButtonFrame.Size = UDim2.new(0, t_2.HubBar.Size.X.Offset, 0, t_2.HubBar.Size.Y.Offset)
		end
		local var50 = themeModule.HubPadding()
		t_2.ReactPage.Size = UDim2.new(0, t_2.HubBar.AbsoluteSize.X + (var50.PaddingLeft.Offset + var50.PaddingRight.Offset), 0, var48 + var45 + (var50.PaddingTop.Offset + var50.PaddingBottom.Offset))
		t_2.PageViewClipper.Size = var49
		
		if var43 then
			t_2.PageViewClipper.Position = UDim2.new(0.5, 0, 0, t_2.HubBar.Position.Y.Offset + t_2.HubBar.AbsoluteSize.Y)
			
			return
		end
		t_2.PageViewClipper.Position = UDim2.new(t_2.PageViewClipper.Position.X.Scale, t_2.PageViewClipper.Position.X.Offset, 0.5, -var48 / 2)
	end
	
	local _ = function()
		-- upvalues: t_2 (ref), themeModule (copy), guiService (copy)
		t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
	end
	
	local function toggleQuickProfilerFromHotkey(p3, p4, _)
		-- upvalues: userInputService (copy), gameSettings (copy)
		if not userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not userInputService:IsKeyDown(Enum.KeyCode.RightControl) then return end
		if p3 == "Show Quick Profiler" and p4 and p4 == Enum.UserInputState.Begin then
			gameSettings.PerformanceStatsVisible = not gameSettings.PerformanceStatsVisible
		end
	end
	
	local function toggleDevConsole(p3, p4, _)
		-- upvalues: devConsoleMasterModule (copy)
		if p3 == "Open Dev Console" and p4 and p4 == Enum.UserInputState.Begin then
			devConsoleMasterModule:ToggleVisibility()
		end
	end
	
	local var39 = var2
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
	userInputService.InputBegan:connect(function(p3)
		-- upvalues: t_3 (ref), var39 (write)
		if p3.UserInputType and t_3[p3.UserInputType] ~= nil then
			var39 = t_3[p3.UserInputType]
			
			return
		elseif p3.KeyCode and t_3[p3.KeyCode] then
			var39 = t_3[p3.KeyCode]
		end
	end)
	userInputService.InputChanged:connect(function(p3)
		-- upvalues: var39 (write)
		if p3.KeyCode == Enum.KeyCode.Thumbstick1 or p3.KeyCode == Enum.KeyCode.Thumbstick2 then
			if p3.Position.magnitude >= 0.25 then
				var39 = true
				
				return
			end
		elseif p3.UserInputType == Enum.UserInputType.Touch or p3.UserInputType == Enum.UserInputType.MouseMovement then
			var39 = false
		end
	end)
	local GetHeaderPosition = nil
	
	local var40 = function(p3, p4)
		-- upvalues: t (copy), t_2 (ref), GetHeaderPosition (write)
		if t.FFlagInExperienceReportClosingBugfix and not t_2.HubBar.Visible then return end
		local var41 = GetHeaderPosition(t_2.Pages.CurrentPage)
		
		if var41 < 0 then return end
		local var42 = var41 + p3
		
		if p4 then
			if #t_2.TabHeaders < var42 then
				var42 = 1
			elseif var42 < 1 then
				var42 = #t_2.TabHeaders
			end
		end
		local var43 = t_2.TabHeaders[var42]
		
		if var43 then
			for i, v in pairs(t_2.Pages.PageTable) do
				if i:GetTabHeader() == var43 then
					t_2:SwitchToPage(i, true, p3)
					
					return
				end
			end
		end
	end
	
	local var44 = function(_, p5, p6)
		-- upvalues: var40 (ref)
		if p5 ~= Enum.UserInputState.Begin then return end
		local var45 = 0
		
		if p6.KeyCode == Enum.KeyCode.ButtonR1 then
			var45 = 1
		elseif p6.KeyCode == Enum.KeyCode.ButtonL1 then
			var45 = -1
		end
		var40(var45, true)
	end
	
	local var45 = function(p5)
		-- upvalues: userInputService (copy), var40 (ref)
		if p5.KeyCode == Enum.KeyCode.Tab then
			local _ = 0
			var40(if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then -1 else 1, true)
		end
	end
	
	local var46 = function(_, p5, p6)
		-- upvalues: t_2 (ref)
		if p5 ~= Enum.UserInputState.Begin then return end
		local var47 = 0
		
		if p6.KeyCode == Enum.KeyCode.PageUp then
			var47 = -100
		elseif p6.KeyCode == Enum.KeyCode.PageDown then
			var47 = 100
		end
		t_2:ScrollPixels(var47)
	end
	
	if t.isInExperienceUIVREnabled or t.FFlagEnableSettingsHubUIDelegateRollout then
		t_2.SettingsUIDelegate = require(robloxGui.Modules.Settings.SettingsUIDelegate).new(t_2)
	end
	createGui()
	
	if settingsHubRaceConditionFix then
		setupVoiceListeners()
	end
	GetHeaderPosition = function(p5)
		-- upvalues: t_2 (ref)
		local tabHeader = p5:GetTabHeader()
		
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
	
	local var47 = function(p6, p7)
		-- upvalues: var47 (write)
		if p7:IsA("GuiObject") then
			p7.ZIndex = p6
			local children = p7:GetChildren()
			
			for i = 1, #children do
				var47(p6, children[i])
			end
		end
	end
	
	local function AddHeader(p8, p9)
		-- upvalues: t_2 (ref), var47 (write)
		if not p8 then return end
		table.insert(t_2.TabHeaders, p8)
		p9.TabPosition = #t_2.TabHeaders
		local var48 = 1 / #t_2.TabHeaders
		
		for i = 1, #t_2.TabHeaders do
			t_2.TabHeaders[i].Size = UDim2.new(var48, 0, 1, 0)
		end
		var47(3, p8)
		p8.Parent = t_2.HubBarContainer
	end
	
	local function RemoveHeader(p10)
		-- upvalues: t_2 (ref)
		local var49 = nil
		
		for i = 1, #t_2.TabHeaders do
			if t_2.TabHeaders[i] ~= p10 then
				continue
			end
			var49 = i
			table.remove(t_2.TabHeaders, i)
			break
		end
		if var49 then
			for i_1 = var49, #t_2.TabHeaders do
				local var50 = t_2.TabHeaders[i_1]
				var50.Position = UDim2.new(var50.Position.X.Scale, var50.Position.X.Offset - p10.AbsoluteSize.X, var50.Position.Y.Scale, var50.Position.Y.Offset)
			end
		end
		p10.Parent = nil
	end
	
	function t_2.AddPage(_, p11)
		-- upvalues: t_2 (ref), AddHeader (ref), setBottomBarSelection (ref), t (copy)
		t_2.Pages.PageTable[p11] = true
		AddHeader(p11:GetTabHeader(), p11)
		p11.Page.Position = UDim2.new(p11.TabPosition - 1, 0, 0, 0)
		p11.LastSelectableObjectsUpdated:connect(function()
			-- upvalues: setBottomBarSelection (copy), p11 (ref)
			setBottomBarSelection(p11)
		end)
		
		if t.FFlagIEMTabFocusNav then
			if t.FFlagIEMTabFocusNav then
				local tabHeader = p11:GetTabHeader()
				
				if tabHeader then
					for i, v in p11.FirstSelectableObjects do
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
			p11.FirstSelectableObjectsUpdated:connect(function()
				-- upvalues: p11 (ref), t (copy)
				if not t.FFlagIEMTabFocusNav then return end
				local tabHeader = p11:GetTabHeader()
				
				if not tabHeader then return end
				for i, v in p11.FirstSelectableObjects do
					v.NextSelectionUp = tabHeader
					tabHeader.NextSelectionDown = v
				end
			end)
		end
	end
	
	function t_2.RemovePage(_, p12)
		-- upvalues: t_2 (ref), RemoveHeader (ref), t (copy)
		t_2.Pages.PageTable[p12] = nil
		RemoveHeader(p12:GetTabHeader())
		p12.LastSelectableObjectsUpdated:disconnect()
		
		if t.FFlagIEMTabFocusNav then
			p12.FirstSelectableObjectsUpdated:disconnect()
			
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
	
	function t_2.HideBar(_)
		-- upvalues: t_2 (ref), removeBottomBarBindings (ref)
		t_2.HubBar.Visible = false
		t_2.PageViewClipper.Visible = false
		
		if t_2.BottomButtonFrame then
			removeBottomBarBindings()
		end
	end
	
	function t_2.ShowBar(_)
		-- upvalues: t_2 (ref), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref)
		t_2.HubBar.Visible = true
		t_2.PageViewClipper.Visible = true
		
		if t_2.BottomButtonFrame and shouldShowBottomBar() then
			setBottomBarBindings()
			setBottomBarSelection(t_2.Pages.CurrentPage)
		end
	end
	
	function t_2.ScrollPixels(_, p13)
		-- upvalues: t_2 (ref)
		t_2.PageView.CanvasPosition = Vector2.new(0, math.max(0, math.min(t_2.PageView.CanvasPosition.Y + p13, t_2.PageView.CanvasSize.Y.Offset - t_2.PageViewClipper.AbsoluteSize.y)))
	end
	
	function t_2.ScrollToFrame(_, p13, p14)
		-- upvalues: var39 (write), t_2 (ref), constantsModule (copy)
		if var39 or p14 then
			local var51 = p13.AbsolutePosition.y - t_2.Pages.CurrentPage.Page.AbsolutePosition.y
			local var52 = var51 + p13.AbsoluteSize.y
			
			if var51 < t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var51)
				
				return
			elseif t_2.Pages.CurrentPage.Page.Name == constantsModule.PeoplePageKey and t_2.PageView.AbsoluteSize.Y - constantsModule.PeoplePageScrollBuffer < var52 - t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var52 - t_2.PageView.AbsoluteSize.Y + constantsModule.PeoplePageScrollBuffer)
				
				return
			elseif t_2.PageViewClipper.Size.Y.Offset < var52 - t_2.PageView.CanvasPosition.y then
				t_2.PageView.CanvasPosition = Vector2.new(0, var52 - t_2.PageViewClipper.Size.Y.Offset)
			end
		end
	end
	
	function t_2.GetFirstPageWithTabHeader(_)
		-- upvalues: t_2 (ref)
		local var51 = nil
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i:GetTabHeader() ~= nil and i.TabPosition == 1 then
				var51 = i
				break
			end
		end
		if var51 == nil then
			error("No page with tab header found")
			
			return nil
		end
		return var51
	end
	
	function t_2.InitInPage(_, p13)
		-- upvalues: t_2 (ref), t (copy), utilityModule (copy), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), var19 (write)
		local tabPosition = p13.TabPosition
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i ~= p13 then
				i:Hide(-1, tabPosition, true, nil, t_2.PageViewInnerFrame)
			end
		end
		if (not t.FFlagRelocateMobileMenuButtons or t.FIntRelocateMobileMenuButtonsVariant == 0 or t.FIntRelocateMobileMenuButtonsVariant == 2 and utilityModule:IsSmallTouchScreen()) and t_2.BottomButtonFrame then
			if shouldShowBottomBar(p13) then
				setBottomBarBindings()
				setBottomBarSelection(p13)
			else
				t_2.BottomButtonFrame.Visible = false
			end
			local var52
			local hubBar = t_2.HubBar
			p13 = p13 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var52 = p13.ShouldShowHubBar == true
				var52 = nil
			else
				var52 = p13.ShouldShowBottomBar == true
			end
			hubBar.Visible = var52
		end
		local var53 = p13.IsPageClipped == true
		t_2.PageViewClipper.ClipsDescendants = var53
		t_2.PageView.ClipsDescendants = var53
		t_2.PageViewInnerFrame.ClipsDescendants = var53
		t_2.Pages.CurrentPage = p13
		t_2.Pages.CurrentPage.Active = true
		t_2.CurrentPageSignal:fire(if t_2.Pages.CurrentPage then t_2.Pages.CurrentPage.Page.Name else nil)
		
		if t.FFlagEnableSideSheet then
			local var54
			local currentPage = t_2.Pages.CurrentPage
			local currentPage_1 = currentPage or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var54 = currentPage_1.ShouldShowHubBar == true
				var54 = nil
			else
				var54 = currentPage_1.ShouldShowBottomBar == true
			end
			if var54 and currentPage.TabHeader then
				t_2.PageTitleLabel.Text = currentPage.TabHeader.TabLabel.Title.Text
			else
				t_2.PageTitleLabel.Text = ""
			end
		end
		t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
		var19 = t_2.Pages.CurrentPage.Page.Changed:connect(function(p14)
			-- upvalues: t_2 (copy)
			if p14 == "AbsoluteSize" then
				t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
			end
		end)
	end
	
	function t_2.SwitchToPage(_, p14, p15, p16, p17, _, p18)
		-- upvalues: t_2 (ref), t (copy), fixReportButtonCutOff (copy), utilityModule (copy), themeModule (copy), shouldShowBottomBar (ref), var19 (write), var20 (write), setBottomBarBindings (ref), setBottomBarSelection (ref), onScreenSizeChanged (ref), cryoModule (copy), IXPServiceWrapper (copy), rbxAnalyticsService (copy), constantsModule (copy), flagsModule (copy), experienceMenuSessionManagerInstance (copy), reactPageSignalModule (copy)
		if t_2.Pages.PageTable[p14] == nil then return end
		if t.FFlagPreventHiddenSwitchPage and t_2:GetVisibility() == false then return end
		if fixReportButtonCutOff then
			if p14.Page.Name == "ReportAbuseMenuNewContainerPage" then
				t_2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0)
			else
				t_2.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5)
			end
		end
		local uDim = UDim.new(0, 0)
		local uDim_1 = UDim.new(0, 0)
		local var55 = if utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen() then themeModule.AlwaysShowBottomBar() else not (utilityModule:IsPortrait() or utilityModule:IsSmallTouchScreen())
		
		if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
			var55 = true
		end
		if t_2.HubBar then
			local var56
			p14 = p14 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var56 = p14.ShouldShowHubBar == true
				var56 = nil
			else
				var56 = p14.ShouldShowBottomBar == true
			end
			if not var56 and not p14.DisableTopPadding then
				uDim = UDim.new(0, t_2.HubBar.AbsoluteSize.Y)
			end
		end
		if not t.FFlagEnableSideSheet and t_2.BottomButtonFrame and (var55 and not shouldShowBottomBar(p14)) then
			uDim_1 = UDim.new(0, t_2.BottomButtonFrame.AbsoluteSize.Y)
		end
		local var57 = themeModule.HubPadding()
		t_2.MenuContainerPadding.PaddingLeft = var57.PaddingLeft
		t_2.MenuContainerPadding.PaddingRight = var57.PaddingRight
		t_2.MenuContainerPadding.PaddingBottom = var57.PaddingBottom + uDim_1
		t_2.MenuContainerPadding.PaddingTop = var57.PaddingTop + uDim
		local var58 = themeModule.MenuContainerPosition(t_2.SettingsUIDelegate)
		t_2.MenuContainer.Position = var58.Position
		t_2.MenuContainer.Size = var58.Size
		t_2.MenuContainer.AnchorPoint = var58.AnchorPoint
		
		if p16 == nil and t_2.Pages.CurrentPage and (t_2.Pages.CurrentPage.TabHeader and p14) and p14.TabHeader then
			p16 = if t_2.Pages.CurrentPage.TabHeader.AbsolutePosition.x < p14.TabHeader.AbsolutePosition.x then 1 else -1
		end
		if p16 == nil then
			p16 = 1
		end
		if t_2.Pages.CurrentPage and var19 ~= nil then
			var19:disconnect()
			t_2.Pages.CurrentPage.Active = false
		end
		if t.FFlagFixDisabledScrollOnIos and var20 ~= nil then
			var20:Disconnect()
			var20 = nil
		end
		local tabPosition = p14.TabPosition
		
		for i, v in pairs(t_2.Pages.PageTable) do
			if i ~= p14 then
				i:Hide(-p16, tabPosition, p17, nil, t_2.PageViewInnerFrame, i == t_2.Pages.CurrentPage)
			end
		end
		if t_2.BottomButtonFrame then
			if shouldShowBottomBar(p14) then
				setBottomBarBindings()
				setBottomBarSelection(p14)
			else
				t_2.BottomButtonFrame.Visible = false
			end
			local var59
			local hubBar = t_2.HubBar
			p14 = p14 or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var59 = p14.ShouldShowHubBar == true
				var59 = nil
			else
				var59 = p14.ShouldShowBottomBar == true
			end
			hubBar.Visible = var59
		end
		if t.FFlagIEMTabFocusNav and t.FFlagIEMTabFocusNav then
			local tabHeader = p14:GetTabHeader()
			
			if tabHeader then
				for i_1, v_1 in p14.FirstSelectableObjects do
					v_1.NextSelectionUp = tabHeader
					tabHeader.NextSelectionDown = v_1
				end
			end
		end
		local var60
		local var61 = p14.IsPageClipped == true
		t_2.PageViewClipper.ClipsDescendants = var61
		t_2.PageView.ClipsDescendants = var61
		t_2.PageViewInnerFrame.ClipsDescendants = var61
		t_2.Pages.CurrentPage = p14
		t_2.Pages.CurrentPage:Display(t_2.PageViewInnerFrame, p17)
		t_2.Pages.CurrentPage.Active = true
		t_2.CurrentPageSignal:fire(if t_2.Pages.CurrentPage then t_2.Pages.CurrentPage.Page.Name else nil)
		
		if t.FFlagEnableSideSheet then
			local currentPage = t_2.Pages.CurrentPage
			local currentPage_1 = currentPage or t_2.Pages.CurrentPage
			
			if t.FFlagEnableSideSheet then
				var60 = currentPage_1.ShouldShowHubBar == true
				var60 = nil
			else
				var60 = currentPage_1.ShouldShowBottomBar == true
			end
			if var60 and currentPage.TabHeader then
				t_2.PageTitleLabel.Text = currentPage.TabHeader.TabLabel.Title.Text
			else
				t_2.PageTitleLabel.Text = ""
			end
		end
		if t.FFlagAddAbilityToDisableIGMScroll then
			local _ = nil
			local _ = t_2.Pages.CurrentPage
			
			if u9680 ~= nil and u9680.ShouldDisableDefaultScroll == true then
				t_2.PageView.ScrollBarThickness = 0
				t_2.PageView.ScrollingEnabled = false
				t_2.PageView.CanvasPosition = Vector2.new(0, 0)
				t_2.PageView.CanvasSize = UDim2.new(1, 0, 1, 0)
				
				if t.FFlagFixDisabledScrollOnIos then
					var20 = t_2.PageView:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
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
			var60 = u9686
			
			if not (var60 ~= nil and var60.ShouldDisableDefaultScroll == true) then
				t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
			end
		else
			t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
		end
		var19 = t_2.Pages.CurrentPage.Page.Changed:connect(function(p19)
			-- upvalues: t (copy), t_2 (copy)
			if p19 == "AbsoluteSize" then
				if t.FFlagAddAbilityToDisableIGMScroll then
					local _ = nil
					local _ = t_2.Pages.CurrentPage
					local var62 = u10223
					
					if not (var62 ~= nil and var62.ShouldDisableDefaultScroll == true) then
						t_2.PageView.CanvasSize = UDim2.new(0, 0, 0, t_2.Pages.CurrentPage:GetSize().Y)
					end
				end
			end
		end)
		
		if t_2.MenuStack[#t_2.MenuStack] ~= t_2.Pages.CurrentPage and not p15 then
			t_2.MenuStack[#t_2.MenuStack + 1] = t_2.Pages.CurrentPage
		end
		if p14.DisableTopPadding then
			onScreenSizeChanged()
		end
		local t_1 = { universeid = tostring(game.GameId) }
		
		if t.GetFFlagReportAbuseMenuEntrypointAnalytics() and p18 then
			t_1 = cryoModule.Dictionary.join(t_1, p18)
		end
		if t.FFlagRespawnChromeShortcutTelemetry and t_1.used_shortcut == nil then
			t_1.used_shortcut = false
		end
		if t_1.playsessionid == nil then
			t_1.playsessionid = t_2.playSessionId
		end
		if p14 then
			if t.FFlagHelpPageIXPExposure and t_2.HelpPage == p14 and not t_2.HelpPageIXPFetched then
				IXPServiceWrapper:LogUserLayerExposure(t.FStringHelpPageIXPLayer)
				t_2.HelpPageIXPFetched = true
			end
			if t_2.GameSettingsPage == p14 then
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_GameSettings_tab", constantsModule.AnalyticsMenuActionName, t_1)
				
				if flagsModule.FFlagIEMSettingsLogExposureIXPFlags and not t_2.GameSettingsPageReorderIXPFetched then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringInExperienceMenuIXPLayer())
					t_2.GameSettingsPageReorderIXPFetched = true
				end
			else
				rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_" .. p64.Page.Name .. "_tab", constantsModule.AnalyticsMenuActionName, t_1)
			end
			experienceMenuSessionManagerInstance:MenuSwitchToPage(p14.Page)
		else
			rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "open_unknown_tab", constantsModule.AnalyticsMenuActionName, t_1)
			experienceMenuSessionManagerInstance:CloseOpenedMenuTab()
		end
		if t.FFlagAddTraversalHistory and t.FFlagIntegrateTraversalHistoryInSideSheet then
			reactPageSignalModule(false).setCurrentReactPage(nil)
		end
	end
	
	function t_2.SetActive(_, p19)
		-- upvalues: t_2 (ref)
		t_2.Active = p19
		
		if t_2.Pages.CurrentPage then
			t_2.Pages.CurrentPage.Active = p19
		end
	end
	
	function clearMenuStack()
		-- upvalues: t_2 (ref)
		while t_2.MenuStack and #t_2.MenuStack > 0 do
			t_2:PopMenu()
		end
	end
	
	function setOverrideMouseIconBehavior()
		-- upvalues: t_2 (ref), userInputService (copy), VRService (copy), mouseIconOverrideService (copy), settingsHubCursorOverride (copy)
		if not t_2.Visible then return end
		if userInputService:GetLastInputType() == Enum.UserInputType.Gamepad1 or VRService.VREnabled then
			mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		end
		mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
	end
	
	function checkLeaveGameUpsell()
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
			task.delay(checkLeaveGameUpsellCooldown, function()
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
	
	local var62 = if t.FFlagSettingsHubIndependentBackgroundVisibility then function(p19, p20)
		-- upvalues: t_2 (ref), inExperienceAppChatModalModule (copy), constantsModule (copy), t (copy), themeModule (copy), tweenService (copy)
		if not t_2.DarkenBackground then return end
		if not p19 and t_2.DarkenBackground.Visible and (inExperienceAppChatModalModule:getVisible() or t_2.Visible) then return end
		local var63 = 1
		local quart = Enum.EasingStyle.Quart
		local var64 = if constantsModule then constantsModule.ShieldCloseAnimationTweenTime else 0.4
		
		if p19 then
			var63 = if t.isInExperienceUIVREnabled then t_2.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else themeModule.transparency("DarkenBackground")
			quart = Enum.EasingStyle.Quad
			var64 = if constantsModule then constantsModule.ShieldOpenAnimationTweenTime else 0.5
		end
		if p20 then
			if t_2.DarkenBackgroundTween then
				t_2.DarkenBackgroundTween:Cancel()
				t_2.DarkenBackgroundTween = nil
			end
			t_2.DarkenBackground.BackgroundTransparency = var63
		else
			local tweenInfo = TweenInfo.new(var64, quart, Enum.EasingDirection.Out)
			
			if t_2.DarkenBackgroundTween then
				t_2.DarkenBackgroundTween:Cancel()
			end
			t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, { BackgroundTransparency = var63 })
			t_2.DarkenBackgroundTween:Play()
		end
		t_2.DarkenBackground.Visible = p19
	end else nil
	
	setVisibilityInternal = function(value, p19, p20, _, p21)
		-- upvalues: t (copy), t_2 (ref), perfUtilsModule (copy), robloxGui (copy), var62 (write), onScreenSizeChanged (ref), utilityModule (copy), var34 (ref), guiService (copy), themeModule (copy), experienceMenuSessionManagerInstance (copy), constantsModule (copy), gameSettings (copy), tweenService (copy), contextActionService (copy), var44 (ref), var46 (ref), shouldShowBottomBar (ref), setBottomBarBindings (ref), setBottomBarSelection (ref), userInputService (copy), var45 (ref), var10 (copy), VRService (copy), mouseIconOverrideService (copy), settingsHubCursorOverride (copy), removeBottomBarBindings (ref), chatSelectorModule (copy), fFlagEnableNewBackpack (copy), var1 (copy), inExperienceAppChatModalModule (copy), var11 (copy), var35 (ref), SHIELD_INACTIVE_POSITION (copy), rbxAnalyticsService (copy)
		local _ = nil
		local var63 = if t.isInExperienceUIVREnabled then p19 or not t_2.SettingsUIDelegate:isOpenCloseAnimationAllowed() else p19
		t_2.OpenStateChangedCount += 1
		local var64 = value ~= t_2.Visible
		t_2.Visible = value
		
		if t.FFlagEnableInGameMenuDurationLogger and var64 and not value then
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
			var62(t_2.Visible, var63)
		end
		if t_2.Visible then
			t_2.ResizedConnection = robloxGui.Changed:connect(function(p22)
				-- upvalues: onScreenSizeChanged (copy)
				if p22 == "AbsoluteSize" then
					onScreenSizeChanged()
				end
			end)
			
			if t.FFlagMenuButtonsMountWithIEM then
				if t.FFlagRelocateMobileMenuButtons and (t.FIntRelocateMobileMenuButtonsVariant == 1 or t.FIntRelocateMobileMenuButtonsVariant == 3 or t.FIntRelocateMobileMenuButtonsVariant == 2 and not utilityModule:IsSmallTouchScreen()) then
					var34()
				end
				if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant == 2 and (utilityModule:IsSmallTouchScreen() and t_2.PlayersPage) then
					t_2.PlayersPage:CreateMenuButtonsContainer()
				end
			end
			if not t.FFlagAddTraversalBackButton then
				if t_2.BackBarRef:getValue() then
					t_2.BackBarVisibleConnection = t_2.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end
				if t.EngineFeatureTeleportHistoryButtons and t_2.FrontBarRef:getValue() then
					t_2.FrontBarVisibleConnection = t_2.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end
			end
			onScreenSizeChanged()
			t_2.PreferredTransparencyChangedConnection = guiService:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
				-- upvalues: t_2 (copy), themeModule (copy), guiService (copy)
				t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
			end)
			t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
			t_2.SettingsShowSignal:fire(t_2.Visible)
			guiService:SetMenuIsOpen(true, "SettingsHub")
			experienceMenuSessionManagerInstance:OpenExperienceMenu()
			t_2.Shield.Visible = t_2.Visible
			guiService:CloseInspectMenu()
			
			if var63 or not t_2.Shield:IsDescendantOf(game) then
				t_2.Shield.Position = UDim2.new(0, 0, 0, 0)
				
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
						t_2.DarkenBackgroundTween = nil
					end
					t_2.DarkenBackground.BackgroundTransparency = themeModule.transparency("DarkenBackground")
				end
			else
				local var65 = if constantsModule then constantsModule.ShieldOpenAnimationTweenTime else 0.5
				
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
					t_2.ReducedMotionOpenTween.Completed:Connect(function(p22)
						-- upvalues: t_2 (copy)
						if p22 == Enum.PlaybackState.Completed then
							t_2.Shield.Parent = t_2.ClippingShield
							t_2.ReducedMotionOpenTween = nil
						end
						t_2.CanvasGroup.Visible = false
					end)
					
					if t.FFlagEnableInGameMenuDurationLogger then
						perfUtilsModule.menuOpenComplete()
					end
				else
					t_2.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, var65, true, function()
						-- upvalues: t (copy), perfUtilsModule (copy)
						if t.FFlagEnableInGameMenuDurationLogger then
							perfUtilsModule.menuOpenComplete()
						end
					end)
				end
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					local tweenInfo = TweenInfo.new(var65, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
					end
					t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, {
						BackgroundTransparency = themeModule.transparency("DarkenBackground")
					})
					t_2.DarkenBackgroundTween:Play()
				end
			end
			contextActionService:BindCoreAction("RbxSettingsHubStopCharacter", if t.isInExperienceUIVREnabled then function(p22, p23, p24)
				-- upvalues: t_2 (copy)
				return if t_2.SettingsUIDelegate:isInputEventNeededBySettings(p22, p23, p24) then Enum.ContextActionResult.Pass else nil
			end else function() end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			
			if not t.FFlagEnableSideSheet then
				contextActionService:BindCoreAction("RbxSettingsHubSwitchTab", var44, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			end
			contextActionService:BindCoreAction("RbxSettingsScrollHotkey", var46, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown)
			
			if shouldShowBottomBar() then
				setBottomBarBindings()
				setBottomBarSelection(t_2.Pages.CurrentPage)
			end
			if t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
			end
			if not t.FFlagEnableSideSheet then
				t_2.TabConnection = userInputService.InputBegan:connect(var45)
			end
			setOverrideMouseIconBehavior()
			var10 = userInputService.LastInputTypeChanged:connect(setOverrideMouseIconBehavior)
			
			if userInputService.MouseEnabled and not VRService.VREnabled then
				mouseIconOverrideService.push(settingsHubCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
			end
			t_2:CloseReactPage()
			
			if p20 then
				removeBottomBarBindings()
				t_2:SwitchToPage(p20, nil, 1, true)
			else
				t_2:SwitchToPage(t_2:GetFirstPageWithTabHeader(), nil, 1, true)
			end
			local var66 = if t.isInExperienceUIVREnabled and not t.InExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true
			
			if var66 then
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
					var1.setVisibility(var1.FeatureName.Backpack, false)
				else
					var66 = require(robloxGui.Modules.BackpackScript)
					
					if var66.IsOpen then
						var66:OpenClose()
					end
				end
			end
			if t.GetFFlagEnableAppChatInExperience() and inExperienceAppChatModalModule:getVisible() then
				var11 = true
				inExperienceAppChatModalModule.default:setVisible(false)
			end
			if not t.isInExperienceUIVREnabled then
				if fFlagEnableNewBackpack then
					var1.setVisibility(var1.FeatureName.Backpack, false)
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
					var35()
				end
				if t.FIntRelocateMobileMenuButtonsVariant == 2 and t_2.PlayersPage then
					t_2.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			if t.ChromeEnabled and t.FFlagEnableConsoleExpControls then
				require(robloxGui.Modules.Chrome.Service):setShortcutBar(nil)
			end
			if t.GetFFlagEnableAppChatInExperience() and var11 then
				var11 = false
			end
			if t.isInExperienceUIVREnabled and t.InExperienceUIVRIXP:isMovePanelToCenter() then
				playerListManagerModule:HideTemp("SettingsMenu", false)
				
				if not t.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled then
					chatSelectorModule:HideTemp("SettingsMenu", false)
				end
			end
			if var63 then
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
				local var67 = if constantsModule then constantsModule.ShieldCloseAnimationTweenTime else 0.4
				
				local function handleShieldClose()
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
					t_2.ReducedMotionCloseTween.Completed:Connect(function(p22)
						-- upvalues: t_2 (copy), SHIELD_INACTIVE_POSITION (copy)
						if p22 == Enum.PlaybackState.Completed then
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
				t_2.Shield:TweenPositionInternal(SHIELD_INACTIVE_POSITION, Enum.EasingDirection.In, Enum.EasingStyle.Quad, var67, true, function()
					-- upvalues: t_2 (copy), handleShieldClose (ref)
					t_2.Shield.Visible = t_2.Visible
					handleShieldClose()
				end)
				if not t.FFlagSettingsHubIndependentBackgroundVisibility and t_2.DarkenBackground then
					local tweenInfo = TweenInfo.new(var67, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					
					if t_2.DarkenBackgroundTween then
						t_2.DarkenBackgroundTween:Cancel()
					end
					t_2.DarkenBackgroundTween = tweenService:Create(t_2.DarkenBackground, tweenInfo, { BackgroundTransparency = 1 })
					t_2.DarkenBackgroundTween:Play()
				end
			end
			if var10 then
				var10:disconnect()
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
			source = p21,
			playsessionid = t_2.playSessionId,
			universeid = tostring(game.GameId)
		}
		
		if var64 then
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
	
	function t_2.SetVisibility(_, p19, p20, p21, p22, p23)
		-- upvalues: t_2 (ref), setVisibilityInternal (write)
		if t_2.Visible == p19 then
			return
		end
		setVisibilityInternal(p19, p20, p21, p22, p23)
	end
	
	function t_2.SetBackgroundVisibility(_, p19, p20)
		-- upvalues: t_2 (ref), var62 (write)
		if t_2.DarkenBackground.Visible == p19 then
			return
		end
		var62(p19, p20)
	end
	
	function t_2.GetVisibility(_)
		-- upvalues: t_2 (ref)
		return t_2.Visible
	end
	
	function t_2.ToggleVisibility(_, p19, p20)
		-- upvalues: setVisibilityInternal (write), t_2 (ref)
		setVisibilityInternal(not t_2.Visible, nil, nil, p19, p20)
	end
	
	function t_2.AddToMenuStack(_, p19)
		-- upvalues: t_2 (ref)
		if t_2.MenuStack[#t_2.MenuStack] ~= p19 then
			t_2.MenuStack[#t_2.MenuStack + 1] = p19
		end
	end
	
	function t_2.InviteToGame(_)
		-- upvalues: t (copy), IXPServiceWrapper (copy), gameInviteInviteExperimentVariant (copy), var5 (copy), userInputService (copy), var4 (copy), t_2 (ref), gameInviteModalManager (copy), gameInviteConstants (copy), robloxGui (copy)
		local var63 = false
		
		if t.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and t.FFlagLuaEnableGameInviteModalSettingsHub then
			local fStringGameInviteMenuLayer = t.GetFStringGameInviteMenuLayer()
			local var64 = IXPServiceWrapper:GetLayerData(fStringGameInviteMenuLayer)
			IXPServiceWrapper:LogUserLayerExposure(fStringGameInviteMenuLayer)
			
			if var64 and var64.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.UxRefresh then
				var63 = var64.inExperienceGameInviteUXRefresh2023 ~= gameInviteInviteExperimentVariant.InviteLimit
			end
		end
		if game:GetEngineFeature("PlatformFriendsService") and var5 and var5:IsInviteFriendsEnabled() then
			var5:ShowInviteFriendsUI()
			
			return
		elseif userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			if var4 then
				var4:PopupGameInviteUI()
				
				return
			end
		elseif var63 then
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
	
	function t_2.PopMenu(_, _, p19, p20)
		-- upvalues: t_2 (ref), poppedMenu (ref), t (copy), robloxGui (copy)
		if t_2.MenuStack and #t_2.MenuStack > 0 then
			local var63 = t_2.MenuStack[#t_2.MenuStack]
			
			if type(var63) ~= "table" then
				poppedMenu:Fire(var63)
			end
			table.remove(t_2.MenuStack, #t_2.MenuStack)
			t_2:SwitchToPage(t_2.MenuStack[#t_2.MenuStack], true, 1, p19)
			
			if #t_2.MenuStack == 0 then
				if t.FFlagAddUILessMode then
					t_2:SetVisibility(false, nil, nil, nil, p20)
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
				t_2:ToggleVisibility(nil, p20)
				
				return
			end
			t_2:ToggleVisibility(p20)
		end
	end
	
	function t_2.ShowShield(_)
		-- upvalues: userInputService (copy), SETTINGS_SHIELD_TRANSPARENCY (copy), t_2 (ref)
		t_2.Shield.BackgroundTransparency = if userInputService.VREnabled then 1 else SETTINGS_SHIELD_TRANSPARENCY
	end
	
	function t_2.HideShield(_)
		-- upvalues: t_2 (ref)
		t_2.Shield.BackgroundTransparency = 1
	end
	
	function t_2.ShowReactPage(_)
		-- upvalues: t_2 (ref)
		if t_2.reactPage then
			t_2.reactPageAnalytics:openPage(t_2.reactPage.name)
		end
		t_2.ReactPage.Visible = true
		t_2.Page.Visible = false
	end
	
	function t_2.HideReactPage(_)
		-- upvalues: t_2 (ref)
		if t_2.reactPage then
			t_2.reactPageAnalytics:closePage(t_2.reactPage.name)
		end
		local visible = t_2.ReactPage.Visible
		t_2.ReactPage.Visible = false
		t_2.Page.Visible = true
		
		if t_2.Pages.CurrentPage and visible and t_2.Visible then
			t_2.Pages.CurrentPage:SelectARow(true)
		end
	end
	
	function t_2.MountReactPage(_)
		-- upvalues: reactPageSignalModule (copy), t_2 (ref), reactRobloxModule (copy)
		reactPageSignalModule(false).setCurrentReactPage(nil)
		
		if t_2.reactPageRoot then
			t_2:UnmountReactPage()
		end
		t_2.reactPageRoot = reactRobloxModule.createRoot(t_2.ReactPage)
	end
	
	function t_2.UnmountReactPage(_)
		-- upvalues: t_2 (ref)
		if t_2.reactPageRoot then
			t_2.reactPageRoot:unmount()
			t_2.reactPageRoot = nil
		end
	end
	
	function t_2.CloseReactPage(_)
		-- upvalues: t_2 (ref)
		t_2:HideReactPage()
		t_2:UnmountReactPage()
	end
	
	function t_2.SwitchToReactPage(_, p19, p20, p21)
		-- upvalues: t_2 (ref)
		if p21 then
			t_2:UnmountReactPage()
		elseif p19 then
			t_2.reactPage = p19
			
			if not t_2.reactPageRoot then
				t_2:MountReactPage()
			end
			t_2.reactPageRoot:render(p19:createPage(p20))
		end
		t_2:ShowReactPage()
	end
	
	t_2.GameSettingsPageReorderIXPFetched = false
	local var63 = nil
	local var64 = nil
	
	local function enableVR()
		-- upvalues: corePackagesService (copy), t_2 (ref), var63 (write)
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
		var63 = t_2.SettingsShowSignal:connect(function(p19)
			-- upvalues: settingsMenu (ref), VRHub (ref)
			if p19 then
				settingsMenu:SetVisible(true)
				VRHub:FireModuleOpened("SettingsMenu")
				
				return
			end
			settingsMenu:SetVisible(false)
			VRHub:FireModuleClosed("SettingsMenu")
		end)
		VRHub.ModuleOpened.Event:connect(function(p19)
			-- upvalues: t_2 (copy)
			if p19 ~= "SettingsMenu" then
				t_2:SetVisibility(false)
			end
		end)
	end
	
	local function disableVR()
		-- upvalues: t_2 (ref), robloxGui (copy), var63 (write), var64 (write), corePackagesService (copy)
		t_2.ClippingShield.Parent = robloxGui
		t_2.Shield.Parent.ClipsDescendants = true
		t_2.VRShield.Visible = false
		t_2:ShowShield()
		
		if var63 then
			var63:disconnect()
			var63 = nil
		end
		if var64 then
			var64:disconnect()
			var64 = nil
		end
		require(corePackagesService.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false)
	end
	
	local _ = function()
		-- upvalues: onScreenSizeChanged (ref), t_2 (ref), themeModule (copy), guiService (copy), resizeBottomBarButtons (ref)
		onScreenSizeChanged()
		t_2.MenuContainer.BackgroundTransparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
		resizeBottomBarButtons()
	end
	
	local function OnVREnabled(p19)
		-- upvalues: userInputService (copy), t (copy), t_2 (ref), onScreenSizeChanged (ref), themeModule (copy), guiService (copy), resizeBottomBarButtons (ref), enableVR (ref), disableVR (ref)
		if p19 == "VREnabled" then
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
	if not var2 and GetCorePackagesLoaded({ "Roact", "Rodux", "RoactRodux" }) then
		local corePackagesService_1 = game:GetService("CorePackages")
		t_2.ShareGameApp = require(robloxGui.Modules.Settings.ShareGameMaster).createApp(t_2.PageViewClipper, gameInviteAnalytics.new():withEventStream(require(corePackagesService_1.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new(rbxAnalyticsService)):withDiag(require(corePackagesService_1.Workspace.Packages.Analytics).AnalyticsReporters.Diag.new(rbxAnalyticsService)):withButtonName(gameInviteAnalytics.ButtonName.SettingsHub))
		t_2.ShareGamePage = require(robloxGui.Modules.Settings.Pages.ShareGamePlaceholderPage)
		t_2.ShareGamePage:ConnectHubToApp(t_2, t_2.ShareGameApp)
		t_2:AddPage(t_2.ShareGamePage)
	end
	local var65 = capturesPolicy.PolicyImplementation.read()
	
	if (if var65 then capturesPolicy.Mapper(var65).eligibleForCapturesFeature() else false) and (if t.isInExperienceUIVREnabled and t.FFlagFixSpatialUICaptures then not isSpatial() else true) then
		local capturesPageWrapperModule = require(robloxGui.Modules.Settings.Pages.CapturesPageWrapper)
		
		local function closeSettingsMenu()
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
		contextActionService:BindCoreAction("RBXEscapeMainMenu", function(_, p19, _)
			-- upvalues: t (copy), getSideSheetVisibility (copy), toggleSideSheet (copy), t_2 (ref), constantsModule (copy)
			if p19 ~= Enum.UserInputState.Begin then return end
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
	guiService.ShowLeaveConfirmation:connect(function()
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
	userInputService.InputBegan:connect(function(p19)
		-- upvalues: t_2 (ref), guiService (copy)
		if (p19.KeyCode == Enum.KeyCode.Left or p19.KeyCode == Enum.KeyCode.Right or (p19.KeyCode == Enum.KeyCode.Up or p19.KeyCode == Enum.KeyCode.Down)) and (t_2.Visible and t_2.Active and (t_2.Pages.CurrentPage and guiService.SelectedCoreObject == nil)) then
			t_2.Pages.CurrentPage:SelectARow()
		end
	end)
	local var66 = false
	
	local _ = function()
		-- upvalues: var66 (write), IXPServiceWrapper (copy), t (copy)
		if var66 then
			return
		end
		var66 = true
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
	end
	
	if t.FFlagRemoveExitModal and isSubjectToDesktopPolicies() then
		game:GetService("GuiService").NativeClose:Connect(function()
			-- upvalues: t (copy), var66 (write), IXPServiceWrapper (copy), leaveGameModule (copy)
			if t.FFlagEnableExitModalExposure and not var66 then
				var66 = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
			end
			leaveGameModule(false, { shouldNativeExit = true })
		end)
		
		if t_2.FullScreenTitleBar then
			t_2.FullScreenTitleBar = settingsFullScreenTitleBarModule.update(t_2.FullScreenTitleBar, {
				onClose = function()
					-- upvalues: t (copy), var66 (write), IXPServiceWrapper (copy), leaveGameModule (copy)
					if t.FFlagEnableExitModalExposure and not var66 then
						var66 = true
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t.GetFStringExitModalIXPLayer())
					end
					leaveGameModule(false, { shouldNativeExit = true })
				end
			})
		end
	elseif t_2.ExitModalPage then
		local buttonsContainer
		local function showExitModal()
			-- upvalues: t (copy), var66 (write), IXPServiceWrapper (copy), t_2 (ref), removeBottomBarBindings (ref)
			if t.FFlagEnableExitModalExposure and not var66 then
				var66 = true
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
		
		local function handleNativeExit()
			-- upvalues: t_2 (ref), t (copy), perfUtilsModule (copy), var35 (ref), showExitModal (ref)
			if not t_2:GetVisibility() or t_2.Pages.CurrentPage ~= t_2.ExitModalPage then
				showExitModal()
				
				return
			elseif t.FFlagEnableInGameMenuDurationLogger then
				perfUtilsModule.leavingGame()
			end
			if t.FFlagRelocateMobileMenuButtons and t.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				var35()
				
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
		t_2.SettingsShowSignal:connect(function(p19)
			-- upvalues: buttonsContainer (write), inExperienceAppChatModalModule (copy), t_2 (ref)
			if p19 then
				buttonsContainer = inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p20)
					-- upvalues: t_2 (copy)
					if p20 and t_2.Visible then
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
	t_2.InExperienceMenuReact = create("Folder")({
		Name = "InExperienceMenuReact",
		Parent = t_2.ClippingShield
	})
	buttonsContainer = t_2.PlayersPage.ButtonsContainer
	
	local var67 = function(p19)
		-- upvalues: reactModule (copy), t_2 (ref), signalsModule (copy), t (copy), isSpatial (copy), portalWithFoundationStylelinkModule (copy), traversalHistoryMenu (copy)
		local var68, var69 = reactModule.useState(p19.showSignal(false) and t_2.Visible)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var69 (ref), p19 (ref), t_2 (copy)
			local var70 = signalsModule.createEffect(function(p20)
				-- upvalues: var69 (copy), p19 (copy), t_2 (copy)
				var69(p19.showSignal(p20) and t_2.Visible)
			end)
			local settingsShowSignalConnection = t_2.SettingsShowSignal:connect(function(p20)
				-- upvalues: var69 (copy), p19 (copy)
				var69(p19.showSignal(false) and p20)
			end)
			
			return function()
				-- upvalues: var70 (ref), settingsShowSignalConnection (ref)
				var70()
				settingsShowSignalConnection:Disconnect()
			end
		end, {})
		
		return t.FFlagAddTraversalHistory and (not (t.isInExperienceUIVREnabled and isSpatial()) and (p19.parent and (var68 and reactModule.createElement(portalWithFoundationStylelinkModule, { parent = p19.parent }, {
			TraversalHistoryMenu = reactModule.createElement(traversalHistoryMenu, {
				anchorParent = p19.parent,
				currentPageChangeSignal = p19.currentPageChangeSignal,
				menuSide = p19.menuSide
			})
		}))))
	end
	
	reactRobloxModule.createRoot(t_2.InExperienceMenuReact):render(reactModule.createElement(inExperienceMenuReactModule, nil, {
		InExperienceMenuReactPage = reactModule.createElement(inExperienceMenuReactPageModule, {
			onMount = function()
				-- upvalues: t_2 (ref)
				t_2:SwitchToReactPage(nil, nil, true)
			end,
			onUnmount = function()
				-- upvalues: t_2 (ref), reactPageSignalModule (copy)
				t_2:CloseReactPage()
				reactPageSignalModule(false).setCurrentReactPage(nil)
			end,
			mountTo = t_2.ReactPage
		}),
		TraversalHistoryMenuBottomBar = reactModule.createElement(var67, {
			showSignal = t_2.showBottomBarSignal,
			parent = if t.FFlagAddTraversalHistory then t_2.LeaveGameButton else nil,
			menuSide = foundationModule.Enums.PopoverSide.Top,
			currentPageChangeSignal = t_2.CurrentPageSignal
		}),
		TraversalHistoryMenuMobileButton = reactModule.createElement(var67, {
			showSignal = signalsModule.createComputed(function(p19)
				-- upvalues: t_2 (ref)
				return not t_2.showBottomBarSignal(p19)
			end),
			parent = if buttonsContainer then buttonsContainer:FindFirstChild("LeaveButtonButton", true) else nil,
			menuSide = foundationModule.Enums.PopoverSide.Bottom,
			currentPageChangeSignal = t_2.CurrentPageSignal
		})
	}))
	
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
VRHub.ModuleOpened.Event:connect(function(p19)
	-- upvalues: t_2 (ref), VRHub (ref)
	if p19 ~= t_2.ModuleName and VRHub:GetModule(p19).VRIsExclusive then
		t_2:SetVisibility(false)
	end
end)
local var62 = CreateSettingsHub()

function t_2.GetExperienceControlStore(_)
	-- upvalues: var62 (ref)
	return var62:GetExperienceControlStore()
end

function t_2.SetVisibility(_, p19, p20, p21, p22, p23)
	-- upvalues: var62 (ref)
	var62:SetVisibility(p19, p20, p21, p22, p23)
end

function t_2.SetBackgroundVisibility(_, p19, p20)
	-- upvalues: var62 (ref)
	var62:SetBackgroundVisibility(p19, p20)
end

function t_2.ToggleVisibility(_, p19, p20)
	-- upvalues: var62 (ref)
	var62:ToggleVisibility(p19, p20)
end

function t_2.SwitchToPage(_, p19, p20)
	-- upvalues: var62 (ref)
	var62:SwitchToPage(p19, p20, 1)
end

if t.FFlagAddUILessMode and t.FIntAddUILessModeVariant ~= 0 then
	function t_2.PopMenu(_, p19, p20, p21)
		-- upvalues: var62 (ref)
		return var62:PopMenu(p19, p20, p21)
	end
end
function t_2.GetVisibility(_)
	-- upvalues: var62 (ref)
	return var62.Visible
end

function t_2.ShowShield(_)
	-- upvalues: var62 (ref)
	var62:ShowShield()
end

function t_2.HideShield(_)
	-- upvalues: var62 (ref)
	var62:HideShield()
end

function t_2.GetRespawnBehaviour(_)
	-- upvalues: var62 (ref)
	return var62:GetRespawnBehaviour()
end

function t_2.CloseReactPage(_)
	-- upvalues: var62 (ref)
	var62:CloseReactPage()
end

function t_2.SwitchToReactPage(_, p19, p20, p21)
	-- upvalues: var62 (ref)
	var62:SwitchToReactPage(p19, p20, p21)
end

if t.FFlagAddInviteFriendsIntegration then
	function t_2.InviteToGame(_)
		-- upvalues: var62 (ref)
		var62:InviteToGame()
	end
end
t_2.RespawnBehaviourChangedEvent = var62.RespawnBehaviourChangedEvent
t_2.SettingsShowSignal = var62.SettingsShowSignal
t_2.CurrentPageSignal = var62.CurrentPageSignal
t_2.SettingsShowEvent = Instance.new("BindableEvent")
var62.SettingsShowSignal:connect(function(p19)
	-- upvalues: t_2 (ref)
	t_2.SettingsShowEvent:Fire(p19)
end)
t_2.Instance = var62

return t_2