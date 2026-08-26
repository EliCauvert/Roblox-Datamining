local VRService = game:GetService("VRService")
local runService = game:GetService("RunService")
local VRHub = require(game:GetService("CorePackages").Workspace.Packages.VrCommon).VRHub
local parent = script.Parent
local constantsModule = require(parent.Constants)
local utilsModule = require(parent.Utils)
local panelType = constantsModule.PanelType
local spatialUIType = constantsModule.SpatialUIType
local createCompatPanelModule = require(script.Parent.createCompatPanel)
local createUIGroupDragBarModule = require(script.Parent.createUIGroupDragBar)
local _ = require(parent.DragBar)
local playersService = game:GetService("Players")
local fIntUIResetDelayInSec = game:DefineFastInt("FIntUIResetDelayInSec", 3)
local vector2 = Vector2.new(2.666666666667, 1.866666666667)
local var1 = CFrame.new(-0.466666666667, -0.8, -2.133333333333) * CFrame.Angles(-0.314159265359, 0.174532925199, 0)

local function _(p1)
	local var2, var3, _ = p1:ToOrientation()
	
	return CFrame.new(p1.Position) * CFrame.fromOrientation(var2, var3, 0)
end

local _ = function(value)
	-- upvalues: VRService (ref)
	local cFrame = workspace.CurrentCamera.CFrame
	local var2 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(value)
	local var3, var4, _ = var2:ToOrientation()
	
	return cFrame:ToObjectSpace(CFrame.new(var2.Position) * CFrame.fromOrientation(var3, var4, 0))
end

local _ = function(p1)
	-- upvalues: spatialUIType (ref)
	return if p1.uiType == spatialUIType.SpatialUI or p1.uiType == spatialUIType.SpatialUIRoact then p1.panelObject.Adornee elseif p1.uiType == spatialUIType.SpatialUIPartOnly then p1.panelObject else nil
end

local _ = function(p1)
	-- upvalues: spatialUIType (ref)
	return p1 ~= nil and (p1.panelObject ~= nil and p1.uiType ~= spatialUIType.ScreenUI)
end

local t = {}
local var2 = nil
t.__index = t

function t:removeRoactPanel(p1)
	self.uiElements[p1] = nil
end

function t:registerRoactPanel(p1, p2)
	self.uiElements[p1] = p2
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurHeadCFrame()
end

function t:createUI(p1)
	-- upvalues: createCompatPanelModule (ref)
	local var3 = createCompatPanelModule(p1)
	
	if var3 == nil then
		return nil
	end
	self.uiElements[p1.panelType] = var3
	self:updatePanelForCurHeadCFrame(p1.panelType)
	
	return { type = var3.uiType, panelObject = var3.panelObject }
end

function t:updateUIGroupForCurHeadCFrame(p1, p2)
	-- upvalues: VRService (ref)
	local var3 = self.uiGroups[p1]
	local cFrame = workspace.CurrentCamera.CFrame
	local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var3.positionProps.uiGroupHeadRotation)
	local var4, var5, _ = uiGroupHeadRotation:ToOrientation()
	local var6 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var4, var5, 0))
	var3.positionProps.uiGroupCameraOffSet = var6
	
	if var3.draggable and var3.dragBar and not (p2 or false) then
		var3.dragBar:setCFrame(workspace.CurrentCamera.CFrame * var6:ToWorldSpace(var3.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p1)
end

function t:updateUIGroupsForCurHeadCFrame()
	for i, v in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function t:updatePanelForCurHeadCFrame(p1)
	-- upvalues: spatialUIType (ref), VRService (ref)
	local var3 = self.uiElements[p1]
	local var4 = var3 ~= nil and (var3.panelObject ~= nil and var3.uiType ~= spatialUIType.ScreenUI)
	
	if var4 and var3.panelPositionProps and var3.panelPositionProps.cameraFixedPanelProp then
		var4 = var3.panelPositionProps
		local cameraFixedPanelProp = var4.cameraFixedPanelProp
		local cFrame = workspace.CurrentCamera.CFrame
		local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[var4.uiGroup].positionProps.uiGroupHeadRotation)
		local var5, var6, _ = uiGroupHeadRotation:ToOrientation()
		local var7 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var5, var6, 0))
		local var8 = if var3.uiType == spatialUIType.SpatialUI or var3.uiType == spatialUIType.SpatialUIRoact then var3.panelObject.Adornee elseif var3.uiType == spatialUIType.SpatialUIPartOnly then var3.panelObject else nil
		
		if var8 == nil then return end
		var8.CFrame = workspace.CurrentCamera.CFrame * var7
		var8.CFrame = var8.CFrame:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
	end
end

function t:updatePanelsInUIGroupForCurHeadCFrame(p1)
	for i, v in pairs(self.uiElements) do
		if v.panelPositionProps and v.panelPositionProps.uiGroup == p1 then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function t:updatePanelsForCurHeadCFrame()
	for i, v in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function t:dragUiGroupStart(p2)
	if self.uiGroups[p2].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p2].dragBar
	dragBar:startDrag(dragBar:getCFrame():ToObjectSpace(workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[p2].positionProps.uiGroupCameraOffSet)))
end

function t:dragUiGroupEnd(p2)
	if self.uiGroups[p2].draggable == false then
		return
	end
	self.uiGroups[p2].dragBar:dragEnd()
end

function t:dragUiGroupStep(p2)
	-- upvalues: VRService (ref)
	if self.uiGroups[p2].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p2].dragBar
	local var3 = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local cFrame = dragBar:getCFrame()
	local var4, var5, _ = (CFrame.lookAt(cFrame.Position, Vector3.new(var3.Position.X, var3.Position.Y - 0.666666666667, var3.Position.Z)) * CFrame.Angles(0, 3.14159265359, 0)):ToEulerAnglesXYZ()
	local _, _, var6 = cFrame:ToEulerAnglesXYZ()
	local var7 = CFrame.new(cFrame.Position) * CFrame.Angles(var4, var5, var6)
	local var8, var9, _ = var7:ToOrientation()
	dragBar:setCFrame(CFrame.new(var7.Position) * CFrame.fromOrientation(var8, var9, 0))
	self.uiGroups[p2].positionProps.uiGroupHeadRotation = var3:ToObjectSpace(dragBar:getCFrame():ToWorldSpace(dragBar.uiGroupOffSet))
	self:updateUIGroupForCurHeadCFrame(p2, true)
end

function t:setUpUiGroups()
	-- upvalues: createUIGroupDragBarModule (ref), constantsModule (ref), var1 (ref), VRService (ref), vector2 (ref), panelType (ref)
	local var3 = createUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStep(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStart(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupEnd(constantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local t = { draggable = true, headScale = 1 }
	local t_1 = { uiGroupHeadRotation = var1 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var4 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var1)
	local var5, var6, _ = var4:ToOrientation()
	t_1.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var4.Position) * CFrame.fromOrientation(var5, var6, 0))
	t_1.defaultGroupHeadRotation = var1
	t.positionProps = t_1
	t.uiContainerSize = vector2
	t.dragBar = var3
	t.dragBarOffset = CFrame.new(0, constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[panelType.BottomBar].Y - 0.075 - 0.066666666667, 0)
	self.uiGroups[constantsModule.SpatialUIGroupType.MainUIGroup] = t
end

function t:step()
	-- upvalues: VRService (ref), spatialUIType (ref), panelType (ref), fIntUIResetDelayInSec (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiElements) do
		if (v ~= nil and (v.panelObject ~= nil and v.uiType ~= spatialUIType.ScreenUI)) and i == panelType.RobloxGui then
			local var3, var4, _ = (if v.uiType == spatialUIType.SpatialUI then v.panelObject.Adornee else v.panelObject).CFrame:ToOrientation()
			local var5, var6, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if math.abs(var4 - var6) <= 1.745329251994 and math.abs(var3 - var5) <= 1.745329251994 then
				self.uiGroupsOutOfViewTimeStamp = nil
			elseif not self.uiGroupsOutOfViewTimeStamp then
				self.uiGroupsOutOfViewTimeStamp = os.clock()
			elseif fIntUIResetDelayInSec <= os.clock() - self.uiGroupsOutOfViewTimeStamp then
				self:updateUIGroupsForCurHeadCFrame()
				self.uiGroupsOutOfViewTimeStamp = nil
			end
		end
	end
end

function t:onShowTopBarChanged()
	-- upvalues: VRService (ref), VRHub (ref), spatialUIType (ref)
	if not VRService.VREnabled then return end
	if VRHub.ShowTopBar then
		for i, v in pairs(self.uiGroups) do
			if v.draggable and v.dragBar then
				v.dragBar:show()
			end
		end
		for i, v_1 in pairs(self.uiElements) do
			if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then
				local panelObject = v_1.panelObject
				panelObject.Enabled = true
				panelObject.Adornee.Parent = workspace
			elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then
				v_1.panelObject.Parent = workspace
			end
		end
		return
	else
		for i, v_1 in pairs(self.uiGroups) do
			if v_1.draggable and v_1.dragBar then
				v_1.dragBar:hide()
			end
		end
		for i, v_1 in pairs(self.uiElements) do
			if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then
				local panelObject = v_1.panelObject
				panelObject.Enabled = false
				panelObject.Adornee.Parent = nil
			elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then
				v_1.panelObject.Parent = nil
			end
		end
	end
end

function t:updateUIGroupsForCurCamera()
	-- upvalues: VRService (ref), spatialUIType (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			v.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v.positionProps.uiGroupCameraOffSet:ToWorldSpace(v.dragBarOffset))
		end
	end
	local var7
	for i, v_1 in pairs(self.uiElements) do
		var7 = v_1 ~= nil and (v_1.panelObject ~= nil and v_1.uiType ~= spatialUIType.ScreenUI)
		
		if var7 and v_1.panelPositionProps and v_1.panelPositionProps.cameraFixedPanelProp then
			var7 = v_1.panelPositionProps
			local cameraFixedPanelProp = var7.cameraFixedPanelProp
			local var8 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
			
			if var8 ~= nil then
				var8.CFrame = workspace.CurrentCamera.CFrame * self.uiGroups[var7.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
				continue
			end
			return
		end
	end
end

function t:onMouseTargetChanged(p2)
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			if v.dragBar and v.dragBar.part == p2 then
				v.dragBar:startHover()
			elseif v.dragBar and v.dragBar.part ~= p2 then
				v.dragBar:hoverEnd()
			end
		end
	end
end

function t:rescaleUIForCurrentHeadScale()
	-- upvalues: utilsModule (ref), spatialUIType (ref)
	local headScale = workspace.CurrentCamera.HeadScale
	
	for i, v in pairs(self.uiGroups) do
		local var9 = headScale / v.headScale
		v.positionProps.uiGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupHeadRotation, var9)
		v.positionProps.uiGroupCameraOffSet = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupCameraOffSet, var9)
		v.positionProps.defaultGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.defaultGroupHeadRotation, var9)
		
		if v.draggable then
			v.dragBarOffset = utilsModule.rescaleCFramePosition(v.dragBarOffset, var9)
			v.dragBar:rescale(var9)
		end
		v.headScale = headScale
	end
	for i, v_1 in pairs(self.uiElements) do
		local var10 = headScale / v_1.headScale
		
		if v_1.uiType ~= spatialUIType.SpatialUIRoact then
			local var11 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
			
			if var11 ~= nil then
				var11.Size *= var10
			end
		end
		local panelPositionProps = v_1.panelPositionProps
		
		if panelPositionProps and panelPositionProps.cameraFixedPanelProp then
			panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = utilsModule.rescaleCFramePosition(panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, var10)
		end
		v_1.headScale = headScale
	end
end

function t.new()
	-- upvalues: t (ref), runService (ref), VRHub (ref), playersService (ref)
	local t_1 = {
		currentMouseTarget = nil,
		uiGroupsOutOfViewTimeStamp = nil,
		uiElements = {},
		uiGroups = {}
	}
	setmetatable(t_1, t)
	t_1:setUpUiGroups()
	t_1:rescaleUIForCurrentHeadScale()
	t_1:updateUIGroupsForCurCamera()
	runService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function()
		-- upvalues: t_1 (ref)
		t_1:step()
	end)
	VRHub.ShowTopBarChanged.Event:connect(function()
		-- upvalues: t_1 (ref)
		t_1:onShowTopBarChanged()
	end)
	local currentCamera = workspace.CurrentCamera
	currentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: t_1 (ref)
		t_1:updateUIGroupsForCurCamera()
	end)
	currentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
		-- upvalues: t_1 (ref)
		t_1:rescaleUIForCurrentHeadScale()
		t_1:updateUIGroupsForCurHeadCFrame()
	end)
	local mouse = playersService.LocalPlayer:GetMouse()
	
	if mouse then
		mouse.Move:Connect(function()
			-- upvalues: playersService (copy), t_1 (ref)
			local mouse = playersService.LocalPlayer:GetMouse()
			
			if mouse.Target ~= t_1.currentMouseTarget then
				t_1:onMouseTargetChanged(mouse.Target)
				t_1.currentMouseTarget = mouse.Target
			end
		end)
	end
	return t_1
end

function t.getInstance()
	-- upvalues: var2 (write), t (ref)
	if var2 == nil then
		var2 = t.new()
	end
	return var2
end

return t