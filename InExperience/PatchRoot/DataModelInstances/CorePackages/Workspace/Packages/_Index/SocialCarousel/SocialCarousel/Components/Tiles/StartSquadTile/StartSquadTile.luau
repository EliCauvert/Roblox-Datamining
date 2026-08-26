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

return function(p1)
	-- upvalues: useNavigation (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), appPage (ref), tileModule (ref)
	local var1 = useNavigation()
	local var2 = useSocialCarouselAnalyticsModule()
	local var3 = useSocialCarouselContextModule()
	local var4 = useLocalization({
		startPartyText = constantsModule.LOCALIZATION.START_SQUAD_TEXT
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), appPage (copy), var2 (ref)
		if p1.item and p1.item.onActivated then
			p1.item.onActivated()
		else
			var1.navigate(appPage.Chat)
		end
		var2.startSquadPressed(p1.index)
	end, { var1, p1.item, p1.index, var2.startSquadPressed })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), constantsModule (copy)
		var3.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.START_SQUAD)
	end, {})
	
	return reactModule.createElement(tileModule, {
		icon = "icons/actions/friends/friendsplaying",
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = var5,
		title = var4.startPartyText,
		selectionOrder = p1.selectionOrder
	})
end