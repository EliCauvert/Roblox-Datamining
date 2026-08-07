local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local inlineElementTypeModule = require(parent.Utils.InlineElementType)
local join = dashModule.join
local t = {}
t.__index = t
t.__type = inlineElementTypeModule

function t.new(p0, p1, p2) --[[ line: 44 ]]
	-- upvalues: t (ref), dashModule (ref)
	local tbl = setmetatable({}, t)
	tbl.props = p1
	tbl.mapProps = p2 or dashModule.identity
	tbl.Element = p0
	
	return tbl
end

function t:getWidth() --[[ line: 52 ]]
	return self.props.Size.Width.Offset
end

function t:split() --[[ line: 56 ]]
	-- upvalues: t (ref), join (ref)
	return t.new(self.Element, join(self.props))
end

function t:render(p3, p4) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), dashModule (ref)
	return reactModule.createElement(self.Element, self.mapProps(dashModule.assign(self.props, { id = p3, key = tostring(p4), LayoutOrder = p4 })))
end

return t