local ItemCard = script.ItemCard
local Widget = script.Widget

return {
	CategoryMenu = require(script.CategoryMenu.CategoryMenu),
	TabGroup = require(script.TabGroup.TabGroup),
	TimerBadge = require(script.TimerBadge.TimerBadge),
	ScrollingFrameWithIndicators = require(script.ScrollingFrameWithIndicators.ScrollingFrameWithIndicators),
	CategoryMenuButtonsLocationEnum = require(script.CategoryMenu.CategoryMenuButtonsLocationEnum),
	ItemCardComponents = {
		ItemCard = require(ItemCard.ItemCard),
		ItemCardAnimationStateIndicator = require(ItemCard.ItemCardAnimationStateIndicator),
		ItemCardBadge = require(ItemCard.ItemCardBadge),
		ItemCardCreatorName = require(ItemCard.ItemCardCreatorName),
		ItemCardFooter = require(ItemCard.ItemCardFooter),
		ItemCardHeader = require(ItemCard.ItemCardHeader),
		ItemCardHeaderCornersOverlay = require(ItemCard.ItemCardHeaderCornersOverlay),
		ItemCardIcon = require(ItemCard.ItemCardIcon),
		ItemCardIndicatorStack = require(ItemCard.ItemCardIndicatorStack),
		ItemCardPriceLine = require(ItemCard.ItemCardPriceLine),
		ItemCardStatus = require(ItemCard.ItemCardStatus),
		ItemCardThumbnail = require(ItemCard.ItemCardThumbnail),
		ItemCardThumbnailSkeleton = require(ItemCard.ItemCardThumbnailSkeleton),
		ItemCardTitle = require(ItemCard.ItemCardTitle)
	},
	WidgetComponents = {
		WidgetHeader = require(Widget.WidgetHeader),
		WidgetLayout = require(Widget.WidgetLayout),
		WidgetListItem = require(Widget.WidgetListItem)
	},
	BackgroundLayersComponents = {
		BackgroundLayers = require(script.BackgroundLayers.BackgroundLayers)
	},
	GridComponents = { Grid = require(script.Grid.Grid) },
	AXTooltipComponents = { AXTooltip = require(script.AXTooltip.AXTooltip) },
	FeedComponents = {
		VirtualizedFeed = require(script.VirtualizedFeed.VirtualizedFeed)
	},
	Hooks = {
		useRemainingTime = require(script.Utils.useRemainingTime)
	},
	Utils = {
		getRemainingTime = require(script.Utils.getRemainingTime),
		getItemCountForRow = require(script.Utils.getItemCountForRow),
		getLocalizedPrice = require(ItemCard.Utils.getLocalizedPrice)
	},
	["jest.config"] = script["jest.config"]
}