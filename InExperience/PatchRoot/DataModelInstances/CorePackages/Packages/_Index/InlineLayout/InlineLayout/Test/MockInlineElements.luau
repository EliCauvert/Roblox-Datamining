local InlineLayout = script:FindFirstAncestor("InlineLayout")
local ReactModule = require(InlineLayout.Parent.React)
local InlineElementTypeModule = require(InlineLayout.Utils.InlineElementType)
local Module = {}
Module.__index = Module
Module.__type = InlineElementTypeModule

function Module.new(Width, CanForceSplit)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.width = Width
	self.canForceSplit = CanForceSplit
	
	return self
end

function Module:getWidth()
	return self.width
end

function Module:split(_, _)
	-- upvalues: Module (copy)
	return Module.new(self.width, self.canForceSplit)
end

function Module:render(p1, LayoutOrder)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("TextLabel", {
		key = tostring(LayoutOrder),
		LayoutOrder = LayoutOrder,
		Size = UDim2.fromOffset(self.width, 20),
		Text = `{p1}`
	})
end

local Module1 = {}
Module1.__index = Module1
Module1.__type = InlineElementTypeModule

function Module1.new(Width, CanForceSplit)
	-- upvalues: Module1 (copy)
	local self = setmetatable({}, Module1)
	self.width = Width
	self.canForceSplit = CanForceSplit
	
	return self
end

function Module1:getWidth()
	return self.width
end

function Module1:split(p1, p2)
	-- upvalues: Module1 (copy)
	local Floored = math.floor(self.width / 2)
	local Width: number = Floored
	local WidthDelta = self.width - Floored
	
	if p2 and p1 < Floored then
		Width = p1
		WidthDelta = self.width - p1
	end
	return Module1.new(Width, self.canForceSplit), (Module1.new(WidthDelta, self.canForceSplit))
end

function Module1:render(p1, LayoutOrder)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("TextLabel", {
		key = tostring(LayoutOrder),
		LayoutOrder = LayoutOrder,
		Size = UDim2.fromOffset(self.width, 20),
		Text = `{p1}`
	})
end

return {
	MockInlineElement = Module,
	SplittableMockInlineElement = Module1
}