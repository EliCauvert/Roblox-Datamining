local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent.React)
local Change = ReactModule.Change
local View = ReactModule.Component:extend("View")

function View.init(p1, Props) --[[ Line: 46 ]]
	-- upvalues: ReactModule (copy)
	p1.props = Props
	p1._nativeRef = p1.props.nativeRef or ReactModule.createRef()
end

function View.render(p1) --[[ Line: 51 ]]
	-- upvalues: Array (copy), Object (copy), Change (copy), ReactModule (copy)
	local AssignResult = Object.assign(table.clone(p1.props), if Array.isArray(p1.props.style) then Array.reduce(p1.props.style, function(p2, p3) --[[ Line: 53 ]]
		-- upvalues: Object (upval)
		return Object.assign(p2, p3)
	end, {}) else p1.props.style)
	p1.nativeProps = {
		ref = p1._nativeRef,
		BackgroundColor3 = AssignResult.BackgroundColor3,
		Name = AssignResult.Name or "View",
		Size = AssignResult.Size or UDim2.new(1, 0, 0, 0),
		AutomaticSize = AssignResult.AutomaticSize or Enum.AutomaticSize.Y,
		ZIndex = AssignResult.ZIndex or nil,
		LayoutOrder = AssignResult.LayoutOrder or nil,
		BorderSizePixel = AssignResult.BorderSizePixel or 0,
		BackgroundTransparency = AssignResult.BackgroundTransparency or 1,
		SelectionGroup = AssignResult.SelectionGroup,
		SelectionBehaviorLeft = AssignResult.SelectionBehaviorLeft,
		SelectionBehaviorRight = AssignResult.SelectionBehaviorRight,
		SelectionBehaviorUp = AssignResult.SelectionBehaviorUp,
		SelectionBehaviorDown = AssignResult.SelectionBehaviorDown,
		[Change.AbsoluteSize] = AssignResult.onLayout
	}
	
	return ReactModule.createElement("Frame", p1.nativeProps, p1.props.children)
end

return View