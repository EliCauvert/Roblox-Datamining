local signal = require(script:FindFirstAncestor("GameTile").Parent.AppCommonLib).Signal
local t = {}
t.__index = t

function t.new()
	-- upvalues: signal (ref), t (ref)
	local t_1 = {
		hoveredKey = nil,
		waitingForHover = nil,
		changed = signal.new()
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:requestHover(p0)
	if self.hoveredKey == p0 then return end
	if self.waitingForHover == p0 then return end
	if self.hoveredKey == nil or self.waitingForHover ~= nil then
		self.hoveredKey = p0
		self.waitingForHover = nil
		self.changed:fire(self.hoveredKey)
		
		return
	end
	self.waitingForHover = p0
end

function t:cancelHover(p1)
	if self.hoveredKey == p1 then
		if self.waitingForHover == nil then
			self.hoveredKey = nil
		else
			self.hoveredKey = self.waitingForHover
			self.waitingForHover = nil
		end
		self.changed:fire(self.hoveredKey)
		
		return
	elseif self.waitingForHover == p1 then
		self.waitingForHover = nil
	end
end

function t:reset()
	local hoveredKey = self.hoveredKey
	self.waitingForHover = nil
	self.hoveredKey = nil
	
	if hoveredKey ~= nil then
		self.changed:fire(self.hoveredKey)
	end
end

t.default = t.new()

return t