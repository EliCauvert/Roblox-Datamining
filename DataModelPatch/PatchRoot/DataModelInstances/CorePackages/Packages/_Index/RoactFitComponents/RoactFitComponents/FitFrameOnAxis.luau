local Parent = script.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local RoactModule = require(Parent1.Roact)
local IsRoact17Module = require(Parent.isRoact17)
local Axis = { Horizontal = {}, Vertical = {}, Both = {} }
local FitFrameOnAxis = RoactModule.PureComponent:extend("FitFrameOnAxis")
FitFrameOnAxis.defaultProps = {
	textProps = nil,
	axis = Axis.Vertical,
	minimumSize = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)),
	margin = require(Parent.Rect).square(0),
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	ImageSet = {},
	VerticalAlignment = Enum.VerticalAlignment.Top,
	contentPadding = UDim.new(0, 0)
}

function FitFrameOnAxis.init(p1)
	-- upvalues: RoactModule (copy), IsRoact17Module (copy)
	p1.layoutRef = RoactModule.createRef()
	
	if IsRoact17Module() then
		p1.frameRef = p1.props.forwardedRef or RoactModule.createRef()
	else
		p1.frameRef = p1.props[RoactModule.Ref] or RoactModule.createRef()
	end
	function p1.onResize()
		-- upvalues: p1 (copy)
		local Current = p1.layoutRef.current
		local Current1 = p1.frameRef.current
		
		if Current1 and Current then
			Current1.Size = p1:__getSize(Current)
			
			return
		end
	end
end

function FitFrameOnAxis.render(p1)
	-- upvalues: RoactModule (copy), CryoModule (copy)
	assert(p1.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?")
	local FilteredProps = p1:__getFilteredProps()
	local ImageButton: string = if p1.props.onActivated then "ImageButton" else "ImageLabel"
	local JoinResult = CryoModule.Dictionary.join(p1.props[RoactModule.Children] or {}, {
		["$layout"] = RoactModule.createElement("UIListLayout", {
			FillDirection = p1.props.FillDirection,
			HorizontalAlignment = p1.props.HorizontalAlignment,
			Padding = p1.props.contentPadding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = p1.props.VerticalAlignment,
			[RoactModule.Change.AbsoluteContentSize] = p1.onResize,
			[RoactModule.Ref] = p1.layoutRef
		}),
		["$margin"] = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.props.margin.left),
			PaddingRight = UDim.new(0, p1.props.margin.right),
			PaddingTop = UDim.new(0, p1.props.margin.top),
			PaddingBottom = UDim.new(0, p1.props.margin.bottom)
		})
	})
	
	return if p1.props.textProps then RoactModule.createElement(ImageButton, FilteredProps, {
		TextLabel = RoactModule.createElement("TextLabel", CryoModule.Dictionary.join(p1.props.textProps, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) })),
		ChildFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, JoinResult)
	}) else RoactModule.createElement(ImageButton, FilteredProps, JoinResult)
end

function FitFrameOnAxis.didMount(p1)
	p1.onResize()
end

function FitFrameOnAxis.didUpdate(p1)
	p1.onResize()
end

function FitFrameOnAxis.__getFilteredProps(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), FitFrameOnAxis (copy)
	local JoinResult = CryoModule.Dictionary.join(p1.props.ImageSet, {
		[RoactModule.Ref] = p1.frameRef,
		[RoactModule.Event.Activated] = p1.props.onActivated
	})
	
	for i, _ in pairs(FitFrameOnAxis.defaultProps) do
		JoinResult[i] = CryoModule.None
	end
	JoinResult.textProps = CryoModule.None
	
	return CryoModule.Dictionary.join(p1.props, JoinResult, {
		onActivated = CryoModule.None,
		forwardedRef = CryoModule.None,
		[RoactModule.Children] = CryoModule.None
	})
end

function FitFrameOnAxis.__getSize(p2, Current)
	-- upvalues: Axis (copy)
	if p2.props.axis == Axis.Both then
		return p2:__getBothAxisSize(Current)
	end
	local AxisUDim = p2:__getAxisUDim(Current.AbsoluteContentSize)
	local OtherUDim = p2:__getOtherUDim()
	
	if p2.props.axis == Axis.Vertical then
		return UDim2.new(OtherUDim, AxisUDim)
	elseif p2.props.axis ~= Axis.Horizontal then return end
	return UDim2.new(AxisUDim, OtherUDim)
end

function FitFrameOnAxis.__getBothAxisSize(p2, p3): UDim2
	local MinimumSize = p2.props.minimumSize
	local AbsoluteContentSize = p3.AbsoluteContentSize
	
	return UDim2.new(UDim.new(MinimumSize.X.Scale, AbsoluteContentSize.X + p2:__getHorizontalMargin()), (UDim.new(MinimumSize.Y.Scale, AbsoluteContentSize.Y + p2:__getVerticalMargin())))
end

function FitFrameOnAxis.__getAxisUDim(p2, AbsoluteContentSize): UDim
	-- upvalues: Axis (copy)
	local MinimumSize = p2.props.minimumSize
	local X = nil
	local NewX: number? = nil
	
	if p2.props.axis == Axis.Vertical then
		X = MinimumSize.Y
		NewX = AbsoluteContentSize.Y + p2:__getVerticalMargin()
	elseif p2.props.axis == Axis.Horizontal then
		X = MinimumSize.X
		NewX = AbsoluteContentSize.X + p2:__getHorizontalMargin()
	end
	return UDim.new(X.Scale, (math.max(NewX, X.Offset)))
end

function FitFrameOnAxis.__getVerticalMargin(p2)
	return p2.props.margin.top + p2.props.margin.bottom
end

function FitFrameOnAxis.__getHorizontalMargin(p2)
	return p2.props.margin.left + p2.props.margin.right
end

function FitFrameOnAxis.__getOtherUDim(p2)
	-- upvalues: Axis (copy)
	local MinimumSize = p2.props.minimumSize
	
	if p2.props.axis == Axis.Vertical then
		return MinimumSize.X
	elseif p2.props.axis ~= Axis.Horizontal then return end
	return MinimumSize.Y
end

local ForwardRefResult = if IsRoact17Module() then RoactModule.forwardRef(function(p2, ForwardedRef)
	-- upvalues: RoactModule (copy), FitFrameOnAxis (copy), CryoModule (copy)
	return RoactModule.createElement(FitFrameOnAxis, CryoModule.Dictionary.join(p2, { forwardedRef = ForwardedRef }))
end) else FitFrameOnAxis
ForwardRefResult.Axis = Axis

return ForwardRefResult