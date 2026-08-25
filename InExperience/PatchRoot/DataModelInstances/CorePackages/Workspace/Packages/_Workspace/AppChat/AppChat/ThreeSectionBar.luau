local parent = script:FindFirstAncestor("AppChat").Parent
local roactFitComponents = require(parent.LuaSocialLibrariesDeps).RoactFitComponents
local roactModule = require(parent.Roact)
local threeSectionBar = roactModule.PureComponent:extend("ThreeSectionBar")
threeSectionBar.Rect = roactFitComponents.Rect
threeSectionBar.defaultProps = {
	marginLeft = threeSectionBar.Rect.square(0),
	marginRight = threeSectionBar.Rect.square(0),
	contentPaddingLeft = UDim.new(0, 0),
	contentPaddingRight = UDim.new(0, 0),
	height = UDim.new(0, 0)
}

function threeSectionBar.init(p0)
	-- upvalues: roactModule (ref)
	local var2, var3 = roactModule.createBinding(0)
	p0.leftWidth = var2
	p0.updateLeftWidth = var3
	local var4, var5 = roactModule.createBinding(0)
	p0.rightWidth = var4
	p0.updateRightWidth = var5
	local var6, var7 = roactModule.createBinding(0)
	p0.fullWidth = var6
	p0.updateFullWidth = var7
end

function threeSectionBar.render(p1)
	-- upvalues: roactModule (ref), roactFitComponents (ref)
	return roactModule.createElement("Frame", {
		Size = UDim2.new(UDim.new(1, 0), p1.props.height),
		LayoutOrder = p1.props.LayoutOrder,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			p1.updateFullWidth(p2.AbsoluteSize.X)
		end
	}, {
		leftFrame = roactModule.createElement(roactFitComponents.FitFrameHorizontal, {
			Transparency = 1,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			minimumSize = UDim.new(0, 0),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			contentPadding = p1.props.contentPaddingLeft,
			margin = p1.props.marginLeft,
			[roactModule.Change.AbsoluteSize] = function(p3)
				-- upvalues: p1 (ref)
				p1.updateLeftWidth(p3.AbsoluteSize.X)
			end
		}, { leftContent = p1.props.renderLeft(p1.props) }),
		centerFrame = roactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = roactModule.joinBindings({ p1.leftWidth, p1.rightWidth, p1.fullWidth }):map(function(p4)
				return UDim2.new(0, (Vector2.new(p4[3] / 2, 0) - Vector2.new(math.max(p4[1], p4[2]), 0)).Magnitude * 2, 1, 0)
			end)
		}, {
			["$layout"] = roactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
			centerContent = p1.props.renderCenter(p1.props)
		}),
		rightFrame = roactModule.createElement(roactFitComponents.FitFrameHorizontal, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			minimumSize = UDim.new(0, 0),
			height = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			contentPadding = p1.props.contentPaddingRight,
			margin = p1.props.marginRight,
			[roactModule.Change.AbsoluteSize] = function(p5)
				-- upvalues: p1 (ref)
				p1.updateRightWidth(p5.AbsoluteSize.X)
			end
		}, { rightContent = p1.props.renderRight(p1.props) })
	})
end

return threeSectionBar