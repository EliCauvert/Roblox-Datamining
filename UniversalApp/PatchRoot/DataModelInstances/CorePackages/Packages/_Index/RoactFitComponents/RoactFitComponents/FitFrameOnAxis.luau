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

function fitFrameOnAxis.init(p1)
	-- upvalues: roactModule (ref), isRoact17Module (ref)
	p1.layoutRef = roactModule.createRef()
	
	if isRoact17Module() then
		p1.frameRef = p1.props.forwardedRef or roactModule.createRef()
	else
		p1.frameRef = p1.props[roactModule.Ref] or roactModule.createRef()
	end
	function p0.onResize()
		-- upvalues: p1 (ref)
		local current = p1.layoutRef.current
		local current_1 = p1.frameRef.current
		
		if current_1 and current then
			current_1.Size = p1:__getSize(current)
			
			return
		end
	end
end

function fitFrameOnAxis.render(p1)
	-- upvalues: roactModule (ref), cryoModule (ref)
	assert(p1.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?")
	local children = p1.props[roactModule.Children] or {}
	local filteredProps = p1:__getFilteredProps()
	local var1 = if p1.props.onActivated then "ImageButton" else "ImageLabel"
	local var2 = cryoModule.Dictionary.join(children, {
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
	
	return if p1.props.textProps then roactModule.createElement(var1, filteredProps, {
		TextLabel = roactModule.createElement("TextLabel", cryoModule.Dictionary.join(p1.props.textProps, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) })),
		ChildFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, var2)
	}) else roactModule.createElement(var1, filteredProps, var2)
end

function fitFrameOnAxis.didMount(p1)
	p1.onResize()
end

function fitFrameOnAxis.didUpdate(p1)
	p1.onResize()
end

function fitFrameOnAxis.__getFilteredProps(p1)
	-- upvalues: cryoModule (ref), roactModule (ref), fitFrameOnAxis (ref)
	local var1 = cryoModule.Dictionary.join(p1.props.ImageSet, {
		[roactModule.Ref] = p1.frameRef,
		[roactModule.Event.Activated] = p1.props.onActivated
	})
	
	for i, v in pairs(fitFrameOnAxis.defaultProps) do
		var1[i] = cryoModule.None
	end
	var1.textProps = cryoModule.None
	
	return cryoModule.Dictionary.join(p1.props, var1, {
		onActivated = cryoModule.None,
		forwardedRef = cryoModule.None,
		[roactModule.Children] = cryoModule.None
	})
end

function fitFrameOnAxis.__getSize(p2, p3)
	-- upvalues: t (ref)
	if p2.props.axis == t.Both then
		return p2:__getBothAxisSize(p3)
	end
	local absoluteContentSizeEtAxisUDim = p2:__getAxisUDim(p3.AbsoluteContentSize)
	local otherUDim = p2:__getOtherUDim()
	
	if p2.props.axis == t.Vertical then
		return UDim2.new(otherUDim, absoluteContentSizeEtAxisUDim)
	elseif p2.props.axis == t.Horizontal then
		return UDim2.new(absoluteContentSizeEtAxisUDim, otherUDim)
	end
end

function fitFrameOnAxis.__getBothAxisSize(p2, p3)
	local minimumSize = p2.props.minimumSize
	local absoluteContentSize = p3.AbsoluteContentSize
	
	return UDim2.new(UDim.new(minimumSize.X.Scale, absoluteContentSize.X + p2:__getHorizontalMargin()), UDim.new(minimumSize.Y.Scale, absoluteContentSize.Y + p2:__getVerticalMargin()))
end

function fitFrameOnAxis.__getAxisUDim(p2, p3)
	-- upvalues: t (ref)
	local minimumSize = p2.props.minimumSize
	local x = nil
	local var2 = nil
	
	if p2.props.axis == t.Vertical then
		x = minimumSize.Y
		var2 = p3.Y + p2:__getVerticalMargin()
	elseif p2.props.axis == t.Horizontal then
		x = minimumSize.X
		var2 = p3.X + p2:__getHorizontalMargin()
	end
	return UDim.new(x.Scale, math.max(var2, x.Offset))
end

function fitFrameOnAxis.__getVerticalMargin(p2)
	return p2.props.margin.top + p2.props.margin.bottom
end

function fitFrameOnAxis.__getHorizontalMargin(p2)
	return p2.props.margin.left + p2.props.margin.right
end

function fitFrameOnAxis.__getOtherUDim(p2)
	-- upvalues: t (ref)
	local minimumSize = p2.props.minimumSize
	
	if p2.props.axis == t.Vertical then
		return minimumSize.X
	elseif p2.props.axis == t.Horizontal then
		return minimumSize.Y
	end
end

local var2 = if isRoact17Module() then roactModule.forwardRef(function(p2, p3)
	-- upvalues: roactModule (ref), fitFrameOnAxis (ref), cryoModule (ref)
	return roactModule.createElement(fitFrameOnAxis, cryoModule.Dictionary.join(p2, { forwardedRef = p3 }))
end) else fitFrameOnAxis
var2.Axis = t

return var2