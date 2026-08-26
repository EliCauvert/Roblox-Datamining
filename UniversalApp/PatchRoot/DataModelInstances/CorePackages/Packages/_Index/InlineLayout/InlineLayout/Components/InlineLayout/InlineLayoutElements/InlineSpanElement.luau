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

local function _(p3, p4, p5, p6, p7, p8)
	local var2 = nil
	local _ = nil
	
	if p7 then
		return var2, p5
	elseif p5.canForceSplit and p8 then
		local var3, var4 = p5:split(p6, true)
		
		return var3, var4
	end
	var2 = p3
	
	return var2, p4
end

function t.new(p3, p4, p5, p6)
	-- upvalues: t (ref), isInlineElementModule (ref), hardBreakElementModule (ref)
	local tbl = setmetatable({}, t)
	tbl.WrapperElement = p3
	tbl.wrapperElementProps = p4
	tbl.Elements = {}
	tbl.startingIndex = p6 or 1
	
	for i, v in p5 do
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
	return dashModule.sum(dashModule.map(self.Elements, function(p7)
		return p7:getWidth()
	end))
end

function t:_splitChildAtIndex(p7, p8)
	local var2, var3 = self.Elements[p7]:split(p8, false)
	
	return var2, var3, var2:getWidth() <= p8
end

function t:split(p7, p8)
	-- upvalues: getSplitPoint (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local var2, var3 = getSplitPoint(self.Elements, p7)
	
	if var2 == -1 then
		return self, nil
	end
	local var4 = var2 + 1
	local var5, var6, var7 = self:_splitChildAtIndex(var2, var3)
	
	if not var7 then
		local var8
		local var9 = var5
		local var10 = var6
		local var11 = self.Elements[var2]
		local var12 = var2 > 1
		local var13 = nil
		local _ = nil
		
		if var12 then
			var8 = var11
		elseif var11.canForceSplit and p8 then
			local var14, var15 = var11:split(var3, true)
			var13 = var14
			var8 = var15
		else
			var13 = var9
			var8 = var10
		end
		var5 = var13
		var6 = var8
	end
	if var2 > 1 then
		table.move(self.Elements, 1, var2 - 1, 1, t_1)
	end
	if var5 then
		table.insert(t_1, var5)
		var4 -= 1
	end
	if var6 then
		table.insert(t_2, var6)
	end
	if var2 < #self.Elements then
		table.move(self.Elements, var2 + 1, #self.Elements, #t_2 + 1, t_2)
	end
	local var16 = t.new(self.WrapperElement, self.wrapperElementProps, t_1, self.startingIndex)
	
	if #t_2 > 0 then
		return var16, t.new(self.WrapperElement, self.wrapperElementProps, t_2, var4)
	end
	return var16, nil
end

function t:render(p7, p8)
	-- upvalues: dashModule (ref), reactModule (ref)
	return reactModule.createElement(self.WrapperElement, dashModule.join(self.wrapperElementProps, { id = p7, LayoutOrder = p8 }), dashModule.map(self.Elements, function(p9, p10)
		-- upvalues: p7 (ref), self (ref)
		return p9:render(`{p7}-{self.startingIndex + p10 - 1}`, p10)
	end))
end

return t