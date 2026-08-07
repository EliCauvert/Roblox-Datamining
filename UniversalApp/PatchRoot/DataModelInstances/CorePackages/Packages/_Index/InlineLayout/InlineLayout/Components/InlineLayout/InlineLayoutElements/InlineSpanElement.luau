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

local function getSplitPoint(p0, p1) --[[ line: 20 ]]
	local var7 = 0
	
	for i, v in p0 do
		local width = v:getWidth()
		
		if p1 >= var7 + width then
			var7 += width
			continue
		end
		return i, p1 - var7
	end
	return -1, -1
end

local function _(p2, p3, p4, p5, p6, p7) --[[ line: 32 | named "handleSplitTrailingElement" ]]
	local var9 = nil
	local _ = nil
	
	if p6 then
		return var9, p4
	elseif p4.canForceSplit and p7 then
		local var10, var11 = p4:split(p5, true)
		
		return var10, var11
	end
	var9 = p2
	
	return var9, p3
end

function t.new(p8, p9, p10, p11) --[[ line: 56 ]]
	-- upvalues: t (ref), isInlineElementModule (ref), hardBreakElementModule (ref)
	local tbl = setmetatable({}, t)
	tbl.WrapperElement = p8
	tbl.wrapperElementProps = p9
	tbl.Elements = {}
	tbl.startingIndex = p11 or 1
	
	for i, v in p10 do
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

function t:getWidth() --[[ line: 85 ]]
	-- upvalues: dashModule (ref)
	return dashModule.sum(dashModule.map(self.Elements, function(p12) --[[ line: 86 ]]
		return p12:getWidth()
	end))
end

function t:_splitChildAtIndex(p13, p14) --[[ line: 91 ]]
	local var13, var14 = self.Elements[p13]:split(p14, false)
	
	return var13, var14, var13:getWidth() <= p14
end

function t:split(p15, p16) --[[ line: 101 ]]
	-- upvalues: getSplitPoint (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local var17, var18 = getSplitPoint(self.Elements, p15)
	
	if var17 == -1 then
		return self, nil
	end
	local var19 = var17 + 1
	local var20, var21, var22 = self:_splitChildAtIndex(var17, var18)
	
	if not var22 then
		local var28
		local var23 = var20
		local var24 = var21
		local var25 = self.Elements[var17]
		local var26 = var17 > 1
		local var27 = nil
		local _ = nil
		
		if var26 then
			var28 = var25
		elseif var25.canForceSplit and p16 then
			local var29, var30 = var25:split(var18, true)
			var27 = var29
			var28 = var30
		else
			var27 = var23
			var28 = var24
		end
		var20 = var27
		var21 = var28
	end
	if var17 > 1 then
		table.move(self.Elements, 1, var17 - 1, 1, t_1)
	end
	if var20 then
		table.insert(t_1, var20)
		var19 -= 1
	end
	if var21 then
		table.insert(t_2, var21)
	end
	if var17 < #self.Elements then
		table.move(self.Elements, var17 + 1, #self.Elements, #t_2 + 1, t_2)
	end
	local var31 = t.new(self.WrapperElement, self.wrapperElementProps, t_1, self.startingIndex)
	
	if #t_2 > 0 then
		return var31, t.new(self.WrapperElement, self.wrapperElementProps, t_2, var19)
	end
	return var31, nil
end

function t:render(p17, p18) --[[ line: 147 ]]
	-- upvalues: dashModule (ref), reactModule (ref)
	return reactModule.createElement(self.WrapperElement, dashModule.join(self.wrapperElementProps, { id = p17, LayoutOrder = p18 }), dashModule.map(self.Elements, function(p19, p20) --[[ line: 148 ]]
		-- upvalues: p17 (ref), self (ref)
		return p19:render(`{p17}-{self.startingIndex + p20 - 1}`, p20)
	end))
end

return t