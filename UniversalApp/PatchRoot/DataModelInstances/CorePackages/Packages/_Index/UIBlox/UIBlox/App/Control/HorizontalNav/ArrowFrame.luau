local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local ArrowNavModule = require(Parent.HorizontalNav.ArrowNav)
local NavigationDirectionModule = require(Parent.HorizontalNav.NavigationDirection)
local ImagesModule = require(Parent1.ImageSet.Images)
local IconsActionsCycleLeft = ImagesModule["icons/actions/cycleLeft"]
local IconsActionsCycleRight = ImagesModule["icons/actions/cycleRight"]
local ArrowFrame = RoactModule.PureComponent:extend("ArrowFrame")
ArrowFrame.validateProps = TModule.strictInterface({
	ZIndex = TModule.optional(TModule.number),
	isVisibleLeft = TModule.optional(TModule.union(TModule.boolean, TModule.table)),
	isVisibleRight = TModule.optional(TModule.union(TModule.boolean, TModule.table)),
	onPressHoldInputBegan = TModule.optional(TModule.callback),
	onPressHoldInputEnded = TModule.optional(TModule.callback),
	defaultUseProps = TModule.optional(TModule.strictInterface({
		scrollingFrameRef = TModule.table,
		buttonRefs = TModule.optional(TModule.table),
		buttonWidth = TModule.optional(TModule.number),
		padOutsideEdges = TModule.optional(TModule.boolean),
		numButtons = TModule.optional(TModule.number),
		buttonPadding = TModule.number,
		updateCanvasPosition = TModule.callback
	}))
})
ArrowFrame.defaultProps = { ZIndex = 1, isVisibleRight = true, isVisibleLeft = true }

function ArrowFrame.init(p1) --[[ Line: 52 ]]
	p1.state = { isHovered = false }
	
	function p1.onMouseEnter() --[[ Line: 57 ]]
		-- upvalues: p1 (copy)
		p1:setState({ isHovered = true })
	end
	
	function p1.onMouseLeave() --[[ Line: 63 ]]
		-- upvalues: p1 (copy)
		p1:setState({ isHovered = false })
	end
end

function ArrowFrame.render(p1) --[[ Line: 70 ]]
	-- upvalues: RoactModule (copy), ArrowNavModule (copy), IconsActionsCycleLeft (copy), NavigationDirectionModule (copy), IconsActionsCycleRight (copy)
	local IsVisibleLeft = p1.props.isVisibleLeft
	local IsVisibleRight = p1.props.isVisibleRight
	local DefaultUseProps = p1.props.defaultUseProps
	local OnPressHoldInputBegan = p1.props.onPressHoldInputBegan
	local OnPressHoldInputEnded = p1.props.onPressHoldInputEnded
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p1.props.ZIndex,
		[RoactModule.Event.MouseEnter] = p1.onMouseEnter,
		[RoactModule.Event.MouseLeave] = p1.onMouseLeave
	}, {
		ArrowLeft = RoactModule.createElement(ArrowNavModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, -6, 0.5, 0),
			Image = IconsActionsCycleLeft,
			Visible = p1.state.isHovered and IsVisibleLeft,
			navDirection = NavigationDirectionModule.IsLeft,
			defaultUseProps = DefaultUseProps,
			onPressHoldInputBegan = OnPressHoldInputBegan,
			onPressHoldInputEnded = OnPressHoldInputEnded
		}),
		ArrowRight = RoactModule.createElement(ArrowNavModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -30, 0.5, 0),
			Image = IconsActionsCycleRight,
			Visible = p1.state.isHovered and IsVisibleRight,
			navDirection = NavigationDirectionModule.IsRight,
			defaultUseProps = DefaultUseProps,
			onPressHoldInputBegan = OnPressHoldInputBegan,
			onPressHoldInputEnded = OnPressHoldInputEnded
		})
	})
end

return ArrowFrame