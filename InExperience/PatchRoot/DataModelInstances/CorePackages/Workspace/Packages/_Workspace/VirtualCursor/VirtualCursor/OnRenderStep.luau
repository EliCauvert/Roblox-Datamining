local Parent = script.Parent
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local GamepadService = game:GetService("GamepadService")
local CoreGui = game:GetService("CoreGui")
local PlayerGui = nil
local InputModule = require(Parent.Input)
local InterfaceModule = require(Parent.Interface)
local PropertiesModule = require(Parent.Properties)
local IsCircleContainedInGuiObjectModule = require(Parent.isCircleContainedInGuiObject)
local IsSelectableGuiObjectModule = require(Parent.isSelectableGuiObject)
local RotatePointAroundObjectModule = require(Parent.RotatePointAroundObject)
local SpeedAdjustmentTarget = 1
local Flag = false
local SinFunction = math.sin
local CosFunction = math.cos
local _ = math.abs
local MaxFunction = math.max
local MinFunction = math.min
local SignFunction = math.sign
local AbsFunction = math.abs
local Tbl = {}
local v1 = nil
local v2 = nil
local v3 = 1e999

local function _(Vector, Vector1, Vector3): boolean --[[ Line: 37 | Named "contains" ]]
	return Vector1.x <= Vector.x and (Vector1.y <= Vector.y and Vector.x <= Vector3.x) and Vector.y <= Vector3.y
end

local function handleScrollingFrame(ScrollFrame, Vector, p1): boolean --[[ Line: 41 ]]
	-- upvalues: Tbl (copy), InputModule (copy), PropertiesModule (copy), AbsFunction (copy), CosFunction (copy), SinFunction (copy), MaxFunction (copy), MinFunction (copy), SignFunction (copy), InterfaceModule (copy)
	if not ScrollFrame:IsA("ScrollingFrame") then
		return false
	end
	if not ScrollFrame.ScrollingEnabled then
		return false
	end
	if Tbl[ScrollFrame] then
		return false
	end
	Tbl[ScrollFrame] = true
	local Thumbstick2Vector = InputModule:GetThumbstick2Vector()
	local ScaledScrollingSpeed = PropertiesModule.ScrollingSpeed * p1
	local ScrollingRadius = PropertiesModule.ScrollingRadius
	local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
	local AbsoluteSize = ScrollFrame.AbsoluteSize
	local ScrollingDirection = ScrollFrame.ScrollingDirection
	local IsScrollingDirectionMatch: boolean = AbsoluteSize.X < AbsoluteCanvasSize.X and (ScrollingDirection == Enum.ScrollingDirection.XY or ScrollingDirection == Enum.ScrollingDirection.X)
	local IsScrollingDirectionMatch1: boolean = AbsoluteSize.Y < AbsoluteCanvasSize.Y and (ScrollingDirection == Enum.ScrollingDirection.XY or ScrollingDirection == Enum.ScrollingDirection.Y)
	local AbsoluteSize1: number = ScrollFrame.AbsoluteSize
	local AbsolutePosition = ScrollFrame.AbsolutePosition
	local ScaledRotation = ScrollFrame.Rotation / 180 * 3.141592653589793
	
	if PropertiesModule.ThumbstickDeadzone < AbsFunction(Thumbstick2Vector.x) and IsScrollingDirectionMatch then
		ScrollFrame.CanvasPosition += Vector2.new(Thumbstick2Vector.x * ScaledScrollingSpeed, 0)
	end
	if PropertiesModule.ThumbstickDeadzone < AbsFunction(Thumbstick2Vector.y) and IsScrollingDirectionMatch1 then
		ScrollFrame.CanvasPosition += Vector2.new(0, Thumbstick2Vector.y * ScaledScrollingSpeed)
	end
	local VectorDelta = Vector2.new(Vector.X, Vector.Y) - AbsolutePosition
	local DotProductDelta = VectorDelta:Dot((Vector2.new(CosFunction(ScaledRotation), (SinFunction(ScaledRotation))))) - AbsoluteSize1.X / 2
	local DotProductDelta1 = VectorDelta:Dot((Vector2.new(-SinFunction(ScaledRotation), (CosFunction(ScaledRotation))))) - AbsoluteSize1.Y / 2
	local VectorDelta1 = Vector2.new(AbsFunction(DotProductDelta), (AbsFunction(DotProductDelta1))) - AbsoluteSize1 / 2
	
	if AbsFunction(MinFunction(MaxFunction(VectorDelta1.x, VectorDelta1.y), 0) + Vector2.new(MaxFunction(VectorDelta1.x, 0), (MaxFunction(VectorDelta1.y, 0))).Magnitude) < ScrollingRadius then
		if AbsFunction(VectorDelta1.x) < AbsFunction(VectorDelta1.y) and IsScrollingDirectionMatch then
			ScrollFrame.CanvasPosition += Vector2.new(SignFunction(DotProductDelta) * ScaledScrollingSpeed, 0)
			InterfaceModule:SetArrow(SignFunction(DotProductDelta), 0)
			
			return true
		elseif AbsFunction(VectorDelta1.y) <= AbsFunction(VectorDelta1.x) and IsScrollingDirectionMatch1 then
			ScrollFrame.CanvasPosition += Vector2.new(0, SignFunction(DotProductDelta1) * ScaledScrollingSpeed)
			InterfaceModule:SetArrow(0, (SignFunction(DotProductDelta1)))
			
			return true
		end
	end
	return false
end

local function findClosestOrOccludingGuiObject(_, Frames, Position, p1) --[[ Line: 106 ]]
	-- upvalues: handleScrollingFrame (copy), Flag (ref), IsSelectableGuiObjectModule (copy), v1 (ref), RotatePointAroundObjectModule (copy), v3 (ref), IsCircleContainedInGuiObjectModule (copy), PropertiesModule (copy), v2 (ref)
	for _, frame in ipairs(Frames) do
		if handleScrollingFrame(frame, Position, p1) then
			Flag = true
			break
		end
		local IsSelectableGuiObjectModule1 = IsSelectableGuiObjectModule(frame)
		
		if IsSelectableGuiObjectModule1 and not v1 then
			v1 = frame
		end
		if IsSelectableGuiObjectModule1 then
			local AbsolutePosition = frame.AbsolutePosition
			local NewAbsolutePosition = frame.AbsolutePosition + frame.AbsoluteSize
			local SquareRoot = 0
			local Position1 = if frame.AbsoluteRotation == 0 then Position else RotatePointAroundObjectModule(Position, frame)
			
			if Position1.x < AbsolutePosition.x or Position1.y < AbsolutePosition.y or NewAbsolutePosition.x < Position1.x or NewAbsolutePosition.y < Position1.y then
				SquareRoot = math.sqrt(math.pow(if Position1.x < AbsolutePosition.x then AbsolutePosition.x - Position1.x elseif NewAbsolutePosition.x < Position1.x then Position1.x - NewAbsolutePosition.x else 0, 2) + math.pow(if Position1.y < AbsolutePosition.y then AbsolutePosition.y - Position1.y elseif NewAbsolutePosition.y < Position1.y then Position1.y - NewAbsolutePosition.y else 0, 2))
			end
			if SquareRoot < v3 then
				v1 = frame
				v3 = SquareRoot
			end
		end
		if frame.Visible and frame.Active and frame.Interactable and IsCircleContainedInGuiObjectModule(Position, PropertiesModule.CursorRadius * PropertiesModule.OcclusionRadiusScale, frame) then
			v2 = frame
			break
		end
	end
end

local function handleScrollingInAncestors(p2, Parent, Position, p3) --[[ Line: 161 ]]
	-- upvalues: handleScrollingFrame (copy), Flag (ref)
	local Parent1 = p2.Parent
	while Parent1 and Parent1 ~= Parent do
		if handleScrollingFrame(Parent1, Position, p3) then
			Flag = true
			break
		end
		Parent1 = Parent1.Parent
	end
end

local function processCursorPosition(GamepadCursorPosition, SelectionRadius, p4) --[[ Line: 172 ]]
	-- upvalues: Tbl (copy), v1 (ref), v2 (ref), v3 (ref), GuiService (copy), PlayerGui (ref), Players (copy), CoreGui (copy), Flag (ref), findClosestOrOccludingGuiObject (copy), handleScrollingInAncestors (copy)
	table.clear(Tbl)
	v1 = nil
	v2 = nil
	v3 = 1e999
	local GamepadCursorPositionDelta = GamepadCursorPosition - GuiService:GetGuiInset()
	
	if PlayerGui == nil then
		PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	Flag = false
	
	for _, value in ipairs({
		{
			CoreGui,
			(CoreGui:GetGuiObjectsInCircle(GamepadCursorPositionDelta, SelectionRadius))
		},
		{
			PlayerGui,
			if PlayerGui then PlayerGui:GetGuiObjectsInCircle(GamepadCursorPositionDelta, SelectionRadius) else {}
		}
	}) do
		local v4 = value[1]
		findClosestOrOccludingGuiObject(v4, value[2], GamepadCursorPositionDelta, p4)
		
		if Flag then
			return nil
		end
		if v1 then
			handleScrollingInAncestors(v1, v4, GamepadCursorPositionDelta, p4)
		end
		if Flag then
			return nil
		end
		if v2 and v2 ~= v1 then
			handleScrollingInAncestors(v2, v4, GamepadCursorPositionDelta, p4)
		end
		if Flag then
			return nil
		elseif v2 then
			return v1
		end
	end
	return v1
end

local _ = function() --[[ Line: 237 | Named "getMaxSpeed" ]]
	-- upvalues: GuiService (copy), PropertiesModule (copy)
	return GuiService:GetScreenResolution().Magnitude * PropertiesModule.MaxSpeedRelative
end

return function(p5, p6) --[[ Line: 242 ]]
	-- upvalues: GuiService (copy), InputModule (copy), GamepadService (copy), SpeedAdjustmentTarget (ref), InterfaceModule (copy), Flag (ref), PropertiesModule (copy), processCursorPosition (copy), CoreGui (copy), PlayerGui (ref)
	local NewScreenResolution = GuiService:GetScreenResolution() + GuiService:GetGuiInset()
	local ThumbstickVector = InputModule:GetThumbstickVector()
	local GamepadCursorPosition = GamepadService:GetGamepadCursorPosition()
	local _ = Vector2.new()
	
	if p5.SelectedObject == nil then
		SpeedAdjustmentTarget = 1
		InterfaceModule:SetCursorHighlight(false)
	end
	if Flag then
		SpeedAdjustmentTarget = PropertiesModule.ScrollingSlowDown
	end
	local ScaledThumbstickVector = ThumbstickVector * (GuiService:GetScreenResolution().Magnitude * PropertiesModule.MaxSpeedRelative) * SpeedAdjustmentTarget
	
	if ScaledThumbstickVector.Magnitude > 0 then
		local NewGamepadCursorPosition: Vector2 = GamepadCursorPosition + ScaledThumbstickVector * p6
		GamepadCursorPosition = Vector2.new(math.clamp(NewGamepadCursorPosition.x, 0, NewScreenResolution.x), (math.clamp(NewGamepadCursorPosition.y, 0, NewScreenResolution.y)))
	end
	InterfaceModule:SetCursorPosition(GamepadCursorPosition)
	GamepadService:SetGamepadCursorPosition(GamepadCursorPosition)
	p5.CursorPosition = GamepadCursorPosition
	local ProcessCursorPositionResult = processCursorPosition(GamepadCursorPosition, PropertiesModule.SelectionRadius, p6)
	
	if ProcessCursorPositionResult ~= p5.PreviouslySelectedObject then
		p5.PreviouslySelectedObject = ProcessCursorPositionResult
		InterfaceModule:SetCursorHighlight(ProcessCursorPositionResult ~= nil)
		
		if ProcessCursorPositionResult then
			if ProcessCursorPositionResult ~= p5.SelectedObject then
				p5.SelectedObject = ProcessCursorPositionResult
				SpeedAdjustmentTarget = PropertiesModule.SpeedAdjustmentTarget
			end
		else
			p5.SelectedObject = nil
			SpeedAdjustmentTarget = 1
		end
		if p5.SelectedObject == nil then
			GuiService.SelectedObject = nil
			GuiService.SelectedCoreObject = nil
			
			return
		end
		if p5.SelectedObject:IsDescendantOf(CoreGui) then
			GuiService.SelectedCoreObject = p5.SelectedObject
			GuiService.SelectedObject = nil
			
			return
		end
		if p5.SelectedObject:IsDescendantOf(PlayerGui) then
			GuiService.SelectedObject = p5.SelectedObject
			GuiService.SelectedCoreObject = nil
		end
	end
end