local parent = script.Parent.Parent
local sharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local fFlagEnableVirtualCursorDebugging = sharedFlagsModule.FFlagEnableVirtualCursorDebugging
local fFlagVirtualCursorMoveAssistIntentRamp = sharedFlagsModule.FFlagVirtualCursorMoveAssistIntentRamp
local propertiesModule = require(parent.Properties)
local moveAssistMinInputMagnitude = propertiesModule.MoveAssistMinInputMagnitude
local var1 = propertiesModule.CursorRadius * 0.5

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

local function computeAimPoint(p1, p2, p3, p4)
	local absoluteSize = p1.AbsoluteSize
	local absolutePosition = p1.AbsolutePosition
	local var2 = absolutePosition - Vector2.new(p3, p3)
	local var3 = absoluteSize + Vector2.new(p4, p4)
	local vector2 = Vector2.new(math.clamp(p2.X, var2.X, var2.X + var3.X), math.clamp(p2.Y, var2.Y, var2.Y + var3.Y))
	local var4 = absolutePosition + absoluteSize / 2
	local clampedValue = math.clamp(1 - math.max(absoluteSize.X, absoluteSize.Y) / p4 / 0.5, 0, 1)
	
	return vector2:Lerp(var4, clampedValue), Vector2.new(math.clamp(p2.X, absolutePosition.X, absolutePosition.X + absoluteSize.X), math.clamp(p2.Y, absolutePosition.Y, absolutePosition.Y + absoluteSize.Y)):Lerp(var4, clampedValue)
end

local function scoreCandidate(p1, p2, p3, p4, p5)
	-- upvalues: computeAimPoint (ref), propertiesModule (ref)
	local absoluteSize = p1.AbsoluteSize
	local var2 = (absoluteSize.X * math.abs(p3.Y) + absoluteSize.Y * math.abs(p3.X)) / p5
	
	if var2 >= 1 then
		return nil
	end
	local clampedValue = math.clamp(1 - var2 ^ 2, 0, 1)
	local var3, var4 = computeAimPoint(p1, p2, p4, p5)
	local var5 = var3 - p2
	local magnitude = var5.Magnitude
	local magnitude_1 = var5.Magnitude
	local var6 = if magnitude_1 > 0.00001 then var5 / magnitude_1 else Vector2.zero
	local var7 = p3:Dot(var6)
	local var8 = magnitude < propertiesModule.MoveAssistRadius and var7 > 0.25
	local var9 = 0
	
	if var8 then
		local clampedValue_1 = math.clamp(1 - magnitude / propertiesModule.MoveAssistRadius, 0, 1)
		var9 = clampedValue_1 * clampedValue_1 * (3 - clampedValue_1 * 2) * var7 * clampedValue
	end
	return {
		scored = var8,
		influence = var9,
		dirToButton = var6,
		distance = magnitude,
		dot = var7,
		aimPoint = var4
	}
end

local function computeAssistStrength(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: var1 (ref)
	local var2 = if p1 > 0 then (p1 - p2) / p1 else 0
	local var3 = if p5 then 0.08 else 0.15
	local clampedValue = math.clamp((var2 - var3) / (0.4 - var3), 0, 1)
	local clampedValue_1 = math.clamp((p3 - 0.25) / 0.75, 0, 1)
	local clampedValue_2 = math.clamp(p4 / var1, 0, 1)
	
	return {
		assistStrength = math.clamp(p6 * p7 * clampedValue * clampedValue_1 * clampedValue_2, 0, 1),
		confidence = var2,
		confidenceStrength = clampedValue,
		inputFollowStrength = clampedValue_1,
		arrivalFactor = clampedValue_2
	}
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), fFlagEnableVirtualCursorDebugging (ref)
	local tbl = setmetatable({ _assistTarget = nil, _debugSnapshot = nil }, t)
	
	if fFlagEnableVirtualCursorDebugging then
		print("[VirtualCursor] MoveAssistController created")
	end
	return tbl
end

function t:applyMoveAssist(p1, p2)
	-- upvalues: fFlagEnableVirtualCursorDebugging (ref), propertiesModule (ref), fFlagVirtualCursorMoveAssistIntentRamp (ref), moveAssistMinInputMagnitude (ref), scoreCandidate (ref), computeAssistStrength (ref)
	local cursorPosition = p2.cursorPosition
	local candidates = p2.candidates
	local clampedValue = math.clamp(p2.strengthMultiplier, 0, 1)
	local var2 = nil
	
	if fFlagEnableVirtualCursorDebugging then
		local t = {}
		var2 = t
		local t_1 = {
			active = false,
			committed = nil,
			intentFactor = 0,
			confidence = 0,
			confidenceStrength = 0,
			inputFollowStrength = 0,
			arrivalFactor = 0,
			assistStrength = 0,
			bestInfluence = 0,
			cursorPosition = cursorPosition,
			radius = propertiesModule.MoveAssistRadius
		}
		local magnitude = p1.Magnitude
		t_1.inputDir = if magnitude > 0.00001 then p1 / magnitude else Vector2.zero
		local magnitude_1 = p1.Magnitude
		t_1.finalDir = if magnitude_1 > 0.00001 then p1 / magnitude_1 else Vector2.zero
		t_1.inputMagnitude = p1.Magnitude
		t_1.candidates = t
		t_1.masterGain = clampedValue
		self._debugSnapshot = t_1
	end
	if clampedValue <= 0 or not candidates or #candidates == 0 then
		self._assistTarget = nil
		
		return p1
	end
	local magnitude = p1.Magnitude
	
	if magnitude < 0.00001 then
		self._assistTarget = nil
		
		return Vector2.zero
	end
	local clampedValue_1
	local _ = nil
	
	if fFlagVirtualCursorMoveAssistIntentRamp then
		clampedValue_1 = math.clamp((magnitude - moveAssistMinInputMagnitude) / (0.7 - moveAssistMinInputMagnitude), 0, 1)
		
		if clampedValue_1 <= 0 then
			self._assistTarget = nil
			
			return p1
		end
	elseif magnitude < moveAssistMinInputMagnitude then
		self._assistTarget = nil
		
		return p1
	end
	clampedValue_1 = 1
	local cursorRadius = propertiesModule.CursorRadius
	local var3 = cursorRadius * 2
	local var4 = p1 / magnitude
	local var5 = 0
	local var6 = 0
	local zero = Vector2.zero
	local var7 = 0
	local var8 = 0
	local var9 = nil
	local var10 = nil
	
	for i, v in candidates do
		local var11 = nil
		
		if var2 then
			local t = {
				influence = 0,
				aimPoint = nil,
				state = "skipped",
				position = v.AbsolutePosition,
				size = v.AbsoluteSize
			}
			var11 = t
			table.insert(var2, t)
		end
		local var12 = scoreCandidate(v, cursorPosition, var4, cursorRadius, var3)
		
		if var12 then
			if var11 then
				var11.aimPoint = var12.aimPoint
				
				if var12.scored then
					var11.influence = var12.influence
					var11.state = "scored"
				end
			end
			if var12.scored then
				local influence = var12.influence
				
				if self._assistTarget ~= nil and v == self._assistTarget then
					influence *= 1.25
				end
				if var5 < influence then
					var6 = var5
					var5 = influence
					zero = var12.dirToButton
					var7 = var12.distance
					var8 = var12.dot
					var9 = v
					var10 = var11
				elseif var6 < influence then
					var6 = influence
				end
			end
		end
	end
	if not var9 or var5 < 0.05 then
		self._assistTarget = nil
		
		return p1
	end
	local var13 = if self._assistTarget then var9 == self._assistTarget else false
	
	if var8 < (if var13 then 0.25 else 0.5) then
		self._assistTarget = nil
		
		return p1
	end
	local var14 = computeAssistStrength(var5, var6, var8, var7, var13, clampedValue, clampedValue_1)
	
	if var14.assistStrength <= 0 then
		self._assistTarget = nil
		
		return p1
	end
	self._assistTarget = var9
	local var15 = var4:Lerp(zero, var14.assistStrength)
	local magnitude_1 = var15.Magnitude
	local var16 = if magnitude_1 > 0.00001 then var15 / magnitude_1 else Vector2.zero
	
	if var16 == Vector2.zero then
		return p1
	end
	local var17 = var16 * magnitude
	
	if fFlagEnableVirtualCursorDebugging then
		if (var17 - p1).Magnitude > 0 then
			print("Move input adjusted from", p1, "to", var17)
		end
		local debugSnapshot = self._debugSnapshot
		
		if debugSnapshot then
			debugSnapshot.active = true
			debugSnapshot.finalDir = var16
			debugSnapshot.intentFactor = clampedValue_1
			debugSnapshot.confidence = var14.confidence
			debugSnapshot.confidenceStrength = var14.confidenceStrength
			debugSnapshot.inputFollowStrength = var14.inputFollowStrength
			debugSnapshot.arrivalFactor = var14.arrivalFactor
			debugSnapshot.assistStrength = var14.assistStrength
			debugSnapshot.bestInfluence = var5
			debugSnapshot.committed = var9
		end
		if var10 then
			var10.state = "committed"
		end
	end
	return var17
end

function t:clearDebugSnapshot()
	self._debugSnapshot = nil
end

return t