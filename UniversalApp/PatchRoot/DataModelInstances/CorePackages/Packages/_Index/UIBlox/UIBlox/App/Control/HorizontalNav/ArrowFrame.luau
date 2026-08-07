local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local arrowNavModule = require(parent.HorizontalNav.ArrowNav)
local navigationDirectionModule = require(parent.HorizontalNav.NavigationDirection)
local imagesModule = require(parent_1.ImageSet.Images)
local cycleLeft = imagesModule["icons/actions/cycleLeft"]
local cycleRight = imagesModule["icons/actions/cycleRight"]
local arrowFrame = roactModule.PureComponent:extend("ArrowFrame")
arrowFrame.validateProps = tModule.strictInterface({
	ZIndex = tModule.optional(tModule.number),
	isVisibleLeft = tModule.optional(tModule.union(tModule.boolean, tModule.table)),
	isVisibleRight = tModule.optional(tModule.union(tModule.boolean, tModule.table)),
	onPressHoldInputBegan = tModule.optional(tModule.callback),
	onPressHoldInputEnded = tModule.optional(tModule.callback),
	defaultUseProps = tModule.optional(tModule.strictInterface({
		scrollingFrameRef = tModule.table,
		buttonRefs = tModule.optional(tModule.table),
		buttonWidth = tModule.optional(tModule.number),
		padOutsideEdges = tModule.optional(tModule.boolean),
		numButtons = tModule.optional(tModule.number),
		buttonPadding = tModule.number,
		updateCanvasPosition = tModule.callback
	}))
})
arrowFrame.defaultProps = { ZIndex = 1, isVisibleRight = true, isVisibleLeft = true }

function arrowFrame.init(p0) --[[ line: 52 ]]
	p0.state = { isHovered = false }
	
	function p0.onMouseEnter() --[[ line: 57 ]]
		-- upvalues: p0 (ref)
		p0:setState({ isHovered = true })
	end
	
	function p0.onMouseLeave() --[[ line: 63 ]]
		-- upvalues: p0 (ref)
		p0:setState({ isHovered = false })
	end
end

function arrowFrame.render(p1) --[[ line: 70 ]]
	-- upvalues: roactModule (ref), arrowNavModule (ref), cycleLeft (ref), navigationDirectionModule (ref), cycleRight (ref)
	local isVisibleLeft = p1.props.isVisibleLeft
	local isVisibleRight = p1.props.isVisibleRight
	local defaultUseProps = p1.props.defaultUseProps
	local onPressHoldInputBegan = p1.props.onPressHoldInputBegan
	local onPressHoldInputEnded = p1.props.onPressHoldInputEnded
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p1.props.ZIndex,
		[roactModule.Event.MouseEnter] = p1.onMouseEnter,
		[roactModule.Event.MouseLeave] = p1.onMouseLeave
	}, {
		ArrowLeft = roactModule.createElement(arrowNavModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, -6, 0.5, 0),
			Image = cycleLeft,
			Visible = p1.state.isHovered and isVisibleLeft,
			navDirection = navigationDirectionModule.IsLeft,
			defaultUseProps = defaultUseProps,
			onPressHoldInputBegan = onPressHoldInputBegan,
			onPressHoldInputEnded = onPressHoldInputEnded
		}),
		ArrowRight = roactModule.createElement(arrowNavModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -30, 0.5, 0),
			Image = cycleRight,
			Visible = p1.state.isHovered and isVisibleRight,
			navDirection = navigationDirectionModule.IsRight,
			defaultUseProps = defaultUseProps,
			onPressHoldInputBegan = onPressHoldInputBegan,
			onPressHoldInputEnded = onPressHoldInputEnded
		})
	})
end

return arrowFrame