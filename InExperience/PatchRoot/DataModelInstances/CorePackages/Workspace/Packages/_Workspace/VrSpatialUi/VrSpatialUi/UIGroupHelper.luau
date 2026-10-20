local VrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local Parent = VrSpatialUi.Parent
local _ = require(Parent.AppCommonLib)
local ObservableModule = require(Parent.Observable)
local ConstantsModule = require(VrSpatialUi.Constants)
local CreateUIGroupDragBarModule = require(VrSpatialUi.createUIGroupDragBar)
local _ = require(VrSpatialUi.DragBar)
local UIGroupStateModule = require(VrSpatialUi.UIGroupState)
local PanelManagedAnimatableModule = require(VrSpatialUi.PanelManagedAnimatable)
local FFlagEnableSpatialUIBottomBarFixPlaceFilterModule = require(VrSpatialUi.Flags.FFlagEnableSpatialUIBottomBarFixPlaceFilter)
local FFlagSpatialUIHiddenPanelRaycastFixModule = require(VrSpatialUi.Flags.FFlagSpatialUIHiddenPanelRaycastFix)
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP
local SpatialUIEnableCameraCacheFix = game:DefineFastFlag("SpatialUIEnableCameraCacheFix", false)
local Radians = math.rad((game:DefineFastInt("SpatialUIRepositionDeviationAngle", 10)))

function getUIGroupTypeForPanel(p1, p2)
	local v1 = if p2 then p1[p2] else nil
	
	if v1 == nil then
		return nil
	else
		local PanelPositionProps = v1.panelPositionProps
		
		return if PanelPositionProps then PanelPositionProps.uiGroup else nil
	end
end

function getDragBarSafely(p1)
	return if p1 and p1.dragBar and p1.draggable then p1.dragBar else nil
end

function isTempPanel(ToolTipsContainer): boolean
	-- upvalues: ConstantsModule (copy)
	return ToolTipsContainer == ConstantsModule.PanelType.ToolTipsContainer
end

function visitAllPanels(List, Callback: (any, any) -> ())
	for i, value in pairs(List) do
		Callback(i, value)
	end
end

function visitDraggablePanels(p1, UiGroup, Callback)
	visitAllPanels(p1, function(p2, p3)
		-- upvalues: UiGroup (copy), Callback (copy)
		local PanelPositionProps = p3.panelPositionProps
		
		if PanelPositionProps and not isTempPanel(p2) and PanelPositionProps.cameraFixedPanelProp and PanelPositionProps.uiGroup == UiGroup then
			Callback(p2, PanelPositionProps.cameraFixedPanelProp)
		end
	end)
end

function connect(Value, p1)
	return { value = Value, connection = Value:connect(p1) }
end

function disconnect(p1)
	if p1.connection then
		p1.connection:disconnect()
		p1.connection = nil
	end
end

function setPanelParent(p1, Parent)
	-- upvalues: ConstantsModule (copy)
	local HasParent = Parent ~= nil
	
	if p1.uiType == ConstantsModule.SpatialUIType.SpatialUI or p1.uiType == ConstantsModule.SpatialUIType.SpatialUIRoact then
		local PanelObject = p1.panelObject
		PanelObject.Enabled = HasParent
		local Adornee = PanelObject.Adornee
		Adornee.CanCollide = false
		Adornee.CanTouch = false
		Adornee.Anchored = true
		Adornee.Parent = Parent
		
		return
	elseif p1.uiType == ConstantsModule.SpatialUIType.SpatialUIPartOnly then
		p1.panelObject.Parent = Parent
	end
end

function setPanelEnabledWithoutReparent(p1, Enabled)
	-- upvalues: ConstantsModule (copy)
	if p1.uiType == ConstantsModule.SpatialUIType.SpatialUI or p1.uiType == ConstantsModule.SpatialUIType.SpatialUIRoact then
		local PanelObject = p1.panelObject
		PanelObject.Enabled = Enabled
		local Adornee = PanelObject.Adornee
		Adornee.CanCollide = false
		Adornee.CanTouch = false
		Adornee.Anchored = true
	end
end

function setPanelVisibleState(p1, BottomBar, p2)
	-- upvalues: FFlagEnableSpatialUIBottomBarFixPlaceFilterModule (copy), ConstantsModule (copy)
	if FFlagEnableSpatialUIBottomBarFixPlaceFilterModule and BottomBar == ConstantsModule.PanelType.BottomBar then
		setPanelEnabledWithoutReparent(p1, p2)
		
		return
	else
		setPanelParent(p1, if p2 then workspace else nil)
	end
end

local UIGroupHelper = {}
UIGroupHelper.__index = UIGroupHelper

function UIGroupHelper:setTopBarVisible(p1, p2)
	self.topBarVisibleValue = connect(p1, p2)
end

function UIGroupHelper:isTopBarVisible()
	return self.topBarVisibleValue.value:get()
end

function UIGroupHelper:prepareGuiToggleAnimationState(_)
	-- upvalues: UIGroupStateModule (copy)
	self:setUIGroupState(UIGroupStateModule.GuiToggleAnimation)
end

function UIGroupHelper:setUIGroupState(UiGroupState)
	self.uiGroupState = UiGroupState
end

function UIGroupHelper:animateBottomBarOnHeadMoveIfNeeded(_, Vector, Vector1)
	-- upvalues: UIGroupStateModule (copy), Radians (copy)
	if self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation or self.currentBottomBarAnimatable == nil then return end
	local Magnitude = math.abs(Vector.Y - Vector1.Y)
	
	if Radians < math.abs(Vector.X - Vector1.X) or Magnitude > Radians then
		self.currentBottomBarAnimatable:animateHideIfNeeded(false)
		
		return
	else
		self.currentBottomBarAnimatable:animateShowIfNeeded()
	end
end

function UIGroupHelper.isGroupVisibleForPanel(p1, BottomBar, p2)
	local UIGroupTypeForPanel = getUIGroupTypeForPanel(p2, BottomBar)
	local UiGroupVisibility = if UIGroupTypeForPanel then p1.uiGroupVisibilityMap[UIGroupTypeForPanel] else nil
	
	return not UiGroupVisibility or UiGroupVisibility.value:get()
end

function UIGroupHelper:applyGroupPanelsEnabled(UIGroupTypeForPanel, p1, p2)
	local UiGroupVisibility = self.uiGroupVisibilityMap[UIGroupTypeForPanel]
	local NoUiGroupVisibility = not UiGroupVisibility or UiGroupVisibility.value:get()
	local NoUiGroupVisibility1 = self:isTopBarVisible() and NoUiGroupVisibility
	
	if not p2 or not NoUiGroupVisibility1 then
		visitAllPanels(p1, function(p3, p4)
			-- upvalues: p1 (copy), UIGroupTypeForPanel (copy), NoUiGroupVisibility1 (copy)
			if not isTempPanel(p3) and getUIGroupTypeForPanel(p1, p3) == UIGroupTypeForPanel then
				setPanelVisibleState(p4, p3, NoUiGroupVisibility1)
			end
		end)
		
		return
	end
end

function UIGroupHelper:updateAllElements(p1, p2)
	-- upvalues: UIGroupStateModule (copy), ConstantsModule (copy), FFlagSpatialUIHiddenPanelRaycastFixModule (copy), FFlagEnableSpatialUIBottomBarFixPlaceFilterModule (copy), PanelManagedAnimatableModule (copy)
	local IsTopBarVisible = self:isTopBarVisible()
	
	if IsTopBarVisible then
		self:setUIGroupState(UIGroupStateModule.Default)
		
		if self.currentBottomBarAnimatable then
			self.currentBottomBarAnimatable:reset()
			self.currentBottomBarAnimatable = nil
		end
	end
	self:updateAllDragBar(p1, p2)
	visitAllPanels(p1, function(BottomBar, p3)
		-- upvalues: ConstantsModule (upval), IsTopBarVisible (copy), FFlagSpatialUIHiddenPanelRaycastFixModule (upval), self (copy), p1 (copy), FFlagEnableSpatialUIBottomBarFixPlaceFilterModule (upval), UIGroupStateModule (upval), PanelManagedAnimatableModule (upval)
		local IsBottomBarMatch = BottomBar == ConstantsModule.PanelType.BottomBar
		
		if not IsTopBarVisible then
			if IsBottomBarMatch and (self.uiGroupState == UIGroupStateModule.GuiToggleAnimation or p3.keepVisibleWhenTopBarHidden) then
				if not self.currentBottomBarAnimatable then
					self.currentBottomBarAnimatable = PanelManagedAnimatableModule.create(p3.panelObject, self.bottomBarVisibility, p3.keepVisibleWhenTopBarHidden and self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation)
					
					if self.currentBottomBarAnimatable then
						self.currentBottomBarAnimatable:hideAndBlockAnimationUntilLookBackAgain()
					end
				end
				if p3.keepVisibleWhenTopBarHidden then
					if FFlagEnableSpatialUIBottomBarFixPlaceFilterModule then
						setPanelEnabledWithoutReparent(p3, true)
						
						return
					else
						setPanelParent(p3, workspace)
						
						return
					end
				end
			elseif FFlagEnableSpatialUIBottomBarFixPlaceFilterModule and IsBottomBarMatch then
				setPanelEnabledWithoutReparent(p3, false)
				
				return
			else
				setPanelParent(p3, nil)
			end
			return
		elseif FFlagSpatialUIHiddenPanelRaycastFixModule and not self:isGroupVisibleForPanel(BottomBar, p1) then
			setPanelVisibleState(p3, BottomBar, false)
			
			return
		else
			if FFlagEnableSpatialUIBottomBarFixPlaceFilterModule and IsBottomBarMatch then
				setPanelEnabledWithoutReparent(p3, true)
				
				return
			else
				setPanelParent(p3, workspace)
			end
		end
	end)
end

function UIGroupHelper:connectPanelVisibility(p1, p2, p3, p4)
	-- upvalues: FFlagSpatialUIHiddenPanelRaycastFixModule (copy)
	if isTempPanel(p1) then return end
	self:disconnectPanelVisibility(p1, p3, p4)
	local UIGroupTypeForPanel = getUIGroupTypeForPanel(p3, p1)
	
	if not UIGroupTypeForPanel then return end
	self.uiGroupVisibilityMap[UIGroupTypeForPanel] = connect(p2, function()
		-- upvalues: self (copy), p1 (copy), p3 (copy), p4 (copy), FFlagSpatialUIHiddenPanelRaycastFixModule (upval), UIGroupTypeForPanel (copy)
		self:updateDragBar(p1, p3, p4)
		
		if FFlagSpatialUIHiddenPanelRaycastFixModule then
			self:applyGroupPanelsEnabled(UIGroupTypeForPanel, p3)
		end
	end)
	self:updateDragBar(p1, p3, p4)
	
	if FFlagSpatialUIHiddenPanelRaycastFixModule then
		self:applyGroupPanelsEnabled(UIGroupTypeForPanel, p3, true)
	end
end

function UIGroupHelper:disconnectPanelVisibility(p1, p2, p3)
	if isTempPanel(p1) then return end
	local UIGroupTypeForPanel = getUIGroupTypeForPanel(p2, p1)
	local UiGroupVisibility = if UIGroupTypeForPanel then self.uiGroupVisibilityMap[UIGroupTypeForPanel] else nil
	
	if UiGroupVisibility then
		disconnect(UiGroupVisibility)
		self.uiGroupVisibilityMap[UIGroupTypeForPanel] = nil
		self:updateDragBar(p1, p2, p3)
	end
end

function UIGroupHelper:updateDragBar(p1, p2, p3)
	local UIGroupTypeForPanel = getUIGroupTypeForPanel(p2, p1)
	local v1 = if UIGroupTypeForPanel then p3[UIGroupTypeForPanel] else nil
	
	if not v1 or not v1.dragBar or not v1.draggable or isTempPanel(p1) then return end
	local IsTopBarVisible = self:isTopBarVisible()
	local UiGroupVisibility = self.uiGroupVisibilityMap[UIGroupTypeForPanel]
	
	if if UiGroupVisibility then IsTopBarVisible and UiGroupVisibility.value:get() else false then
		v1.dragBar:show()
		
		return
	else
		v1.dragBar:hide()
	end
end

function UIGroupHelper:updateAllDragBar(List, p1)
	for i, _ in pairs(List) do
		self:updateDragBar(i, List, p1)
	end
end

function UIGroupHelper:createUIGroup(p2, Name, UiContainerSize, PositionProps, p3, p4)
	-- upvalues: ConstantsModule (copy), CreateUIGroupDragBarModule (copy), InExperienceUIVRIXP (copy)
	local UIGROUPINITITIALROTATION = ConstantsModule.UIGROUP_INITITIAL_ROTATION_MAP[Name]
	local UiGroup = self.uiGroups[Name]
	local DragBarSafely = getDragBarSafely(UiGroup)
	
	if p4 and UIGROUPINITITIALROTATION and DragBarSafely and DragBarSafely:isEverDragged() then
		visitDraggablePanels(p3, Name, function(_, p5)
			-- upvalues: UiGroup (copy), UIGROUPINITITIALROTATION (copy)
			UiGroup.dragBarOffset *= UIGROUPINITITIALROTATION
			p5.uiGroupElementOffset *= UIGROUPINITITIALROTATION
		end)
	end
	local v1 = nil
	local DragBar = nil
	DragBar = CreateUIGroupDragBarModule({
		name = Name,
		dragFunction = function(_, _, _, _, _)
			-- upvalues: p2 (copy), Name (copy)
			p2:dragUiGroupStep(Name)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _)
			-- upvalues: UIGROUPINITITIALROTATION (copy), v1 (ref), DragBar (ref), p3 (copy), Name (copy), p2 (copy)
			if UIGROUPINITITIALROTATION and v1 and DragBar and not DragBar:isEverDragged() then
				DragBar:setCFrame(DragBar:getCFrame() * UIGROUPINITITIALROTATION:Inverse())
				v1.dragBarOffset *= UIGROUPINITITIALROTATION:Inverse()
				visitDraggablePanels(p3, Name, function(_, p5)
					-- upvalues: UIGROUPINITITIALROTATION (upval)
					p5.uiGroupElementOffset *= UIGROUPINITITIALROTATION:Inverse()
				end)
			end
			p2:dragUiGroupStart(Name)
		end,
		dragEndFunction = function(_)
			-- upvalues: p2 (copy), Name (copy)
			p2:dragUiGroupEnd(Name)
		end,
		dragBarPartSize = ConstantsModule.DRAG_BAR_SIZE
	})
	DragBar:hide()
	v1 = {
		headScale = 1,
		positionProps = PositionProps,
		uiContainerSize = UiContainerSize,
		draggable = InExperienceUIVRIXP:isDraggingAllowed(),
		dragBar = DragBar,
		dragBarOffset = ConstantsModule.UIGROUP_DRAGBAR_OFFSET_MAP[Name]
	}
	self.uiGroups[Name] = v1
	
	return v1
end

function UIGroupHelper:checkAndGetUIGroupTypeForTempPanel(p2, p3)
	return if isTempPanel(p2) then getUIGroupTypeForPanel(p3, p2) else nil
end

function UIGroupHelper:getGroupCameraCFrameIfPossible(p2, p3)
	-- upvalues: SpatialUIEnableCameraCacheFix (copy)
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	
	if SpatialUIEnableCameraCacheFix and isTempPanel(p2) then
		local UIGroupTypeForPanel = getUIGroupTypeForPanel(p3, p2)
		
		if UIGroupTypeForPanel ~= nil and self.uiGroups[UIGroupTypeForPanel].lastCameraCFrame then
			CurrentCameraCFrame = self.uiGroups[UIGroupTypeForPanel].lastCameraCFrame
		end
	end
	return CurrentCameraCFrame
end

function UIGroupHelper:getBottomBarVisibility()
	return self.bottomBarVisibility
end

function UIGroupHelper.new(p2)
	-- upvalues: ObservableModule (copy), UIGroupStateModule (copy), UIGroupHelper (copy)
	local config = {
		currentBottomBarAnimatable = nil,
		uiGroupVisibilityMap = {},
		topBarVisibleValue = { value = ObservableModule.ObservableValue.new(p2) },
		uiGroups = {},
		uiGroupState = UIGroupStateModule.Default,
		bottomBarVisibility = ObservableModule.ObservableValue.new(true)
	}
	setmetatable(config, UIGroupHelper)
	
	return config
end

return UIGroupHelper