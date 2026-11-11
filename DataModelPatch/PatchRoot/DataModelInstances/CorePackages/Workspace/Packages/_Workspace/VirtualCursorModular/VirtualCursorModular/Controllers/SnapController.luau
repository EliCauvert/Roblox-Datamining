local Parent = script.Parent.Parent
local TweenService = game:GetService("TweenService")
local FFlagEnableVirtualCursorDebugging = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagEnableVirtualCursorDebugging
local EnumsModule = require(Parent.Enums)
local PropertiesModule = require(Parent.Properties)

local function _(Offset)
	local Magnitude: number = Offset.Magnitude
	
	return if Magnitude > 0.00001 then Offset / Magnitude else Vector2.zero
end

local _ = function(Vector, Vector1, Vector3): Vector2
	return Vector2.new(math.clamp(Vector.X, Vector1.X, Vector1.X + Vector3.X), (math.clamp(Vector.Y, Vector1.Y, Vector1.Y + Vector3.Y)))
end

local _ = function(p1: number): number
	return p1 * p1 * (3 - p1 * 2)
end

local SnapController = {}
SnapController.__index = SnapController

function SnapController.new()
	-- upvalues: EnumsModule (copy), SnapController (copy)
	return (setmetatable({
		_currTargetObject = nil,
		_currTargetCenter = nil,
		_cursorStartingPosition = nil,
		_snapTimer = 0,
		_cursorVelocity = Vector2.zero,
		_strengthTable = {
			[EnumsModule.SnapAssistMethod.Friction] = 0,
			[EnumsModule.SnapAssistMethod.Tracking] = 0,
			[EnumsModule.SnapAssistMethod.Centering] = 0
		}
	}, SnapController))
end

function SnapController:setMethodStrength(p1, Value: number)
	self._strengthTable[p1] = math.clamp(Value, 0, 1)
end

function SnapController:getScaledMethodStrength(Centering, StrengthMultiplier): number
	return (math.clamp((self._strengthTable[Centering] or 0) * StrengthMultiplier, 0, 1))
end

function SnapController:adjustFriction(p1)
	-- upvalues: EnumsModule (copy)
	local ScaledMethodStrength: number = self:getScaledMethodStrength(EnumsModule.SnapAssistMethod.Friction, p1.strengthMultiplier)
	
	return if p1.targetObject and ScaledMethodStrength > 0 and self._cursorStartingPosition then p1.cursorPosition:Lerp(self._cursorStartingPosition, ScaledMethodStrength) else p1.cursorPosition
end

function SnapController:adjustTracking(p1)
	-- upvalues: EnumsModule (copy)
	local ScaledMethodStrength: number = self:getScaledMethodStrength(EnumsModule.SnapAssistMethod.Tracking, p1.strengthMultiplier)
	
	if p1.targetObject and ScaledMethodStrength > 0 then
		local NewAbsolutePosition = p1.targetObject.AbsolutePosition + p1.targetObject.AbsoluteSize / 2
		self._currTargetCenter = NewAbsolutePosition
		
		return p1.cursorPosition + Vector2.new(0, 0):Lerp(NewAbsolutePosition - (self._currTargetCenter or NewAbsolutePosition), ScaledMethodStrength)
	else
		return p1.cursorPosition
	end
end

function SnapController:adjustCentering(p1)
	-- upvalues: EnumsModule (copy), TweenService (copy)
	local ScaledMethodStrength: number = self:getScaledMethodStrength(EnumsModule.SnapAssistMethod.Centering, p1.strengthMultiplier)
	
	if not p1.targetObject or ScaledMethodStrength <= 0 then
		return p1.cursorPosition
	end
	local NewAbsolutePosition = p1.targetObject.AbsolutePosition + Vector2.new(math.floor(p1.targetObject.AbsoluteSize.X / 2), (math.floor(p1.targetObject.AbsoluteSize.Y / 2)))
	
	if p1.deltaTime then
		local SmoothDampResult, SmoothDampResult2 = TweenService:SmoothDamp(p1.cursorPosition, NewAbsolutePosition, self._cursorVelocity, 1 - ScaledMethodStrength, 1e999, p1.deltaTime)
		self._cursorVelocity = SmoothDampResult2
		
		return SmoothDampResult
	else
		return (p1.cursorPosition:Lerp(NewAbsolutePosition, ScaledMethodStrength))
	end
end

function SnapController:adjustSnap(p1)
	-- upvalues: FFlagEnableVirtualCursorDebugging (copy)
	if p1.targetObject == self._currTargetObject then
		if p1.expiredTime and p1.expiredTime < tick() - self._snapTimer then
			if FFlagEnableVirtualCursorDebugging then
				print("Snap expired")
			end
			return p1.cursorPosition
		end
	else
		self._currTargetObject = p1.targetObject
		self._currTargetCenter = if p1.targetObject then p1.targetObject.AbsolutePosition + p1.targetObject.AbsoluteSize / 2 else nil
		self._cursorVelocity = Vector2.zero
		self._cursorStartingPosition = p1.cursorPosition
		self._snapTimer = tick()
		
		if FFlagEnableVirtualCursorDebugging then
			print("New target detected, cursorPos", p1.cursorPosition, "targetPos", self.currTargetCenter)
		end
	end
	p1.cursorPosition = self:adjustFriction(p1)
	p1.cursorPosition = self:adjustTracking(p1)
	p1.cursorPosition = self:adjustCentering(p1)
	
	return p1.cursorPosition
end

function SnapController:isSnapCandidate(Frame: Frame, Vector): boolean
	return if Frame.Visible and Frame.Selectable then Frame.AbsolutePosition.X + Frame.AbsoluteSize.X >= 0 and Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y >= 0 and Vector.X >= Frame.AbsolutePosition.X and Vector.Y >= Frame.AbsolutePosition.Y else false
end

function SnapController:adjustMove(Offset, p1)
	-- upvalues: PropertiesModule (copy), FFlagEnableVirtualCursorDebugging (copy)
	local CursorPosition = p1.cursorPosition
	local Candidates = p1.candidates
	local StrengthMultiplier: number = p1.strengthMultiplier
	
	if StrengthMultiplier <= 0 or not Candidates or #Candidates == 0 then
		return Offset
	end
	if Offset.Magnitude < 0.00001 then
		return Vector2.zero
	end
	local Magnitude: number = Offset.Magnitude
	local OffsetRatio = if Magnitude > 0.00001 then Offset / Magnitude else Vector2.zero
	local v1 = 0
	local ZeroVector = Vector2.zero
	
	for _, candidate in Candidates do
		local AbsolutePosition = candidate.AbsolutePosition
		local AbsoluteSize = candidate.AbsoluteSize
		local VectorDelta = Vector2.new(math.clamp(CursorPosition.X, AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X), (math.clamp(CursorPosition.Y, AbsolutePosition.Y, AbsolutePosition.Y + AbsoluteSize.Y))) - CursorPosition
		local Magnitude1 = VectorDelta.Magnitude
		
		if Magnitude1 < PropertiesModule.SnapRadius then
			local Magnitude11: number = VectorDelta.Magnitude
			local VectorDeltaRatio = if Magnitude11 > 0.00001 then VectorDelta / Magnitude11 else Vector2.zero
			local DotProduct: number = OffsetRatio:Dot(VectorDeltaRatio)
			
			if DotProduct > 0.25 then
				local ClampedValue = math.clamp(1 - Magnitude1 / PropertiesModule.SnapRadius, 0, 1)
				local ScaledClampedValue = ClampedValue * ClampedValue * (3 - ClampedValue * 2) * DotProduct
				
				if v1 < ScaledClampedValue then
					v1 = ScaledClampedValue
					ZeroVector = VectorDeltaRatio
				end
			end
		end
	end
	local ZeroVector1 = OffsetRatio
	
	if v1 > 0 then
		local NewOffsetRatio = OffsetRatio + ZeroVector * (v1 * StrengthMultiplier)
		local Magnitude2: number = NewOffsetRatio.Magnitude
		ZeroVector1 = if Magnitude2 > 0.00001 then NewOffsetRatio / Magnitude2 else Vector2.zero
	end
	if (ZeroVector1 - Offset).Magnitude > 0 and FFlagEnableVirtualCursorDebugging then
		print("Move input adjusted from", Offset, "to", ZeroVector1)
	end
	return ZeroVector1
end

return SnapController