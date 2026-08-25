local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local inlineElementTypeModule = require(parent.Utils.InlineElementType)
local _ = require(parent.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local hardBreakElementModule = require(parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local isInlineElementModule = require(parent.Utils.isInlineElement)
local t = {}
t.__index = t
t.__type = inlineElementTypeModule

local function getSplitPoint(p1, p2)
	local var1 = 0
	
	for i, v in p1 do
		local width = v:getWidth()
		
		if p2 >= var1 + width then
			var1 += width
			continue
		end
		return i, p2 - var1
	end
	return -1, -1
end

local function _(p1, p2, p3, p4, p5, p6)
	local var1 = nil
	local _ = nil
	
	if p5 then
		return var1, p3
	elseif p3.canForceSplit and p6 then
		local var2, var3 = p3:split(p4, true)
		
		return var2, var3
	end
	var1 = p1
	
	return var1, p2
end

function t.new(p1, p2, p3, p4)
	-- upvalues: t (ref), isInlineElementModule (ref), hardBreakElementModule (ref)
	local tbl = setmetatable({}, t)
	tbl.WrapperElement = p1
	tbl.wrapperElementProps = p2
	tbl.Elements = {}
	tbl.startingIndex = p4 or 1
	
	for i, v in p3 do
		if isInlineElementModule(v) and v ~= hardBreakElementModule then
			table.insert(tbl.Elements, v)
		else
			warn("InlineSpanElement: invalid element provided. Only non inline elements, excluding HardBreakElement, are allowed.")
		end
	end
	if #tbl.Elements == 0 then
		warn("InlineSpanElement: no elements provided")
	end
	tbl.canForceSplit = #tbl.Elements > 0 and tbl.Elements[#tbl.Elements].canForceSplit
	
	return tbl
end

function t:getWidth()
	-- upvalues: dashModule (ref)
	return dashModule.sum(dashModule.map(self.Elements, function(p1)
		return p1:getWidth()
	end))
end

function t:_splitChildAtIndex(p1, p2)
	local var1, var2 = self.Elements[p1]:split(p2, false)
	
	return var1, var2, var1:getWidth() <= p2
end

function t:split(p1, p2)
	-- upvalues: getSplitPoint (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local var1, var2 = getSplitPoint(self.Elements, p1)
	
	if var1 == -1 then
		return self, nil
	end
	local var3 = var1 + 1
	local var4, var5, var6 = self:_splitChildAtIndex(var1, var2)
	
	if not var6 then
		local var7
		local var8 = var4
		local var9 = var5
		local var10 = self.Elements[var1]
		local var11 = var1 > 1
		local var12 = nil
		local _ = nil
		
		if var11 then
			var7 = var10
		elseif var10.canForceSplit and p2 then
			local var13, var14 = var10:split(var2, true)
			var12 = var13
			var7 = var14
		else
			var12 = var8
			var7 = var9
		end
		var4 = var12
		var5 = var7
	end
	if var1 > 1 then
		table.move(self.Elements, 1, var1 - 1, 1, t_1)
	end
	if var4 then
		table.insert(t_1, var4)
		var3 -= 1
	end
	if var5 then
		table.insert(t_2, var5)
	end
	if var1 < #self.Elements then
		table.move(self.Elements, var1 + 1, #self.Elements, #t_2 + 1, t_2)
	end
	local var15 = t.new(self.WrapperElement, self.wrapperElementProps, t_1, self.startingIndex)
	
	if #t_2 > 0 then
		return var15, t.new(self.WrapperElement, self.wrapperElementProps, t_2, var3)
	end
	return var15, nil
end

function t:render(p1, p2)
	-- upvalues: dashModule (ref), reactModule (ref)
	return reactModule.createElement(self.WrapperElement, dashModule.join(self.wrapperElementProps, { id = p1, LayoutOrder = p2 }), dashModule.map(self.Elements, function(p1, p2)
		-- upvalues: p1 (ref), self (ref)
		return p1:render(`{p1}-{self.startingIndex + p2 - 1}`, p2)
	end))
end

return t