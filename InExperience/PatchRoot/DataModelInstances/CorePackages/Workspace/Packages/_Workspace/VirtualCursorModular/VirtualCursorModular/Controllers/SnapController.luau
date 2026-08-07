local parent = script.Parent.Parent
local tweenService = game:GetService("TweenService")
local fFlagEnableVirtualCursorDebugging = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagEnableVirtualCursorDebugging
local enumsModule = require(parent.Enums)
local propertiesModule = require(parent.Properties)

local function _(p0) --[[ line: 26 | named "normalizeSafe" ]]
	local magnitude = p0.Magnitude
	
	return if magnitude > 0.00001 then p0 / magnitude else Vector2.zero
end

local _ = function(p1, p2, p3) --[[ line: 34 | named "closestPointOnRect" ]]
	return Vector2.new(math.clamp(p1.X, p2.X, p2.X + p3.X), math.clamp(p1.Y, p2.Y, p2.Y + p3.Y))
end

local _ = function(p4) --[[ line: 43 | named "smoothStep" ]]
	return p4 * p4 * (3 - p4 * 2)
end

local t = {}
t.__index = t

function t.new() --[[ line: 60 ]]
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

function t:setMethodStrength(p5, p6) --[[ line: 78 ]]
	self._strengthTable[p5] = math.clamp(p6, 0, 1)
end

function t:getScaledMethodStrength(p7, p8) --[[ line: 84 ]]
	return math.clamp((self._strengthTable[p7] or 0) * p8, 0, 1)
end

function t:adjustFriction(p9) --[[ line: 91 ]]
	-- upvalues: enumsModule (ref)
	local frictionScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Friction, p9.strengthMultiplier)
	
	return if not (not p9.targetObject or frictionScaledMethodStrength <= 0) then if self._cursorStartingPosition then p9.cursorPosition:Lerp(self._cursorStartingPosition, frictionScaledMethodStrength) else p9.cursorPosition else p9.cursorPosition
end

function t:adjustTracking(p10) --[[ line: 106 ]]
	-- upvalues: enumsModule (ref)
	local trackingScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Tracking, p10.strengthMultiplier)
	
	if p10.targetObject and trackingScaledMethodStrength > 0 then
		local var6 = p10.targetObject.AbsolutePosition + p10.targetObject.AbsoluteSize / 2
		local var7 = p10.cursorPosition + Vector2.new(0, 0):Lerp(var6 - (self._currTargetCenter or var6), trackingScaledMethodStrength)
		self._currTargetCenter = var6
		
		return var7
	end
	return p10.cursorPosition
end

function t:adjustCentering(p11) --[[ line: 124 ]]
	-- upvalues: enumsModule (ref), tweenService (ref)
	local centeringScaledMethodStrength = self:getScaledMethodStrength(enumsModule.SnapAssistMethod.Centering, p11.strengthMultiplier)
	
	if not p11.targetObject or centeringScaledMethodStrength <= 0 then
		return p11.cursorPosition
	end
	local var9 = p11.targetObject.AbsolutePosition + Vector2.new(math.floor(p11.targetObject.AbsoluteSize.X / 2), math.floor(p11.targetObject.AbsoluteSize.Y / 2))
	
	if p11.deltaTime then
		local cursorPosition, cursorPosition_1 = tweenService:SmoothDamp(p11.cursorPosition, var9, self._cursorVelocity, 1 - centeringScaledMethodStrength, 1e999, p11.deltaTime)
		self._cursorVelocity = cursorPosition_1
		
		return cursorPosition
	end
	return p11.cursorPosition:Lerp(var9, centeringScaledMethodStrength)
end

function t:adjustSnap(p12) --[[ line: 159 ]]
	-- upvalues: fFlagEnableVirtualCursorDebugging (ref)
	if p12.targetObject == self._currTargetObject then
		if p12.expiredTime and p12.expiredTime < tick() - self._snapTimer then
			if fFlagEnableVirtualCursorDebugging then
				print("Snap expired")
			end
			return p12.cursorPosition
		else
			p12.cursorPosition = self:adjustFriction(p12)
			p12.cursorPosition = self:adjustTracking(p12)
			p12.cursorPosition = self:adjustCentering(p12)
			
			return p12.cursorPosition
		end
	else
		self._currTargetObject = p12.targetObject
		self._currTargetCenter = if p12.targetObject then p12.targetObject.AbsolutePosition + p12.targetObject.AbsoluteSize / 2 else nil
		self._cursorVelocity = Vector2.zero
		self._cursorStartingPosition = p12.cursorPosition
		self._snapTimer = tick()
		
		if fFlagEnableVirtualCursorDebugging then
			print("New target detected, cursorPos", p12.cursorPosition, "targetPos", self.currTargetCenter)
		end
	end
end

function t.isSnapCandidate(_, p13, p14) --[[ line: 192 ]]
	return not (not p13.Visible or not p13.Selectable) and (p13.AbsolutePosition.X + p13.AbsoluteSize.X < 0 or p13.AbsolutePosition.Y + p13.AbsoluteSize.Y < 0 or (p14.X < p13.AbsolutePosition.X or p14.Y < p13.AbsolutePosition.Y))
end

function t.adjustMove(_, p15, p16) --[[ line: 210 ]]
	-- upvalues: propertiesModule (ref), fFlagEnableVirtualCursorDebugging (ref)
	local cursorPosition = p16.cursorPosition
	local candidates = p16.candidates
	local strengthMultiplier = p16.strengthMultiplier
	
	if strengthMultiplier <= 0 or not candidates or #candidates == 0 then
		return p15
	elseif p15.Magnitude < 0.00001 then
		return Vector2.zero
	end
	local magnitude = p15.Magnitude
	local var12 = if magnitude > 0.00001 then p15 / magnitude else Vector2.zero
	local var13 = 0
	local zero = Vector2.zero
	
	for i, v in candidates do
		local absolutePosition = v.AbsolutePosition
		local absoluteSize = v.AbsoluteSize
		absolutePosition = Vector2.new(math.clamp(cursorPosition.X, absolutePosition.X, absolutePosition.X + absoluteSize.X), math.clamp(cursorPosition.Y, absolutePosition.Y, absolutePosition.Y + absoluteSize.Y)) - cursorPosition
		local magnitude_1 = absolutePosition.Magnitude
		
		if magnitude_1 < propertiesModule.SnapRadius then
			local magnitude_2 = absolutePosition.Magnitude
			local var17 = if magnitude_2 > 0.00001 then absolutePosition / magnitude_2 else Vector2.zero
			local var18 = var12:Dot(var17)
			
			if var18 > 0.25 then
				local clampedValue = math.clamp(1 - magnitude_1 / propertiesModule.SnapRadius, 0, 1)
				local var20 = clampedValue * clampedValue * (3 - clampedValue * 2) * var18
				
				if var13 < var20 then
					var13 = var20
					zero = var17
				end
			end
		end
	end
	local var15 = var12
	
	if var13 > 0 then
		local var16 = var12 + zero * (var13 * strengthMultiplier)
		local magnitude_1 = var16.Magnitude
		var15 = if magnitude_1 > 0.00001 then var16 / magnitude_1 else Vector2.zero
	end
	if (var15 - p15).Magnitude > 0 and fFlagEnableVirtualCursorDebugging then
		print("Move input adjusted from", p15, "to", var15)
	end
	return var15
end

return t