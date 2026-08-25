local utilsModule = require(script:FindFirstAncestor("VrSpatialUi").Utils)
local _ = {
	Hovering = "Hovering",
	Dragging = "Dragging",
	Idle = "Idle"
}
local t = {}
t.__index = t

function t:getCFrame()
	return self.part.CFrame
end

function t:setCFrame(p0)
	self.part.CFrame = p0
end

function t:updateTransparency()
	if self.dragBarState == "Hovering" then
		self.dragBarImage.ImageTransparency = 0.2
		
		return
	elseif self.dragBarState == "Dragging" then
		self.dragBarImage.ImageTransparency = 0
		
		return
	end
	self.dragBarImage.ImageTransparency = 0.6
end

function t:updateState()
	if self.dragging then
		self.dragBarState = "Dragging"
	elseif self.hovering and not self.dragging then
		self.dragBarState = "Hovering"
	else
		self.dragBarState = "Idle"
	end
	self:updateTransparency()
end

function t:startDrag(p1)
	self.everDragged = true
	self.dragging = true
	self.uiGroupOffSet = p1
	self:updateState()
end

function t:isEverDragged()
	return self.everDragged
end

function t:dragEnd()
	self.dragging = false
	self:updateState()
end

function t:startHover()
	self.hovering = true
	self:updateState()
end

function t:hoverEnd()
	self.hovering = false
	self:updateState()
end

function t:show()
	self.part.Parent = self.partsParent
end

function t:hide()
	self.part.Parent = nil
end

function t:rescale(p2)
	-- upvalues: utilsModule (ref)
	self.part.Size *= p2
	
	if self.uiGroupOffSet then
		self.uiGroupOffSet = utilsModule.rescaleCFramePosition(self.uiGroupOffSet, p2)
	end
end

function t.new(p3, p4)
	-- upvalues: t (ref)
	local t_1 = {
		hovering = false,
		dragging = false,
		everDragged = false,
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