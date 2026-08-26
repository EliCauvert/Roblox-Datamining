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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useNavigation (ref), useDispatch (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), reactModule (ref), fFlagSocialCarouselShareQRBackToAddFriends (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), fFlagCreateConnectionsHub (ref), appPage (ref), navigateDown (ref), constantsModule (ref), shareQRTileModule (ref), cryoModule (ref)
	local var2 = useNavigation()
	local var3 = useDispatch()
	local var4 = useSocialCarouselAnalyticsModule()
	local var5 = useSocialCarouselContextModule()
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref), fFlagSocialCarouselShareQRBackToAddFriends (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateBack (copy), fFlagCreateConnectionsHub (copy), var2 (ref), appPage (copy), navigateDown (copy), var5 (ref), constantsModule (copy)
		var4.shareQRPressed(p1.index)
		local var7 = if fFlagSocialCarouselShareQRBackToAddFriends then function()
			-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (copy), navigateBack (copy), fFlagCreateConnectionsHub (copy), var2 (copy), appPage (copy), navigateDown (copy)
			if fFlagSignalsNavP3Dispatch then
				var1.back(true)
			else
				var3(navigateBack(true))
			end
			if fFlagCreateConnectionsHub then
				var2.navigate(appPage.CoHubAddConnections)
				
				return
			elseif fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage({ name = appPage.AddFriendsPage }))
				
				return
			end
			var3(navigateDown({ name = appPage.AddFriendsPage }))
		end else nil
		
		if var5.navigateToQRCodePage then
			var5.navigateToQRCodePage({
				source = constantsModule.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
				onClose = var7
			})
		end
	end, {
		var3,
		var2,
		p1.index,
		var4.shareQRPressed,
		var5.navigateToQRCodePage
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), constantsModule (copy)
		var5.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.SHARE_QR)
	end, {})
	
	return reactModule.createElement(shareQRTileModule, cryoModule.Dictionary.join(p1, { onActivated = var6 }))
end