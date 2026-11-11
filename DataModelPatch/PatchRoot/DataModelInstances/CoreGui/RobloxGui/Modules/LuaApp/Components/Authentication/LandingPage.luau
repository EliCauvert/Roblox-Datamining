local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SetStatusBarHeightModule = require(Modules.LuaApp.Actions.SetStatusBarHeight)
local LogoWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.LogoWithContentsLayout)
local TenFootLogoWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.TenFootLogoWithContentsLayout)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FetchSignUpBundlesModule = require(Modules.LuaApp.Thunks.Authentication.FetchSignUpBundles)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local LuobuLandingPageModule = require(Modules.Luobu.Components.Authentication.LuobuLandingPage)
local WechatQQLoginPage = require(CorePackages.Workspace.Packages.WechatQQAuth).Components.WechatQQLoginPage
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local VideoWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.VideoWithContentsLayout)
local CustomizedInviteLandingPageLayoutModule = require(Modules.LuaApp.Components.Authentication.CustomizedInviteLandingPageLayout)
local GetFFlagEnableVideoLandingModule = require(Modules.LuaApp.Flags.GetFFlagEnableVideoLanding)
local ShowCustomizedLandingPageWithoutInviter1 = game:DefineFastFlag("ShowCustomizedLandingPageWithoutInviter1", false)
local AppAppLifecycleObserverService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService
local LandingPageMountSignalEnabledEngineFeature = game:GetEngineFeature("LandingPageMountSignalEnabled")
local GetFStringLandingVideoAssetModule = require(Modules.LuaApp.Flags.GetFStringLandingVideoAsset)
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local UseUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local UIConstants = AuthCommonModule.Common.UIConstants
local ThirdPartySwitchAccountComponent = AuthCommonModule.Components.ThirdPartySwitchAccountComponent
local AuthTimingUtil = require(CorePackages.Workspace.Packages.AuthAnalytics).authTimingUtil
local LandingPageConstants = require(CorePackages.Workspace.Packages.LandingPage).Constants.LandingPageConstants
local UseLandingPageNavigationBindingsModule = require(Modules.LuaApp.Components.Authentication.useLandingPageNavigationBindings)
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local OpenAccountSwitcherModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitcher)
local CredentialsProtocolModule = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local FFlagShouldLinkBrowserTrackerToDeviceModule = require(Modules.LuaApp.Flags.FFlagShouldLinkBrowserTrackerToDevice)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local GetFFlagAddLandingPageAccountSwitcherIxpGatingModule = require(Modules.LuaApp.Flags.GetFFlagAddLandingPageAccountSwitcherIxpGating)
local FFlagEnableKoreaKISAComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
local FFlagBypassIXPBrazilComplianceModule = require(Modules.LuaApp.Flags.FFlagBypassIXPBrazilCompliance)
local FFlagBypassIXPKoreaComplianceModule = require(Modules.LuaApp.Flags.FFlagBypassIXPKoreaCompliance)
local FFlagBypassGUACKoreaComplianceModule = require(Modules.LuaApp.Flags.FFlagBypassGUACKoreaCompliance)
local PostAssociateBrowserTrackerToDeviceModule = require(Modules.LuaApp.Http.Requests.PostAssociateBrowserTrackerToDevice)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local GetDeepLinkDataModule = require(Modules.LuaApp.Thunks.Authentication.Util.getDeepLinkData)
local GetFFlagEnableMultiPageSignupExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local FFlagEnableLuaLoginRevamp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLuaLoginRevamp
local FFlagLuafiedWechatQQLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuafiedWechatQQLogin
local FStringLuaLoginRevampIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaLoginRevampIxpLayer
local GetFFlagEnableMultiPageSignupFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableMultiPageSignup
local FFlagLuaEnableCustomizedInviteLandingPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPage
local FFlagLuaEnableCustomizedInviteLandingPageForTesting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPageForTesting
local FFlagEnableLoginV1ForcedUsernameOverride = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLoginV1ForcedUsernameOverride
local FFlagEnableLoginV2ForcedUsernameOverride = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLoginV2ForcedUsernameOverride
local FFlagEnableAuthButtonShownEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthButtonShownEvent
local CustomizedLandingEDP = game:DefineFastFlag("CustomizedLandingEDP", false)
local CustomizedLandingLaunchGame = game:DefineFastFlag("CustomizedLandingLaunchGame", false)
local EnablePrewarmChallengeWebView = game:DefineFastFlag("EnablePrewarmChallengeWebView", false)
local CustomizedLandingExperienceSort = game:DefineFastString("CustomizedLandingExperienceSort", "")
local v1 = (function(Text: string)
	local t = {}
	
	for Text1 in string.gmatch(Text, "([^,]+)") do
		local SS = Text1:gsub("^%s*(.-)%s*$", "%1")
		
		if SS ~= "" then
			t[SS] = true
		end
	end
	return t
end)(CustomizedLandingExperienceSort)
local InvoluntaryLogoutAnalyticsEvents = AuthCommonModule.Analytics.InvoluntaryLogoutAnalyticsEvents
local AuthPageloadFunction = require(CorePackages.Workspace.Packages.AuthAnalytics).Events.authPageload
local LandingPage = RoactModule.PureComponent:extend("LandingPage")

local function _(p1, p2)
	-- upvalues: FFlagEnableAuthButtonShownEvent (copy), EventStreamConstantsModule (copy)
	if FFlagEnableAuthButtonShownEvent then
		p1.reportAuthButtonShown(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.SwitchAccounts, p2, EventStreamConstantsModule.Origin.LandingScreen)
		
		return
	end
end

local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableAccountSwitcherIxpExposureGating = SharedFlagsModule.FFlagEnableAccountSwitcherIxpExposureGating
local FFlagUseStandardFoundationButtonVariantModule = require(Modules.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant)
local GetFFlagEnableLuaAccountPickerFunction = SharedFlagsModule.GetFFlagEnableLuaAccountPicker
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherRedesignIXP
local SessionCheckModule = require(Modules.LuaApp.Thunks.Authentication.SessionCheck)
local AccountCarouselContainer = require(CorePackages.Workspace.Packages.LandingPage).Components.AccountCarouselContainer
local SwitchToAccountModule = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.SwitchToAccount)
local GetAccountsListWithSignedOutAccountsFunction = require(CorePackages.Workspace.Packages.AccountSwitching).GetAccountsListWithSignedOutAccounts
local PrewarmWebViewModule = require(Modules.LuaApp.Thunks.Challenge.PrewarmWebView)
local FFlagAuthSecExclusions = SharedFlagsModule.FFlagAuthSecExclusions
local GetFFlagSetStatusBarHeightFunction = SharedFlagsModule.GetFFlagSetStatusBarHeight
local FFlagEnableAuthDeepLinkReceiver = SharedFlagsModule.FFlagEnableAuthDeepLinkReceiver
local FFlagLuaEnableGenreLandingDeeplink = SharedFlagsModule.FFlagLuaEnableGenreLandingDeeplink
local PreAuthDeepLinkUrlStore = AuthCommonModule.Stores.PreAuthDeepLinkUrlStore
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local GetUniverseIdFromPlaceIdFunction = AuthCommonModule.Thunks.GetUniverseIdFromPlaceId
local AccountPickerListView = require(CorePackages.Workspace.Packages.LandingPage).Components.AccountPickerListView
local GetFIntAccountPickerVariantOverrideFunction = SharedFlagsModule.GetFIntAccountPickerVariantOverride
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local ThirdPartyUserServiceIsAccountSwitchingSupportedEngineFeature = game:GetEngineFeature("ThirdPartyUserServiceIsAccountSwitchingSupported")
local ShowLandingPageThirdPartySwitchAccountButton = game:DefineFastFlag("ShowLandingPageThirdPartySwitchAccountButton", false)
local ShowBrazilContentRatingBadge4 = game:DefineFastFlag("ShowBrazilContentRatingBadge4", false)
local BrazilContentRatingBadge = require(CorePackages.Workspace.Packages.LandingPage).Components.BrazilContentRatingBadge

function LandingPage.init(p1)
	-- upvalues: UserModule (copy), AuthTimingUtil (copy), GetFFlagEnableVideoLandingModule (copy), GetFStringLandingVideoAssetModule (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), FFlagLuaEnableCustomizedInviteLandingPage (copy), FFlagLuaEnableCustomizedInviteLandingPageForTesting (copy), CustomizedLandingEDP (copy), GetDeepLinkDataModule (copy), ShowCustomizedLandingPageWithoutInviter1 (copy), CustomizedLandingLaunchGame (copy), ExperienceService (copy), GetUniverseIdFromPlaceIdFunction (copy), CustomizedLandingExperienceSort (copy), v1 (copy), FFlagLuaEnableGenreLandingDeeplink (copy), LandingPageConstants (copy), EventStreamConstantsModule (copy), GetFFlagEnableMultiPageSignupFunction (copy), FlagSettingsModule (copy), FFlagEnableLuaLoginRevamp (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), FFlagEnableLoginV1ForcedUsernameOverride (copy), GetFFlagEnableLuaAccountPickerFunction (copy), FFlagAuthSecExclusions (copy), FFlagEnableAuthButtonShownEvent (copy), FFlagEnableLuaAccountSwitchModule (copy), GetFFlagAddLandingPageAccountSwitcherIxpGatingModule (copy), AppStorageUtilitiesModule (copy), FFlagEnableKoreaKISAComplianceModule (copy), FFlagBypassGUACKoreaComplianceModule (copy), FFlagBypassIXPKoreaComplianceModule (copy), FFlagShouldLinkBrowserTrackerToDeviceModule (copy), PostAssociateBrowserTrackerToDeviceModule (copy)
	if p1.props.shouldDoSessionCheck then
		p1.props.sessionCheck(p1.props.networking, UserModule.fromLocalStorage(), p1.props.analytics, p1.props.appPolicy, p1.props.loggingProtocol)
	end
	AuthTimingUtil.landingPageLoadStart()
	p1.state = {
		shouldShowAccountSwitcherButton = false,
		landingVideoAsset = "",
		credProtocolIsAvailableResponse = nil,
		shouldShowCustomizedLandingPage = false,
		deepLinkData = nil,
		accountPickerAccounts = {}
	}
	
	if GetFFlagEnableVideoLandingModule() then
		if p1.props.landingVideoAsset and type(p1.props.landingVideoAsset) == "string" and string.len(p1.props.landingVideoAsset) > 0 then
			p1:setState({ landingVideoAsset = p1.props.landingVideoAsset })
		else
			p1:setState({ landingVideoAsset = GetFStringLandingVideoAssetModule() })
		end
	end
	function p1.maybeShowCustomizedLandingPage()
		-- upvalues: FFlagEnableAuthDeepLinkReceiver (upval), PreAuthDeepLinkUrlStore (upval), LinkingProtocol (upval), FFlagLuaEnableCustomizedInviteLandingPage (upval), p1 (copy), FFlagLuaEnableCustomizedInviteLandingPageForTesting (upval), CustomizedLandingEDP (upval), GetDeepLinkDataModule (upval), ShowCustomizedLandingPageWithoutInviter1 (upval), CustomizedLandingLaunchGame (upval), ExperienceService (upval), GetUniverseIdFromPlaceIdFunction (upval), CustomizedLandingExperienceSort (upval), v1 (upval), FFlagLuaEnableGenreLandingDeeplink (upval), LandingPageConstants (upval)
		local Url = if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL()
		
		if FFlagLuaEnableCustomizedInviteLandingPage and (p1.props.isCustomizedLandingPageEnabled or FFlagLuaEnableCustomizedInviteLandingPageForTesting) then
			if CustomizedLandingEDP and Url and string.find(Url, "game_details") then
				local GameIdD: string? = Url:match("gameId=(%d+)")
				
				if GameIdD then
					p1:setState({
						shouldShowCustomizedLandingPage = true,
						deepLinkData = { universeId = GameIdD }
					})
				end
			end
			if Url and string.find(Url, "share") then
				local DeepLinkDataModule = GetDeepLinkDataModule(p1.props.networking, Url)
				
				if DeepLinkDataModule then
					local UniverseId = DeepLinkDataModule.universeId
					local InviterId = DeepLinkDataModule.inviterId
					
					if ShowCustomizedLandingPageWithoutInviter1 and UniverseId or UniverseId and InviterId then
						p1:setState({
							shouldShowCustomizedLandingPage = true,
							deepLinkData = DeepLinkDataModule
						})
					end
				end
			end
			if CustomizedLandingLaunchGame then
				local PendingJoinAttempt = ExperienceService:GetPendingJoinAttempt()
				
				if PendingJoinAttempt then
					local PlaceId = PendingJoinAttempt.placeId
					
					if PlaceId then
						GetUniverseIdFromPlaceIdFunction(p1.props.networking, PlaceId):andThen(function(Result)
							-- upvalues: p1 (upval)
							if Result then
								p1:setState({
									shouldShowCustomizedLandingPage = true,
									deepLinkData = { universeId = Result }
								})
							end
						end):catch(function(_) end)
					end
				end
			end
			if CustomizedLandingExperienceSort and Url and string.find(Url, "navigation/experience_sort") then
				local SortId: string? = Url:match("sortId=([^&]+)")
				
				if SortId and v1[SortId] then
					p1:setState({
						shouldShowCustomizedLandingPage = true,
						deepLinkData = { genre = SortId }
					})
				end
			end
		end
		if FFlagLuaEnableGenreLandingDeeplink and Url and string.find(Url, "navigation/genre") then
			local Genre: string? = Url:match("genre=([^&]+)")
			
			if LandingPageConstants.Common.GetGenreBackgroundAssetId(Genre) then
				p1:setState({
					shouldShowCustomizedLandingPage = true,
					deepLinkData = { genre = Genre }
				})
			end
		end
	end
	
	function p1.navigateToSignUp(CredProtocolIsAvailableResponse)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), GetFFlagEnableMultiPageSignupFunction (upval), FlagSettingsModule (upval)
		local Networking = p1.props.networking
		local FetchSignUpBundlesFunction: (any) -> () = p1.props.fetchSignUpBundles
		local NavigateToSinglePageSignUpFunction: () -> () = p1.props.navigateToSinglePageSignUp
		local NavigateToMultiPageSignUpFunction: (any) -> () = p1.props.navigateToMultiPageSignUp
		local NavigateToBirthdayPageFunction: () -> () = p1.props.navigateToBirthdayPage
		p1.props.analytics.reportSignUpButtonClicked(EventStreamConstantsModule.Context.LandingScreen)
		
		if GetFFlagEnableMultiPageSignupFunction() and p1.props.shouldEnableMultiPageSignup then
			NavigateToMultiPageSignUpFunction(CredProtocolIsAvailableResponse)
			
			return
		end
		if p1.props.shouldShowMultipageSignupDirectionalTest then
			NavigateToBirthdayPageFunction()
			
			return
		end
		if FlagSettingsModule.SinglePageSignUpEnabled() then
			NavigateToSinglePageSignUpFunction()
			
			return
		else
			FetchSignUpBundlesFunction(Networking)
			NavigateToBirthdayPageFunction()
		end
	end
	
	function p1.navigateToLogin(p2, p3)
		-- upvalues: FFlagEnableLuaLoginRevamp (upval), p1 (copy), FFlagEnableLoginV2ForcedUsernameOverride (upval), FFlagEnableLoginV1ForcedUsernameOverride (upval)
		if FFlagEnableLuaLoginRevamp and p1.props.showLoginRevamp then
			if FFlagEnableLoginV2ForcedUsernameOverride then
				p1.props.gotoLoginV2(p2, p3)
				
				return
			else
				p1.props.gotoLoginV2(p2)
				
				return
			end
		elseif FFlagEnableLoginV1ForcedUsernameOverride then
			p1.props.gotoLogin(p3)
			
			return
		else
			p1.props.gotoLogin()
		end
	end
	
	function p1.openAccountSwitcher()
		-- upvalues: GetFFlagEnableLuaAccountPickerFunction (upval), p1 (copy), FFlagAuthSecExclusions (upval), FFlagEnableAuthButtonShownEvent (upval), EventStreamConstantsModule (upval), FFlagEnableLuaAccountSwitchModule (upval), GetFFlagAddLandingPageAccountSwitcherIxpGatingModule (upval), AppStorageUtilitiesModule (upval)
		if GetFFlagEnableLuaAccountPickerFunction() and p1.props.accountPickerVariantEnabled ~= 0 and p1.props.accountPickerVariantEnabled ~= nil then return end
		if FFlagAuthSecExclusions and p1.props.excludeAccountSwitcher then
			if FFlagEnableAuthButtonShownEvent then
				local Analytics = p1.props.analytics
				local SwitchAccountsExclusionsHidden = EventStreamConstantsModule.State.SwitchAccountsExclusionsHidden
				
				if not FFlagEnableAuthButtonShownEvent then return end
				Analytics.reportAuthButtonShown(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsExclusionsHidden, EventStreamConstantsModule.Origin.LandingScreen)
			end
			return
		elseif FFlagEnableLuaAccountSwitchModule == true and (not GetFFlagAddLandingPageAccountSwitcherIxpGatingModule() or p1.props.isAccountSwitcherEnabled == true) then
			local AccountBlob = AppStorageUtilitiesModule.getAccountBlob()
			
			local function v125(p2: number)
				-- upvalues: p1 (upval), FFlagEnableAuthButtonShownEvent (upval), EventStreamConstantsModule (upval)
				local ShouldShowAccountSwitcherButton: boolean = p2 ~= nil and p2 > 0
				p1:setState({
					shouldShowAccountSwitcherButton = ShouldShowAccountSwitcherButton
				})
				
				if FFlagEnableAuthButtonShownEvent then
					local Analytics = p1.props.analytics
					local SwitchAccountsShown = if ShouldShowAccountSwitcherButton then EventStreamConstantsModule.State.SwitchAccountsShown else EventStreamConstantsModule.State.SwitchAccountsBlobEmpty
					
					if not FFlagEnableAuthButtonShownEvent then return end
					Analytics.reportAuthButtonShown(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsShown, EventStreamConstantsModule.Origin.LandingScreen)
				end
			end
			
			if AccountBlob and AccountBlob ~= "" then
				p1.props.showAccountSwitcher(p1.props.networking, v125, p1.props.analytics, p1.props.appPolicy, p1.props.omniRecommendationsRequest, p1.props.enableFoundationDesign, p1.props.enableSignedOutAccounts, p1.props.showLoginRevamp)
				
				return
			end
			if FFlagEnableAuthButtonShownEvent then
				local Analytics = p1.props.analytics
				local SwitchAccountsBlobEmpty = EventStreamConstantsModule.State.SwitchAccountsBlobEmpty
				
				if FFlagEnableAuthButtonShownEvent then
					Analytics.reportAuthButtonShown(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsBlobEmpty, EventStreamConstantsModule.Origin.LandingScreen)
					
					return
				end
				return
			end
		elseif FFlagEnableAuthButtonShownEvent then
			local Analytics = p1.props.analytics
			local SwitchAccountsIxpHidden = EventStreamConstantsModule.State.SwitchAccountsIxpHidden
			
			if not FFlagEnableAuthButtonShownEvent then return end
			Analytics.reportAuthButtonShown(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsIxpHidden, EventStreamConstantsModule.Origin.LandingScreen)
		end
	end
	
	function p1.getShouldShowKISAAgreements()
		-- upvalues: FFlagEnableKoreaKISAComplianceModule (upval), p1 (copy), FFlagBypassGUACKoreaComplianceModule (upval), FFlagBypassIXPKoreaComplianceModule (upval)
		return FFlagEnableKoreaKISAComplianceModule and (if p1.props.useKoreaKISAUserAgreementPopup then p1.props.shouldShowKoreanKISASignUpFlow or FFlagBypassIXPKoreaComplianceModule else FFlagBypassGUACKoreaComplianceModule and (p1.props.shouldShowKoreanKISASignUpFlow or FFlagBypassIXPKoreaComplianceModule))
	end
	
	if FFlagShouldLinkBrowserTrackerToDeviceModule() then
		PostAssociateBrowserTrackerToDeviceModule(p1.props.networking):catch(function() end)
	end
	if FFlagLuaEnableCustomizedInviteLandingPage and (p1.props.isCustomizedLandingPageEnabled or FFlagLuaEnableCustomizedInviteLandingPageForTesting) or FFlagLuaEnableGenreLandingDeeplink then
		p1.maybeShowCustomizedLandingPage()
	end
end

function LandingPage.didUpdate(p1, _)
	-- upvalues: GetFFlagSetStatusBarHeightFunction (copy), UIConstants (copy)
	if GetFFlagSetStatusBarHeightFunction() and p1.props.isCompact then
		p1.props.setStatusBarHeight(UIConstants.STATUS_BAR_HEIGHT)
	end
end

function LandingPage.render(p1)
	-- upvalues: GetFFlagEnableLuaAccountPickerFunction (copy), AccountCarouselContainer (copy), AccountPickerListView (copy), RoactModule (copy), AppStorageUtilitiesModule (copy), WithLocalizationModule (copy), UiMode (copy), TenFootLogoWithContentsLayoutModule (copy), LogoWithContentsLayoutModule (copy), FFlagLuaEnableGenreLandingDeeplink (copy), LandingPageConstants (copy), FFlagLuaEnableCustomizedInviteLandingPage (copy), GetFFlagEnableVideoLandingModule (copy), VideoWithContentsLayoutModule (copy), CustomizedInviteLandingPageLayoutModule (copy), ShowBrazilContentRatingBadge4 (copy), FFlagBypassIXPBrazilComplianceModule (copy), FormFactor (copy), AlignmentModule (copy), BrazilContentRatingBadge (copy), FitChildrenModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), TelemetryConfigs (copy), FFlagEnableLuaAccountSwitchModule (copy), FFlagUseStandardFoundationButtonVariantModule (copy), EventStreamConstantsModule (copy), ThirdPartyUserService (copy), ThirdPartyUserServiceIsAccountSwitchingSupportedEngineFeature (copy), ShowLandingPageThirdPartySwitchAccountButton (copy), ThirdPartySwitchAccountComponent (copy), DisclaimerLinksModule (copy)
	return if GetFFlagEnableLuaAccountPickerFunction() and p1.props.accountPickerVariantEnabled ~= 0 and p1.props.accountPickerVariantEnabled ~= nil and #p1.state.accountPickerAccounts > 0 then RoactModule.createElement(({
		[1] = AccountCarouselContainer,
		[2] = AccountPickerListView
	})[p1.props.accountPickerVariantEnabled], {
		accounts = p1.state.accountPickerAccounts,
		avatarSize = UDim2.new(0, 160, 0, 240),
		onAvatarActivated = function(p2, p3, p4)
			-- upvalues: AppStorageUtilitiesModule (upval), p1 (copy)
			if p4 then
				AppStorageUtilitiesModule.setAccountSwitchTargetUsername(p3)
				AppStorageUtilitiesModule.flush()
				p1.props.navigateSwitchToAccount(p1.props.networking, p2, p1.props.appPolicy, p1.props.omniRecommendationsRequest, p1.props.analytics)
				
				return
			else
				p1.navigateToLogin(p1.state.credProtocolIsAvailableResponse, p3)
			end
		end,
		setAccountPickerAccounts = function(AccountPickerAccounts)
			-- upvalues: p1 (copy)
			p1:setState({ accountPickerAccounts = AccountPickerAccounts })
		end,
		navigateToSignup = function()
			-- upvalues: p1 (copy)
			p1.navigateToSignUp(p1.state.credProtocolIsAvailableResponse)
		end,
		navigateToLogin = function()
			-- upvalues: p1 (copy)
			p1.navigateToLogin(p1.state.credProtocolIsAvailableResponse, "")
		end
	}) else WithLocalizationModule({
		signUpText = "Authentication.SignUp.Action.CreateAccount",
		signInText = "Authentication.Login.Action.SignIn",
		switchAccountsText = "Authentication.AccountSwitch.Action.SwitchAccount"
	})(function(p2)
		-- upvalues: p1 (copy), UiMode (upval), TenFootLogoWithContentsLayoutModule (upval), LogoWithContentsLayoutModule (upval), FFlagLuaEnableGenreLandingDeeplink (upval), LandingPageConstants (upval), FFlagLuaEnableCustomizedInviteLandingPage (upval), GetFFlagEnableVideoLandingModule (upval), VideoWithContentsLayoutModule (upval), CustomizedInviteLandingPageLayoutModule (upval), ShowBrazilContentRatingBadge4 (upval), FFlagBypassIXPBrazilComplianceModule (upval), RoactModule (upval), FormFactor (upval), AlignmentModule (upval), BrazilContentRatingBadge (upval), FitChildrenModule (upval), Button (upval), ButtonVariant (upval), ButtonSize (upval), TelemetryConfigs (upval), FFlagEnableLuaAccountSwitchModule (upval), FFlagUseStandardFoundationButtonVariantModule (upval), EventStreamConstantsModule (upval), ThirdPartyUserService (upval), ThirdPartyUserServiceIsAccountSwitchingSupportedEngineFeature (upval), ShowLandingPageThirdPartySwitchAccountButton (upval), ThirdPartySwitchAccountComponent (upval), DisclaimerLinksModule (upval)
		local LandingPage = p1.props.tokens.LuaApps.LandingPage
		local IsUiModeMatch = p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		local TenFootLogoWithContentsLayoutModule1 = if IsUiModeMatch then TenFootLogoWithContentsLayoutModule else LogoWithContentsLayoutModule
		local HasGenreBackgroundAssetId = false
		
		if FFlagLuaEnableGenreLandingDeeplink and p1.state.shouldShowCustomizedLandingPage then
			local DeepLinkData = p1.state.deepLinkData
			
			if DeepLinkData and DeepLinkData.genre then
				HasGenreBackgroundAssetId = LandingPageConstants.Common.GetGenreBackgroundAssetId(DeepLinkData.genre) ~= nil
			end
		end
		local ShouldShowCustomizedLandingPage = FFlagLuaEnableCustomizedInviteLandingPage and p1.state.shouldShowCustomizedLandingPage or HasGenreBackgroundAssetId
		local NoShouldShowCustomizedLandingPage: boolean = GetFFlagEnableVideoLandingModule() and (p1.props.landingVideoEnabled and not ShouldShowCustomizedLandingPage)
		
		if NoShouldShowCustomizedLandingPage then
			TenFootLogoWithContentsLayoutModule1 = VideoWithContentsLayoutModule
		elseif ShouldShowCustomizedLandingPage then
			TenFootLogoWithContentsLayoutModule1 = CustomizedInviteLandingPageLayoutModule
		end
		local SignUpText = p2.signUpText
		local ShouldDisplayBrazilAgeRatingIXP = ShowBrazilContentRatingBadge4 and (p1.props.showBrazilContentRatingLogo and (p1.props.shouldDisplayBrazilAgeRatingIXP or FFlagBypassIXPBrazilComplianceModule))
		
		return RoactModule.createElement(TenFootLogoWithContentsLayoutModule1, {
			ContentAlign = if IsUiModeMatch or p1.props.formFactor ~= FormFactor.COMPACT then AlignmentModule.Top else AlignmentModule.Bottom,
			ref = p1.props.containerRef,
			VNAgeBadgeEnabled = p1.props.showVNGAge12Badge,
			screenSize = if GetFFlagEnableVideoLandingModule() or ShouldShowCustomizedLandingPage then p1.props.screenSize else nil,
			statusBarHeight = if GetFFlagEnableVideoLandingModule() or ShouldShowCustomizedLandingPage then p1.props.statusBarHeight else nil,
			globalGuiInset = if GetFFlagEnableVideoLandingModule() or ShouldShowCustomizedLandingPage then p1.props.globalGuiInset else nil,
			formFactor = if GetFFlagEnableVideoLandingModule() then p1.props.formFactor else nil,
			landingVideoAsset = if GetFFlagEnableVideoLandingModule() then p1.state.landingVideoAsset else nil,
			deepLinkData = if ShouldShowCustomizedLandingPage then p1.state.deepLinkData else nil,
			containerRef = p1.props.containerRef,
			FooterElement = if ShouldDisplayBrazilAgeRatingIXP then RoactModule.createElement(BrazilContentRatingBadge) else nil,
			FooterHeight = if ShouldDisplayBrazilAgeRatingIXP then LandingPage.brazilBadgeHeight else 0
		}, {
			LandingPageContents = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -40, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				ref = p1.props.ref
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, LandingPage.contentPadding),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Bottom
				}),
				UIPadding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 36) }),
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, 0),
					MaxSize = Vector2.new(LandingPage.buttonWidth, 1e999)
				}),
				SignUpButton = if NoShouldShowCustomizedLandingPage then RoactModule.createElement(Button, {
					LayoutOrder = 1,
					variant = ButtonVariant.Emphasis,
					size = ButtonSize.Large,
					width = UDim.new(1, 0),
					text = SignUpText,
					onActivated = function()
						-- upvalues: p1 (upval), TelemetryConfigs (upval)
						p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LandingSignupButtonClickedConfig, 1)
						p1.navigateToSignUp(p1.state.credProtocolIsAvailableResponse)
					end,
					[RoactModule.Ref] = p1.props.defaultRef
				}) else RoactModule.createElement(Button, {
					LayoutOrder = 1,
					variant = ButtonVariant.SubEmphasis,
					size = ButtonSize.Large,
					text = SignUpText,
					onActivated = function()
						-- upvalues: p1 (upval), TelemetryConfigs (upval)
						p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LandingSignupButtonClickedConfig, 1)
						p1.navigateToSignUp(p1.state.credProtocolIsAvailableResponse)
					end,
					width = UDim.new(1, 0),
					[RoactModule.Ref] = p1.props.defaultRef
				}),
				AccountSwitchButton = FFlagEnableLuaAccountSwitchModule == true and (p1.state.shouldShowAccountSwitcherButton and RoactModule.createElement(Button, {
					LayoutOrder = 2,
					variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
					size = ButtonSize.Large,
					width = UDim.new(1, 0),
					text = p2.switchAccountsText,
					onActivated = function()
						-- upvalues: p1 (upval), EventStreamConstantsModule (upval)
						p1.props.analytics.reportSwitchAccountButtonClicked(EventStreamConstantsModule.Context.LandingScreen)
						p1.openAccountSwitcher()
					end
				})),
				LoginButton = RoactModule.createElement(Button, {
					LayoutOrder = 3,
					variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
					size = ButtonSize.Large,
					width = UDim.new(1, 0),
					text = p2.signInText,
					onActivated = function()
						-- upvalues: p1 (upval), TelemetryConfigs (upval), EventStreamConstantsModule (upval)
						p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LandingLoginButtonClickedConfig, 1)
						p1.props.analytics.reportLogInButtonClicked(EventStreamConstantsModule.Context.LandingScreen)
						p1.props.analytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LandingScreen, EventStreamConstantsModule.Button.LogIn)
						p1.navigateToLogin(p1.state.credProtocolIsAvailableResponse)
					end
				}),
				ThirdPartySwitchAccountComponent = if ThirdPartyUserService and ThirdPartyUserServiceIsAccountSwitchingSupportedEngineFeature and ThirdPartyUserService:IsAccountSwitchingSupported() and ShowLandingPageThirdPartySwitchAccountButton then RoactModule.createElement(ThirdPartySwitchAccountComponent, {
					layoutOrder = 4,
					dividerTextKey = "CommonUI.Features.Labels.ConnectTo",
					thirdPartyUserName = ThirdPartyUserService:GetUserPlatformName()
				}) else nil,
				DisclaimerLinks = if p1.props.useVNGUserAgreementPopup or (p1.getShouldShowKISAAgreements() or IsUiModeMatch) then nil else RoactModule.createElement(DisclaimerLinksModule, {
					LayoutOrder = if ShowLandingPageThirdPartySwitchAccountButton then 5 else 4
				})
			})
		})
	end)
end

function LandingPage.didMount(p1)
	-- upvalues: GetFFlagEnableLuaAccountPickerFunction (copy), GetAccountsListWithSignedOutAccountsFunction (copy), InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstantsModule (copy), FFlagEnableAccountSwitcherIxpExposureGating (copy), IXPService (copy), AppBtidLayers (copy), GetFFlagEnableVideoLandingModule (copy), EnablePrewarmChallengeWebView (copy), PrewarmWebViewModule (copy), TelemetryConfigs (copy), LandingPageMountSignalEnabledEngineFeature (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), SystemThemeFeatureModule (copy)
	if GetFFlagEnableLuaAccountPickerFunction() and p1.props.accountPickerVariantEnabled ~= 0 and p1.props.accountPickerVariantEnabled ~= nil then
		pcall(function()
			-- upvalues: GetAccountsListWithSignedOutAccountsFunction (upval), p1 (copy)
			GetAccountsListWithSignedOutAccountsFunction(p1.props.networking, {
				isAuthenticated = false,
				filterUnauthenticatedSessionsForAccountPicker = true
			}):andThen(function(Result)
				-- upvalues: p1 (upval)
				p1:setState({ accountPickerAccounts = Result })
			end):catch(function(Err)
				warn(Err)
			end)
		end)
	end
	InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstantsModule.Origin.LandingScreen, "")
	
	if FFlagEnableAccountSwitcherIxpExposureGating then
		IXPService:LogBrowserTrackerLayerExposure(AppBtidLayers.AccountSwitcherLayer)
	end
	p1.openAccountSwitcher()
	
	if GetFFlagEnableVideoLandingModule() then
		p1.props.analytics.reportAuthPageload(EventStreamConstantsModule.Context.LandingScreenVideo, (tostring(true)))
	else
		p1.props.analytics.reportAuthPageload(EventStreamConstantsModule.Context.LandingScreenVideo, (tostring(false)))
	end
	p1.props.loggingProtocol:logEventOnce("landing_page_did_mount")
	
	if EnablePrewarmChallengeWebView then
		local Success, Result = pcall(function()
			-- upvalues: PrewarmWebViewModule (upval)
			PrewarmWebViewModule.init()
		end)
		
		if not Success or not Result then
			p1.props.analytics.reportAuthClientError(EventStreamConstantsModule.Context.LandingScreen, "prewarm_challenge_webview_error")
		end
	end
	p1.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LandingPageMountTelemetryConfig, 1)
	
	if LandingPageMountSignalEnabledEngineFeature then
		p1.props.appLifecycleObserverService:TriggerOnLandingPageMount()
	end
	p1.props.analytics.reportAuthPageload(EventStreamConstantsModule.Context.LandingScreen, if FFlagEnableAuthDeepLinkReceiver then PreAuthDeepLinkUrlStore.getUrl() else LinkingProtocol:getLastLuaURL())
	local ClockTime = os.clock()
	Default:isAvailable(Default.CredentialsTypes.all, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), ClockTime (copy)
		p1.props.analytics.reportAuthPageload(EventStreamConstantsModule.Context.LandingPageIsAvailablePrefetch, (tostring(os.clock() - ClockTime)))
		p1:setState({ credProtocolIsAvailableResponse = Result })
	end)
	SystemThemeFeatureModule.SetDarkThemeOverride()
end

function LandingPage:willUnmount()
	-- upvalues: AuthPageloadFunction (copy), EventStreamConstantsModule (copy), EnablePrewarmChallengeWebView (copy), PrewarmWebViewModule (copy), SystemThemeFeatureModule (copy)
	AuthPageloadFunction(EventStreamConstantsModule.Context.LandingPageUnmount)
	
	if EnablePrewarmChallengeWebView then
		pcall(function()
			-- upvalues: PrewarmWebViewModule (upval)
			PrewarmWebViewModule.cleanup()
		end)
	end
	SystemThemeFeatureModule.ClearThemeOverride()
end

local v2 = RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService,
	analytics = RoactAnalyticsAuthEventsModule,
	loggingProtocol = AppLogging,
	appLifecycleObserverService = AppAppLifecycleObserverService
})((RoactAppPolicy.connect(function(AppPolicy, _)
	return {
		showVNGAge12Badge = AppPolicy.getShowVNGAge12Badge(),
		useVNGUserAgreementPopup = AppPolicy.getUseVNGUserAgreementPopup(),
		useKoreaKISAUserAgreementPopup = AppPolicy.getUseKoreaKISAUserAgreementPopup(),
		excludeAccountSwitcher = AppPolicy.getExcludeAccountSwitcher(),
		showBrazilContentRatingLogo = AppPolicy.getShowBrazilContentRatingLogo(),
		appPolicy = AppPolicy
	}
end)((RoactRoduxModule.connect(function(p1, _)
	return {
		formFactor = p1.FormFactor,
		screenSize = p1.ScreenSize,
		statusBarHeight = p1.TopBar.statusBarHeight,
		globalGuiInset = p1.GlobalGuiInset
	}
end, function(Callback)
	-- upvalues: FetchSignUpBundlesModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), AppPageModule (copy), NavigateDownModule (copy), GetFFlagEnableLuaAccountPickerFunction (copy), SwitchToAccountModule (copy), FFlagEnableLoginV1ForcedUsernameOverride (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), OpenAccountSwitcherModule (copy), EventStreamConstantsModule (copy), SessionCheckModule (copy), SetStatusBarHeightModule (copy)
	return {
		fetchSignUpBundles = function(p1)
			-- upvalues: Callback (copy), FetchSignUpBundlesModule (upval)
			return Callback(FetchSignUpBundlesModule.Fetch(p1))
		end,
		navigateToSinglePageSignUp = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), AppPageModule (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPageModule.SinglePageSignUp }))
				
				return
			else
				Callback(NavigateDownModule({ name = AppPageModule.SinglePageSignUp }))
			end
		end,
		navigateToMultiPageSignUp = function(CredProtocolIsAvailableResponse)
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.MultiPageSignup,
				extraProps = {
					enforceResetState = true,
					credProtocolIsAvailableResponse = CredProtocolIsAvailableResponse
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		navigateSwitchToAccount = function(p1, p2, p3, p4, p5)
			-- upvalues: GetFFlagEnableLuaAccountPickerFunction (upval), Callback (copy), SwitchToAccountModule (upval)
			if GetFFlagEnableLuaAccountPickerFunction() then
				Callback(SwitchToAccountModule(p1, p2, p3, p4, p5))
				
				return
			end
		end,
		navigateToBirthdayPage = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), AppPageModule (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPageModule.Birthday }))
				
				return
			else
				Callback(NavigateDownModule({ name = AppPageModule.Birthday }))
			end
		end,
		gotoLogin = function(p1)
			-- upvalues: AppPageModule (upval), FFlagEnableLoginV1ForcedUsernameOverride (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.Login,
				extraProps = {
					forcedUsernameOverride = if FFlagEnableLoginV1ForcedUsernameOverride then p1 else nil
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		gotoLoginV2 = function(CredProtocolIsAvailableResponse, p1)
			-- upvalues: AppPageModule (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.LoginV2,
				extraProps = {
					credProtocolIsAvailableResponse = CredProtocolIsAvailableResponse,
					forcedUsernameOverride = if FFlagEnableLoginV2ForcedUsernameOverride then p1 else nil
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		showAccountSwitcher = function(p1, Callback1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), OpenAccountSwitcherModule (upval), EventStreamConstantsModule (upval)
			Callback(OpenAccountSwitcherModule(true, p1, EventStreamConstantsModule.Origin.LandingScreen, p2, p3, p4, p5, p6, p7)):andThen(function(Result)
				-- upvalues: Callback1 (copy)
				if Result ~= nil and Callback1 then
					Callback1(Result)
				end
			end)
		end,
		sessionCheck = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), SessionCheckModule (upval)
			return Callback(SessionCheckModule(p1, p2, p3, p4, p5))
		end,
		setStatusBarHeight = function(p1)
			-- upvalues: Callback (copy), SetStatusBarHeightModule (upval)
			return Callback(SetStatusBarHeightModule(p1))
		end
	}
end)(LandingPage)))))

local function v106(p1)
	-- upvalues: UseUiModeInfo (copy), UseDesignTokens (copy), UseLandingPageNavigationBindingsModule (copy), GetFFlagSetStatusBarHeightFunction (copy), ResponsiveModule (copy), ReactFocusNavigationModule (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
	local UiModeInfo = UseUiModeInfo()
	local Tokens = UseDesignTokens()
	local UseBreakpointXOrSmallerResult = if GetFFlagSetStatusBarHeightFunction() then ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Medium) else false
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((UseLandingPageNavigationBindingsModule()))
	
	return RoactModule.createElement(v2, CryoModule.Dictionary.join({
		eventHandlerRef = nil,
		uiModeInfo = UiModeInfo,
		tokens = Tokens,
		defaultRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2,
		isCompact = UseBreakpointXOrSmallerResult
	}, p1))
end

if GetFFlagEnableVideoLandingModule() then
	v106 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.LandingLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		local v3 = p1[AppBtidLayers.LandingLayer] or {}
		
		return {
			landingVideoEnabled = v3.landingVideoEnabled,
			landingVideoAsset = v3.landingVideoAsset
		}
	end)(v106)
end
if FFlagLuaEnableCustomizedInviteLandingPage then
	v106 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.LandingLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			isCustomizedLandingPageEnabled = (p1[AppBtidLayers.LandingLayer] or {}).isCustomizedLandingPageEnabled
		}
	end)(v106)
end
if GetFFlagEnableLuaAccountPickerFunction() then
	v106 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.LandingLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy), GetFIntAccountPickerVariantOverrideFunction (copy)
		local v3 = p1[AppBtidLayers.LandingLayer] or {}
		
		return {
			accountPickerVariantEnabled = v3.accountPickerVariantEnabled and tonumber(v3.accountPickerVariantEnabled) or GetFIntAccountPickerVariantOverrideFunction()
		}
	end)(v106)
end
local _ = function()
	-- upvalues: GetFFlagEnableMultiPageSignupExperimentModule (copy), GetFFlagEnableMultiPageSignupFunction (copy), FFlagEnableKoreaKISAComplianceModule (copy)
	return GetFFlagEnableMultiPageSignupExperimentModule() or (GetFFlagEnableMultiPageSignupFunction() or FFlagEnableKoreaKISAComplianceModule)
end

if GetFFlagEnableMultiPageSignupExperimentModule() or (GetFFlagEnableMultiPageSignupFunction() or FFlagEnableKoreaKISAComplianceModule) then
	v106 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.SignupLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		local v3 = p1[AppBtidLayers.SignupLayer] or {}
		
		return {
			shouldShowMultipageSignupDirectionalTest = v3.shouldShowMultipageSignupDirectionalTest,
			shouldShowKoreanKISASignUpFlow = v3.shouldShowKoreanKISASignUpFlow,
			shouldEnableMultiPageSignup = v3.shouldEnableMultiPageSignup
		}
	end)(v106)
end
if FFlagEnableLuaLoginRevamp then
	v106 = RoactAppExperimentModule.connectBrowserTrackerLayer({ FStringLuaLoginRevampIxpLayer }, function(p1, _)
		-- upvalues: FStringLuaLoginRevampIxpLayer (copy)
		return {
			showLoginRevamp = (p1[FStringLuaLoginRevampIxpLayer] or {}).showLoginRevamp
		}
	end)(v106)
end
local v3 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.LandingLayer }, function(p1, _)
	-- upvalues: AppBtidLayers (copy)
	return {
		shouldDoSessionCheck = (p1[AppBtidLayers.LandingLayer] or {}).shouldDoSessionCheck
	}
end)(v106)

if ShowBrazilContentRatingBadge4 then
	v3 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.LandingLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldDisplayBrazilAgeRatingIXP = (p1[AppBtidLayers.LandingLayer] or {}).shouldDisplayBrazilAgeRating
		}
	end)(v3)
end
local v4 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.AccountSwitcherLayer }, function(p1, _)
	-- upvalues: AppBtidLayers (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy)
	local v5 = p1[AppBtidLayers.AccountSwitcherLayer] or {}
	
	return if GetFFlagEnableAccountSwitcherRedesignIXPFunction() then {
		isAccountSwitcherEnabled = v5.isAccountSwitcherEnabled,
		enableFoundationDesign = v5.enableAccountSwitcherFoundationDesign == true,
		enableSignedOutAccounts = v5.enableAccountSwitcherSignedOutAccounts == true
	} else {
		enableFoundationDesign = true,
		enableSignedOutAccounts = true,
		isAccountSwitcherEnabled = v5.isAccountSwitcherEnabled
	}
end)(v3)

return function(p1)
	-- upvalues: FlagSettingsModule (copy), UseAppPolicyFunction (copy), RoactModule (copy), LuobuLandingPageModule (copy), FFlagLuafiedWechatQQLogin (copy), WechatQQLoginPage (copy), v4 (ref)
	return if if FlagSettingsModule.LuaAuthEnabledForLuobu() then UseAppPolicyFunction(function(p2)
		return p2.useLuobuAuthentication()
	end) else false then RoactModule.createElement(LuobuLandingPageModule, p1) elseif if FFlagLuafiedWechatQQLogin then UseAppPolicyFunction(function(p2)
		return p2.useWechatQQAuthentication()
	end) else false then RoactModule.createElement(WechatQQLoginPage, p1) else RoactModule.createElement(v4, p1)
end