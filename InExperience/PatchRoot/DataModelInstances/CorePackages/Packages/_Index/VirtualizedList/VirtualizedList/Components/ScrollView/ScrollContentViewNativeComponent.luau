local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent.React)
local change = reactModule.Change
local scrollContentViewNativeComponent = reactModule.Component:extend("ScrollContentViewNativeComponent")

function scrollContentViewNativeComponent.init(p1, p2)
	p1.props = p2
end

function scrollContentViewNativeComponent.render(p1)
	-- upvalues: array (ref), object (ref), change (ref), reactModule (ref)
	return reactModule.createElement("Frame", object.assign({
		Name = "RCTScrollContentView",
		[change.AbsoluteSize] = p1.props.onLayout,
		Size = UDim2.new(1, 0, 1, 0)
	}, if p1.props.AutomaticSize then { AutomaticSize = p1.props.AutomaticSize } else nil, if array.isArray(p1.props.style) then array.reduce(p1.props.style, function(p2, p3)
		-- upvalues: object (copy)
		return object.assign(p2, p3)
	end, {}) else p1.props.style), p1.props.children)
end

return scrollContentViewNativeComponent