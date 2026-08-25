local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent.React)
local change = reactModule.Change
local scrollContentViewNativeComponent = reactModule.Component:extend("ScrollContentViewNativeComponent")

function scrollContentViewNativeComponent.init(p0, p1)
	p0.props = p1
end

function scrollContentViewNativeComponent.render(p2)
	-- upvalues: array (ref), object (ref), change (ref), reactModule (ref)
	return reactModule.createElement("Frame", object.assign({
		Name = "RCTScrollContentView",
		[change.AbsoluteSize] = p2.props.onLayout,
		Size = UDim2.new(1, 0, 1, 0)
	}, if p2.props.AutomaticSize then { AutomaticSize = p2.props.AutomaticSize } else nil, if array.isArray(p2.props.style) then array.reduce(p2.props.style, function(p3, p4)
		-- upvalues: object (copy)
		return object.assign(p3, p4)
	end, {}) else p2.props.style), p2.props.children)
end

return scrollContentViewNativeComponent