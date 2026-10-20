local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local ReactModule = require(CorePackages.Packages.React)
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local ProfilePlatformNavigatorModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfilePlatformNavigator)
local ProfileWrapperContextModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ContainerModule = require(Modules.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container)
local IsRootRouteInRNModule = require(Modules.LuaApp.Navigation.isRootRouteInRN)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateDownTo3DQRCodePageModule = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local AppPageModule = require(Modules.LuaApp.AppPage)
local BrowserServiceWrapperModule = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local HttpService = game:GetService("HttpService")
local Enums = require(CorePackages.Workspace.Packages.FriendsNetworking).Enums
local ProfileTypes = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local NavigateBackFunction = NavigationRoduxModule.Thunks.NavigateBack
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local PeekViewDismissedEvent = require(CorePackages.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local OpenAppItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenAppItemDetails)
local NavigateIntoItemDetailsPageModule = require(Modules.AvatarExperience.Common.Thunks.NavigateIntoItemDetailsPage)
local UpdateAvatarEquipsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GetDeepValueFunction = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local FFlagProfilePlatformEnableStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformEnableImpressions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableImpressions
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local SetCreatorFilterModule = require(Modules.AvatarExperience.Catalog.Actions.SetCreatorFilter)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddSocialLinksToCommunityProfile = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagEnablePlatformProfileContextualMenuOption = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagAddIEMProfilePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(CorePackages.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(CorePackages.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableCurrencyTransfer = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagSocialEnableProfileInspectAndBuy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local AvatarEditorCategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories
local FFlagEnableMobileGameJoinCard = SharedFlagsModule.FFlagEnableMobileGameJoinCard
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState

local function v52(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), FFlagAXEnableProfileTab (copy), UseNavigationPropsFunction (copy), FFlagEnableMobileGameJoinCard (copy), Enums (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStoreFunction (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), GetDeepValueFunction (copy), FFlagEnablePlatformProfileContextualMenuOption (copy), UserProfilesModule (copy), ProfileTypes (copy), FFlagProfilePlatformEnableImpressions (copy), ReactModule (copy), HttpService (copy), NavigateDownTo3DQRCodePageModule (copy), Contexts (copy), PeekViewDismissedEvent (copy), DefaultAnalyticsService (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), NavigateIntoItemDetailsPageModule (copy), ConstantsModule (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy), OpenAppItemDetailsModule (copy), FFlagProfilePlatformEnableStore (copy), SetCreatorFilterModule (copy), NavigateToSearchModule (copy), FFlagAddIEMProfilePage (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), AvatarScreen (copy), UtilsModule (copy), AvatarEditorCategories (copy), FFlagProfilePlatformEditBackgroundMenuItemModule (copy), AppPageModule (copy), BrowserServiceWrapperModule (copy), NavigateDownModule (copy), FFlagAddSocialLinksToCommunityProfile (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), CloseCentralOverlayModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagSocialEnableProfileInspectAndBuy (copy), UpdateAvatarEquipsModule (copy), ProfileWrapperContextModule (copy), ProfilePlatformNavigatorModule (copy), ContainerModule (copy), IsRootRouteInRNModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local IsEmbedded = if FFlagAXEnableProfileTab then p1.embedded == true else nil
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(ProfileId, p2)
		-- upvalues: FFlagEnableMobileGameJoinCard (upval)
		return {
			forceFullView = nil,
			headerVariant = nil,
			currentlyWearingVariant = nil,
			itemDetailsFullView = nil,
			profileId = ProfileId,
			profileType = p2.profileType,
			absolutePosition = p2.absolutePosition,
			source = p2.source,
			contextualInfoType = p2.contextualInfoType,
			contextualInfoDisplay = p2.contextualInfoDisplay,
			profileUserNickname = p2.profileUserNickname,
			sessionIdOverride = p2.sessionIdOverride,
			isRecommendation = p2.isRecommendation,
			recommendationContextType = p2.recommendationContextType,
			recommendationSessionId = p2.recommendationSessionId,
			recommendationRank = p2.recommendationRank,
			offNetworkFriendRequestToken = p2.offNetworkFriendRequestToken,
			shareLinkId = p2.shareLinkId,
			friendshipOriginSourceType = p2.friendshipOriginSourceType,
			initialPresence = p2.initialPresence,
			mountAsFullView = if FFlagEnableMobileGameJoinCard then p2.mountAsFullView else nil
		}
	end)
	local EmbedNavigationProps = if FFlagAXEnableProfileTab and IsEmbedded then p1.embedNavigationProps else UseNavigationPropsResult
	local RawValueResult = if EmbedNavigationProps.source == "playerSearch" then Enums.FriendshipOriginSourceType.PlayerSearch.rawValue() elseif EmbedNavigationProps.isRecommendation then Enums.FriendshipOriginSourceType.FriendRecommendations.rawValue() elseif EmbedNavigationProps.friendshipOriginSourceType then EmbedNavigationProps.friendshipOriginSourceType else Enums.FriendshipOriginSourceType.UserProfile.rawValue()
	local Name = nil
	
	if FFlagSignalsNavP3hMisc then
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStoreFunction(false).getCurrentPage)
		Name = UseSignalStateResult and UseSignalStateResult.name or nil
	else
		Name = UseSelectorFunction(function(p2)
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval), GetDeepValueFunction (upval)
			if FFlagUseNavigationSelectors then
				return Selectors.selectCurrentPageName(p2)
			else
				local NavigationHistory = GetDeepValueFunction(p2, "Navigation.history") or {}
				
				return ((NavigationHistory[#NavigationHistory] or {})[#NavigationHistory] or {}).name
			end
		end)
	end
	local UseUserProfilesFetchResult = if FFlagEnablePlatformProfileContextualMenuOption then UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { EmbedNavigationProps.profileId },
		query = UserProfilesModule.Queries.userProfilesPlatformProfileIdsByUserIds
	}) else nil
	local PlatformProfileIdFromId = if FFlagEnablePlatformProfileContextualMenuOption and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getPlatformProfileIdFromId(UseUserProfilesFetchResult.data, EmbedNavigationProps.profileId) else nil
	local Text = tostring(EmbedNavigationProps.profileId)
	local ProfileType = EmbedNavigationProps.profileType or ProfileTypes.User
	local UseMemoResult = if FFlagProfilePlatformEnableImpressions then ReactModule.useMemo(function()
		-- upvalues: EmbedNavigationProps (copy), HttpService (upval)
		return EmbedNavigationProps.sessionIdOverride or HttpService:GenerateGUID(false)
	end, { EmbedNavigationProps.sessionIdOverride }) else nil
	
	return ReactModule.createElement(ProfileWrapperContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseDispatchResult (copy), NavigateDownTo3DQRCodePageModule (upval), Contexts (upval), FFlagAXEnableProfileTab (upval), IsEmbedded (copy), PeekViewDismissedEvent (upval), DefaultAnalyticsService (upval), Name (ref), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackFunction (upval), NavigateIntoItemDetailsPageModule (upval), UseNavigationResult (copy), ConstantsModule (upval), EmbedNavigationProps (copy), FFlagAXFixPurchaseSurfaceLogging (upval), ImpressionEnums (upval), OpenAppItemDetailsModule (upval), FFlagProfilePlatformEnableStore (upval), SetCreatorFilterModule (upval), NavigateToSearchModule (upval), FFlagAddIEMProfilePage (upval), FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), AvatarScreen (upval), UtilsModule (upval), AvatarEditorCategories (upval), FFlagProfilePlatformEditBackgroundMenuItemModule (upval), AppPageModule (upval), BrowserServiceWrapperModule (upval), NavigateDownModule (upval), FFlagAddSocialLinksToCommunityProfile (upval), OpenCentralOverlayForLeaveRobloxAlertModule (upval), CloseCentralOverlayModule (upval), FFlagProfilePlatformEnableCurrencyTransfer (upval), UseRoactServiceResult (copy), FFlagSocialEnableProfileInspectAndBuy (upval), UpdateAvatarEquipsModule (upval), RawValueResult (ref), FFlagProfilePlatformEnableImpressions (upval), UseMemoResult (copy), Text (copy), PlatformProfileIdFromId (copy), ProfileType (copy), FFlagEnableMobileGameJoinCard (upval)
			return {
				navigateTo = {
					qRCodePage = function()
						-- upvalues: UseDispatchResult (upval), NavigateDownTo3DQRCodePageModule (upval), Contexts (upval)
						UseDispatchResult(NavigateDownTo3DQRCodePageModule({ source = Contexts.ProfileCard }))
					end,
					previousView = function(p2)
						-- upvalues: FFlagAXEnableProfileTab (upval), IsEmbedded (upval), PeekViewDismissedEvent (upval), DefaultAnalyticsService (upval), Name (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval)
						if FFlagAXEnableProfileTab and IsEmbedded then return end
						if p2 then
							PeekViewDismissedEvent.logEvent(DefaultAnalyticsService.EventStream, "ProfilePeekView", {
								dismissMethod = PeekViewDismissedEvent.dismissMethodEnum.topBarTap,
								page = Name
							})
						end
						local NoP4 = not p2 or nil
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.back(NoP4)
							
							return
						else
							UseDispatchResult(NavigateBackFunction(NoP4))
						end
					end,
					itemDetails = function(ItemId)
						-- upvalues: FFlagAXEnableProfileTab (upval), IsEmbedded (upval), UseDispatchResult (upval), NavigateIntoItemDetailsPageModule (upval), UseNavigationResult (upval), ConstantsModule (upval), EmbedNavigationProps (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ImpressionEnums (upval), OpenAppItemDetailsModule (upval)
						if FFlagAXEnableProfileTab and IsEmbedded then
							UseDispatchResult(NavigateIntoItemDetailsPageModule(UseNavigationResult, {
								mountAnimation = false,
								fromProfile = false,
								isFirstItemDetails = true,
								itemId = ItemId,
								itemType = ConstantsModule.ItemType.Asset,
								showFullWithNoPeekView = EmbedNavigationProps.itemDetailsFullView,
								fromSurface = if FFlagAXFixPurchaseSurfaceLogging then ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE else nil,
								itemDetailsPeekViewRefs = {}
							}))
							
							return
						else
							UseDispatchResult(OpenAppItemDetailsModule(ItemId, ConstantsModule.ItemType.Asset, nil, if FFlagAXFixPurchaseSurfaceLogging then true else nil, if FFlagAXFixPurchaseSurfaceLogging then ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE else nil))
						end
					end,
					itemOrBundleDetails = if FFlagProfilePlatformEnableStore then function(ItemId, ItemType)
						-- upvalues: FFlagAXEnableProfileTab (upval), IsEmbedded (upval), UseDispatchResult (upval), NavigateIntoItemDetailsPageModule (upval), UseNavigationResult (upval), EmbedNavigationProps (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ImpressionEnums (upval), OpenAppItemDetailsModule (upval)
						if FFlagAXEnableProfileTab and IsEmbedded then
							UseDispatchResult(NavigateIntoItemDetailsPageModule(UseNavigationResult, {
								mountAnimation = false,
								fromProfile = false,
								isFirstItemDetails = true,
								itemId = ItemId,
								itemType = ItemType,
								showFullWithNoPeekView = EmbedNavigationProps.itemDetailsFullView,
								fromSurface = if FFlagAXFixPurchaseSurfaceLogging then ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE else nil,
								itemDetailsPeekViewRefs = {}
							}))
							
							return
						else
							UseDispatchResult(OpenAppItemDetailsModule(ItemId, ItemType, nil, if FFlagAXFixPurchaseSurfaceLogging then true else nil, if FFlagAXFixPurchaseSurfaceLogging then ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE else nil))
						end
					end else nil,
					catalogSearch = if FFlagProfilePlatformEnableStore then function(p2)
						-- upvalues: UseDispatchResult (upval), SetCreatorFilterModule (upval), NavigateToSearchModule (upval), UseNavigationResult (upval)
						UseDispatchResult(SetCreatorFilterModule(p2))
						UseDispatchResult(NavigateToSearchModule(UseNavigationResult, {}))
					end else nil,
					inspectAvatar = if FFlagAddIEMProfilePage then function() end else nil,
					editAvatar = function()
						-- upvalues: FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), UseNavigationResult (upval), AvatarScreen (upval)
						if FFlagProfilePlatformEnableEditAppearanceMenuModule then
							UseNavigationResult.navigate(AvatarScreen.Catalog)
							
							return
						else
							UseNavigationResult.navigate(AvatarScreen.AvatarEditor)
						end
					end,
					editEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function()
						-- upvalues: UtilsModule (upval), AvatarEditorCategories (upval), UseNavigationResult (upval), AvatarScreen (upval)
						UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
							category = UtilsModule.resolveEditorCategory(AvatarEditorCategories.Emotes)
						})
					end else nil,
					switchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function()
						-- upvalues: UtilsModule (upval), AvatarEditorCategories (upval), UseNavigationResult (upval), AvatarScreen (upval)
						UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
							category = UtilsModule.resolveEditorCategory(AvatarEditorCategories.Avatars)
						})
					end else nil,
					editBackground = if FFlagProfilePlatformEditBackgroundMenuItemModule then function()
						-- upvalues: UtilsModule (upval), AvatarEditorCategories (upval), UseNavigationResult (upval), AvatarScreen (upval)
						UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
							category = UtilsModule.resolveEditorCategory(AvatarEditorCategories.Backgrounds)
						})
					end else nil,
					editUsername = function(p2)
						-- upvalues: AppPageModule (upval), BrowserServiceWrapperModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval)
						local config = {
							name = AppPageModule.EditUsername,
							extraProps = {
								BrowserWrapperComponent = BrowserServiceWrapperModule,
								showToast = p2.showToast,
								onUsernameChanged = p2.onUsernameChanged
							}
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownModule(config))
						end
					end,
					openLeaveRobloxAlertUIBlox = if FFlagAddSocialLinksToCommunityProfile then function(p2)
						-- upvalues: UseDispatchResult (upval), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
						UseDispatchResult(OpenCentralOverlayForLeaveRobloxAlertModule(p2))
					end else nil,
					closeLeaveRobloxAlert = if FFlagAddSocialLinksToCommunityProfile then function()
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval)
						UseDispatchResult(CloseCentralOverlayModule())
					end else nil,
					navigateToTransfer = if FFlagProfilePlatformEnableCurrencyTransfer then function(p2)
						-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval)
						local config = {
							name = AppPageModule.TransferRobuxFlow,
							extraProps = {
								direction = p2.direction,
								recipientUserId = p2.recipientUserId,
								transferId = p2.transferId,
								transferOrigination = p2.transferOrigination
							}
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownModule(config))
						end
					end else nil
				},
				externalAnalytics = { catalogAnalytics = UseRoactServiceResult },
				postPurchase = if FFlagSocialEnableProfileInspectAndBuy then {
					wearAfterPurchase = function(List)
						-- upvalues: UseDispatchResult (upval), UpdateAvatarEquipsModule (upval)
						local Assets = {}
						
						for _, value in List do
							table.insert(Assets, { assetTypeId = value.assetTypeId, assetId = value.assetId })
						end
						if #Assets > 0 then
							UseDispatchResult(UpdateAvatarEquipsModule({ assets = Assets }))
						end
					end
				} else nil,
				sourceInfo = {
					homepageCarouselAbsolutePosition = EmbedNavigationProps.absolutePosition,
					source = EmbedNavigationProps.source,
					contextualInfoType = EmbedNavigationProps.contextualInfoType,
					contextualOverride = EmbedNavigationProps.contextualInfoDisplay,
					isRecommendation = EmbedNavigationProps.isRecommendation,
					recommendationContextType = EmbedNavigationProps.recommendationContextType,
					recommendationSessionId = EmbedNavigationProps.recommendationSessionId,
					recommendationRank = EmbedNavigationProps.recommendationRank,
					friendshipOriginSourceType = RawValueResult,
					shareLinkId = EmbedNavigationProps.shareLinkId
				},
				profileSessionId = if FFlagProfilePlatformEnableImpressions then UseMemoResult else nil,
				profileId = Text,
				profilePlatformId = PlatformProfileIdFromId,
				profileType = ProfileType,
				profileUserNickname = EmbedNavigationProps.profileUserNickname,
				sessionIdOverride = if FFlagProfilePlatformEnableImpressions then nil else EmbedNavigationProps.sessionIdOverride,
				offNetworkFriendRequestToken = EmbedNavigationProps.offNetworkFriendRequestToken,
				initialPresence = EmbedNavigationProps.initialPresence,
				mountAsFullView = if FFlagEnableMobileGameJoinCard then EmbedNavigationProps.mountAsFullView else nil,
				forceFullView = if FFlagAXEnableProfileTab then EmbedNavigationProps.forceFullView else nil,
				headerVariant = if FFlagAXEnableProfileTab then EmbedNavigationProps.headerVariant else nil,
				currentlyWearingVariant = if FFlagAXEnableProfileTab then EmbedNavigationProps.currentlyWearingVariant else nil
			}
		end, {
			Text, UseDispatchResult, Name, EmbedNavigationProps.absolutePosition,
			EmbedNavigationProps.source, UseRoactServiceResult, UseNavigationResult,
			if FFlagAXEnableProfileTab then IsEmbedded else nil,
			if FFlagAXEnableProfileTab then EmbedNavigationProps.forceFullView else nil,
			if FFlagAXEnableProfileTab then EmbedNavigationProps.headerVariant else nil,
			if FFlagAXEnableProfileTab then EmbedNavigationProps.currentlyWearingVariant else nil,
			if FFlagAXEnableProfileTab then EmbedNavigationProps.itemDetailsFullView else nil
		})
	}, {
		ProfilePlatformNavigator = ReactModule.createElement(ProfilePlatformNavigatorModule, p1),
		androidBackButtonNavigationHandler = if FFlagAXEnableProfileTab and IsEmbedded then nil else ReactModule.createElement(ContainerModule, {
			canGoBackInRN = not IsRootRouteInRNModule(UseNavigationResult.state),
			navigateBackInRN = UseNavigationResult.pop
		})
	})
end

local ClassWrapper = ReactModule.PureComponent:extend("classWrapper")

function ClassWrapper.render(p2)
	-- upvalues: ReactModule (copy), v52 (copy)
	return ReactModule.createElement(v52, p2.props)
end

ClassWrapper.router = ProfilePlatformNavigatorModule.router

return ClassWrapper