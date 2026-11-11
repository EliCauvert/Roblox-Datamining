local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactFitComponents = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents
local RoactModule = require(Parent.Roact)
local ThreeSectionBar = RoactModule.PureComponent:extend("ThreeSectionBar")
ThreeSectionBar.Rect = RoactFitComponents.Rect
ThreeSectionBar.defaultProps = {
	marginLeft = ThreeSectionBar.Rect.square(0),
	marginRight = ThreeSectionBar.Rect.square(0),
	contentPaddingLeft = UDim.new(0, 0),
	contentPaddingRight = UDim.new(0, 0),
	height = UDim.new(0, 0)
}

function ThreeSectionBar.init(p1)
	-- upvalues: RoactModule (copy)
	p1.leftWidth, p1.updateLeftWidth = RoactModule.createBinding(0)
	p1.rightWidth, p1.updateRightWidth = RoactModule.createBinding(0)
	p1.fullWidth, p1.updateFullWidth = RoactModule.createBinding(0)
end

function ThreeSectionBar.render(p1)
	-- upvalues: RoactModule (copy), RoactFitComponents (copy)
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(UDim.new(1, 0), p1.props.height),
		LayoutOrder = p1.props.LayoutOrder,
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: p1 (copy)
			p1.updateFullWidth(Frame.AbsoluteSize.X)
		end
	}, {
		leftFrame = RoactModule.createElement(RoactFitComponents.FitFrameHorizontal, {
			Transparency = 1,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			minimumSize = UDim.new(0, 0),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			contentPadding = p1.props.contentPaddingLeft,
			margin = p1.props.marginLeft,
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (copy)
				p1.updateLeftWidth(Frame.AbsoluteSize.X)
			end
		}, { leftContent = p1.props.renderLeft(p1.props) }),
		centerFrame = RoactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = RoactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(Entry): UDim2
				return UDim2.new(0, (Vector2.new(Entry[3] / 2, 0) - Vector2.new(math.max(Entry[1], Entry[2]), 0)).Magnitude * 2, 1, 0)
			end)
		}, {
			["$layout"] = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
			centerContent = p1.props.renderCenter(p1.props)
		}),
		rightFrame = RoactModule.createElement(RoactFitComponents.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			minimumSize = UDim.new(0, 0),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			contentPadding = p1.props.contentPaddingRight,
			margin = p1.props.marginRight,
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (copy)
				p1.updateRightWidth(Frame.AbsoluteSize.X)
			end
		}, { rightContent = p1.props.renderRight(p1.props) })
	})
end

return ThreeSectionBar