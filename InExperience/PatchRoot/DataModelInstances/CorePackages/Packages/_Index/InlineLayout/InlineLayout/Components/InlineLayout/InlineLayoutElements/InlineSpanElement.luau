local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local _ = require(Parent.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local HardBreakElementModule = require(Parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local IsInlineElementModule = require(Parent.Utils.isInlineElement)
local RenderInMeasuredFrameModule = require(Parent.Utils.renderInMeasuredFrame)
local InlineSpanElementModule = {}
InlineSpanElementModule.__index = InlineSpanElementModule
InlineSpanElementModule.__type = require(Parent.Utils.InlineElementType)

local function getSplitPoint(Elements, p1: number) --[[ Line: 21 ]]
	local Total = 0
	
	for i, element in Elements do
		local Width: number = element:getWidth()
		
		if p1 < Total + Width then
			return i, p1 - Total
		end
		Total += Width
	end
	return -1, -1
end

local function _(p2, p3, Text: string, p4, p5, p6) --[[ Line: 33 | Named "handleSplitTrailingElement" ]]
	local v1 = nil
	
	if p5 then
		return v1, Text
	elseif Text.canForceSplit and p6 then
		local Parts, Parts2 = Text:split(p4, true)
		
		return Parts, Parts2
	else
		v1 = p2
		
		return v1, p3
	end
end

function InlineSpanElementModule.new(WrapperElement, WrapperElementProps, Elements, Count) --[[ Line: 57 ]]
	-- upvalues: InlineSpanElementModule (copy), IsInlineElementModule (copy), HardBreakElementModule (copy)
	local self = setmetatable({}, InlineSpanElementModule)
	self.WrapperElement = WrapperElement
	self.wrapperElementProps = WrapperElementProps
	self.Elements = {}
	self.startingIndex = Count or 1
	
	for _, element in Elements do
		if IsInlineElementModule(element) and element ~= HardBreakElementModule then
			table.insert(self.Elements, element)
		else
			warn("InlineSpanElement: invalid element provided. Only non inline elements, excluding HardBreakElement, are allowed.")
		end
	end
	if #self.Elements == 0 then
		warn("InlineSpanElement: no elements provided")
	end
	self.canForceSplit = #self.Elements > 0 and self.Elements[#self.Elements].canForceSplit
	
	return self
end

function InlineSpanElementModule:getWidth() --[[ Line: 86 ]]
	-- upvalues: DashModule (copy)
	return DashModule.sum(DashModule.map(self.Elements, function(p2) --[[ Line: 87 ]]
		return p2:getWidth()
	end))
end

function InlineSpanElementModule:_splitChildAtIndex(p2, p3) --[[ Line: 92 ]]
	local Parts, Parts2 = self.Elements[p2]:split(p3, false)
	
	return Parts, Parts2, Parts:getWidth() <= p3
end

function InlineSpanElementModule:split(p2, p3) --[[ Line: 102 ]]
	-- upvalues: getSplitPoint (copy), InlineSpanElementModule (copy)
	local List = {}
	local Elements = {}
	local SplitPoint, SplitPoint2 = getSplitPoint(self.Elements, p2)
	
	if SplitPoint == -1 then
		return self, nil
	end
	local NewSplitPoint = SplitPoint + 1
	local SplitChildAtIndexResult, SplitChildAtIndexResult2, SplitChildAtIndexResult3 = self:_splitChildAtIndex(SplitPoint, SplitPoint2)
	
	if not SplitChildAtIndexResult3 then
		local SplitChildAtIndexResult1 = SplitChildAtIndexResult
		local SplitChildAtIndexResult4: string = SplitChildAtIndexResult2
		local Element: string = self.Elements[SplitPoint]
		local v1 = nil
		local Element1 = nil
		
		if SplitPoint > 1 then
			Element1 = Element
		elseif Element.canForceSplit and p3 then
			v1, Element1 = Element:split(SplitPoint2, true)
		else
			v1 = SplitChildAtIndexResult1
			Element1 = SplitChildAtIndexResult4
		end
		SplitChildAtIndexResult = v1
		SplitChildAtIndexResult2 = Element1
	end
	if SplitPoint > 1 then
		table.move(self.Elements, 1, SplitPoint - 1, 1, List)
	end
	if SplitChildAtIndexResult then
		table.insert(List, SplitChildAtIndexResult)
		NewSplitPoint -= 1
	end
	if SplitChildAtIndexResult2 then
		table.insert(Elements, SplitChildAtIndexResult2)
	end
	if SplitPoint < #self.Elements then
		table.move(self.Elements, SplitPoint + 1, #self.Elements, #Elements + 1, Elements)
	end
	local NewInlineSpanElement = InlineSpanElementModule.new(self.WrapperElement, self.wrapperElementProps, List, self.startingIndex)
	
	if #Elements > 0 then
		return NewInlineSpanElement, (InlineSpanElementModule.new(self.WrapperElement, self.wrapperElementProps, Elements, NewSplitPoint))
	else
		return NewInlineSpanElement, nil
	end
end

function InlineSpanElementModule:trimStart() --[[ Line: 150 ]]
	-- upvalues: InlineSpanElementModule (copy)
	local TrimStartResult = nil
	for i, element in self.Elements do
		TrimStartResult = if element.trimStart then element:trimStart() else element
		
		if TrimStartResult == element and i == 1 then
			return self
		elseif TrimStartResult ~= nil then
			local list = { TrimStartResult }
			table.move(self.Elements, i + 1, #self.Elements, 2, list)
			
			return InlineSpanElementModule.new(self.WrapperElement, self.wrapperElementProps, list, self.startingIndex + i - 1)
		end
	end
	return nil
end

function InlineSpanElementModule:render(Id, LayoutOrder) --[[ Line: 170 ]]
	-- upvalues: DashModule (copy), RenderInMeasuredFrameModule (copy), ReactModule (copy)
	return ReactModule.createElement(self.WrapperElement, DashModule.join(self.wrapperElementProps, { id = Id, LayoutOrder = LayoutOrder }), (DashModule.map(self.Elements, function(p2, LayoutOrder) --[[ Line: 172 ]]
		-- upvalues: RenderInMeasuredFrameModule (upval), Id (copy), self (copy)
		return RenderInMeasuredFrameModule(p2:render(`{Id}-{self.startingIndex + LayoutOrder - 1}`, LayoutOrder), p2:getWidth(), LayoutOrder)
	end)))
end

return InlineSpanElementModule