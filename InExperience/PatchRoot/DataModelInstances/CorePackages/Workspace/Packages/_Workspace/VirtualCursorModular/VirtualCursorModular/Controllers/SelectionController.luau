local Parent = script.Parent.Parent
local GuiService = game:GetService("GuiService")
local GamepadService = game:GetService("GamepadService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local SharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local FFlagEnableVirtualCursorMoveAssist = SharedFlagsModule.FFlagEnableVirtualCursorMoveAssist
local FIntVirtualCursorMoveAssistLevel = SharedFlagsModule.FIntVirtualCursorMoveAssistLevel
local FIntVirtualCursorMoveAssistHoverSpeed = SharedFlagsModule.FIntVirtualCursorMoveAssistHoverSpeed
local PropertiesModule = require(Parent.Properties)
local UtilModule = require(Parent.Util)
local GetMaxSpeedFunction = UtilModule.GetMaxSpeed
local IsCircleContainedInGuiObjectFunction = UtilModule.IsCircleContainedInGuiObject
local IsSelectableGuiObjectFunction = UtilModule.IsSelectableGuiObject
local IsSinkingGuiObjectFunction = UtilModule.IsSinkingGuiObject
local GetPointRotatedAroundObjectFunction = UtilModule.GetPointRotatedAroundObject
local CosFunction = math.cos
local SinFunction = math.sin
local AbsFunction = math.abs
local MaxFunction = math.max
local MinFunction = math.min
local SignFunction = math.sign
local SelectionController = {}
SelectionController.__index = SelectionController

function SelectionController.new(_inputController, _cursorController, _moveAssistController) --[[ Line: 57 ]]
	-- upvalues: PropertiesModule (copy), SelectionController (copy)
	return (setmetatable({
		_isScrolling = false,
		_selectedObject = nil,
		_inputController = _inputController,
		_cursorController = _cursorController,
		_moveAssistController = _moveAssistController,
		_selectionRadius = PropertiesModule.SelectionRadius,
		_scrolled = {}
	}, SelectionController))
end

function SelectionController:processScrolling(ScrollFrame, Vector, p1): boolean --[[ Line: 75 ]]
	-- upvalues: PropertiesModule (copy), AbsFunction (copy), CosFunction (copy), SinFunction (copy), MaxFunction (copy), MinFunction (copy), SignFunction (copy)
	if not ScrollFrame:IsA("ScrollingFrame") then
		return false
	end
	if not ScrollFrame.ScrollingEnabled then
		return false
	end
	if self._scrolled[ScrollFrame] then
		return false
	end
	self._scrolled[ScrollFrame] = true
	local ScrollVector = self._inputController:GetScrollVector()
	local ScaledScrollingSpeed = PropertiesModule.ScrollingSpeed * p1
	local ScrollingRadius = PropertiesModule.ScrollingRadius
	local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
	local AbsoluteSize: number = ScrollFrame.AbsoluteSize
	local ScrollingDirection = ScrollFrame.ScrollingDirection
	local IsScrollingDirectionMatch: boolean = AbsoluteSize.X < AbsoluteCanvasSize.X and (ScrollingDirection == Enum.ScrollingDirection.XY or ScrollingDirection == Enum.ScrollingDirection.X)
	local IsScrollingDirectionMatch1: boolean = AbsoluteSize.Y < AbsoluteCanvasSize.Y and (ScrollingDirection == Enum.ScrollingDirection.XY or ScrollingDirection == Enum.ScrollingDirection.Y)
	local AbsolutePosition = ScrollFrame.AbsolutePosition
	local ScaledRotation = ScrollFrame.Rotation / 180 * 3.141592653589793
	
	if PropertiesModule.ThumbstickDeadzone < AbsFunction(ScrollVector.x) and IsScrollingDirectionMatch then
		ScrollFrame.CanvasPosition += Vector2.new(ScrollVector.x * ScaledScrollingSpeed, 0)
	end
	if PropertiesModule.ThumbstickDeadzone < AbsFunction(ScrollVector.y) and IsScrollingDirectionMatch1 then
		ScrollFrame.CanvasPosition += Vector2.new(0, ScrollVector.y * ScaledScrollingSpeed)
	end
	local VectorDelta = Vector2.new(Vector.X, Vector.Y) - AbsolutePosition
	local DotProductDelta = VectorDelta:Dot((Vector2.new(CosFunction(ScaledRotation), (SinFunction(ScaledRotation))))) - AbsoluteSize.X / 2
	local DotProductDelta1 = VectorDelta:Dot((Vector2.new(-SinFunction(ScaledRotation), (CosFunction(ScaledRotation))))) - AbsoluteSize.Y / 2
	local VectorDelta1 = Vector2.new(AbsFunction(DotProductDelta), (AbsFunction(DotProductDelta1))) - AbsoluteSize / 2
	
	if AbsFunction(MinFunction(MaxFunction(VectorDelta1.X, VectorDelta1.Y), 0) + Vector2.new(MaxFunction(VectorDelta1.X, 0), (MaxFunction(VectorDelta1.Y, 0))).Magnitude) < ScrollingRadius then
		if AbsFunction(VectorDelta1.X) < AbsFunction(VectorDelta1.Y) and IsScrollingDirectionMatch then
			ScrollFrame.CanvasPosition += Vector2.new(SignFunction(DotProductDelta) * ScaledScrollingSpeed, 0)
			self._cursorController:SetArrow(SignFunction(DotProductDelta), 0)
			
			return true
		elseif AbsFunction(VectorDelta1.Y) <= AbsFunction(VectorDelta1.X) and IsScrollingDirectionMatch1 then
			ScrollFrame.CanvasPosition += Vector2.new(0, SignFunction(DotProductDelta1) * ScaledScrollingSpeed)
			self._cursorController:SetArrow(0, (SignFunction(DotProductDelta1)))
			
			return true
		end
	end
	return false
end

function SelectionController:getClosestCandidate(Frames, p1, _, p2, p3) --[[ Line: 140 ]]
	-- upvalues: IsSelectableGuiObjectFunction (copy), GetPointRotatedAroundObjectFunction (copy), IsSinkingGuiObjectFunction (copy), IsCircleContainedInGuiObjectFunction (copy), PropertiesModule (copy)
	local ClosestCandidate = nil
	local OccludingCandidate = nil
	local ClosestDistance = 1e999
	
	if p3 then
		ClosestCandidate = p3.closestCandidate
		OccludingCandidate = p3.occludingCandidate
		ClosestDistance = p3.closestDistance
	end
	for _, frame in ipairs(Frames) do
		if self:processScrolling(frame, p1, p2) then
			self._isScrolling = true
			
			return ClosestCandidate, OccludingCandidate, ClosestDistance
		end
		if IsSelectableGuiObjectFunction(frame) then
			local AbsolutePosition = frame.AbsolutePosition
			local NewAbsolutePosition = frame.AbsolutePosition + frame.AbsoluteSize
			local SquareRoot = 0
			local PointRotatedAroundObject = if frame.AbsoluteRotation == 0 then p1 else GetPointRotatedAroundObjectFunction(p1, frame)
			
			if PointRotatedAroundObject.X < AbsolutePosition.X or PointRotatedAroundObject.Y < AbsolutePosition.Y or NewAbsolutePosition.X < PointRotatedAroundObject.X or NewAbsolutePosition.Y < PointRotatedAroundObject.Y then
				SquareRoot = math.sqrt(math.pow(if PointRotatedAroundObject.X < AbsolutePosition.X then AbsolutePosition.X - PointRotatedAroundObject.X elseif NewAbsolutePosition.X < PointRotatedAroundObject.X then PointRotatedAroundObject.X - NewAbsolutePosition.X else 0, 2) + math.pow(if PointRotatedAroundObject.Y < AbsolutePosition.Y then AbsolutePosition.Y - PointRotatedAroundObject.Y elseif NewAbsolutePosition.Y < PointRotatedAroundObject.Y then PointRotatedAroundObject.Y - NewAbsolutePosition.Y else 0, 2))
			end
			if SquareRoot < ClosestDistance or ClosestCandidate == nil then
				ClosestCandidate = frame
				ClosestDistance = SquareRoot
			end
		end
		if IsSinkingGuiObjectFunction(frame) and IsCircleContainedInGuiObjectFunction(p1, PropertiesModule.CursorRadius * PropertiesModule.OcclusionRadiusScale, frame) then
			OccludingCandidate = frame
			
			return ClosestCandidate, OccludingCandidate, ClosestDistance
		end
	end
	return ClosestCandidate, OccludingCandidate, ClosestDistance
end

function SelectionController:processMoving(p4) --[[ Line: 210 ]]
	-- upvalues: GuiService (copy), GamepadService (copy), FFlagEnableVirtualCursorMoveAssist (copy), FIntVirtualCursorMoveAssistLevel (copy), PropertiesModule (copy), GetMaxSpeedFunction (copy), FIntVirtualCursorMoveAssistHoverSpeed (copy)
	local NewScreenResolution = GuiService:GetScreenResolution() + GuiService:GetGuiInset()
	local MoveVector = self._inputController:GetMoveVector()
	local GamepadCursorPosition = GamepadService:GetGamepadCursorPosition()
	
	if FFlagEnableVirtualCursorMoveAssist and not self._isScrolling and FIntVirtualCursorMoveAssistLevel > 0 and PropertiesModule.MoveAssistMinInputMagnitude <= MoveVector.Magnitude then
		MoveVector = self._moveAssistController:applyMoveAssist(MoveVector, {
			cursorPosition = GamepadCursorPosition + self._cursorController:GetCursorScreenGuiOffset(),
			strengthMultiplier = FIntVirtualCursorMoveAssistLevel / 100,
			candidates = self:getAssistCandidateList(GamepadCursorPosition, PropertiesModule.MoveAssistRadius)
		})
	elseif FFlagEnableVirtualCursorMoveAssist then
		self._moveAssistController:clearDebugSnapshot()
	end
	local FIntVirtualCursorMoveAssistHoverSpeedRatio = if FFlagEnableVirtualCursorMoveAssist and FIntVirtualCursorMoveAssistLevel > 0 and FIntVirtualCursorMoveAssistHoverSpeed > 0 then FIntVirtualCursorMoveAssistHoverSpeed / 100 else PropertiesModule.SpeedAdjustmentTarget
	local ScaledMoveVector = MoveVector * GetMaxSpeedFunction() * (if self._selectedObject == nil then 1 elseif self._isScrolling then PropertiesModule.ScrollingSlowDown else FIntVirtualCursorMoveAssistHoverSpeedRatio)
	
	if ScaledMoveVector.Magnitude > 0 then
		local NewGamepadCursorPosition: Vector2 = GamepadCursorPosition + ScaledMoveVector * p4
		GamepadCursorPosition = Vector2.new(math.clamp(NewGamepadCursorPosition.X, 0, NewScreenResolution.X), (math.clamp(NewGamepadCursorPosition.Y, 0, NewScreenResolution.Y)))
	end
	self._cursorController:SetPosition(GamepadCursorPosition)
	GamepadService:SetGamepadCursorPosition(GamepadCursorPosition)
end

function SelectionController:getCandidates(Position, Radius) --[[ Line: 264 ]]
	-- upvalues: Players (copy), CoreGui (copy)
	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil
	
	return {
		{
			CoreGui,
			(CoreGui:GetGuiObjectsInCircle(Position, Radius))
		},
		{
			PlayerGui,
			if PlayerGui then PlayerGui:GetGuiObjectsInCircle(Position, Radius) else {}
		}
	}
end

function SelectionController:processAncestors(ClosestCandidate, Parent, p4, p5) --[[ Line: 273 ]]
	local Parent1 = ClosestCandidate.Parent
	while Parent1 and Parent1 ~= Parent do
		if self:processScrolling(Parent1, p4, p5) then
			self._isScrolling = true
			break
		end
		Parent1 = Parent1.Parent
	end
end

function SelectionController:processCandidates(GamepadCursorPosition, SelectionRadius, p6) --[[ Line: 284 ]]
	-- upvalues: GuiService (copy)
	local GamepadCursorPositionDelta = GamepadCursorPosition - GuiService:GetGuiInset()
	local Candidates = self:getCandidates(GamepadCursorPositionDelta, SelectionRadius)
	local ClosestCandidate = nil
	local OccludingCandidate = nil
	local ClosestDistance = 1e999
	self._scrolled = {}
	self._isScrolling = false
	
	for _, candidate in ipairs(Candidates) do
		local v1 = candidate[1]
		ClosestCandidate, OccludingCandidate, ClosestDistance = self:getClosestCandidate(candidate[2], GamepadCursorPositionDelta, SelectionRadius, p6, {
			closestCandidate = ClosestCandidate,
			occludingCandidate = OccludingCandidate,
			closestDistance = ClosestDistance
		})
		
		if self._isScrolling then
			return nil, 1e999
		end
		if ClosestCandidate then
			self:processAncestors(ClosestCandidate, v1, GamepadCursorPositionDelta, p6)
		end
		if self._isScrolling then
			return nil, 1e999
		end
		if OccludingCandidate and OccludingCandidate ~= ClosestCandidate then
			self:processAncestors(OccludingCandidate, v1, GamepadCursorPositionDelta, p6)
		end
		if self._isScrolling then
			return nil, 1e999
		elseif OccludingCandidate then
			return ClosestCandidate, ClosestDistance
		end
	end
	return ClosestCandidate, ClosestDistance
end

function SelectionController.getAssistCandidateList(p7, GamepadCursorPosition, MoveAssistRadius) --[[ Line: 331 ]]
	-- upvalues: GuiService (copy), IsSelectableGuiObjectFunction (copy)
	local Guis = {}
	
	for _, candidate in p7:getCandidates(GamepadCursorPosition - GuiService:GetGuiInset(), MoveAssistRadius) do
		for _, Gui in candidate[2] do
			if Gui:IsA("GuiObject") and IsSelectableGuiObjectFunction(Gui) then
				table.insert(Guis, Gui)
			end
		end
	end
	return Guis
end

function SelectionController:onRenderStep(p8) --[[ Line: 350 ]]
	-- upvalues: GamepadService (copy), Players (copy), CoreGui (copy), GuiService (copy)
	self:processMoving(p8)
	local ProcessCandidatesResult = self:processCandidates(GamepadService:GetGamepadCursorPosition(), self._selectionRadius, p8)
	
	if ProcessCandidatesResult ~= self._selectedObject then
		local LocalPlayer = Players.LocalPlayer
		local PlayerGui = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil
		
		if ProcessCandidatesResult then
			self._cursorController:SetHighlight(true)
			
			if ProcessCandidatesResult:IsDescendantOf(CoreGui) then
				GuiService.SelectedCoreObject = ProcessCandidatesResult
				GuiService.SelectedObject = nil
			elseif PlayerGui and ProcessCandidatesResult:IsDescendantOf(PlayerGui) then
				GuiService.SelectedObject = ProcessCandidatesResult
				GuiService.SelectedCoreObject = nil
			end
		else
			self._cursorController:SetHighlight(false)
			GuiService.SelectedObject = nil
			GuiService.SelectedCoreObject = nil
		end
		self._selectedObject = ProcessCandidatesResult
	end
end

return SelectionController