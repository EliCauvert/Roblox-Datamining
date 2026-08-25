local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local localizationModule = require(parent.Localization)
local useNavigation = require(parent.Navigation).useNavigation
local reactModule = require(parent.React)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local tileModule = require(socialCarousel.BaseComponents.Tile)
local useLocalization = localizationModule.Hooks.useLocalization
local constantsModule = require(socialCarousel.Common.Constants)

return function(p0)
	-- upvalues: useNavigation (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), appPage (ref), tileModule (ref)
	local var7 = useNavigation()
	local var8 = useSocialCarouselAnalyticsModule()
	local var9 = useSocialCarouselContextModule()
	local var10 = useLocalization({
		startPartyText = constantsModule.LOCALIZATION.START_SQUAD_TEXT
	})
	local var11 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var7 (ref), appPage (copy), var8 (ref)
		if p0.item and p0.item.onActivated then
			p0.item.onActivated()
		else
			var7.navigate(appPage.Chat)
		end
		var8.startSquadPressed(p0.index)
	end, { var7, p0.item, p0.index, var8.startSquadPressed })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), constantsModule (copy)
		var9.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.START_SQUAD)
	end, {})
	
	return reactModule.createElement(tileModule, {
		icon = "icons/actions/friends/friendsplaying",
		index = p0.index,
		itemSize = p0.itemSize,
		onActivated = var11,
		title = var10.startPartyText,
		selectionOrder = p0.selectionOrder
	})
end