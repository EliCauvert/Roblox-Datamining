local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AccessResponseEnum = require(CorePackages.Workspace.Packages.AmpUpsell).AmpEnums.AccessResponseEnum
local AppBrowserService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppBrowserService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AmpApiProvider = require(CorePackages.Workspace.Packages.AmpUpsell).AmpApiProvider
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local CryoModule = require(CorePackages.Packages.Cryo)
local DeepLinkModule = require(CorePackages.Workspace.Packages.DeepLink)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local NavigateIntoAvatarExperienceModule = require(Modules.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience)
local NavigateIntoChatThunkModule = require(CorePackages.Workspace.Packages.AppChat.NavigateIntoChatThunk)
local ShowFAESocialUpsellOverlayFunction = require(CorePackages.Workspace.Packages.SocialUpsell).Thunks.ShowFAESocialUpsellOverlay
local StartFacialAgeEstimationFunction = require(CorePackages.Workspace.Packages.SocialUpsell).Thunks.startFacialAgeEstimation
local NavigateIntoSquadLobbyIfExistsModule = require(CorePackages.Workspace.Packages.AppChat.NavigateIntoSquadLobbyIfExists)
local PromiseModule = require(Modules.LuaApp.Promise)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsShareLinksModule = require(Modules.LuaApp.Services.RoactAnalyticsShareLinks)
local RoactAnalyticsSocialProfileShareModule = require(Modules.LuaApp.Services.RoactAnalyticsSocialProfileShare)
local EnteredChatFromEntryPointModule = require(CorePackages.Workspace.Packages.AppChat.EnteredChatFromEntryPoint)
local QualifiedSignUpAttribution = require(CorePackages.Workspace.Packages.AffiliateLinks).QualifiedSignUpAttribution
local AuthenticatedVisitAttribution = require(CorePackages.Workspace.Packages.AffiliateLinks).AuthenticatedVisitAttribution
local SocialUpsellType = require(CorePackages.Workspace.Packages.SocialUpsell).Enums.SocialUpsellType
local UpsellComponent = require(CorePackages.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellComponent
local AppPageModule = require(Modules.LuaApp.AppPage)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local EventNetworkingModule = require(script.Parent.EventNetworking)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local LaunchGame = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local ShareLinkTypesModule = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking
local FFlagSignalsNavP3cEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3cEvents
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3cEvents then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local AppNavigationModule = if FFlagSignalsNavP3cEvents then require(Modules.LuaApp.Navigation.AppNavigation) else nil
local DeeplinkNavDurationLog = game:DefineFastFlag("DeeplinkNavDurationLog", false)
local GetFFlagEnableUnifiedWebViewsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews
local FFlagTCUpdateProfileCTAButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton
local RefreshProfilePlatformActionInfoModule = require(CorePackages.Workspace.Packages.ProfilePlatform.refreshProfilePlatformActionInfo)
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(CorePackages.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformRefreshActionsRespectPolicies)
local BuildUserActionsComponentModule = require(CorePackages.Workspace.Packages.ProfilePlatform.buildUserActionsComponent)
local DeeplinkTelemetryCounters = game:DefineFastFlag("DeeplinkTelemetryCounters", false)
local CloseModalsWhenDeeplinking = game:DefineFastFlag("CloseModalsWhenDeeplinking", false)
local EnableExperienceInviteLinkTypeAttribution = game:DefineFastFlag("EnableExperienceInviteLinkTypeAttribution", false)
local JoinCodePattern = game:DefineFastString("JoinCodePattern", ".*/join/([%w]+)")
local FFlagEnableSquadDeeplinkWithChatId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local FFlagEnableAmpWizardDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLink
local OpenAmpWizardContainer = if FFlagEnableAmpWizardDeepLink then require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer else nil
local FFlagEnableAuthDeepLinkReceiver = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver
local FFlagEnableDeepLinkHistoryWithModalAPI = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagStreamNotificationDropdownSingleOwner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStreamNotificationDropdownSingleOwner
local StreamNotificationStore = require(CorePackages.Workspace.Packages.StreamNotifications).StreamNotificationStore
local EnableJoinLinkAttribution = game:DefineFastFlag("EnableJoinLinkAttribution", false)
local SimpleUrlDecodeFunction = require(CorePackages.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode
local NewResult = require(Modules.LuaApp.DeepLinks.DeepLinkParser).new((require(Modules.LuaApp.DeepLinks.DeepLinkMap)))
local ParseQueryFunction = require(CorePackages.Packages.StringUtilities).ParseQuery
local SocialCommsRestrictionsNamespace = game:DefineFastString("SocialCommsRestrictionsNamespace", "social/CommunicationRestrictions")
local EligibleForCommsAgeVerificationUpsellFeatureName = game:DefineFastString("EligibleForCommsAgeVerificationUpsellFeatureName", "EligibleForCommsAgeVerificationUpsell")
local EnableDeepLinkWaitForNavigationUnlock2 = game:DefineFastFlag("EnableDeepLinkWaitForNavigationUnlock2", false)
local FFlagEnableSearchDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableSearchDeepLink)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local UseSetDrawerVisible = if FFlagEnableFlyoutSidePanelModule then require(CorePackages.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible else nil
local PostAuthDeepLinkAvailableSignal = require(CorePackages.Workspace.Packages.AuthCommon).EventReceivers.PostAuthDeepLinkAvailableSignal
local PostAuthPendingLuaUrlAvailableSignal = require(CorePackages.Workspace.Packages.AuthCommon).EventReceivers.PostAuthPendingLuaUrlAvailableSignal

local function _(p1)
	-- upvalues: SimpleUrlDecodeFunction (copy), ParseQueryFunction (copy)
	local _, Unpacked2 = unpack(string.split(SimpleUrlDecodeFunction(p1), "?"))
	
	return (ParseQueryFunction(Unpacked2))
end

local _ = function(p1, p2)
	return if p1 and p1[p2] then p1[p2][1] else nil
end

function getJoinCode(p1)
	-- upvalues: JoinCodePattern (copy)
	return (p1:match(JoinCodePattern))
end

local function getShareLinkType(Text: string)
	-- upvalues: ShareLinkTypesModule (copy), HttpService (copy)
	local Lowered = string.lower(Text)
	
	for i, value in pairs(ShareLinkTypesModule) do
		if Lowered:find("&type=" .. string.lower(value)) then
			return i
		elseif Lowered:find((string.lower((string.gsub(HttpService:UrlEncode("&type=" .. value), "%%", "%%%%"))))) then
			return i
		end
	end
	return nil
end

local function getScreenAndParams(p1)
	-- upvalues: CryoModule (copy)
	local v1 = p1[#p1]
	
	return v1.name, (CryoModule.Dictionary.join(v1.extraProps or {}, { detail = v1.detail }))
end

local _ = function(Entry, Name): boolean
	return Entry and (#Entry > 0 and (Name and Entry[1].name == Name))
end

local DeepLinkEventReceiver = RoactModule.Component:extend("DeepLinkEventReceiver")

function DeepLinkEventReceiver.UpdateConnection(p1)
	-- upvalues: FFlagEnableAuthDeepLinkReceiver (copy), FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLinkModule (copy), EnableDeepLinkWaitForNavigationUnlock2 (copy), Default (copy), TelemetryConfigs (copy), DeeplinkNavDurationLog (copy)
	if not FFlagEnableAuthDeepLinkReceiver then
		if p1.props.userLoggedOut or not p1.props.appLoadingStarted then
			p1.props.linking:stopListeningForLuaURLs()
			
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				p1.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(DeepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
			end
		else
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				p1.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(DeepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, (p1.props.linking:getLastLuaURL()))
			end
			p1.props.linking:getAndClearLastPendingURL():andThen(function(Result)
				-- upvalues: p1 (copy)
				if Result.hasPendingUrl then
					p1:logPendingLink(Result.url, Result.attributionUrl)
					
					return
				end
			end)
			p1.props.linking:listenForLuaURLs(function(PendingDeepLinkUrl, AttributionUrl)
				-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (upval), p1 (copy), EnableDeepLinkWaitForNavigationUnlock2 (upval), Default (upval), TelemetryConfigs (upval), DeeplinkNavDurationLog (upval)
				if FFlagEnableDeepLinkHistoryWithModalAPI then
					p1.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(PendingDeepLinkUrl)
				end
				p1:logProcessedLink(PendingDeepLinkUrl, AttributionUrl)
				
				if EnableDeepLinkWaitForNavigationUnlock2 and p1.props.navigationLocked then
					p1.pendingDeepLinkUrl = PendingDeepLinkUrl
					Default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkPendingDueToNavigationLockConfig, 1)
				else
					p1:navigate(PendingDeepLinkUrl)
				end
				if DeeplinkNavDurationLog then
					p1.props.loggingProtocol:logEvent("deeplink_navigation_begin")
				end
			end)
		end
	end
	if p1.props.userLoggedOut then
		local LastLuaURL: string = p1.props.linking:getLastLuaURL()
		
		if LastLuaURL then
			local XXes = {}
			
			for i, Text in LastLuaURL:gmatch("([^&=?]-)=([^&=?]+)") do
				XXes[i] = Text:gsub("+", " "):gsub("%%(%x%x)", function(p2): string
					return (string.char((tonumber(p2, 16))))
				end)
			end
			if XXes.friendshipSourceType == "profileshare" then
				p1.props.socialProfileShareAnalytics.inviteePageLoad(XXes.userId, "appSignIn")
			end
		end
	end
end

function DeepLinkEventReceiver.navigate(p2, PendingDeepLinkUrl)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), CloseModalsWhenDeeplinking (copy), FFlagStreamNotificationDropdownSingleOwner (copy), StreamNotificationStore (copy), FFlagTCUpdateProfileCTAButton (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), BuildUserActionsComponentModule (copy), NewResult (copy), LaunchGame (copy), PromiseModule (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), AvatarScreen (copy), getScreenAndParams (copy), AppPageModule (copy), FFlagEnableAmpWizardDeepLink (copy), FFlagEnableSearchDeepLinkModule (copy)
	if FFlagEnableFlyoutSidePanelModule then
		p2.props.setDrawerVisible(false)
	end
	if CloseModalsWhenDeeplinking then
		if FFlagStreamNotificationDropdownSingleOwner then
			StreamNotificationStore.setActiveBellId(nil)
		end
		StreamNotificationStore.setStreamPresented(false)
		p2.props.CloseCentralOverlay()
	end
	local CurrentHistory = p2.props.currentHistory
	local Networking = p2.props.networking
	local AnalyticsImpls = {
		socialProfileShareAnalytics = p2.props.socialProfileShareAnalytics,
		shareLinksAnalytics = p2.props.shareLinksAnalytics
	}
	local ResolveLinkFromLinkId = p2.props.ResolveLinkFromLinkId
	local ResolveLinkFromLinkIdV2 = p2.props.ResolveLinkFromLinkIdV2
	local CloseCentralOverlay = p2.props.CloseCentralOverlay
	local RefreshProfilePlatformActionInfoFunction: (any) -> any = p2.props.RefreshProfilePlatformActionInfo
	
	if FFlagTCUpdateProfileCTAButton and FFlagProfilePlatformRefreshActionsRespectPoliciesModule and RefreshProfilePlatformActionInfoFunction then
		local Props = p2.props
		
		RefreshProfilePlatformActionInfoFunction = function(p3)
			-- upvalues: BuildUserActionsComponentModule (upval), Props (copy), RefreshProfilePlatformActionInfoFunction (copy)
			return RefreshProfilePlatformActionInfoFunction(p3, (BuildUserActionsComponentModule(nil, {
				areWebViewsSupported = if Props.getWebViewSupport then Props.getWebViewSupport() else nil,
				isProfileQrCodeEnabled = if Props.getEnableProfileQrCode then Props.getEnableProfileQrCode() else nil,
				canRenderTransferInProfile = if Props.getCanRenderTransferOnProfile then Props.getCanRenderTransferOnProfile() else nil,
				canSeeChatTab = if Props.getCanSeeChatTab then Props.getCanSeeChatTab() else nil,
				isSelfView = Props.localUserId ~= nil and tostring(p3) == tostring(Props.localUserId) or nil
			})))
		end
	end
	return PromiseModule.resolve((NewResult:resolve(PendingDeepLinkUrl, {
		history = CurrentHistory,
		network = Networking,
		analyticsImpls = AnalyticsImpls,
		resolveLinkFromLinkId = ResolveLinkFromLinkId,
		resolveLinkFromLinkIdV2 = ResolveLinkFromLinkIdV2,
		launchGame = LaunchGame,
		closeCentralOverlay = CloseCentralOverlay,
		RefreshProfilePlatformActionInfo = if FFlagTCUpdateProfileCTAButton then RefreshProfilePlatformActionInfoFunction else nil
	}))):andThen(function(Result)
		-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (upval), p2 (copy), AvatarScreen (upval), getScreenAndParams (upval), AppPageModule (upval), FFlagEnableAmpWizardDeepLink (upval), FFlagEnableSearchDeepLinkModule (upval)
		if type(Result) == "table" and next(Result) then
			local Entry = Result[#Result]
			
			if not GetFFlagEnableUnifiedWebViewsFunction() and p2.props.browserService then
				p2.props.browserService:CloseBrowserWindow()
			end
			local AvatarExperienceLandingPage = AvatarScreen.AvatarExperienceLandingPage
			
			if Entry and (#Entry > 0 and (AvatarExperienceLandingPage and Entry[1].name == AvatarExperienceLandingPage)) then
				local ScreenAndParams, ScreenAndParams2 = getScreenAndParams(Entry)
				p2.props.NavigateIntoAvatarExperience(ScreenAndParams, ScreenAndParams2, true)
				
				return
			end
			local Chat = AppPageModule.Chat
			
			if Entry and (#Entry > 0 and (Chat and Entry[1].name == Chat)) then
				p2.navigateIntoChat(getScreenAndParams(Entry))
				
				return
			end
			local SquadLobby = AppPageModule.SquadLobby
			
			if Entry and (#Entry > 0 and (SquadLobby and Entry[1].name == SquadLobby)) then
				p2.navigateIntoSquadLobbyIfExists(getScreenAndParams(Entry))
				
				return
			end
			local FAE = AppPageModule.FAE
			
			if Entry and (#Entry > 0 and (FAE and Entry[1].name == FAE)) then
				p2.navigateIntoFAE(getScreenAndParams(Entry))
				
				return
			end
			local FAEUpsellOverlay = AppPageModule.FAEUpsellOverlay
			
			if Entry and (#Entry > 0 and (FAEUpsellOverlay and Entry[1].name == FAEUpsellOverlay)) then
				p2.showFAEUpsellOverlay(getScreenAndParams(Entry))
				
				return
			end
			if FFlagEnableAmpWizardDeepLink then
				local AmpWizardContainer = AppPageModule.AmpWizardContainer
				
				if Entry and (#Entry > 0 and (AmpWizardContainer and Entry[1].name == AmpWizardContainer)) then
					p2.navigateIntoAmpWizard(getScreenAndParams(Entry))
					
					return
				end
			end
			if FFlagEnableSearchDeepLinkModule then
				local Entry1 = Entry[#Entry]
				local ExtraProps = Entry1 and Entry1.extraProps
				
				if Entry1 and Entry1.name == AppPageModule.SearchPage and ExtraProps then
					p2.props.SetSearchType(Entry1.detail, ExtraProps.searchType)
					p2.props.SetSearchParameters(Entry1.detail, {
						isKeywordSuggestionEnabled = true,
						searchKeyword = ExtraProps.searchKeyword
					})
				end
			end
			p2.props.ResetNavigationHistory(Result)
		end
	end)
end

function DeepLinkEventReceiver.logPendingLink(p2, Url, AttributionUrl)
	-- upvalues: SimpleUrlDecodeFunction (copy), ParseQueryFunction (copy), getShareLinkType (copy), EnableJoinLinkAttribution (copy), EnableExperienceInviteLinkTypeAttribution (copy), ShareLinkTypesModule (copy), GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction (copy), QualifiedSignUpAttribution (copy)
	local AppAnalytics = p2.props.appAnalytics
	local _, Unpacked2 = unpack(string.split(SimpleUrlDecodeFunction(Url), "?"))
	local ParseQueryResult = ParseQueryFunction(Unpacked2)
	local ShareLinkType = getShareLinkType(Url)
	local JoinCode = if EnableJoinLinkAttribution then getJoinCode(Url) else nil
	AppAnalytics.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
		attributionUrl = AttributionUrl,
		shareLinkType = ShareLinkType,
		stamp = if ParseQueryResult and ParseQueryResult.stamp then ParseQueryResult.stamp[1] else nil,
		url = Url,
		userDidLogIn = p2.loginTracking.userDidLogIn,
		userDidSignUp = p2.loginTracking.userDidSignUp
	})
	local PendingLinkAfterLogin: string = if p2.loginTracking.userDidLogIn then "PendingLinkAfterLogin" elseif p2.loginTracking.userDidSignUp then "PendingLinkAfterSignUp" else "PendingLink"
	
	if ShareLinkType ~= nil and PendingLinkAfterLogin == "PendingLinkAfterSignUp" and (ShareLinkType == ShareLinkTypesModule.ExperienceAffiliate or EnableExperienceInviteLinkTypeAttribution and ShareLinkType == "ExperienceInviteLinkType") and GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction() then
		QualifiedSignUpAttribution.attribute(p2.props.networking, if ParseQueryResult and ParseQueryResult.code then ParseQueryResult.code[1] else nil, Url, if ShareLinkType == "ExperienceInviteLinkType" then ShareLinkTypesModule.ExperienceInviteLinkType else ShareLinkTypesModule.ExperienceAffiliate)
	end
	if JoinCode ~= nil and PendingLinkAfterLogin == "PendingLinkAfterSignUp" and EnableJoinLinkAttribution then
		QualifiedSignUpAttribution.attributeJoinLink(p2.props.networking, Url, JoinCode)
	end
	AppAnalytics.Diag:reportCounter(PendingLinkAfterLogin, 1)
	
	if ShareLinkType ~= nil then
		AppAnalytics.Diag:reportCounter(PendingLinkAfterLogin .. ShareLinkType, 1)
	end
end

function DeepLinkEventReceiver.logProcessedLink(p2, Url, AttributionUrl)
	-- upvalues: SimpleUrlDecodeFunction (copy), ParseQueryFunction (copy), getShareLinkType (copy), ShareLinkTypesModule (copy), AuthenticatedVisitAttribution (copy), DeeplinkTelemetryCounters (copy), Default (copy)
	local AppAnalytics = p2.props.appAnalytics
	local SessionService = p2.props.sessionService
	local UserDidLogIn = p2.loginTracking.userDidLogIn
	local UserDidSignUp = p2.loginTracking.userDidSignUp
	local _, Unpacked2 = unpack(string.split(SimpleUrlDecodeFunction(Url), "?"))
	local ParseQueryResult = ParseQueryFunction(Unpacked2)
	local ShareLinkType = getShareLinkType(Url)
	local JoinCode = getJoinCode(Url)
	AppAnalytics.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
		attributionUrl = AttributionUrl,
		sessionId = SessionService:GetRootSID(),
		shareLinkType = ShareLinkType,
		stamp = if ParseQueryResult and ParseQueryResult.stamp then ParseQueryResult.stamp[1] else nil,
		url = Url,
		utm = if ParseQueryResult and ParseQueryResult.utm then ParseQueryResult.utm[1] else nil,
		userDidLogIn = p2.loginTracking.userDidLogIn,
		userDidSignUp = p2.loginTracking.userDidSignUp
	})
	
	if ShareLinkType == ShareLinkTypesModule.ExperienceAffiliate and not UserDidSignUp then
		AuthenticatedVisitAttribution.attribute(p2.props.networking, if ParseQueryResult and ParseQueryResult.code then ParseQueryResult.code[1] else nil, Url, ShareLinkTypesModule.ExperienceAffiliate, UserDidLogIn)
	end
	if JoinCode ~= nil and not UserDidSignUp then
		AuthenticatedVisitAttribution.attributeJoinLink(p2.props.networking, Url, JoinCode, UserDidLogIn)
	end
	if DeeplinkTelemetryCounters then
		Default:logRobloxTelemetryCounter({
			eventName = "DeeplinkProcessed",
			backends = { Default.TelemetryBackends.RobloxTelemetryCounter }
		}, 1, {
			url = Url,
			attributionUrl = AttributionUrl,
			shareLinkType = ShareLinkType
		})
	end
end

function DeepLinkEventReceiver.init(p2)
	-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLinkModule (copy), FFlagEnableAuthDeepLinkReceiver (copy), PostAuthDeepLinkAvailableSignal (copy), EnableDeepLinkWaitForNavigationUnlock2 (copy), Default (copy), TelemetryConfigs (copy), DeeplinkNavDurationLog (copy), PostAuthPendingLuaUrlAvailableSignal (copy), FFlagEnableSquadDeeplinkWithChatId (copy), FFlagEnableAmpWizardDeepLink (copy)
	p2.loginTracking = { userDidLogIn = false, userDidSignUp = false }
	
	if FFlagEnableDeepLinkHistoryWithModalAPI then
		p2.deepLinkLuaHandlerStatusStore = DeepLinkModule.DeepLinkLuaReceiverStatusStore(false)
	end
	p2:UpdateConnection()
	
	if FFlagEnableAuthDeepLinkReceiver then
		PostAuthDeepLinkAvailableSignal:connect(function(p3)
			-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (upval), p2 (copy), EnableDeepLinkWaitForNavigationUnlock2 (upval), Default (upval), TelemetryConfigs (upval), DeeplinkNavDurationLog (upval)
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				p2.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(p3.url)
			end
			p2:logProcessedLink(p3.url, p3.attributionUrl)
			
			if EnableDeepLinkWaitForNavigationUnlock2 and p2.props.navigationLocked then
				p2.pendingDeepLinkUrl = p3.url
				Default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkPendingDueToNavigationLockConfig, 1)
			else
				p2:navigate(p3.url)
			end
			if DeeplinkNavDurationLog then
				p2.props.loggingProtocol:logEvent("deeplink_navigation_begin")
			end
		end)
		PostAuthPendingLuaUrlAvailableSignal:connect(function(p3)
			-- upvalues: p2 (copy)
			p2:logPendingLink(p3.url, p3.attributionUrl)
		end)
	end
	function p2:navigateIntoChat(p3)
		-- upvalues: p2 (copy)
		if p2.props.getCanSeeChatTab and p2.props.getCanSeeChatTab() then
			p2.props.EnteredChatFromEntryPoint(p3 and p3.entryPoint)
			p2.props.NavigateIntoChat({ conversationId = p3 and p3.detail }, true)
			
			return
		end
	end
	
	function p2:navigateIntoSquadLobbyIfExists(p3)
		-- upvalues: p2 (copy), FFlagEnableSquadDeeplinkWithChatId (upval)
		if p2.props.getCanSeeChatTab and p2.props.getCanSeeChatTab() then
			p2.props.NavigateIntoSquadLobbyIfExists({
				partyId = p3 and p3.detail,
				conversationId = if FFlagEnableSquadDeeplinkWithChatId then p3 and p3.conversationId else nil
			}, true)
			
			return
		end
	end
	
	function p2:navigateIntoFAE(p3)
		-- upvalues: p2 (copy)
		p2.props.NavigateIntoFAE(p3.source)
	end
	
	function p2:showFAEUpsellOverlay(p3)
		-- upvalues: p2 (copy)
		p2.props.ShowFAEUpsellOverlay(p3.source, p3.isPhase2)
	end
	
	if FFlagEnableAmpWizardDeepLink then
		function p2:navigateIntoAmpWizard(p3)
			-- upvalues: p2 (copy)
			p2.props.NavigateIntoAmpWizard(p3)
		end
	end
end

function DeepLinkEventReceiver:render() end

function DeepLinkEventReceiver.didUpdate(p2, p3)
	-- upvalues: LaunchContextModule (copy), EnableDeepLinkWaitForNavigationUnlock2 (copy), Default (copy), TelemetryConfigs (copy)
	if p3.userLoggedOut ~= p2.props.userLoggedOut and not p2.props.userLoggedOut then
		p2.loginTracking.userDidLogIn = p2.props.launchContext == LaunchContextModule.Login
		p2.loginTracking.userDidSignUp = p2.props.launchContext == LaunchContextModule.SignUp
	end
	p2:UpdateConnection()
	
	if EnableDeepLinkWaitForNavigationUnlock2 and (p3.navigationLocked and not p2.props.navigationLocked and p2.pendingDeepLinkUrl) then
		local PendingDeepLinkUrl = p2.pendingDeepLinkUrl
		p2.pendingDeepLinkUrl = nil
		Default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkProcessedAfterNavigationUnlockConfig, 1)
		p2:navigate(PendingDeepLinkUrl)
	end
end

function DeepLinkEventReceiver.willUnmount(p2)
	p2.props.linking:stopListeningForLuaURLs()
end

local v1: (any) -> any = RoactRoduxModule.connect(function(p2, _)
	-- upvalues: RetrievalStatusModule (copy), FFlagSignalsNavP3cEvents (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), LoginStatusModule (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy)
	return {
		currentHistory = if FFlagSignalsNavP3cEvents then nil elseif FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p2) else p2.Navigation.history,
		launchContext = p2.LaunchContext,
		userLoggedOut = p2.AuthenticationStatus.status == LoginStatusModule.LOGGED_OUT,
		username = if p2.Users[p2.LocalUserId] then p2.Users[p2.LocalUserId].name else nil,
		appLoadingStarted = p2.Startup.AppDataStatus ~= RetrievalStatusModule.NotStarted,
		navigationLocked = if FFlagSignalsNavP3cEvents then nil elseif FFlagUseNavigationSelectors then Selectors.selectNavigationLocked(p2) else p2.Navigation.lockNavigationActions,
		localUserId = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then p2.LocalUserId else nil
	}
end, function(Callback)
	-- upvalues: FFlagTCUpdateProfileCTAButton (copy), RefreshProfilePlatformActionInfoModule (copy), CloseCentralOverlayModule (copy), EnteredChatFromEntryPointModule (copy), NavigateIntoAvatarExperienceModule (copy), NavigateIntoChatThunkModule (copy), NavigateIntoSquadLobbyIfExistsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), StartFacialAgeEstimationFunction (copy), SocialUpsellType (copy), AmpApiProvider (copy), EligibleForCommsAgeVerificationUpsellFeatureName (copy), SocialCommsRestrictionsNamespace (copy), AccessResponseEnum (copy), ShowFAESocialUpsellOverlayFunction (copy), UpsellComponent (copy), FFlagEnableAmpWizardDeepLink (copy), OpenAmpWizardContainer (ref), FFlagEnableSearchDeepLinkModule (copy), SetSearchParametersModule (copy), SetSearchTypeModule (copy), ResetNavigationHistoryModule (copy), EventNetworkingModule (copy)
	return {
		RefreshProfilePlatformActionInfo = if FFlagTCUpdateProfileCTAButton then function(p2, p3)
			-- upvalues: Callback (copy), RefreshProfilePlatformActionInfoModule (upval)
			return Callback(RefreshProfilePlatformActionInfoModule(p2, p3))
		end else nil,
		CloseCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		EnteredChatFromEntryPoint = function(p2)
			-- upvalues: Callback (copy), EnteredChatFromEntryPointModule (upval)
			return Callback(EnteredChatFromEntryPointModule(p2))
		end,
		NavigateIntoAvatarExperience = function(p2, p3, p4)
			-- upvalues: Callback (copy), NavigateIntoAvatarExperienceModule (upval)
			return Callback(NavigateIntoAvatarExperienceModule(p2, p3, p4))
		end,
		NavigateIntoChat = function(p2, p3)
			-- upvalues: Callback (copy), NavigateIntoChatThunkModule (upval)
			return Callback(NavigateIntoChatThunkModule(p2, p3))
		end,
		NavigateIntoSquadLobbyIfExists = function(p2, p3)
			-- upvalues: Callback (copy), NavigateIntoSquadLobbyIfExistsModule (upval)
			return Callback(NavigateIntoSquadLobbyIfExistsModule(p2, p3))
		end,
		NavigateIntoFAE = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackFunction (upval), StartFacialAgeEstimationFunction (upval), SocialUpsellType (upval)
			local function v127()
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (upval), NavigateBackFunction (upval)
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.back()
					
					return
				else
					Callback(NavigateBackFunction())
				end
			end
			
			return Callback(StartFacialAgeEstimationFunction(SocialUpsellType.FacialAgeEstimation .. (p2 or ""), v127, v127, p2))
		end,
		ShowFAEUpsellOverlay = function(p2, p3)
			-- upvalues: AmpApiProvider (upval), EligibleForCommsAgeVerificationUpsellFeatureName (upval), SocialCommsRestrictionsNamespace (upval), AccessResponseEnum (upval), Callback (copy), ShowFAESocialUpsellOverlayFunction (upval), SocialUpsellType (upval), UpsellComponent (upval)
			if AmpApiProvider.upsellFeatureAccess(EligibleForCommsAgeVerificationUpsellFeatureName, {}, SocialCommsRestrictionsNamespace).access == AccessResponseEnum.Granted then
				Callback(ShowFAESocialUpsellOverlayFunction({
					entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. (p2 or ""),
					upsellEntrySurface = p2 or "",
					upsellEntryComponent = UpsellComponent.PushNotifUI,
					p3
				}))
			end
		end,
		NavigateIntoAmpWizard = if FFlagEnableAmpWizardDeepLink then function(p2)
			-- upvalues: Callback (copy), OpenAmpWizardContainer (upval)
			return Callback(OpenAmpWizardContainer(p2.featureName, function() end, nil, p2.entryPointEventCtx, nil, p2.nameSpace, nil, {
				returnPage = p2.returnPage,
				targetUserId = p2.targetUserId
			}))
		end else nil,
		SetSearchParameters = if FFlagEnableSearchDeepLinkModule then function(p2, p3)
			-- upvalues: Callback (copy), SetSearchParametersModule (upval)
			return Callback(SetSearchParametersModule(p2, p3))
		end else nil,
		SetSearchType = if FFlagEnableSearchDeepLinkModule then function(p2, p3)
			-- upvalues: Callback (copy), SetSearchTypeModule (upval)
			return Callback(SetSearchTypeModule(p2, p3))
		end else nil,
		ResetNavigationHistory = function(p2)
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval)
			return Callback(ResetNavigationHistoryModule(nil, p2))
		end,
		ResolveLinkFromLinkId = function(LinkId, LinkType)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			return Callback(EventNetworkingModule.ShareLinksNetworking.ResolveLinkFromLinkId.API({ linkId = LinkId, linkType = LinkType }))
		end,
		ResolveLinkFromLinkIdV2 = function(LinkId)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			return Callback(EventNetworkingModule.ShareLinksNetworking.ResolveLinkFromLinkIdV2.API({ linkId = LinkId }))
		end
	}
end)(DeepLinkEventReceiver)

if FFlagSignalsNavP3cEvents then
	local v2 = v1
	
	v1 = function(p2)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), AppNavigationModule (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
		return RoactModule.createElement(v2, CryoModule.Dictionary.union(p2, {
			currentHistory = UseSignalState(GetLegacyNavigationStore(false).getHistory),
			navigationLocked = UseSignalState(AppNavigationModule.getIsNavigating)
		}))
	end
end
local v3 = RoactServices.connect({
	appAnalytics = RoactAnalyticsModule,
	browserService = if GetFFlagEnableUnifiedWebViewsFunction() then nil else AppBrowserService,
	linking = AppLinking,
	loggingProtocol = AppLogging,
	networking = RoactNetworkingModule,
	sessionService = AppSessionService,
	shareLinksAnalytics = RoactAnalyticsShareLinksModule,
	socialProfileShareAnalytics = RoactAnalyticsSocialProfileShareModule
})((UniversalAppPolicy.connect(function(p2)
	-- upvalues: FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy)
	return {
		getCanSeeChatTab = p2.getCanSeeChatTab,
		getWebViewSupport = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then p2.getWebViewSupport else nil,
		getEnableProfileQrCode = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then p2.getEnableProfileQrCode else nil,
		getCanRenderTransferOnProfile = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then p2.getCanRenderTransferOnProfile else nil
	}
end)(v1)))

local function v85(p2)
	-- upvalues: UseSetDrawerVisible (ref), CryoModule (copy), RoactModule (copy), v3 (ref)
	return RoactModule.createElement(v3, (CryoModule.Dictionary.join(p2, { setDrawerVisible = UseSetDrawerVisible() })))
end

return if FFlagEnableFlyoutSidePanelModule then v85 else v3