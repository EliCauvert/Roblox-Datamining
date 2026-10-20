local Signal = require(script:FindFirstAncestor("GameTile").Parent.AppCommonLib).Signal
local HoverTileCoordinatorModule = {}
HoverTileCoordinatorModule.__index = HoverTileCoordinatorModule

function HoverTileCoordinatorModule.new()
	-- upvalues: Signal (copy), HoverTileCoordinatorModule (copy)
	local config = {
		hoveredKey = nil,
		waitingForHover = nil,
		changed = Signal.new()
	}
	setmetatable(config, HoverTileCoordinatorModule)
	
	return config
end

function HoverTileCoordinatorModule:requestHover(HoveredKey)
	if self.hoveredKey == HoveredKey then return end
	if self.waitingForHover == HoveredKey then return end
	if self.hoveredKey == nil or self.waitingForHover ~= nil then
		self.hoveredKey = HoveredKey
		self.waitingForHover = nil
		self.changed:fire(self.hoveredKey)
		
		return
	else
		self.waitingForHover = HoveredKey
	end
end

function HoverTileCoordinatorModule:cancelHover(HoveredKey)
	if self.hoveredKey == HoveredKey then
		if self.waitingForHover == nil then
			self.hoveredKey = nil
		else
			self.hoveredKey = self.waitingForHover
			self.waitingForHover = nil
		end
		self.changed:fire(self.hoveredKey)
		
		return
	elseif self.waitingForHover == HoveredKey then
		self.waitingForHover = nil
	end
end

function HoverTileCoordinatorModule:reset()
	self.waitingForHover = nil
	self.hoveredKey = nil
	
	if self.hoveredKey ~= nil then
		self.changed:fire(self.hoveredKey)
	end
end

HoverTileCoordinatorModule.default = HoverTileCoordinatorModule.new()

return HoverTileCoordinatorModule