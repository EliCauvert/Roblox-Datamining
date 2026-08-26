local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent.React)
local change = reactModule.Change
local view = reactModule.Component:extend("View")

function view.init(p1, p2)
	-- upvalues: reactModule (ref)
	p1.props = p2
	p1._nativeRef = p1.props.nativeRef or reactModule.createRef()
end

function view.render(p1)
	-- upvalues: array (ref), object (ref), change (ref), reactModule (ref)
	local var1 = object.assign(table.clone(p1.props), if array.isArray(p1.props.style) then array.reduce(p1.props.style, function(p2, p3)
		-- upvalues: object (copy)
		return object.assign(p2, p3)
	end, {}) else p1.props.style)
	p1.nativeProps = {
		ref = p1._nativeRef,
		BackgroundColor3 = var1.BackgroundColor3,
		Name = var1.Name or "View",
		Size = var1.Size or UDim2.new(1, 0, 0, 0),
		AutomaticSize = var1.AutomaticSize or Enum.AutomaticSize.Y,
		ZIndex = var1.ZIndex or nil,
		LayoutOrder = var1.LayoutOrder or nil,
		BorderSizePixel = var1.BorderSizePixel or 0,
		BackgroundTransparency = var1.BackgroundTransparency or 1,
		SelectionGroup = var1.SelectionGroup,
		SelectionBehaviorLeft = var1.SelectionBehaviorLeft,
		SelectionBehaviorRight = var1.SelectionBehaviorRight,
		SelectionBehaviorUp = var1.SelectionBehaviorUp,
		SelectionBehaviorDown = var1.SelectionBehaviorDown,
		[change.AbsoluteSize] = var1.onLayout
	}
	
	return reactModule.createElement("Frame", p1.nativeProps, p1.props.children)
end

return view