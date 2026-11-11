local UtilsModule = require(script.Parent.Utils)
local DragBarModule = {}
DragBarModule.__index = DragBarModule

function DragBarModule:getCFrame()
	return self.part.CFrame
end

function DragBarModule:setCFrame(p1)
	self.part.CFrame = p1
end

function DragBarModule:updateTransparency()
	if self.dragBarState == "Hovering" then
		self.dragBarImage.ImageTransparency = 0.2
		
		return
	end
	if self.dragBarState == "Dragging" then
		self.dragBarImage.ImageTransparency = 0
		
		return
	else
		self.dragBarImage.ImageTransparency = 0.6
	end
end

function DragBarModule:updateState()
	if self.dragging then
		self.dragBarState = "Dragging"
	elseif self.hovering and not self.dragging then
		self.dragBarState = "Hovering"
	else
		self.dragBarState = "Idle"
	end
	self:updateTransparency()
end

function DragBarModule:startDrag(UiGroupOffSet)
	self.dragging = true
	self.uiGroupOffSet = UiGroupOffSet
	self:updateState()
end

function DragBarModule:dragEnd()
	self.dragging = false
	self:updateState()
end

function DragBarModule:startHover()
	self.hovering = true
	self:updateState()
end

function DragBarModule:hoverEnd()
	self.hovering = false
	self:updateState()
end

function DragBarModule:show()
	self.part.Parent = self.partsParent
end

function DragBarModule:hide()
	self.part.Parent = nil
end

function DragBarModule:rescale(p1)
	-- upvalues: UtilsModule (copy)
	self.part.Size *= p1
	
	if self.uiGroupOffSet then
		self.uiGroupOffSet = UtilsModule.rescaleCFramePosition(self.uiGroupOffSet, p1)
	end
end

function DragBarModule.new(Part, DragBarImage)
	-- upvalues: DragBarModule (copy)
	local config = {
		hovering = false,
		dragging = false,
		dragBarState = "Idle",
		uiGroupOffSet = nil,
		part = Part,
		dragBarImage = DragBarImage,
		partsParent = Part.Parent
	}
	setmetatable(config, DragBarModule)
	config.dragBarImage.ImageTransparency = 0.6
	
	return config
end

return DragBarModule