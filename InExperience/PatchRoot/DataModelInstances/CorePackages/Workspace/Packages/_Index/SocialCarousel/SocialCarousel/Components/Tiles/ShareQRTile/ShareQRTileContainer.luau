local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local NavigateBackFunction = NavigationRoduxModule.Thunks.NavigateBack
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ShareQRTileModule = require(script.Parent.ShareQRTile)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local FFlagSocialCarouselShareQRBackToAddFriends = require(Parent.SharedFlags).FFlagSocialCarouselShareQRBackToAddFriends
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 32 | Named "ShareQRTileContainer" ]]
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseSocialCarouselAnalyticsModule (copy), UseSocialCarouselContextModule (copy), ReactModule (copy), FFlagSocialCarouselShareQRBackToAddFriends (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), NavigateDownFunction (copy), ConstantsModule (copy), ShareQRTileModule (copy), CryoModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 39 ]]
		-- upvalues: UseSocialCarouselAnalyticsModuleResult (copy), p1 (copy), FFlagSocialCarouselShareQRBackToAddFriends (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval), NavigateDownFunction (upval), UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval)
		UseSocialCarouselAnalyticsModuleResult.shareQRPressed(p1.index)
		local OnClose = if FFlagSocialCarouselShareQRBackToAddFriends then function() --[[ Line: 43 ]]
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (upval), AppPage (upval), NavigateDownFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(true)
			else
				UseDispatchResult(NavigateBackFunction(true))
			end
			if FFlagCreateConnectionsHub then
				UseNavigationResult.navigate(AppPage.CoHubAddConnections)
				
				return
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPage.AddFriendsPage }))
				
				return
			else
				UseDispatchResult(NavigateDownFunction({ name = AppPage.AddFriendsPage }))
			end
		end else nil
		
		if UseSocialCarouselContextModuleResult.navigateToQRCodePage then
			UseSocialCarouselContextModuleResult.navigateToQRCodePage({
				source = ConstantsModule.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
				onClose = OnClose
			})
		end
	end, {
		UseDispatchResult,
		UseNavigationResult,
		p1.index,
		UseSocialCarouselAnalyticsModuleResult.shareQRPressed,
		UseSocialCarouselContextModuleResult.navigateToQRCodePage
	})
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.SHARE_QR)
	end, {})
	
	return ReactModule.createElement(ShareQRTileModule, CryoModule.Dictionary.join(p1, { onActivated = UseResult }))
end