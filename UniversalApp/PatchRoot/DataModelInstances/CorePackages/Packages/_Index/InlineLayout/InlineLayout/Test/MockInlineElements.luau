local inlineLayout = script:FindFirstAncestor("InlineLayout")
local reactModule = require(inlineLayout.Parent.React)
local inlineElementTypeModule = require(inlineLayout.Utils.InlineElementType)
local t = {}
t.__index = t
t.__type = inlineElementTypeModule

function t.new(p0, p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.width = p0
	tbl.canForceSplit = p1
	
	return tbl
end

function t:getWidth()
	return self.width
end

function t:split(_, _)
	-- upvalues: t (ref)
	return t.new(self.width, self.canForceSplit)
end

function t:render(p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextLabel", {
		key = tostring(p3),
		LayoutOrder = p3,
		Size = UDim2.new(0, self.width, 0, 20),
		Text = `{p2}`
	})
end

local t_1 = {}
t_1.__index = t_1
t_1.__type = inlineElementTypeModule

function t_1.new(p4, p5)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.width = p4
	tbl.canForceSplit = p5
	
	return tbl
end

function t_1:getWidth()
	return self.width
end

function t_1:split(p6, p7)
	-- upvalues: t_1 (ref)
	local floored = math.floor(self.width / 2)
	local var8 = floored
	local var9 = self.width - floored
	
	if p7 and p6 < floored then
		var8 = p6
		var9 = self.width - p6
	end
	return t_1.new(var8, self.canForceSplit), t_1.new(var9, self.canForceSplit)
end

function t_1:render(p8, p9)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextLabel", {
		key = tostring(p9),
		LayoutOrder = p9,
		Size = UDim2.new(0, self.width, 0, 20),
		Text = `{p8}`
	})
end

return { MockInlineElement = t, SplittableMockInlineElement = t_1 }