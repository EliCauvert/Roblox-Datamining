local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local JoinFunction = DashModule.join
local RenderableInlineElementModule = {}
RenderableInlineElementModule.__index = RenderableInlineElementModule
RenderableInlineElementModule.__type = require(Parent.Utils.InlineElementType)

function RenderableInlineElementModule.new(Element, Props, p1) --[[ Line: 46 ]]
	-- upvalues: RenderableInlineElementModule (copy), DashModule (copy)
	local self = setmetatable({}, RenderableInlineElementModule)
	self.props = Props
	self.mapProps = p1 or DashModule.identity
	self.Element = Element
	
	return self
end

function RenderableInlineElementModule:getWidth() --[[ Line: 54 ]]
	return self.props.Size.Width.Offset
end

function RenderableInlineElementModule:split() --[[ Line: 58 ]]
	-- upvalues: RenderableInlineElementModule (copy), JoinFunction (copy)
	return RenderableInlineElementModule.new(self.Element, JoinFunction(self.props))
end

function RenderableInlineElementModule:render(Id, LayoutOrder) --[[ Line: 62 ]]
	-- upvalues: ReactModule (copy), DashModule (copy)
	return ReactModule.createElement(self.Element, self.mapProps(DashModule.assign(self.props, {
		id = Id,
		key = tostring(LayoutOrder),
		LayoutOrder = LayoutOrder
	})))
end

return RenderableInlineElementModule