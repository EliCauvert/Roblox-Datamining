local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local fitFrameVertical = roactModule.PureComponent:extend("FitFrameVertical")
fitFrameVertical.defaultProps = {
	marginTop = 0,
	marginBottom = 0,
	marginLeft = 0,
	marginRight = 0,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0),
	width = UDim.new(0, 0),
	contentPadding = UDim.new(0, 0),
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Top
}

function fitFrameVertical.init(p0) --[[ line: 22 ]]
	-- upvalues: roactModule (ref)
	p0.layoutRef = roactModule.createRef()
	p0.frameRef = roactModule.createRef()
	
	function p0.onResize() --[[ line: 26 ]]
		-- upvalues: p0 (ref)
		local current = p0.layoutRef.current
		local current_1 = p0.frameRef.current
		
		if current_1 and current then
			current_1.Size = UDim2.new(p0.props.width, UDim.new(0, current.AbsoluteContentSize.Y + p0.props.marginTop + p0.props.marginBottom))
			
			return
		end
	end
end

function fitFrameVertical.render(p1) --[[ line: 41 ]]
	-- upvalues: roactModule (ref), immutable (ref)
	local width = p1.props.width
	
	return roactModule.createElement("Frame", {
		AnchorPoint = p1.props.AnchorPoint,
		Position = p1.props.Position,
		BackgroundColor3 = p1.props.BackgroundColor3,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		Size = UDim2.new(width.Scale, width.Offset, 0, if p1.layoutRef.current then p1.layoutRef.current.AbsoluteContentSize.Y else 0),
		LayoutOrder = p1.props.LayoutOrder,
		[roactModule.Ref] = p1.frameRef,
		Visible = p1.props.Visible,
		BorderSizePixel = 0
	}, immutable.JoinDictionaries(p1.props[roactModule.Children] or {}, {
		layout = roactModule.createElement("UIListLayout", {
			Padding = p1.props.contentPadding,
			FillDirection = p1.props.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = p1.props.HorizontalAlignment,
			VerticalAlignment = p1.props.VerticalAlignment,
			[roactModule.Ref] = p1.layoutRef,
			[roactModule.Change.AbsoluteContentSize] = p1.onResize
		}),
		padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.props.marginLeft),
			PaddingRight = UDim.new(0, p1.props.marginRight),
			PaddingTop = UDim.new(0, p1.props.marginTop),
			PaddingBottom = UDim.new(0, p1.props.marginBottom)
		})
	}))
end

function fitFrameVertical.didMount(p2) --[[ line: 90 ]]
	p2.onResize()
end

function fitFrameVertical.didUpdate(p3) --[[ line: 94 ]]
	p3.onResize()
end

return fitFrameVertical