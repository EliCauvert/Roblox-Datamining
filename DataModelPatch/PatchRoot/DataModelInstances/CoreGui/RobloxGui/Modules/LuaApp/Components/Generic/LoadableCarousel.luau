local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local FreeFlowCarousel = UIBloxModule.App.Container.Carousel.FreeFlowCarousel
local GAMECAROUSELPADDING = require(CorePackages.Workspace.Packages.DiscoveryTypes).Constants.GAME_CAROUSEL_PADDING
local LoadableCarousel = RoactModule.PureComponent:extend("LoadableCarousel")
LoadableCarousel.validateProps = TModule.strictInterface({
	fetchingStatus = TModule.string,
	itemList = TModule.array(TModule.any),
	renderItem = TModule.callback,
	identifier = TModule.optional(TModule.callback),
	headerText = TModule.optional(TModule.string),
	onSeeAll = TModule.optional(TModule.callback),
	itemSize = TModule.optional(TModule.Vector2),
	itemPadding = TModule.optional(TModule.number),
	carouselMargin = TModule.optional(TModule.number),
	innerPadding = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	loadNext = TModule.optional(TModule.callback),
	onRetry = TModule.optional(TModule.callback)
})
LoadableCarousel.defaultProps = { carouselMargin = GAMECAROUSELPADDING }

function LoadableCarousel.init(p1)
	function p1.renderOnLoading()
		return nil
	end
end

function LoadableCarousel.render(p1)
	-- upvalues: RoactModule (copy), FreeFlowCarousel (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	local Element = RoactModule.createElement(FreeFlowCarousel, {
		identifier = p1.props.identifier,
		headerText = p1.props.headerText,
		onSeeAll = p1.props.onSeeAll,
		itemList = p1.props.itemList,
		renderItem = p1.props.renderItem,
		itemSize = p1.props.itemSize,
		itemPadding = p1.props.itemPadding,
		carouselMargin = p1.props.carouselMargin,
		innerPadding = p1.props.innerPadding,
		layoutOrder = p1.props.layoutOrder,
		loadNext = p1.props.loadNext
	})
	
	return RoactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(p1.props.fetchingStatus),
		onRetry = p1.props.onRetry,
		renderOnLoading = p1.renderOnLoading,
		renderOnLoaded = function()
			-- upvalues: Element (copy)
			return Element
		end
	})
end

return LoadableCarousel