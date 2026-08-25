local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local navigationRoduxModule = require(parent.NavigationRodux)
local navigationModule = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local navigateBack = navigationRoduxModule.Thunks.NavigateBack
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local shareQRTileModule = require(script.Parent.ShareQRTile)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local constantsModule = require(socialCarousel.Common.Constants)
local fFlagSocialCarouselShareQRBackToAddFriends = require(parent.SharedFlags).FFlagSocialCarouselShareQRBackToAddFriends
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var10 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useNavigation (ref), useDispatch (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), reactModule (ref), fFlagSocialCarouselShareQRBackToAddFriends (ref), fFlagSignalsNavP3Dispatch (ref), var10 (ref), navigateBack (ref), fFlagCreateConnectionsHub (ref), appPage (ref), navigateDown (ref), constantsModule (ref), shareQRTileModule (ref), cryoModule (ref)
	local var11 = useNavigation()
	local var12 = useDispatch()
	local var13 = useSocialCarouselAnalyticsModule()
	local var14 = useSocialCarouselContextModule()
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p0 (ref), fFlagSocialCarouselShareQRBackToAddFriends (copy), fFlagSignalsNavP3Dispatch (copy), var10 (copy), var12 (ref), navigateBack (copy), fFlagCreateConnectionsHub (copy), var11 (ref), appPage (copy), navigateDown (copy), var14 (ref), constantsModule (copy)
		var13.shareQRPressed(p0.index)
		local var16 = if fFlagSocialCarouselShareQRBackToAddFriends then function()
			-- upvalues: fFlagSignalsNavP3Dispatch (copy), var10 (copy), var12 (copy), navigateBack (copy), fFlagCreateConnectionsHub (copy), var11 (copy), appPage (copy), navigateDown (copy)
			if fFlagSignalsNavP3Dispatch then
				var10.back(true)
			else
				var12(navigateBack(true))
			end
			if fFlagCreateConnectionsHub then
				var11.navigate(appPage.CoHubAddConnections)
				
				return
			elseif fFlagSignalsNavP3Dispatch then
				var10.down(var10.fromLegacyPage({ name = appPage.AddFriendsPage }))
				
				return
			end
			var12(navigateDown({ name = appPage.AddFriendsPage }))
		end else nil
		
		if var14.navigateToQRCodePage then
			var14.navigateToQRCodePage({
				source = constantsModule.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
				onClose = var16
			})
		end
	end, {
		var12,
		var11,
		p0.index,
		var13.shareQRPressed,
		var14.navigateToQRCodePage
	})
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), constantsModule (copy)
		var14.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.SHARE_QR)
	end, {})
	
	return reactModule.createElement(shareQRTileModule, cryoModule.Dictionary.join(p0, { onActivated = var15 }))
end