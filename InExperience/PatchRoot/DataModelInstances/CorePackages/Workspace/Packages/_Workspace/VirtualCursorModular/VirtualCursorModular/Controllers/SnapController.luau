local parent = script.Parent.Parent
local tweenService = game:GetService("TweenService")
local fFlagEnableVirtualCursorDebugging = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagEnableVirtualCursorDebugging
local enumsModule = require(parent.Enums)
local propertiesModule = require(parent.Properties)

local function _(p1)
	local magnitude = p1.Magnitude
	
	return if magnitude > 0.00001 then p1 / magnitude else Vector2.zero
end

local _ = function(p1, p2, p3)
	return Vector2.new(math.clamp(p1.X, p2.X, p2.X + p3.X), math.clamp(p1.Y, p2.Y, p2.Y + p3.Y))
end

local _ = function(p1)
	return p1 * p1 * (3 - p1 * 2)
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: enumsModule (ref), t (ref)
	return setmetatable({
		_currTargetObject = nil,
		_currTargetCenter = nil,
		_cursorStartingPosition = nil,
		_snapTimer = 0,
		_cursorVelocity = Vector2.zero,
		_strengthTable = {
			[enumsModule.SnapAssistMethod.Friction] = 0,
			[enumsModule.SnapAssistMethod.Tracking] = 0,
			[enumsModule.SnapAssistMethod.Centering] = 0
		}
	}, t)
end

function t:setMethodStrength(p1, p2)
	self._strengthTable[p1] = math.clamp(p2, 0, 1)
end

function t:getScaledMethodStrength(p1, p2)
	return math.clamp((self._strengthTable[p1] or 0) * p2, 0, 1)
end

function t:adjustFriction(p1)
	-- upvalues: enumsModule (ref)
	local frictionScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Friction, p1.strengthMultiplier)
	
	return if not (not p1.targetObject or frictionScaledMethodStrength <= 0) then if self._cursorStartingPosition then p1.cursorPosition:Lerp(self._cursorStartingPosition, frictionScaledMethodStrength) else p1.cursorPosition else p1.cursorPosition
end

function t:adjustTracking(p1)
	-- upvalues: enumsModule (ref)
	local trackingScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Tracking, p1.strengthMultiplier)
	
	if p1.targetObject and trackingScaledMethodStrength > 0 then
		local var1 = p1.targetObject.AbsolutePosition + p1.targetObject.AbsoluteSize / 2
		local var2 = p1.cursorPosition + Vector2.new(0, 0):Lerp(var1 - (self._currTargetCenter or var1), trackingScaledMethodStrength)
		self._currTargetCenter = var1
		
		return var2
	end
	return p1.cursorPosition
end

function t:adjustCentering(p1)
	-- upvalues: enumsModule (ref), tweenService (ref)
	local centeringScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Centering, p1.strengthMultiplier)
	
	if not p1.targetObject or centeringScaledMethodStrength <= 0 then
		return p1.cursorPosition
	end
	local var1 = p1.targetObject.AbsolutePosition + Vector2.new(math.floor(p1.targetObject.AbsoluteSize.X / 2), math.floor(p1.targetObject.AbsoluteSize.Y / 2))
	
	if p1.deltaTime then
		local cursorPosition, cursorPosition_1 = tweenService:SmoothDamp(p1.cursorPosition, var1, self._cursorVelocity, 1 - centeringScaledMethodStrength, 1e999, p1.deltaTime)
		self._cursorVelocity = cursorPosition_1
		
		return cursorPosition
	end
	return p1.cursorPosition:Lerp(var1, centeringScaledMethodStrength)
end

function t:adjustSnap(p1)
	-- upvalues: fFlagEnableVirtualCursorDebugging (ref)
	if p1.targetObject == self._currTargetObject then
		if p1.expiredTime and p1.expiredTime < tick() - self._snapTimer then
			if fFlagEnableVirtualCursorDebugging then
				print("Snap expired")
			end
			return p1.cursorPosition
		else
			p1.cursorPosition = self:adjustFriction(p1)
			p1.cursorPosition = self:adjustTracking(p1)
			p1.cursorPosition = self:adjustCentering(p1)
			
			return p1.cursorPosition
		end
	else
		self._currTargetObject = p1.targetObject
		self._currTargetCenter = if p1.targetObject then p1.targetObject.AbsolutePosition + p1.targetObject.AbsoluteSize / 2 else nil
		self._cursorVelocity = Vector2.zero
		self._cursorStartingPosition = p1.cursorPosition
		self._snapTimer = tick()
		
		if fFlagEnableVirtualCursorDebugging then
			print("New target detected, cursorPos", p1.cursorPosition, "targetPos", self.currTargetCenter)
		end
	end
end

function t.isSnapCandidate(_, p1, p2)
	return not (not p1.Visible or not p1.Selectable) and (p1.AbsolutePosition.X + p1.AbsoluteSize.X < 0 or p1.AbsolutePosition.Y + p1.AbsoluteSize.Y < 0 or (p2.X < p1.AbsolutePosition.X or p2.Y < p1.AbsolutePosition.Y))
end

function t.adjustMove(_, p1, p2)
	-- upvalues: propertiesModule (ref), fFlagEnableVirtualCursorDebugging (ref)
	local cursorPosition = p2.cursorPosition
	local candidates = p2.candidates
	local strengthMultiplier = p2.strengthMultiplier
	
	if strengthMultiplier <= 0 or not candidates or #candidates == 0 then
		return p1
	elseif p1.Magnitude < 0.00001 then
		return Vector2.zero
	end
	local magnitude = p1.Magnitude
	local var1 = if magnitude > 0.00001 then p1 / magnitude else Vector2.zero
	local var2 = 0
	local zero = Vector2.zero
	
	for i, v in candidates do
		local absolutePosition = v.AbsolutePosition
		local absoluteSize = v.AbsoluteSize
		absolutePosition = Vector2.new(math.clamp(cursorPosition.X, absolutePosition.X, absolutePosition.X + absoluteSize.X), math.clamp(cursorPosition.Y, absolutePosition.Y, absolutePosition.Y + absoluteSize.Y)) - cursorPosition
		local magnitude_1 = absolutePosition.Magnitude
		
		if magnitude_1 < propertiesModule.SnapRadius then
			local magnitude_2 = absolutePosition.Magnitude
			local var3 = if magnitude_2 > 0.00001 then absolutePosition / magnitude_2 else Vector2.zero
			local var4 = var1:Dot(var3)
			
			if var4 > 0.25 then
				local clampedValue = math.clamp(1 - magnitude_1 / propertiesModule.SnapRadius, 0, 1)
				local var5 = clampedValue * clampedValue * (3 - clampedValue * 2) * var4
				
				if var2 < var5 then
					var2 = var5
					zero = var3
				end
			end
		end
	end
	local var6 = var1
	
	if var2 > 0 then
		local var7 = var1 + zero * (var2 * strengthMultiplier)
		local magnitude_1 = var7.Magnitude
		var6 = if magnitude_1 > 0.00001 then var7 / magnitude_1 else Vector2.zero
	end
	if (var6 - p1).Magnitude > 0 and fFlagEnableVirtualCursorDebugging then
		print("Move input adjusted from", p1, "to", var6)
	end
	return var6
end

return t