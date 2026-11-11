local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseContactImporterConfigurationFunction = require(CorePackages.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FFlagLuaAppCompositionAlways = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local SetCurrentToastMessageFunction = require(CorePackages.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateToUserInfoModule = require(Modules.LuaApp.Thunks.NavigateToUserInfo)
local NavigateDownToAddFriendsPageModule = require(Modules.LuaApp.Thunks.NavigateDownToAddFriendsPage)
local UseNavigateFromAddFriendsModule = require(Modules.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends)
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local GetDeepValueFunction = LuaSocialLibrariesDepsModule.SocialLibraries.config({}).Dictionary.getDeepValue
local Llama = LuaSocialLibrariesDepsModule.llama
local GetFFlagPYMKAddFriendsEntryFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagPYMKAddFriendsEntry
local GetFFlagPYMKShowAddFriendsButtonDEVModule = require(Modules.Personalization.Flags.getFFlagPYMKShowAddFriendsButton_DEV)
local FFlagCreateConnectionsHub = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local PYMKCarouselEntryPoint = require(Modules.LuaApp.Components.PYMKCarousel.api).PYMKCarouselEntryPoint
local config = {
	renderFriendRecommendationCarousel = function(p1)
		-- upvalues: RoactModule (copy), PYMKCarouselEntryPoint (copy)
		return RoactModule.createElement(PYMKCarouselEntryPoint, p1)
	end
}
local v1 = require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	roactAnalytics = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalytics,
	eventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
})(function(p1)
	-- upvalues: CryoModule (copy), config (copy), OmniFeedProps (copy), AppPage (copy), ReactModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), UseDispatchFunction (copy), FFlagCreateConnectionsHub (copy), UseNavigationFunction (copy), NavigateToUserInfoModule (copy), UseNavigateFromAddFriendsModule (copy), NavigateDownToAddFriendsPageModule (copy), UseContactImporterConfigurationFunction (copy), SetCurrentToastMessageFunction (copy), FFlagLuaAppCompositionAlways (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), OmniFeedConstants (copy), GetFFlagPYMKShowAddFriendsButtonDEVModule (copy), RoactModule (copy), Llama (copy), GetFFlagPYMKAddFriendsEntryFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local AppPage1 = JoinResult[OmniFeedProps.key] and JoinResult[OmniFeedProps.key].appPage or AppPage.Home
	local FeedItemStartRow = JoinResult[OmniFeedProps.key] and JoinResult[OmniFeedProps.key].feedItemStartRow or nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), AppPage1 (copy), FeedItemStartRow (copy)
		return {
			sortIndex = JoinResult.sortIndex,
			appPage = AppPage1,
			sortId = JoinResult.topicId,
			startRow = FeedItemStartRow or -1
		}
	end, {
		JoinResult.sortIndex,
		AppPage1,
		JoinResult.topicId,
		FeedItemStartRow
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), AppPage (upval)
		return GetDeepValueFunction(p2, string.format("OmniRecommendations.%s.recommendationsId", AppPage.Home)) or {}
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = if FFlagCreateConnectionsHub then UseNavigationFunction() else nil
	
	local function OpenProfilePeekView(p2, p3)
		-- upvalues: UseDispatchResult (copy), NavigateToUserInfoModule (upval), CryoModule (upval)
		UseDispatchResult(NavigateToUserInfoModule(p2, {
			profilePeekViewProps = CryoModule.Dictionary.join({ resetPeekView = true }, p3 or {})
		}))
	end
	
	local UseNavigateFromAddFriendsModuleResult = UseNavigateFromAddFriendsModule({
		policyIsEnabled = JoinResult.isContactImporterPolicyEnabled
	})
	
	local function v34(p2)
		-- upvalues: UseNavigateFromAddFriendsModuleResult (copy), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval), UseDispatchResult (copy), NavigateDownToAddFriendsPageModule (upval)
		if p2 then
			UseNavigateFromAddFriendsModuleResult()
			
			return
		end
		if FFlagCreateConnectionsHub then
			UseNavigationResult.navigate(AppPage.CoHubAddConnections)
			
			return
		else
			UseDispatchResult(NavigateDownToAddFriendsPageModule())
		end
	end
	
	local ShouldShowContactImporterModal = UseContactImporterConfigurationFunction({
		policyIsEnabled = JoinResult.isContactImporterPolicyEnabled
	}).shouldShowContactImporterModal
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else JoinResult[OmniFeedProps.key] and JoinResult[OmniFeedProps.key].appCompositionEnabled
	local TopicLayoutData = JoinResult.topicLayoutData or {}
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		key = UseSelectorResult1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		FriendRecommendationCarouselFeedItem = JoinResult.renderFriendRecommendationCarousel({
			findFriendsTileEnabled = TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PYMKFindFriendsEnabled] == "true" or (TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PYMKFindFriendsEnabled] == true or GetFFlagPYMKShowAddFriendsButtonDEVModule()),
			seeAllTileEnabled = TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PYMKSeeAllEnabled] == "true" or (TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PYMKSeeAllEnabled] == true or GetFFlagPYMKShowAddFriendsButtonDEVModule()),
			pageContext = AppPage1,
			scrollViewPositionChangedSignal = if JoinResult[OmniFeedProps.key] then JoinResult[OmniFeedProps.key].scrollViewPositionChangedSignal else nil,
			carouselTitle = JoinResult.carouselTitle,
			openProfilePeekView = OpenProfilePeekView,
			sideMargin = if AppCompositionEnabled then nil elseif UseSelectorResult == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING,
			showToast = function(ToastMessage)
				-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
				UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = ToastMessage }))
			end,
			roactAnalytics = Llama.None,
			diagService = JoinResult.roactAnalytics.Diag,
			shouldShowContactImporterBadge = if GetFFlagPYMKAddFriendsEntryFunction() then ShouldShowContactImporterModal else nil,
			goToAddFriendsPage = if GetFFlagPYMKAddFriendsEntryFunction() then v34 else function() end,
			eventIngestService = JoinResult.eventIngestService,
			sortAnalyticsData = UseMemoResult,
			appCompositionEnabled = AppCompositionEnabled
		})
	})
end)

if GetFFlagPYMKAddFriendsEntryFunction() then
	v1 = UniversalAppPolicy.connect(function(p1)
		return {
			isContactImporterPolicyEnabled = p1.getContactImporterEnabled()
		}
	end)(v1)
end
return v1