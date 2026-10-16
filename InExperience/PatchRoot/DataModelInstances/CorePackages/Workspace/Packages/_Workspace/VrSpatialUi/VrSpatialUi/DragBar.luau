local UtilsModule = require(script:FindFirstAncestor("VrSpatialUi").Utils)
local DragBarModule = {}
DragBarModule.__index = DragBarModule

function DragBarModule:getCFrame() --[[ Line: 34 ]]
	return self.part.CFrame
end

function DragBarModule:setCFrame(p1) --[[ Line: 38 ]]
	self.part.CFrame = p1
end

function DragBarModule:updateTransparency() --[[ Line: 42 ]]
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

function DragBarModule:updateState() --[[ Line: 52 ]]
	if self.dragging then
		self.dragBarState = "Dragging"
	elseif self.hovering and not self.dragging then
		self.dragBarState = "Hovering"
	else
		self.dragBarState = "Idle"
	end
	self:updateTransparency()
end

function DragBarModule:startDrag(UiGroupOffSet) --[[ Line: 63 ]]
	self.everDragged = true
	self.dragging = true
	self.uiGroupOffSet = UiGroupOffSet
	self:updateState()
end

function DragBarModule:isEverDragged() --[[ Line: 70 ]]
	return self.everDragged
end

function DragBarModule:dragEnd() --[[ Line: 74 ]]
	self.dragging = false
	self:updateState()
end

function DragBarModule:startHover() --[[ Line: 79 ]]
	self.hovering = true
	self:updateState()
end

function DragBarModule:hoverEnd() --[[ Line: 84 ]]
	self.hovering = false
	self:updateState()
end

function DragBarModule:show() --[[ Line: 89 ]]
	self.part.Parent = self.partsParent
end

function DragBarModule:hide() --[[ Line: 93 ]]
	self.part.Parent = nil
end

function DragBarModule:rescale(p1) --[[ Line: 97 ]]
	-- upvalues: UtilsModule (copy)
	self.part.Size *= p1
	
	if self.uiGroupOffSet then
		self.uiGroupOffSet = UtilsModule.rescaleCFramePosition(self.uiGroupOffSet, p1)
	end
end

function DragBarModule.new(Part, DragBarImage) --[[ Line: 104 ]]
	-- upvalues: DragBarModule (copy)
	local config = {
		hovering = false,
		dragging = false,
		everDragged = false,
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