local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local Contexts = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local AppPageModule = require(Modules.LuaApp.AppPage)
local EntryPointModule = require(CorePackages.Workspace.Packages.FriendsLanding.EntryPoint)
local EnumScreensModule = require(CorePackages.Workspace.Packages.FriendsLanding.EnumScreens)
local PlayerSearchModule = require(Modules.LuaApp.Components.UserSearch.Players.PlayerSearch)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local MemoizeModule = require(Modules.Common.memoize)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
local Llama = require(CorePackages.Packages.LuaSocialLibrariesDeps).llama
local OffPlatformFriendRequestsIXP = require(CorePackages.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local FormatUserModule = require(script.Parent.Parent.utils.formatUser)
local FFlagLuaAppEnableStickyShortcutBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableStickyShortcutBar
local UseIsStickyShortcutBarEnabled = if FFlagLuaAppEnableStickyShortcutBar then require(CorePackages.Workspace.Packages.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil
local FFlagCreateConnectionsHub = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub
local FFlagContactImporterIXPCleanup = require(CorePackages.Workspace.Packages.SharedFlags).FFlagContactImporterIXPCleanup
local FFlagGuacStickyShortcutBarEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagGuacStickyShortcutBarEnabled
local UseAppPolicy = if FFlagGuacStickyShortcutBarEnabled then require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy else nil
local FriendsLandingUniversalAppWrapper = RoactModule.PureComponent:extend("FriendsLandingUniversalAppWrapper")
FriendsLandingUniversalAppWrapper.defaultProps = { wideMode = false }

function FriendsLandingUniversalAppWrapper.init(p1)
	-- upvalues: RobloxEventReceiver (copy), Llama (copy), FormatUserModule (copy), EnumScreensModule (copy), FFlagContactImporterIXPCleanup (copy), Contexts (copy), AppPageModule (copy), RobloxAppEnumsModule (copy), PlayerSearchModule (copy), MemoizeModule (copy), RoactModule (copy), EntryPointModule (copy), Logger (copy)
	p1.robloxEventReceiver = RobloxEventReceiver.new(p1.props.notificationService)
	
	function p1.navigateDownToFriendRequests()
		-- upvalues: p1 (copy)
		p1.props.navigateDownToFriendRequests()
	end
	
	function p1.viewUserProfile(p2, p3)
		-- upvalues: Llama (upval), FormatUserModule (upval), p1 (copy)
		if p3 then
			local ContextualMenuProps = p3.contextualMenuProps or {}
			p1.props.navigateToUserInfo(p2, {
				contextualMenuProps = Llama.Dictionary.join(ContextualMenuProps, {
					user = if ContextualMenuProps.user then FormatUserModule(ContextualMenuProps.user) else {}
				}),
				profilePeekViewProps = Llama.Dictionary.join(p3.profilePeekViewProps or {}, { resetPeekView = false, source = p3.source }),
				entryPoint = p3.entryPoint,
				openJoinable = p3.openJoinable,
				userInGame = p3.userInGame
			})
		end
	end
	
	p1.navigateToLuaAppPages = {
		[EnumScreensModule.FriendFinder] = p1.navigateDownToFriendRequests,
		[EnumScreensModule.ViewUserProfile] = p1.viewUserProfile,
		[EnumScreensModule.LearnMore] = if (p1.props.contactImporterAndPYMKEnabled or FFlagContactImporterIXPCleanup) and p1.props.isContactImporterPolicyEnabled then p1.props.openLearnMoreLink else nil,
		[EnumScreensModule.ProfileQRCode] = function()
			-- upvalues: p1 (copy), Contexts (upval)
			p1.props.navigateTo3DQRCodePage({ source = Contexts.AddFriends })
		end,
		[EnumScreensModule.SearchPage] = function()
			-- upvalues: p1 (copy), AppPageModule (upval), RobloxAppEnumsModule (upval)
			p1.props.navigation.navigate(AppPageModule.SearchPage, {
				defaultSearchType = RobloxAppEnumsModule.SearchTypes.Players
			})
		end,
		[EnumScreensModule.AmpWizardContainer] = p1.props.openAmpWizardContainer
	}
	p1.luaAppPages = { playerSearchPage = PlayerSearchModule }
	
	function p1.getLoadingTimeInfo()
		-- upvalues: p1 (copy)
		return p1.props.navigateToFriendsLandingEventStart
	end
	
	p1.renderFriendsLanding = p1.props.renderFriendsLanding or MemoizeModule(function(_, NavigateToLuaAppPages, WideMode, LuaAppPages, _, Navigation)
		-- upvalues: RoactModule (upval), EntryPointModule (upval), Logger (upval), p1 (copy), FFlagContactImporterIXPCleanup (upval)
		return RoactModule.createElement(EntryPointModule, {
			isLuaProfilePageEnabled = true,
			navigation = Navigation,
			navigateToLuaAppPages = NavigateToLuaAppPages,
			wideMode = WideMode,
			luaAppPages = LuaAppPages,
			logger = Logger,
			debug_willUnmount = p1.props.debug_entryPointWillUnmount,
			luaAddFriendsPageEnabled = p1.props.luaAddFriendsPageEnabled,
			robloxEventReceiver = p1.robloxEventReceiver,
			getLoadingTimeInfo = p1.getLoadingTimeInfo,
			contactImporterAndPYMKEnabled = if FFlagContactImporterIXPCleanup then nil else p1.props.contactImporterAndPYMKEnabled and p1.props.isContactImporterPolicyEnabled,
			contactImporterExperimentVariant = if FFlagContactImporterIXPCleanup then nil else p1.props.contactImporterExperimentVariant,
			diagService = p1.props.roactAnalytics.Diag,
			eventIngestService = p1.props.eventIngestService,
			openProfilePeekView = p1.props.openProfilePeekView,
			openPlayerContextualMenu = p1.props.openPlayerContextualMenu,
			passedNavParams = p1.props.passedNavParams
		})
	end)
end

function FriendsLandingUniversalAppWrapper.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagCreateConnectionsHub (copy), AppPageModule (copy), RoactModule (copy), FullscreenPageWithSafeAreaModule (copy)
	return WithStyleFunction(function(_)
		-- upvalues: FFlagCreateConnectionsHub (upval), p1 (copy), AppPageModule (upval), RoactModule (upval), FullscreenPageWithSafeAreaModule (upval)
		return if FFlagCreateConnectionsHub and p1.props.navigation.state.routeName == AppPageModule.CoHubMyConnections then p1.renderFriendsLanding(nil, p1.navigateToLuaAppPages, p1.props.wideMode, p1.luaAppPages, nil, p1.props.navigation) else RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
			includeStatusBar = true,
			BackgroundColor3 = p1.props.BackgroundColor,
			BackgroundTransparency = p1.props.BackgroundTransparency,
			useFullScalePage = p1.props.useFullScalePage
		}, {
			FriendsLanding = p1.renderFriendsLanding(nil, p1.navigateToLuaAppPages, p1.props.wideMode, p1.luaAppPages, nil, p1.props.navigation)
		})
	end)
end

local v1 = RoactServices.connect({
	roactAnalytics = RoactAnalyticsModule,
	eventIngestService = AppEventIngestServiceModule
})((UniversalAppPolicy.connect(function(p1)
	return {
		isContactImporterPolicyEnabled = p1.getContactImporterEnabled()
	}
end)((RoactRoduxModule.connect(function(p1, _)
	return { centralOverlayType = p1.CentralOverlay.OverlayType }
end, nil)((RoactAppExperimentModule.connectUserLayer({ AppUserLayers.SocialFriendsLayer }, function(p1, _)
	-- upvalues: AppUserLayers (copy), FFlagContactImporterIXPCleanup (copy), OffPlatformFriendRequestsIXP (copy)
	local ExperimentVariant = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXP.getExperimentVariant(p1)
	local ExperimentOrRolloutEnabledResult = if FFlagContactImporterIXPCleanup then nil else OffPlatformFriendRequestsIXP.experimentOrRolloutEnabled(p1)
	
	return {
		luaAddFriendsPageEnabled = (p1[AppUserLayers.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True",
		contactImporterAndPYMKEnabled = if FFlagContactImporterIXPCleanup then nil else ExperimentOrRolloutEnabledResult,
		contactImporterExperimentVariant = if FFlagContactImporterIXPCleanup then nil else ExperimentVariant
	}
end)(FriendsLandingUniversalAppWrapper)))))))

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UseNavigationFunction (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicy (copy), FFlagLuaAppEnableStickyShortcutBar (copy), UseIsStickyShortcutBarEnabled (copy), UiMode (copy), UseNavigationPropsFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicy(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) elseif FFlagLuaAppEnableStickyShortcutBar then UseIsStickyShortcutBarEnabled() else nil
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		BackgroundColor = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency,
		navigation = UseNavigationFunction(),
		useFullScalePage = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then IsUiModeMatch or UseAppPolicyResult else IsUiModeMatch
	}, (UseNavigationPropsFunction(function(_, p2)
		return {
			navigateToFriendsLandingEventStart = p2.navigateToFriendsLandingEventStart
		}
	end))))
end