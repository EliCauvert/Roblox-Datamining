local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local AppCarousel = Roact.PureComponent:extend("AppCarousel")
local IsSocialTabAutoSizedCarouselAndTileEnabled2Module = require(SocialTab.Flags.isSocialTabAutoSizedCarouselAndTileEnabled2)
AppCarousel.defaultProps = {
	carouselHeight = 100,
	canvasWidth = 100,
	onRefCallback = nil,
	items = {},
	onChangeCanvasPosition = function() end
}
AppCarousel.validateProps = T.interface({
	carouselHeight = T.optional(T.number),
	canvasWidth = T.optional(T.number),
	items = T.optional(T.table),
	onChangeCanvasPosition = T.optional(T.callback)
})

function AppCarousel.render(p1)
	-- upvalues: Roact (copy), IsSocialTabAutoSizedCarouselAndTileEnabled2Module (copy)
	return Roact.createElement("ScrollingFrame", {
		AutomaticSize = IsSocialTabAutoSizedCarouselAndTileEnabled2Module() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
		Size = UDim2.new(1, 0, 0, p1.props.carouselHeight),
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = UDim2.new(0, p1.props.canvasWidth, 0, p1.props.carouselHeight),
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		[Roact.Change.CanvasPosition] = p1.props.onChangeCanvasPosition,
		[Roact.Ref] = p1.props.onRefCallback or Roact.createRef()
	}, p1.props.items)
end

return AppCarousel