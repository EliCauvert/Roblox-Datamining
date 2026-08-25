local parent = script.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roactModule = require(parent_1.Roact)
local isRoact17Module = require(parent.isRoact17)
local rectModule = require(parent.Rect)
local t = { Horizontal = {}, Vertical = {}, Both = {} }
local fitFrameOnAxis = roactModule.PureComponent:extend("FitFrameOnAxis")
fitFrameOnAxis.defaultProps = {
	textProps = nil,
	axis = t.Vertical,
	minimumSize = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)),
	margin = rectModule.square(0),
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	ImageSet = {},
	VerticalAlignment = Enum.VerticalAlignment.Top,
	contentPadding = UDim.new(0, 0)
}

function fitFrameOnAxis.init(p0)
	-- upvalues: roactModule (ref), isRoact17Module (ref)
	p0.layoutRef = roactModule.createRef()
	
	if isRoact17Module() then
		p0.frameRef = p0.props.forwardedRef or roactModule.createRef()
	else
		p0.frameRef = p0.props[roactModule.Ref] or roactModule.createRef()
	end
	function p0.onResize()
		-- upvalues: p0 (ref)
		local current = p0.layoutRef.current
		local current_1 = p0.frameRef.current
		
		if current_1 and current then
			current_1.Size = p0:__getSize(current)
			
			return
		end
	end
end

function fitFrameOnAxis.render(p1)
	-- upvalues: roactModule (ref), cryoModule (ref)
	assert(p1.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?")
	local children = p1.props[roactModule.Children] or {}
	local filteredProps = p1:__getFilteredProps()
	local var9 = if p1.props.onActivated then "ImageButton" else "ImageLabel"
	local var10 = cryoModule.Dictionary.join(children, {
		["$layout"] = roactModule.createElement("UIListLayout", {
			FillDirection = p1.props.FillDirection,
			HorizontalAlignment = p1.props.HorizontalAlignment,
			Padding = p1.props.contentPadding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = p1.props.VerticalAlignment,
			[roactModule.Change.AbsoluteContentSize] = p1.onResize,
			[roactModule.Ref] = p1.layoutRef
		}),
		["$margin"] = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.props.margin.left),
			PaddingRight = UDim.new(0, p1.props.margin.right),
			PaddingTop = UDim.new(0, p1.props.margin.top),
			PaddingBottom = UDim.new(0, p1.props.margin.bottom)
		})
	})
	
	return if p1.props.textProps then roactModule.createElement(var9, filteredProps, {
		TextLabel = roactModule.createElement("TextLabel", cryoModule.Dictionary.join(p1.props.textProps, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) })),
		ChildFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, var10)
	}) else roactModule.createElement(var9, filteredProps, var10)
end

function fitFrameOnAxis.didMount(p2)
	p2.onResize()
end

function fitFrameOnAxis.didUpdate(p3)
	p3.onResize()
end

function fitFrameOnAxis.__getFilteredProps(p4)
	-- upvalues: cryoModule (ref), roactModule (ref), fitFrameOnAxis (ref)
	local var11 = cryoModule.Dictionary.join(p4.props.ImageSet, {
		[roactModule.Ref] = p4.frameRef,
		[roactModule.Event.Activated] = p4.props.onActivated
	})
	
	for i, v in pairs(fitFrameOnAxis.defaultProps) do
		var11[i] = cryoModule.None
	end
	var11.textProps = cryoModule.None
	
	return cryoModule.Dictionary.join(p4.props, var11, {
		onActivated = cryoModule.None,
		forwardedRef = cryoModule.None,
		[roactModule.Children] = cryoModule.None
	})
end

function fitFrameOnAxis.__getSize(p5, p6)
	-- upvalues: t (ref)
	if p5.props.axis == t.Both then
		return p5:__getBothAxisSize(p6)
	end
	local absoluteContentSizeEtAxisUDim = p5:__getAxisUDim(p6.AbsoluteContentSize)
	local otherUDim = p5:__getOtherUDim()
	
	if p5.props.axis == t.Vertical then
		return UDim2.new(otherUDim, absoluteContentSizeEtAxisUDim)
	elseif p5.props.axis == t.Horizontal then
		return UDim2.new(absoluteContentSizeEtAxisUDim, otherUDim)
	end
end

function fitFrameOnAxis.__getBothAxisSize(p7, p8)
	local minimumSize = p7.props.minimumSize
	local absoluteContentSize = p8.AbsoluteContentSize
	
	return UDim2.new(UDim.new(minimumSize.X.Scale, absoluteContentSize.X + p7:__getHorizontalMargin()), UDim.new(minimumSize.Y.Scale, absoluteContentSize.Y + p7:__getVerticalMargin()))
end

function fitFrameOnAxis.__getAxisUDim(p9, p10)
	-- upvalues: t (ref)
	local minimumSize = p9.props.minimumSize
	local x = nil
	local var14 = nil
	
	if p9.props.axis == t.Vertical then
		x = minimumSize.Y
		var14 = p10.Y + p9:__getVerticalMargin()
	elseif p9.props.axis == t.Horizontal then
		x = minimumSize.X
		var14 = p10.X + p9:__getHorizontalMargin()
	end
	return UDim.new(x.Scale, math.max(var14, x.Offset))
end

function fitFrameOnAxis.__getVerticalMargin(p11)
	return p11.props.margin.top + p11.props.margin.bottom
end

function fitFrameOnAxis.__getHorizontalMargin(p12)
	return p12.props.margin.left + p12.props.margin.right
end

function fitFrameOnAxis.__getOtherUDim(p13)
	-- upvalues: t (ref)
	local minimumSize = p13.props.minimumSize
	
	if p13.props.axis == t.Vertical then
		return minimumSize.X
	elseif p13.props.axis == t.Horizontal then
		return minimumSize.Y
	end
end

local var6 = if isRoact17Module() then roactModule.forwardRef(function(p14, p15)
	-- upvalues: roactModule (ref), fitFrameOnAxis (ref), cryoModule (ref)
	return roactModule.createElement(fitFrameOnAxis, cryoModule.Dictionary.join(p14, { forwardedRef = p15 }))
end) else fitFrameOnAxis
var6.Axis = t

return var6