local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent.React)
local Change = ReactModule.Change
local ScrollContentViewNativeComponent = ReactModule.Component:extend("ScrollContentViewNativeComponent")

function ScrollContentViewNativeComponent.init(p1, Props)
	p1.props = Props
end

function ScrollContentViewNativeComponent.render(p1)
	-- upvalues: Array (copy), Object (copy), Change (copy), ReactModule (copy)
	return ReactModule.createElement("Frame", Object.assign({
		Name = "RCTScrollContentView",
		[Change.AbsoluteSize] = p1.props.onLayout,
		Size = UDim2.new(1, 0, 1, 0)
	}, if p1.props.AutomaticSize then { AutomaticSize = p1.props.AutomaticSize } else nil, if Array.isArray(p1.props.style) then Array.reduce(p1.props.style, function(p2, p3)
		-- upvalues: Object (upval)
		return Object.assign(p2, p3)
	end, {}) else p1.props.style), p1.props.children)
end

return ScrollContentViewNativeComponent