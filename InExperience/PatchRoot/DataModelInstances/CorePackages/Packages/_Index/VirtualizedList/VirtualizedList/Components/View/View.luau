local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent.React)
local change = reactModule.Change
local view = reactModule.Component:extend("View")

function view.init(p0, p1) --[[ line: 46 ]]
	-- upvalues: reactModule (ref)
	p0.props = p1
	p0._nativeRef = p0.props.nativeRef or reactModule.createRef()
end

function view.render(p2) --[[ line: 51 ]]
	-- upvalues: array (ref), object (ref), change (ref), reactModule (ref)
	local var3 = object.assign(table.clone(p2.props), if array.isArray(p2.props.style) then array.reduce(p2.props.style, function(p3, p4) --[[ line: 53 ]]
		-- upvalues: object (copy)
		return object.assign(p3, p4)
	end, {}) else p2.props.style)
	p2.nativeProps = {
		ref = p2._nativeRef,
		BackgroundColor3 = var3.BackgroundColor3,
		Name = var3.Name or "View",
		Size = var3.Size or UDim2.new(1, 0, 0, 0),
		AutomaticSize = var3.AutomaticSize or Enum.AutomaticSize.Y,
		ZIndex = var3.ZIndex or nil,
		LayoutOrder = var3.LayoutOrder or nil,
		BorderSizePixel = var3.BorderSizePixel or 0,
		BackgroundTransparency = var3.BackgroundTransparency or 1,
		SelectionGroup = var3.SelectionGroup,
		SelectionBehaviorLeft = var3.SelectionBehaviorLeft,
		SelectionBehaviorRight = var3.SelectionBehaviorRight,
		SelectionBehaviorUp = var3.SelectionBehaviorUp,
		SelectionBehaviorDown = var3.SelectionBehaviorDown,
		[change.AbsoluteSize] = var3.onLayout
	}
	
	return reactModule.createElement("Frame", p2.nativeProps, p2.props.children)
end

return view