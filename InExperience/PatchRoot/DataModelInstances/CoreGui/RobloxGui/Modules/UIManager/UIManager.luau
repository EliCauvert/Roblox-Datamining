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
local var9 = CFrame.new(-0.466666666667, -0.8, -2.133333333333) * CFrame.Angles(-0.314159265359, 0.174532925199, 0)

local function _(p0) --[[ line: 52 | named "getZAxisStablizedCFrame" ]]
	local var12, var13, _ = p0:ToOrientation()
	
	return CFrame.new(p0.Position) * CFrame.fromOrientation(var12, var13, 0)
end

local _ = function(value) --[[ line: 57 | named "getCameraOffsetFromHeadRotationWithZAxisStabl" ]]
	-- upvalues: VRService (ref)
	local cFrame = workspace.CurrentCamera.CFrame
	local var14 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(value)
	local var15, var16, _ = var14:ToOrientation()
	
	return cFrame:ToObjectSpace(CFrame.new(var14.Position) * CFrame.fromOrientation(var15, var16, 0))
end

local _ = function(p1) --[[ line: 66 | named "getPanelPart" ]]
	-- upvalues: spatialUIType (ref)
	return if p1.uiType == spatialUIType.SpatialUI or p1.uiType == spatialUIType.SpatialUIRoact then p1.panelObject.Adornee elseif p1.uiType == spatialUIType.SpatialUIPartOnly then p1.panelObject else nil
end

local _ = function(p2) --[[ line: 77 | named "panelExistsInSpace" ]]
	-- upvalues: spatialUIType (ref)
	return p2 ~= nil and (p2.panelObject ~= nil and p2.uiType ~= spatialUIType.ScreenUI)
end

local t = {}
local var11 = nil
t.__index = t

function t:removeRoactPanel(p3) --[[ line: 97 ]]
	self.uiElements[p3] = nil
end

function t:registerRoactPanel(p4, p5) --[[ line: 101 ]]
	self.uiElements[p4] = p5
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurHeadCFrame()
end

function t:createUI(p6) --[[ line: 113 ]]
	-- upvalues: createCompatPanelModule (ref)
	local var17 = createCompatPanelModule(p6)
	
	if var17 == nil then
		return nil
	end
	self.uiElements[p6.panelType] = var17
	self:updatePanelForCurHeadCFrame(p6.panelType)
	
	return { type = var17.uiType, panelObject = var17.panelObject }
end

function t:updateUIGroupForCurHeadCFrame(p7, p8) --[[ line: 126 ]]
	-- upvalues: VRService (ref)
	local var18 = self.uiGroups[p7]
	local cFrame = workspace.CurrentCamera.CFrame
	local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var18.positionProps.uiGroupHeadRotation)
	local var20, var21, _ = uiGroupHeadRotation:ToOrientation()
	local var22 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var20, var21, 0))
	var18.positionProps.uiGroupCameraOffSet = var22
	
	if var18.draggable and var18.dragBar and not (p8 or false) then
		var18.dragBar:setCFrame(workspace.CurrentCamera.CFrame * var22:ToWorldSpace(var18.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p7)
end

function t:updateUIGroupsForCurHeadCFrame() --[[ line: 147 ]]
	for i, v in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function t:updatePanelForCurHeadCFrame(p9) --[[ line: 153 ]]
	-- upvalues: spatialUIType (ref), VRService (ref)
	local var23 = self.uiElements[p9]
	local var24 = var23 ~= nil and (var23.panelObject ~= nil and var23.uiType ~= spatialUIType.ScreenUI)
	
	if var24 and var23.panelPositionProps and var23.panelPositionProps.cameraFixedPanelProp then
		var24 = var23.panelPositionProps
		local cameraFixedPanelProp = var24.cameraFixedPanelProp
		local cFrame = workspace.CurrentCamera.CFrame
		local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[var24.uiGroup].positionProps.uiGroupHeadRotation)
		local var26, var27, _ = uiGroupHeadRotation:ToOrientation()
		local var28 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var26, var27, 0))
		local var29 = if var23.uiType == spatialUIType.SpatialUI or var23.uiType == spatialUIType.SpatialUIRoact then var23.panelObject.Adornee elseif var23.uiType == spatialUIType.SpatialUIPartOnly then var23.panelObject else nil
		
		if var29 == nil then return end
		var29.CFrame = workspace.CurrentCamera.CFrame * var28
		var29.CFrame = var29.CFrame:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
	end
end

function t:updatePanelsInUIGroupForCurHeadCFrame(p10) --[[ line: 175 ]]
	for i, v in pairs(self.uiElements) do
		if v.panelPositionProps and v.panelPositionProps.uiGroup == p10 then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function t:updatePanelsForCurHeadCFrame() --[[ line: 189 ]]
	for i, v in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function t:dragUiGroupStart(p11) --[[ line: 195 ]]
	if self.uiGroups[p11].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p11].dragBar
	dragBar:startDrag(dragBar:getCFrame():ToObjectSpace(workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[p11].positionProps.uiGroupCameraOffSet)))
end

function t:dragUiGroupEnd(p12) --[[ line: 207 ]]
	if self.uiGroups[p12].draggable == false then
		return
	end
	self.uiGroups[p12].dragBar:dragEnd()
end

function t:dragUiGroupStep(p13) --[[ line: 215 ]]
	-- upvalues: VRService (ref)
	if self.uiGroups[p13].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p13].dragBar
	local var30 = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local cFrame = dragBar:getCFrame()
	local var32, var33, _ = (CFrame.lookAt(cFrame.Position, Vector3.new(var30.Position.X, var30.Position.Y - 0.666666666667, var30.Position.Z)) * CFrame.Angles(0, 3.14159265359, 0)):ToEulerAnglesXYZ()
	local _, _, var34 = cFrame:ToEulerAnglesXYZ()
	local var35 = CFrame.new(cFrame.Position) * CFrame.Angles(var32, var33, var34)
	local var36, var37, _ = var35:ToOrientation()
	dragBar:setCFrame(CFrame.new(var35.Position) * CFrame.fromOrientation(var36, var37, 0))
	self.uiGroups[p13].positionProps.uiGroupHeadRotation = var30:ToObjectSpace(dragBar:getCFrame():ToWorldSpace(dragBar.uiGroupOffSet))
	self:updateUIGroupForCurHeadCFrame(p13, true)
end

function t:setUpUiGroups() --[[ line: 247 ]]
	-- upvalues: createUIGroupDragBarModule (ref), constantsModule (ref), var9 (ref), VRService (ref), vector2 (ref), panelType (ref)
	local var38 = createUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _) --[[ line: 251 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStep(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _) --[[ line: 254 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStart(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_) --[[ line: 257 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupEnd(constantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local t = { draggable = true, headScale = 1 }
	local t_1 = { uiGroupHeadRotation = var9 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var41 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var9)
	local var42, var43, _ = var41:ToOrientation()
	t_1.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var41.Position) * CFrame.fromOrientation(var42, var43, 0))
	t_1.defaultGroupHeadRotation = var9
	t.positionProps = t_1
	t.uiContainerSize = vector2
	t.dragBar = var38
	t.dragBarOffset = CFrame.new(0, constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[panelType.BottomBar].Y - 0.075 - 0.066666666667, 0)
	self.uiGroups[constantsModule.SpatialUIGroupType.MainUIGroup] = t
end

function t:step() --[[ line: 282 ]]
	-- upvalues: VRService (ref), spatialUIType (ref), panelType (ref), fIntUIResetDelayInSec (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiElements) do
		if (v ~= nil and (v.panelObject ~= nil and v.uiType ~= spatialUIType.ScreenUI)) and i == panelType.RobloxGui then
			local var44, var45, _ = (if v.uiType == spatialUIType.SpatialUI then v.panelObject.Adornee else v.panelObject).CFrame:ToOrientation()
			local var46, var47, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if math.abs(var45 - var47) <= 1.745329251994 and math.abs(var44 - var46) <= 1.745329251994 then
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

function t:onShowTopBarChanged() --[[ line: 321 ]]
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

function t:updateUIGroupsForCurCamera() --[[ line: 362 ]]
	-- upvalues: VRService (ref), spatialUIType (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			v.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v.positionProps.uiGroupCameraOffSet:ToWorldSpace(v.dragBarOffset))
		end
	end
	local var48
	for i, v_1 in pairs(self.uiElements) do
		var48 = v_1 ~= nil and (v_1.panelObject ~= nil and v_1.uiType ~= spatialUIType.ScreenUI)
		
		if var48 and v_1.panelPositionProps and v_1.panelPositionProps.cameraFixedPanelProp then
			var48 = v_1.panelPositionProps
			local cameraFixedPanelProp = var48.cameraFixedPanelProp
			local var49 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
			
			if var49 ~= nil then
				var49.CFrame = workspace.CurrentCamera.CFrame * self.uiGroups[var48.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
				continue
			end
			return
		end
	end
end

function t:onMouseTargetChanged(p14) --[[ line: 398 ]]
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			if v.dragBar and v.dragBar.part == p14 then
				v.dragBar:startHover()
			elseif v.dragBar and v.dragBar.part ~= p14 then
				v.dragBar:hoverEnd()
			end
		end
	end
end

function t:rescaleUIForCurrentHeadScale() --[[ line: 410 ]]
	-- upvalues: utilsModule (ref), spatialUIType (ref)
	local headScale = workspace.CurrentCamera.HeadScale
	
	for i, v in pairs(self.uiGroups) do
		local var52 = headScale / v.headScale
		v.positionProps.uiGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupHeadRotation, var52)
		v.positionProps.uiGroupCameraOffSet = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupCameraOffSet, var52)
		v.positionProps.defaultGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.defaultGroupHeadRotation, var52)
		
		if v.draggable then
			v.dragBarOffset = utilsModule.rescaleCFramePosition(v.dragBarOffset, var52)
			v.dragBar:rescale(var52)
		end
		v.headScale = headScale
	end
	for i, v_1 in pairs(self.uiElements) do
		local var50 = headScale / v_1.headScale
		
		if v_1.uiType ~= spatialUIType.SpatialUIRoact then
			local var51 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
			
			if var51 ~= nil then
				var51.Size *= var50
			end
		end
		local panelPositionProps = v_1.panelPositionProps
		
		if panelPositionProps and panelPositionProps.cameraFixedPanelProp then
			panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = utilsModule.rescaleCFramePosition(panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, var50)
		end
		v_1.headScale = headScale
	end
end

function t.new() --[[ line: 450 ]]
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
	runService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ line: 465 ]]
		-- upvalues: t_1 (ref)
		t_1:step()
	end)
	VRHub.ShowTopBarChanged.Event:connect(function() --[[ line: 469 ]]
		-- upvalues: t_1 (ref)
		t_1:onShowTopBarChanged()
	end)
	local currentCamera = workspace.CurrentCamera
	currentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ line: 474 ]]
		-- upvalues: t_1 (ref)
		t_1:updateUIGroupsForCurCamera()
	end)
	currentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ line: 478 ]]
		-- upvalues: t_1 (ref)
		t_1:rescaleUIForCurrentHeadScale()
		t_1:updateUIGroupsForCurHeadCFrame()
	end)
	local mouse = playersService.LocalPlayer:GetMouse()
	
	if mouse then
		mouse.Move:Connect(function() --[[ line: 486 ]]
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

function t.getInstance() --[[ line: 499 ]]
	-- upvalues: var11 (write), t (ref)
	if var11 == nil then
		var11 = t.new()
	end
	return var11
end

return t