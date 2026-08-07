local utilsModule = require(script.Parent.Utils)
local _ = {
	Hovering = "Hovering",
	Dragging = "Dragging",
	Idle = "Idle"
}
local t = {}
t.__index = t

function t:getCFrame() --[[ line: 33 ]]
	return self.part.CFrame
end

function t:setCFrame(p0) --[[ line: 37 ]]
	self.part.CFrame = p0
end

function t:updateTransparency() --[[ line: 41 ]]
	if self.dragBarState == "Hovering" then
		self.dragBarImage.ImageTransparency = 0.2
		
		return
	elseif self.dragBarState == "Dragging" then
		self.dragBarImage.ImageTransparency = 0
		
		return
	end
	self.dragBarImage.ImageTransparency = 0.6
end

function t:updateState() --[[ line: 51 ]]
	if self.dragging then
		self.dragBarState = "Dragging"
	elseif self.hovering and not self.dragging then
		self.dragBarState = "Hovering"
	else
		self.dragBarState = "Idle"
	end
	self:updateTransparency()
end

function t:startDrag(p1) --[[ line: 62 ]]
	self.dragging = true
	self.uiGroupOffSet = p1
	self:updateState()
end

function t:dragEnd() --[[ line: 68 ]]
	self.dragging = false
	self:updateState()
end

function t:startHover() --[[ line: 73 ]]
	self.hovering = true
	self:updateState()
end

function t:hoverEnd() --[[ line: 78 ]]
	self.hovering = false
	self:updateState()
end

function t:show() --[[ line: 83 ]]
	self.part.Parent = self.partsParent
end

function t:hide() --[[ line: 87 ]]
	self.part.Parent = nil
end

function t:rescale(p2) --[[ line: 91 ]]
	-- upvalues: utilsModule (ref)
	self.part.Size *= p2
	
	if self.uiGroupOffSet then
		self.uiGroupOffSet = utilsModule.rescaleCFramePosition(self.uiGroupOffSet, p2)
	end
end

function t.new(p3, p4) --[[ line: 98 ]]
	-- upvalues: t (ref)
	local t_1 = {
		hovering = false,
		dragging = false,
		dragBarState = "Idle",
		uiGroupOffSet = nil,
		part = p3,
		dragBarImage = p4,
		partsParent = p3.Parent
	}
	setmetatable(t_1, t)
	t_1.dragBarImage.ImageTransparency = 0.6
	
	return t_1
end

return t