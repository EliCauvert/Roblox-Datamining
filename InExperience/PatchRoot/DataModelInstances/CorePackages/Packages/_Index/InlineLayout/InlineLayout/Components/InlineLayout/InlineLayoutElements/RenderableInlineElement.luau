local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local inlineElementTypeModule = require(parent.Utils.InlineElementType)
local join = dashModule.join
local t = {}
t.__index = t
t.__type = inlineElementTypeModule

function t.new(p1, p2, p3)
	-- upvalues: t (ref), dashModule (ref)
	local tbl = setmetatable({}, t)
	tbl.props = p2
	tbl.mapProps = p3 or dashModule.identity
	tbl.Element = p1
	
	return tbl
end

function t:getWidth()
	return self.props.Size.Width.Offset
end

function t:split()
	-- upvalues: t (ref), join (ref)
	return t.new(self.Element, join(self.props))
end

function t:render(p1, p2)
	-- upvalues: reactModule (ref), dashModule (ref)
	return reactModule.createElement(self.Element, self.mapProps(dashModule.assign(self.props, { id = p1, key = tostring(p2), LayoutOrder = p2 })))
end

return t