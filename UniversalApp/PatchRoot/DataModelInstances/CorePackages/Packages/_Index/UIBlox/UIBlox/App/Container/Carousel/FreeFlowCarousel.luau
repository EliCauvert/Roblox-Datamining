local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local fitFrameOnAxis = require(parent_2.FitFrame).FitFrameOnAxis
local isCallableModule = require(parent_1.Utility.isCallable)
local carouselHeaderModule = require(parent.CarouselHeader)
local horizontalCarouselModule = require(parent.HorizontalCarousel)
local freeFlowCarousel = roactModule.PureComponent:extend("FreeFlowCarousel")
freeFlowCarousel.validateProps = tModule.strictInterface({
	identifier = tModule.optional(tModule.callback),
	headerText = tModule.optional(tModule.string),
	onSeeAll = tModule.optional(tModule.callback),
	itemList = tModule.array(tModule.any),
	renderItem = tModule.callback,
	itemSize = tModule.optional(tModule.Vector2),
	itemPadding = tModule.optional(tModule.number),
	carouselMargin = tModule.optional(tModule.number),
	innerPadding = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.integer),
	loadNext = tModule.optional(tModule.callback),
	maxNumOfItemsVisible = tModule.optional(tModule.integer),
	viewabilityConfigCallbackPairs = tModule.optional(tModule.array(tModule.strictInterface({
		viewabilityConfig = tModule.strictInterface({
			minimumViewTime = tModule.optional(tModule.number),
			viewAreaCoveragePercentThreshold = tModule.optional(tModule.number),
			itemVisiblePercentThreshold = tModule.optional(tModule.number),
			waitForInteraction = tModule.optional(tModule.boolean)
		}),
		onViewableItemsChanged = isCallableModule
	})))
})
freeFlowCarousel.defaultProps = {
	headerText = "",
	innerPadding = 12,
	itemPadding = 12,
	carouselMargin = 24
}

function freeFlowCarousel.render(p1)
	-- upvalues: roactModule (ref), fitFrameOnAxis (ref), carouselHeaderModule (ref), horizontalCarouselModule (ref)
	local innerPadding = p1.props.innerPadding
	local carouselMargin = p1.props.carouselMargin
	
	return roactModule.createElement(fitFrameOnAxis, {
		BackgroundTransparency = 1,
		axis = fitFrameOnAxis.Axis.Vertical,
		minimumSize = UDim2.fromScale(1, 0),
		LayoutOrder = p1.props.layoutOrder,
		contentPadding = UDim.new(0, innerPadding)
	}, {
		CarouselHeader = roactModule.createElement(carouselHeaderModule, {
			layoutOrder = 1,
			headerText = p1.props.headerText,
			onSeeAll = p1.props.onSeeAll,
			carouselMargin = carouselMargin
		}),
		Carousel = roactModule.createElement(horizontalCarouselModule, {
			layoutOrder = 2,
			identifier = p1.props.identifier,
			itemList = p1.props.itemList,
			renderItem = p1.props.renderItem,
			itemSize = p1.props.itemSize,
			itemPadding = innerPadding,
			carouselMargin = carouselMargin,
			loadNext = p1.props.loadNext,
			maxNumOfItemsVisible = p1.props.maxNumOfItemsVisible,
			viewabilityConfigCallbackPairs = p1.props.viewabilityConfigCallbackPairs
		})
	})
end

return freeFlowCarousel