local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local FitFrameOnAxis = require(Parent2.FitFrame).FitFrameOnAxis
local CarouselHeaderModule = require(Parent.CarouselHeader)
local HorizontalCarouselModule = require(Parent.HorizontalCarousel)
local FreeFlowCarousel = RoactModule.PureComponent:extend("FreeFlowCarousel")
FreeFlowCarousel.validateProps = TModule.strictInterface({
	identifier = TModule.optional(TModule.callback),
	headerText = TModule.optional(TModule.string),
	onSeeAll = TModule.optional(TModule.callback),
	itemList = TModule.array(TModule.any),
	renderItem = TModule.callback,
	itemSize = TModule.optional(TModule.Vector2),
	itemPadding = TModule.optional(TModule.number),
	carouselMargin = TModule.optional(TModule.number),
	innerPadding = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	loadNext = TModule.optional(TModule.callback),
	maxNumOfItemsVisible = TModule.optional(TModule.integer),
	viewabilityConfigCallbackPairs = TModule.optional(TModule.array(TModule.strictInterface({
		viewabilityConfig = TModule.strictInterface({
			minimumViewTime = TModule.optional(TModule.number),
			viewAreaCoveragePercentThreshold = TModule.optional(TModule.number),
			itemVisiblePercentThreshold = TModule.optional(TModule.number),
			waitForInteraction = TModule.optional(TModule.boolean)
		}),
		onViewableItemsChanged = require(Parent1.Utility.isCallable)
	})))
})
FreeFlowCarousel.defaultProps = {
	headerText = "",
	innerPadding = 12,
	itemPadding = 12,
	carouselMargin = 24
}

function FreeFlowCarousel.render(p1)
	-- upvalues: RoactModule (copy), FitFrameOnAxis (copy), CarouselHeaderModule (copy), HorizontalCarouselModule (copy)
	local InnerPadding = p1.props.innerPadding
	local CarouselMargin = p1.props.carouselMargin
	
	return RoactModule.createElement(FitFrameOnAxis, {
		BackgroundTransparency = 1,
		axis = FitFrameOnAxis.Axis.Vertical,
		minimumSize = UDim2.fromScale(1, 0),
		LayoutOrder = p1.props.layoutOrder,
		contentPadding = UDim.new(0, InnerPadding)
	}, {
		CarouselHeader = RoactModule.createElement(CarouselHeaderModule, {
			layoutOrder = 1,
			headerText = p1.props.headerText,
			onSeeAll = p1.props.onSeeAll,
			carouselMargin = CarouselMargin
		}),
		Carousel = RoactModule.createElement(HorizontalCarouselModule, {
			layoutOrder = 2,
			identifier = p1.props.identifier,
			itemList = p1.props.itemList,
			renderItem = p1.props.renderItem,
			itemSize = p1.props.itemSize,
			itemPadding = InnerPadding,
			carouselMargin = CarouselMargin,
			loadNext = p1.props.loadNext,
			maxNumOfItemsVisible = p1.props.maxNumOfItemsVisible,
			viewabilityConfigCallbackPairs = p1.props.viewabilityConfigCallbackPairs
		})
	})
end

return FreeFlowCarousel