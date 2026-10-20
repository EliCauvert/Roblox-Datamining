local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local Contexts = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = script:FindFirstAncestor("Modules")
local AppPageModule = require(Modules.LuaApp.AppPage)
local UserModule = require(Modules.LuaApp.Models.User)
local JoinGameModule = require(Modules.LuaApp.Util.joinGame)
local ConfigModule = require(Modules.LuaApp.Config)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local PerformanceTestingModule = require(Modules.LuaApp.PerformanceTesting)
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
local SetAppLoadedModule = require(CorePackages.Workspace.Packages.AppChat.SetAppLoaded)
local SquadAppChatEventReceiver = require(CorePackages.Workspace.Packages.SquadsCore.Components).SquadAppChatEventReceiver
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local Llama = require(CorePackages.Packages.LuaSocialLibrariesDeps).llama
local FormatUserModule = require(script.Parent.Parent.utils.formatUser)
local ChatEventReceiverModule = require(CorePackages.Workspace.Packages.AppChat.ChatEventReceiver)
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local SignalModule = require(Modules.Common.Signal)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local AndroidBackButtonConnectionFunction = require(CorePackages.Workspace.Packages.SocialTab).AndroidBackButtonConnection
local EnumScreens = require(CorePackages.Workspace.Packages.SocialTab).EnumScreens
local ContainerModule = require(Modules.LuaApp.Components.SocialTab.SocialTabLoader.Container)
local Context = require(Modules.LuaApp.Components.SocialTab.SocialTab).Context
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local PlayerSearchModule = require(Modules.LuaApp.Components.UserSearch.Players.PlayerSearch)
local OffPlatformFriendRequestsIXP = require(CorePackages.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP
local NotificationsUpsellModule = require(CorePackages.Workspace.Packages.NotificationsUpsell)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local EntryPointModule = require(CorePackages.Workspace.Packages.AppChat.EntryPoint)
local ContainerModule1 = require(Modules.LuaApp.Components.Chat.ExternalNavigationHandler.Container)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseIsStickyShortcutBarEnabledFunction = require(CorePackages.Workspace.Packages.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ConvertUniverseIdToString = SharedFlagsModule.ConvertUniverseIdToString
local CommunityListExperimentation = require(CorePackages.Workspace.Packages.Groups).Experiments.CommunityListExperimentation
local GetFFlagEnableCommunityListExperimentationFunction = SharedFlagsModule.GetFFlagEnableCommunityListExperimentation
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local WithThrottleFramerateGivenPolicyModule = require(Modules.LuaApp.Common.withThrottleFramerateGivenPolicy)
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local Default1 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local SocialTabShouldRequestPushPermissions = game:DefineFastFlag("SocialTabShouldRequestPushPermissions", false)
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local GetFFlagEnablePushNotificationsUpsellModalFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local PushUpsellExposureLogFix = game:DefineFastFlag("PushUpsellExposureLogFix", false)
local GetFStringPushUpsellVariantNameFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringPushUpsellVariantName
local FFlagSquadAppChatRTNFix = SharedFlagsModule.FFlagSquadAppChatRTNFix
local FFlagShareTargetGameCleanup = SharedFlagsModule.FFlagShareTargetGameCleanup
local FFlagLuaAppEnableStickyShortcutBar = SharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local FFlagContactImporterIXPCleanup = SharedFlagsModule.FFlagContactImporterIXPCleanup
local FFlagCreateConnectionsHub = SharedFlagsModule.FFlagCreateConnectionsHub
local FFlagFixSocialTabBottomBarCutOffModule = require(Modules.LuaApp.Flags.FFlagFixSocialTabBottomBarCutOff)
local FFlagGuacStickyShortcutBarEnabled = SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local SocialTabUniversalAppWrapper = RoactModule.PureComponent:extend("SocialTabUniversalAppWrapper")
SocialTabUniversalAppWrapper.defaultProps = {
	renderSocialTab = function()
		-- upvalues: RoactModule (copy), ContainerModule (copy)
		return RoactModule.createElement(ContainerModule)
	end,
	renderRoactChat = function()
		-- upvalues: Context (copy), RoactModule (copy), EntryPointModule (copy)
		return Context.with(function(p1)
			-- upvalues: RoactModule (upval), EntryPointModule (upval)
			return p1.wasEverVisible and RoactModule.createElement(EntryPointModule, p1) or nil
		end)
	end,
	runService = RunService
}

function SocialTabUniversalAppWrapper.init(p1)
	-- upvalues: RoactModule (copy), AndroidBackButtonConnectionFunction (copy), NotificationTypeModule (copy), SignalModule (copy), PerformanceTestingModule (copy), RobloxEventReceiver (copy), ContainerModule1 (copy), Logger (copy), RoactNavigationModule (copy), EnumScreens (copy), Llama (copy), AppPageModule (copy), GetFFlagEnableCommunityListExperimentationFunction (copy), CommunityListExperimentation (copy), FormatUserModule (copy), FFlagCreateConnectionsHub (copy), Contexts (copy), SearchTypes (copy), GetFFlagIsSquadEnabledFunction (copy), PlayerSearchModule (copy), RunService (copy), GetDefaultQualityLevelFunction (copy), FFlagShareTargetGameCleanup (copy), SocialTabShouldRequestPushPermissions (copy), GetFFlagEnablePushNotificationsUpsellModalFunction (copy), PushUpsellExposureLogFix (copy), NotificationsUpsellModule (copy), Default1 (copy), Default (copy), MemoizeFunction (copy), UserInputService (copy), EntryPointModule (copy), UseRoactServiceModule (copy), RoactAnalyticsModule (copy), RoactAnalyticsCommonGameEvents (copy), JoinGameModule (copy), OpenGameDetailsModule (copy), NavigateDownModule (copy), UserModule (copy), ConvertUniverseIdToString (copy), SetAppLoadedModule (copy), ConfigModule (copy), FFlagContactImporterIXPCleanup (copy)
	p1.state = {
		wasChatEverTapped = p1.props.isVisible,
		externalNavigationByScreen = {}
	}
	p1.chatToastRef = RoactModule.createRef()
	p1.androidBackButtonConnection = AndroidBackButtonConnectionFunction(p1.props.guiService, NotificationTypeModule)
	p1.androidBackButtonConnectionSocialTab = AndroidBackButtonConnectionFunction(p1.props.guiService, NotificationTypeModule)
	p1._rnBypassActionSignal = SignalModule.new()
	p1._rnBypassActionSignalSocialTab = SignalModule.new()
	p1.backButtonEnabled = false
	p1._performanceTesting = PerformanceTestingModule
	p1._robloxEventReceiver = RobloxEventReceiver.new(p1.props.notificationService)
	
	function p1.renderOnLoaded()
		-- upvalues: p1 (copy), RoactModule (upval), ContainerModule1 (upval)
		return if p1.state.wasChatEverTapped then RoactModule.createFragment({
			screen = p1.props.renderSocialTab(),
			externalNavigation = RoactModule.createElement(ContainerModule1, { navigationByScreen = p1.state.externalNavigationByScreen })
		}) else nil
	end
	
	function p1.setBackButtonEnabled(BackButtonEnabled)
		-- upvalues: p1 (copy)
		p1.backButtonEnabled = BackButtonEnabled
	end
	
	function p1.setTabBarVisibleFromChat(IsTabBarEnabled)
		-- upvalues: p1 (copy)
		p1.props.setTabBarVisibleFromChat(if p1.props.shouldSystemBarUsuallyBePresent then true else IsTabBarEnabled)
	end
	
	function p1.setActiveConversationId(p2)
		-- upvalues: Logger (upval), p1 (copy), RoactModule (upval)
		Logger:debug("{} setting activeConversationId as {}", script.Name, p2)
		p1:setState({ activeConversationId = p2 or RoactModule.None })
	end
	
	function p1.getActiveConversationId()
		-- upvalues: p1 (copy)
		return p1.state.activeConversationId
	end
	
	function p1.initRoactChatNavigation()
		-- upvalues: p1 (copy), RoactNavigationModule (upval), EnumScreens (upval)
		p1._rnBypassActionSignalSocialTab:fire(RoactNavigationModule.Actions.navigate({ routeName = EnumScreens.RoactChat }))
	end
	
	function p1.updateExternalNavigationForScreen(p2, p3)
		-- upvalues: p1 (copy), Llama (upval)
		p1:setState(function(p4, _)
			-- upvalues: p2 (copy), Llama (upval), p3 (copy)
			if p2 then
				return {
					externalNavigationByScreen = Llama.Dictionary.join(p4.externalNavigationByScreen, { [p3] = p2 })
				}
			else
				local CopyResult = Llama.Dictionary.copy(p4.externalNavigationByScreen)
				CopyResult[p3] = nil
				
				return { externalNavigationByScreen = CopyResult }
			end
		end)
	end
	
	function p1.navigateDownToNotifications(p2)
		-- upvalues: p1 (copy)
		local P9 = p2 or false
		p1.props.navigateDownToNotifications(function()
			-- upvalues: P9 (ref), p1 (upval)
			if P9 then
				p1.setTabBarVisibleFromChat(true)
			end
		end)
	end
	
	function p1.navigateToCoHubAddConnections()
		-- upvalues: p1 (copy), AppPageModule (upval)
		p1.props.navigation.navigate(AppPageModule.CoHubAddConnections)
	end
	
	function p1.openProfileWebView(p2)
		-- upvalues: p1 (copy)
		p1.props.navigateDownToViewUserProfile(p2, function()
			-- upvalues: p1 (upval)
			if p1.props.wideMode then
				p1.setTabBarVisibleFromChat(p1.props.wideMode)
			end
		end)
	end
	
	function p1.openProfilePeekView(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.openProfilePeekView(p2, {
			resetPeekView = true,
			onClose = function()
				-- upvalues: p1 (upval), p3 (copy)
				if p1.state.getIsTabBarEnabled then
					p1.setTabBarVisibleFromChat(p1.state.getIsTabBarEnabled())
				end
				if p3 and p3.onClose then
					p3.onClose()
				end
			end,
			onOpen = function()
				-- upvalues: p1 (upval), p3 (copy)
				p1.setTabBarVisibleFromChat(false)
				
				if p3 and p3.onOpen then
					p3.onOpen()
				end
			end
		})
	end
	
	function p1.navigateDownToReportAbuse(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.useLuafiedReportFlow then
			p1.props.openReportDialog(p2, p3)
			
			return
		else
			p1.props.navigateDownToReportAbuse(p2, p3)
		end
	end
	
	function p1.navigateDownToPrivacySettings()
		-- upvalues: p1 (copy)
		p1.props.navigateDownToPrivacySettings()
	end
	
	function p1.navigateDownToGroups()
		-- upvalues: p1 (copy), GetFFlagEnableCommunityListExperimentationFunction (upval), CommunityListExperimentation (upval)
		local function v64()
			-- upvalues: p1 (upval)
			p1.setTabBarVisibleFromChat(true)
		end
		
		if GetFFlagEnableCommunityListExperimentationFunction() then
			CommunityListExperimentation.logExposure()
		end
		if GetFFlagEnableCommunityListExperimentationFunction() and CommunityListExperimentation.getCommunityListEnabled() then
			p1.props.openGroupsListPage(v64)
			
			return
		else
			p1.props.navigateDownToGroups(v64)
		end
	end
	
	function p1.navigateDownToAddFriends()
		-- upvalues: p1 (copy)
		p1.props.navigateDownToAddFriends(function()
			-- upvalues: p1 (upval)
			p1.setTabBarVisibleFromChat(true)
		end)
	end
	
	function p1.navigateToHomePage()
		-- upvalues: p1 (copy), AppPageModule (upval)
		p1.props.navigation.navigate(AppPageModule.Home)
	end
	
	function p1.FriendFinder()
		-- upvalues: p1 (copy)
		p1.props.navigateDownToFriendFinder(function()
			-- upvalues: p1 (upval)
			p1.setTabBarVisibleFromChat(true)
		end)
	end
	
	function p1.AddFriendsAccountProvider(p2)
		-- upvalues: p1 (copy)
		p1.props.navigateDownToAddFriendsAccountProvider(p2)
	end
	
	function p1.setIsTabBarEnabled(GetIsTabBarEnabled)
		-- upvalues: p1 (copy)
		p1:setState({ getIsTabBarEnabled = GetIsTabBarEnabled })
	end
	
	function p1.openUserContextualMenu(p2)
		-- upvalues: Llama (upval), p1 (copy), FormatUserModule (upval)
		local OnCloseFunction = p2.onClose
		p1.props.openContextualMenu((Llama.Dictionary.join(p2, {
			onCloseGameDetails = function()
				-- upvalues: p1 (upval)
				p1.setTabBarVisibleFromChat(true)
			end,
			onClose = function()
				-- upvalues: OnCloseFunction (copy)
				if OnCloseFunction then
					OnCloseFunction()
				end
			end,
			onCloseProfileWebview = function()
				-- upvalues: p1 (upval)
				p1.setTabBarVisibleFromChat(true)
			end,
			user = FormatUserModule(p2.user)
		})))
	end
	
	function p1.navigateToUserInfo(p2, p3)
		-- upvalues: p1 (copy), Llama (upval), FormatUserModule (upval)
		if not p3 then
			p1.openProfileWebView(p2)
			
			return
		end
		local ContextualMenuProps = p3.contextualMenuProps or {}
		
		if p3.contextualMenuProps then
			ContextualMenuProps = Llama.Dictionary.join(ContextualMenuProps, {
				onCloseGameDetails = function()
					-- upvalues: p1 (upval)
					p1.setTabBarVisibleFromChat(true)
				end,
				onClose = function()
					-- upvalues: p3 (copy)
					if p3.contextualMenuProps.onClose then
						p3.contextualMenuProps.onClose()
					end
				end,
				onCloseProfileWebview = function()
					-- upvalues: p1 (upval)
					p1.setTabBarVisibleFromChat(true)
				end,
				user = FormatUserModule(p3.contextualMenuProps.user)
			})
		end
		p1.props.navigateToUserInfo(p2, {
			contextualMenuProps = ContextualMenuProps,
			profilePeekViewProps = Llama.Dictionary.join(p3.profilePeekViewProps or {}, {
				resetPeekView = true,
				onClose = function()
					-- upvalues: p1 (upval), p3 (copy)
					if p1.state.getIsTabBarEnabled then
						p1.setTabBarVisibleFromChat(p1.state.getIsTabBarEnabled())
					end
					if p3.profilePeekViewProps and p3.profilePeekViewProps.onClose then
						p3.profilePeekViewProps.onClose()
					end
				end,
				onOpen = function()
					-- upvalues: p1 (upval), p3 (copy)
					p1.setTabBarVisibleFromChat(false)
					
					if p3.profilePeekViewProps and p3.profilePeekViewProps.onOpen then
						p3.profilePeekViewProps.onOpen()
					end
				end,
				source = p3.source
			}),
			openJoinable = p3.openJoinable,
			entryPoint = p3.entryPoint
		})
	end
	
	p1.navigateToLuaAppPages = {
		[EnumScreens.GameDetail] = p1.props.navigateToGameDetails,
		[EnumScreens.ViewUserProfile] = p1.navigateToUserInfo,
		[EnumScreens.Notifications] = p1.navigateDownToNotifications,
		[EnumScreens.LearnMore] = p1.props.openLearnMoreLink,
		[EnumScreens.ReportAbuse] = p1.navigateDownToReportAbuse,
		[EnumScreens.PrivacySettings] = p1.navigateDownToPrivacySettings,
		[EnumScreens.CoHubAddConnections] = if FFlagCreateConnectionsHub then p1.navigateToCoHubAddConnections else nil,
		[EnumScreens.AddFriends] = p1.navigateDownToAddFriends,
		[EnumScreens.Groups] = p1.navigateDownToGroups,
		[EnumScreens.FriendFinder] = p1.FriendFinder,
		[EnumScreens.AddFriendsAccountProvider] = p1.AddFriendsAccountProvider,
		[EnumScreens.ViewUser] = p1.openUserContextualMenu,
		[EnumScreens.VerifiedBadgeModal] = p1.props.openVerifiedBadgeModal,
		[EnumScreens.DiscoverabilityModal] = p1.props.openDiscoverabilityModal,
		[EnumScreens.ProfileQRCode] = function()
			-- upvalues: p1 (copy), Contexts (upval)
			p1.props.navigateTo3DQRCodePage({ source = Contexts.AddFriends })
		end,
		[EnumScreens.SearchPage] = function()
			-- upvalues: p1 (copy), AppPageModule (upval), SearchTypes (upval)
			p1.props.navigation.navigate(AppPageModule.SearchPage, { defaultSearchType = SearchTypes.Players })
		end,
		[EnumScreens.AmpWizardContainer] = p1.props.openAmpWizardContainer,
		[EnumScreens.Home] = if GetFFlagIsSquadEnabledFunction() then p1.navigateToHomePage else nil
	}
	p1.luaAppPages = { playerSearchPage = PlayerSearchModule }
	local Connection = nil
	Connection = RunService.RenderStepped:Connect(function()
		-- upvalues: Connection (ref), GetDefaultQualityLevelFunction (upval)
		if Connection then
			Connection:Disconnect()
		end
		settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
	end)
	
	function p1.onBackButtonPressed()
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		if p1.props.canGoBack then
			p1.props.navigateBack()
			
			return
		end
		if p1.backButtonEnabled then
			p1._rnBypassActionSignal:fire(RoactNavigationModule.Actions.back())
			
			return
		else
			p1.androidBackButtonConnection.showExitDialog()
		end
	end
	
	function p1.isAndroidBackButtonHandlerDisabled(AvatarExperienceWrapper)
		-- upvalues: AppPageModule (upval), FFlagShareTargetGameCleanup (upval)
		return AvatarExperienceWrapper == AppPageModule.GameDetail or ((if FFlagShareTargetGameCleanup then nil else AvatarExperienceWrapper == AppPageModule.ShareGameToChat) or (AvatarExperienceWrapper == AppPageModule.AvatarExperienceWrapperTransparent or (AvatarExperienceWrapper == AppPageModule.AvatarExperienceWrapper or AvatarExperienceWrapper == AppPageModule.ProfilePlatform)))
	end
	
	p1._navigatingFromSocialTabEvent = nil
	
	function p1.setNavigatingFromSocialTabEvent(EndPage)
		-- upvalues: p1 (copy), EnumScreens (upval)
		p1._navigatingFromSocialTabEvent = {
			startTime = os.clock(),
			startPage = EnumScreens.SocialTab,
			endPage = EndPage
		}
	end
	
	function p1.getNavigatingFromSocialTabEvent()
		-- upvalues: p1 (copy)
		return p1._navigatingFromSocialTabEvent
	end
	
	if SocialTabShouldRequestPushPermissions then
		local NotificationsCanReceivePush = p1.props.shouldShowPushUpsell and p1.props.notificationsCanReceivePush
		
		if GetFFlagEnablePushNotificationsUpsellModalFunction and NotificationsCanReceivePush then
			if p1.props.pushUpsellVariant ~= nil then
				if if PushUpsellExposureLogFix then p1.props.pushUpsellVariant == 0 else p1.props.pushUpsellVariant > -1 then
					local ModalEventConstants = NotificationsUpsellModule.ModalEventConstants
					Default1:logRobloxTelemetryEvent(NotificationsUpsellModule.PushUpsellEventConfig, {}, {
						[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
						[ModalEventConstants.EntryPoint] = AppPageModule.Chat
					})
				end
				if p1.props.pushUpsellVariant <= 0 then
					Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS })
				end
			end
		elseif NotificationsCanReceivePush then
			Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS })
		end
	end
	p1.generateContext = MemoizeFunction(function(IsVisible, LocalUserId, NavigationProps, NotificationCount, PageType, Parameters, WideMode, p2, IsLuaProfilePageEnabled, LuaAddFriendsPageEnabled)
		-- upvalues: p1 (copy), Logger (upval), UserInputService (upval), EntryPointModule (upval), SignalModule (upval), UseRoactServiceModule (upval), RoactAnalyticsModule (upval), RoactAnalyticsCommonGameEvents (upval), JoinGameModule (upval), OpenGameDetailsModule (upval), NavigateDownModule (upval), UserModule (upval), AppPageModule (upval), ConvertUniverseIdToString (upval), SetAppLoadedModule (upval), ConfigModule (upval), PerformanceTestingModule (upval), NotificationTypeModule (upval), FFlagContactImporterIXPCleanup (upval)
		return {
			wasEverVisible = p1.state.wasEverVisible,
			localUserId = LocalUserId,
			isVisible = IsVisible,
			pageType = PageType,
			parameters = Parameters,
			navigationProps = NavigationProps,
			logger = Logger,
			navigateToLuaAppPages = p1.navigateToLuaAppPages,
			rnBypassActionSignal = p1._rnBypassActionSignal,
			rnBypassActionSignalSocialTab = p1._rnBypassActionSignalSocialTab,
			getActiveConversationId = p1.getActiveConversationId,
			setActiveConversationId = p1.setActiveConversationId,
			setBackButtonEnabled = p1.setBackButtonEnabled,
			setTabBarVisible = p1.setTabBarVisibleFromChat,
			luaAppPages = p1.luaAppPages,
			wideMode = WideMode,
			notificationCount = NotificationCount,
			robloxEventReceiver = p1._robloxEventReceiver,
			userInputService = UserInputService,
			roactChatEntryPoint = EntryPointModule,
			androidBackButtonConnection = p1.androidBackButtonConnectionSocialTab,
			signal = SignalModule,
			androidBackButtonHandlerDisabled = p1.isAndroidBackButtonHandlerDisabled(p2),
			setIsTabBarEnabled = IsLuaProfilePageEnabled and p1.setIsTabBarEnabled or nil,
			isLuaProfilePageEnabled = IsLuaProfilePageEnabled,
			useRoactService = UseRoactServiceModule,
			roactAnalytics = RoactAnalyticsModule,
			roactAnalyticsCommonGameEvents = RoactAnalyticsCommonGameEvents,
			joinGame = JoinGameModule,
			openGameDetails = OpenGameDetailsModule,
			navigateDown = NavigateDownModule,
			presenceType = UserModule.PresenceType,
			appPage = AppPageModule,
			convertUniverseIdToString = ConvertUniverseIdToString,
			setNavigatingFromSocialTabEvent = p1.setNavigatingFromSocialTabEvent,
			getNavigatingFromSocialTabEvent = p1.getNavigatingFromSocialTabEvent,
			luaAddFriendsPageEnabled = LuaAddFriendsPageEnabled,
			setAppLoaded = SetAppLoadedModule,
			fetchUnreadConversationCount = p1.props.fetchUnreadConversationCount,
			notificationService = p1.props.notificationService,
			config = ConfigModule,
			toggleChatPaused = p1.props.toggleChatPaused,
			performanceTesting = PerformanceTestingModule,
			notificationType = NotificationTypeModule,
			contactImporterAndPYMKEnabled = if FFlagContactImporterIXPCleanup then nil else p1.props.contactImporterAndPYMKEnabled and p1.props.isContactImporterPolicyEnabled or nil,
			diagService = p1.props.roactAnalytics.Diag,
			eventIngestService = p1.props.eventIngestService,
			openProfilePeekView = p1.props.openProfilePeekView,
			closeCentralOverlay = p1.props.closeCentralOverlay,
			openLearnMoreLink = p1.props.openLearnMoreLink,
			showToast = p1.props.showToast,
			updateExternalNavigationForScreen = p1.updateExternalNavigationForScreen,
			initialRouteName = p1.props.initialRouteName,
			openPlayerContextualMenu = p1.props.openPlayerContextualMenu
		}
	end)
end

function SocialTabUniversalAppWrapper.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Context (copy), FullscreenPageWithSafeAreaModule (copy), FFlagFixSocialTabBottomBarCutOffModule (copy), AppNavBarModule (copy), ChatEventReceiverModule (copy), FFlagSquadAppChatRTNFix (copy), SquadAppChatEventReceiver (copy)
	return WithStyleFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), Context (upval), FullscreenPageWithSafeAreaModule (upval), FFlagFixSocialTabBottomBarCutOffModule (upval), AppNavBarModule (upval), ChatEventReceiverModule (upval), FFlagSquadAppChatRTNFix (upval), SquadAppChatEventReceiver (upval)
		return RoactModule.createElement(Context.Provider, {
			value = p1.generateContext(p1.props.isVisible, p1.props.localUserId, p1.props.navigationProps, p1.props.notificationCount, p1.props.pageType, p1.props.parameters, p1.props.wideMode, p1.props.currentAppPage, true, p1.props.luaAddFriendsPageEnabled)
		}, {
			SocialTab = RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
				BorderSizePixel = 0,
				includeStatusBar = true,
				BackgroundColor3 = p1.props.BackgroundColor,
				BackgroundTransparency = p1.props.BackgroundTransparency,
				useFullScalePage = p1.props.useFullScalePage,
				includeBottomBar = if FFlagFixSocialTabBottomBarCutOffModule then p1.props.navBarPlacement == AppNavBarModule.Placement.Bottom and p1.props.bottomBarVisible ~= false else p1.props.wideMode and p1.props.navBarPlacement == AppNavBarModule.Placement.Bottom
			}, {
				ChatEventReceiver = RoactModule.createElement(ChatEventReceiverModule, {
					robloxEventReceiver = p1._robloxEventReceiver,
					rnBypassActionSignal = p1._rnBypassActionSignal,
					initRoactChatNavigation = p1.initRoactChatNavigation,
					activeConversationId = p1.state.activeConversationId
				}),
				SocialTab = p1.renderOnLoaded(),
				SquadAppChatEventReceiver = if FFlagSquadAppChatRTNFix then RoactModule.createElement(SquadAppChatEventReceiver) else nil
			})
		})
	end)
end

function SocialTabUniversalAppWrapper.didMount(p1)
	-- upvalues: Logger (copy)
	Logger:info("Initializing SocialTabUniversalAppWrapper")
	
	if p1.props.isVisible and p1.props.toggleChatPaused ~= nil then
		p1.props.toggleChatPaused(false)
	end
end

function SocialTabUniversalAppWrapper.didUpdate(p1, p2, _)
	-- upvalues: ConfigModule (copy)
	if p2.isVisible ~= p1.props.isVisible then
		p1.androidBackButtonConnection.disconnect()
		
		if not p2.isVisible then
			p1._performanceTesting:Initialize()
			p1.props.setThrottleFramerateEnabled(ConfigModule.General.PerformanceTestingMode == Enum.VirtualInputMode.None)
			p1.props.toggleChatPaused(false)
			
			return
		end
		p1._performanceTesting:Stop()
		p1.props.setThrottleFramerateEnabled(false)
		p1.props.toggleChatPaused(true)
	end
end

function SocialTabUniversalAppWrapper.getDerivedStateFromProps(p1, p2)
	-- upvalues: RetrievalStatusModule (copy)
	local WasEverVisible: boolean? = nil
	local WasEverDoneRetrieving: boolean? = nil
	local WasChatEverTapped: boolean? = nil
	
	if p1.isVisible then
		WasEverVisible = true
	end
	if p1.retrievalStatus == RetrievalStatusModule.Done then
		WasEverDoneRetrieving = true
	end
	if p2.wasChatEverTapped == false and p1.isVisible == true then
		WasChatEverTapped = true
	end
	return {
		wasChatEverTapped = WasChatEverTapped,
		wasEverVisible = WasEverVisible,
		wasEverDoneRetrieving = WasEverDoneRetrieving
	}
end

function SocialTabUniversalAppWrapper.willUnmount(p1)
	p1.androidBackButtonConnection.disconnect()
end

local v1 = RoactAppExperimentModule.connectUserLayer({
	AppUserLayers.SocialFriendsLayer,
	AppUserLayers.PushNotificationPrompt
}, function(p1, _)
	-- upvalues: AppUserLayers (copy), FFlagContactImporterIXPCleanup (copy), OffPlatformFriendRequestsIXP (copy), GetFStringPushUpsellVariantNameFunction (copy), GetFFlagEnablePushNotificationsUpsellModalFunction (copy)
	local v2 = p1[AppUserLayers.SocialFriendsLayer] or {}
	local ExperimentVariant = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXP.getExperimentVariant(p1)
	local ExperimentOrRolloutEnabledResult = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXP.experimentOrRolloutEnabled(p1)
	local v3 = p1[AppUserLayers.PushNotificationPrompt] or {}
	local FStringPushUpsellVariantName = GetFStringPushUpsellVariantNameFunction()
	
	return {
		luaAddFriendsPageEnabled = v2.show_lua_add_friends_page == "True",
		contactImporterAndPYMKEnabled = if FFlagContactImporterIXPCleanup then nil else ExperimentOrRolloutEnabledResult,
		contactImporterExperimentVariant = if FFlagContactImporterIXPCleanup then nil else ExperimentVariant,
		pushUpsellVariant = if GetFFlagEnablePushNotificationsUpsellModalFunction() then v3[FStringPushUpsellVariantName] or -1 else nil
	}
end)((WithThrottleFramerateGivenPolicyModule((UniversalAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagLuafiedReportEntryPointsFunction (copy)
	return {
		isContactImporterPolicyEnabled = p1.getContactImporterEnabled(),
		shouldSystemBarUsuallyBePresent = p1.getShouldSystemBarUsuallyBePresent(),
		useLuafiedReportFlow = if GetFFlagLuafiedReportEntryPointsFunction() then p1.getUseLuafiedReportFlow() else nil,
		shouldShowPushUpsell = p1.getPushNotificationsUpsell(),
		notificationsCanReceivePush = p1.getNotificationsCanReceivePush()
	}
end)(SocialTabUniversalAppWrapper)))))

return function(p1)
	-- upvalues: UseNavBarPlacementFunction (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicyFunction (copy), FFlagLuaAppEnableStickyShortcutBar (copy), UseIsStickyShortcutBarEnabledFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicyFunction(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) elseif FFlagLuaAppEnableStickyShortcutBar then UseIsStickyShortcutBarEnabledFunction() else nil
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		navBarPlacement = UseNavBarPlacementFunction(),
		useFullScalePage = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then UseAppPolicyResult else nil
	}))
end