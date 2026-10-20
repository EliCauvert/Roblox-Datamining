local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ReactModule = require(Parent.React)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local TileModule = require(SocialCarousel.BaseComponents.Tile)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseSocialCarouselAnalyticsModule (copy), UseSocialCarouselContextModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), AppPage (copy), TileModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseLocalizationResult = UseLocalizationFunction({
		startPartyText = ConstantsModule.LOCALIZATION.START_SQUAD_TEXT
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseNavigationResult (copy), AppPage (upval), UseSocialCarouselAnalyticsModuleResult (copy)
		if p1.item and p1.item.onActivated then
			p1.item.onActivated()
		else
			UseNavigationResult.navigate(AppPage.Chat)
		end
		UseSocialCarouselAnalyticsModuleResult.startSquadPressed(p1.index)
	end, {
		UseNavigationResult,
		p1.item,
		p1.index,
		UseSocialCarouselAnalyticsModuleResult.startSquadPressed
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.START_SQUAD)
	end, {})
	
	return ReactModule.createElement(TileModule, {
		icon = "icons/actions/friends/friendsplaying",
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = UseResult,
		title = UseLocalizationResult.startPartyText,
		selectionOrder = p1.selectionOrder
	})
end