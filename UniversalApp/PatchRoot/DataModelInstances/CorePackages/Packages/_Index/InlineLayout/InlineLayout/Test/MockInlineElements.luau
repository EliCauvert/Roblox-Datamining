local inlineLayout = script:FindFirstAncestor("InlineLayout")
local reactModule = require(inlineLayout.Parent.React)
local inlineElementTypeModule = require(inlineLayout.Utils.InlineElementType)
local t = {}
t.__index = t
t.__type = inlineElementTypeModule

function t.new(p1, p2)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.width = p1
	tbl.canForceSplit = p2
	
	return tbl
end

function t:getWidth()
	return self.width
end

function t:split(_, _)
	-- upvalues: t (ref)
	return t.new(self.width, self.canForceSplit)
end

function t:render(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextLabel", {
		key = tostring(p2),
		LayoutOrder = p2,
		Size = UDim2.new(0, self.width, 0, 20),
		Text = `{p1}`
	})
end

local t_1 = {}
t_1.__index = t_1
t_1.__type = inlineElementTypeModule

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.width = p1
	tbl.canForceSplit = p2
	
	return tbl
end

function t_1:getWidth()
	return self.width
end

function t_1:split(p1, p2)
	-- upvalues: t_1 (ref)
	local floored = math.floor(self.width / 2)
	local var1 = floored
	local var2 = self.width - floored
	
	if p2 and p1 < floored then
		var1 = p1
		var2 = self.width - p1
	end
	return t_1.new(var1, self.canForceSplit), t_1.new(var2, self.canForceSplit)
end

function t_1:render(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextLabel", {
		key = tostring(p2),
		LayoutOrder = p2,
		Size = UDim2.new(0, self.width, 0, 20),
		Text = `{p1}`
	})
end

return { MockInlineElement = t, SplittableMockInlineElement = t_1 }