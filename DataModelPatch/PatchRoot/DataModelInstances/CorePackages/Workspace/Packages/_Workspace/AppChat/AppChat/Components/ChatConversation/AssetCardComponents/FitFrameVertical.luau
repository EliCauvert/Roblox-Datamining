local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local Immutable = require(Parent.AppCommonLib).Immutable
local FitFrameVertical = RoactModule.PureComponent:extend("FitFrameVertical")
FitFrameVertical.defaultProps = {
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

function FitFrameVertical.init(p1)
	-- upvalues: RoactModule (copy)
	p1.layoutRef = RoactModule.createRef()
	p1.frameRef = RoactModule.createRef()
	
	function p1.onResize()
		-- upvalues: p1 (copy)
		local Current = p1.layoutRef.current
		local Current1 = p1.frameRef.current
		
		if Current1 and Current then
			Current1.Size = UDim2.new(p1.props.width, UDim.new(0, Current.AbsoluteContentSize.Y + p1.props.marginTop + p1.props.marginBottom))
			
			return
		end
	end
end

function FitFrameVertical.render(p1)
	-- upvalues: RoactModule (copy), Immutable (copy)
	local Width = p1.props.width
	
	return RoactModule.createElement("Frame", {
		AnchorPoint = p1.props.AnchorPoint,
		Position = p1.props.Position,
		BackgroundColor3 = p1.props.BackgroundColor3,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		Size = UDim2.new(Width.Scale, Width.Offset, 0, if p1.layoutRef.current then p1.layoutRef.current.AbsoluteContentSize.Y else 0),
		LayoutOrder = p1.props.LayoutOrder,
		[RoactModule.Ref] = p1.frameRef,
		Visible = p1.props.Visible,
		BorderSizePixel = 0
	}, Immutable.JoinDictionaries(p1.props[RoactModule.Children] or {}, {
		layout = RoactModule.createElement("UIListLayout", {
			Padding = p1.props.contentPadding,
			FillDirection = p1.props.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = p1.props.HorizontalAlignment,
			VerticalAlignment = p1.props.VerticalAlignment,
			[RoactModule.Ref] = p1.layoutRef,
			[RoactModule.Change.AbsoluteContentSize] = p1.onResize
		}),
		padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.props.marginLeft),
			PaddingRight = UDim.new(0, p1.props.marginRight),
			PaddingTop = UDim.new(0, p1.props.marginTop),
			PaddingBottom = UDim.new(0, p1.props.marginBottom)
		})
	}))
end

function FitFrameVertical.didMount(p1)
	p1.onResize()
end

function FitFrameVertical.didUpdate(p1)
	p1.onResize()
end

return FitFrameVertical