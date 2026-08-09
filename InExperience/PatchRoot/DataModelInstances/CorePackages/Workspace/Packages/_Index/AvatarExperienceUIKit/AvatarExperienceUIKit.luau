local backgroundLayersModule = require(script.BackgroundLayers.BackgroundLayers)
local itemCard = script.ItemCard
local widget = script.Widget

return {
	CategoryMenu = require(script.CategoryMenu.CategoryMenu),
	TabGroup = require(script.TabGroup.TabGroup),
	TimerBadge = require(script.TimerBadge.TimerBadge),
	ScrollingFrameWithIndicators = require(script.ScrollingFrameWithIndicators.ScrollingFrameWithIndicators),
	CategoryMenuButtonsLocationEnum = require(script.CategoryMenu.CategoryMenuButtonsLocationEnum),
	ItemCardComponents = {
		ItemCard = require(itemCard.ItemCard),
		ItemCardAnimationStateIndicator = require(itemCard.ItemCardAnimationStateIndicator),
		ItemCardBadge = require(itemCard.ItemCardBadge),
		ItemCardCreatorName = require(itemCard.ItemCardCreatorName),
		ItemCardFooter = require(itemCard.ItemCardFooter),
		ItemCardHeader = require(itemCard.ItemCardHeader),
		ItemCardHeaderCornersOverlay = require(itemCard.ItemCardHeaderCornersOverlay),
		ItemCardIcon = require(itemCard.ItemCardIcon),
		ItemCardPriceLine = require(itemCard.ItemCardPriceLine),
		ItemCardStatus = require(itemCard.ItemCardStatus),
		ItemCardThumbnail = require(itemCard.ItemCardThumbnail),
		ItemCardTitle = require(itemCard.ItemCardTitle)
	},
	WidgetComponents = {
		WidgetHeader = require(widget.WidgetHeader),
		WidgetLayout = require(widget.WidgetLayout),
		WidgetListItem = require(widget.WidgetListItem)
	},
	BackgroundLayersComponents = { BackgroundLayers = backgroundLayersModule },
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
		getLocalizedPrice = require(itemCard.Utils.getLocalizedPrice)
	},
	["jest.config"] = script["jest.config"]
}