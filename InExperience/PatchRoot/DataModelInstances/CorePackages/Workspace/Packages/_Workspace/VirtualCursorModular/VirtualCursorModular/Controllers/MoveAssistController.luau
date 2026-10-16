local SharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local FFlagEnableVirtualCursorDebugging = SharedFlagsModule.FFlagEnableVirtualCursorDebugging
local FFlagVirtualCursorMoveAssistIntentRamp = SharedFlagsModule.FFlagVirtualCursorMoveAssistIntentRamp
local PropertiesModule = require(script.Parent.Parent.Properties)
local MoveAssistMinInputMagnitude = PropertiesModule.MoveAssistMinInputMagnitude
local ScaledCursorRadius = PropertiesModule.CursorRadius * 0.5

local function _(Offset) --[[ Line: 50 | Named "normalizeSafe" ]]
	local Magnitude: number = Offset.Magnitude
	
	return if Magnitude > 0.00001 then Offset / Magnitude else Vector2.zero
end

local _ = function(Vector, Vector1, Vector3): Vector2 --[[ Line: 58 | Named "closestPointOnRect" ]]
	return Vector2.new(math.clamp(Vector.X, Vector1.X, Vector1.X + Vector3.X), (math.clamp(Vector.Y, Vector1.Y, Vector1.Y + Vector3.Y)))
end

local _ = function(p1: number): number --[[ Line: 67 | Named "smoothStep" ]]
	return p1 * p1 * (3 - p1 * 2)
end

local function computeAimPoint(Frame: Frame, Vector, X, X1) --[[ Line: 75 ]]
	local AbsoluteSize: number = Frame.AbsoluteSize
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsolutePositionDelta = AbsolutePosition - Vector2.new(X, X)
	local NewAbsoluteSize = AbsoluteSize + Vector2.new(X1, X1)
	local NewAbsolutePosition = AbsolutePosition + AbsoluteSize / 2
	local ClampedValue = math.clamp(1 - math.max(AbsoluteSize.X, AbsoluteSize.Y) / X1 / 0.5, 0, 1)
	
	return Vector2.new(math.clamp(Vector.X, AbsolutePositionDelta.X, AbsolutePositionDelta.X + NewAbsoluteSize.X), (math.clamp(Vector.Y, AbsolutePositionDelta.Y, AbsolutePositionDelta.Y + NewAbsoluteSize.Y))):Lerp(NewAbsolutePosition, ClampedValue), (Vector2.new(math.clamp(Vector.X, AbsolutePosition.X, AbsolutePosition.X + AbsoluteSize.X), (math.clamp(Vector.Y, AbsolutePosition.Y, AbsolutePosition.Y + AbsoluteSize.Y))):Lerp(NewAbsolutePosition, ClampedValue))
end

local function scoreCandidate(Frame: Frame, CursorPosition, Vector, CursorRadius, p1) --[[ Line: 111 ]]
	-- upvalues: computeAimPoint (copy), PropertiesModule (copy)
	local AbsoluteSize = Frame.AbsoluteSize
	local XRatio = (AbsoluteSize.X * math.abs(Vector.Y) + AbsoluteSize.Y * math.abs(Vector.X)) / p1
	
	if XRatio >= 1 then
		return nil
	end
	local ClampedValue = math.clamp(1 - XRatio ^ 2, 0, 1)
	local AimPoint, AimPoint2 = computeAimPoint(Frame, CursorPosition, CursorRadius, p1)
	local AimPointDelta = AimPoint - CursorPosition
	local Magnitude = AimPointDelta.Magnitude
	local Magnitude1: number = AimPointDelta.Magnitude
	local AimPointDeltaRatio = if Magnitude1 > 0.00001 then AimPointDelta / Magnitude1 else Vector2.zero
	local DotProduct: number = Vector:Dot(AimPointDeltaRatio)
	local IsDotProductAbove: boolean = Magnitude < PropertiesModule.MoveAssistRadius and DotProduct > 0.25
	local Influence = 0
	
	if IsDotProductAbove then
		local ClampedValue1 = math.clamp(1 - Magnitude / PropertiesModule.MoveAssistRadius, 0, 1)
		Influence = ClampedValue1 * ClampedValue1 * (3 - ClampedValue1 * 2) * DotProduct * ClampedValue
	end
	return {
		scored = IsDotProductAbove,
		influence = Influence,
		dirToButton = AimPointDeltaRatio,
		distance = Magnitude,
		dot = DotProduct,
		aimPoint = AimPoint2
	}
end

local function computeAssistStrength(BestInfluence: number, p1: number, Dot: number, Distance, IsAssistTargetMatch, ClampedValue, ClampedValue1) --[[ Line: 164 ]]
	-- upvalues: ScaledCursorRadius (copy)
	local BestInfluenceRatio = if BestInfluence > 0 then (BestInfluence - p1) / BestInfluence else 0
	local v1: number = if IsAssistTargetMatch then 0.08 else 0.15
	local ClampedValue2 = math.clamp((BestInfluenceRatio - v1) / (0.4 - v1), 0, 1)
	local ClampedValue3 = math.clamp((Dot - 0.25) / 0.75, 0, 1)
	local ClampedValue4 = math.clamp(Distance / ScaledCursorRadius, 0, 1)
	
	return {
		assistStrength = math.clamp(ClampedValue * ClampedValue1 * ClampedValue2 * ClampedValue3 * ClampedValue4, 0, 1),
		confidence = BestInfluenceRatio,
		confidenceStrength = ClampedValue2,
		inputFollowStrength = ClampedValue3,
		arrivalFactor = ClampedValue4
	}
end

local MoveAssistController = {}
MoveAssistController.__index = MoveAssistController

function MoveAssistController.new() --[[ Line: 232 ]]
	-- upvalues: MoveAssistController (copy), FFlagEnableVirtualCursorDebugging (copy)
	local self = setmetatable({ _assistTarget = nil, _debugSnapshot = nil }, MoveAssistController)
	
	if FFlagEnableVirtualCursorDebugging then
		print("[VirtualCursor] MoveAssistController created")
	end
	return self
end

function MoveAssistController:applyMoveAssist(Offset, _debugSnapshot) --[[ Line: 248 ]]
	-- upvalues: FFlagEnableVirtualCursorDebugging (copy), PropertiesModule (copy), FFlagVirtualCursorMoveAssistIntentRamp (copy), MoveAssistMinInputMagnitude (copy), scoreCandidate (copy), computeAssistStrength (copy)
	local CursorPosition = _debugSnapshot.cursorPosition
	local Candidates = _debugSnapshot.candidates
	local ClampedValue = math.clamp(_debugSnapshot.strengthMultiplier, 0, 1)
	local List = nil
	
	if FFlagEnableVirtualCursorDebugging then
		local Candidates1 = {}
		List = Candidates1
		local Magnitude: number = Offset.Magnitude
		local OffsetRatio = if Magnitude > 0.00001 then Offset / Magnitude else Vector2.zero
		local Magnitude1: number = Offset.Magnitude
		self._debugSnapshot = {
			active = false,
			committed = nil,
			intentFactor = 0,
			confidence = 0,
			confidenceStrength = 0,
			inputFollowStrength = 0,
			arrivalFactor = 0,
			assistStrength = 0,
			bestInfluence = 0,
			cursorPosition = CursorPosition,
			radius = PropertiesModule.MoveAssistRadius,
			inputDir = OffsetRatio,
			finalDir = if Magnitude1 > 0.00001 then Offset / Magnitude1 else Vector2.zero,
			inputMagnitude = Offset.Magnitude,
			candidates = Candidates1,
			masterGain = ClampedValue
		}
	end
	if ClampedValue <= 0 or not Candidates or #Candidates == 0 then
		self._assistTarget = nil
		
		return Offset
	end
	local Magnitude: number = Offset.Magnitude
	
	if Magnitude < 0.00001 then
		self._assistTarget = nil
		
		return Vector2.zero
	end
	local ClampedValue1 = nil
	if FFlagVirtualCursorMoveAssistIntentRamp then
		ClampedValue1 = math.clamp((Magnitude - MoveAssistMinInputMagnitude) / (0.7 - MoveAssistMinInputMagnitude), 0, 1)
		
		if ClampedValue1 <= 0 then
			self._assistTarget = nil
			
			return Offset
		end
	else
		if Magnitude < MoveAssistMinInputMagnitude then
			self._assistTarget = nil
			
			return Offset
		end
		ClampedValue1 = 1
	end
	local CursorRadius: number = PropertiesModule.CursorRadius
	local ScaledCursorRadius = CursorRadius * 2
	local OffsetRatio = Offset / Magnitude
	local BestInfluence = 0
	local v1 = 0
	local ZeroVector = Vector2.zero
	local Distance = 0
	local Dot = 0
	local Committed = nil
	local v2 = nil
	
	for _, candidate in Candidates do
		local v3 = nil
		
		if List then
			local config = {
				influence = 0,
				aimPoint = nil,
				state = "skipped",
				position = candidate.AbsolutePosition,
				size = candidate.AbsoluteSize
			}
			v3 = config
			table.insert(List, config)
		end
		local ScoreCandidateResult = scoreCandidate(candidate, CursorPosition, OffsetRatio, CursorRadius, ScaledCursorRadius)
		
		if ScoreCandidateResult then
			if v3 then
				v3.aimPoint = ScoreCandidateResult.aimPoint
				
				if ScoreCandidateResult.scored then
					v3.influence = ScoreCandidateResult.influence
					v3.state = "scored"
				end
			end
			if ScoreCandidateResult.scored then
				local Influence = ScoreCandidateResult.influence
				
				if self._assistTarget ~= nil and candidate == self._assistTarget then
					Influence *= 1.25
				end
				if BestInfluence < Influence then
					v1 = BestInfluence
					BestInfluence = Influence
					ZeroVector = ScoreCandidateResult.dirToButton
					Distance = ScoreCandidateResult.distance
					Dot = ScoreCandidateResult.dot
					Committed = candidate
					v2 = v3
				elseif v1 < Influence then
					v1 = Influence
				end
			end
		end
	end
	if not Committed or BestInfluence < 0.05 then
		self._assistTarget = nil
		
		return Offset
	end
	local IsCommittedMatch: boolean = if self._assistTarget then Committed == self._assistTarget else false
	
	if Dot < (if IsCommittedMatch then 0.25 else 0.5) then
		self._assistTarget = nil
		
		return Offset
	end
	local AssistStrength = computeAssistStrength(BestInfluence, v1, Dot, Distance, IsCommittedMatch, ClampedValue, ClampedValue1)
	
	if AssistStrength.assistStrength <= 0 then
		self._assistTarget = nil
		
		return Offset
	end
	self._assistTarget = Committed
	local Interpolated = OffsetRatio:Lerp(ZeroVector, AssistStrength.assistStrength)
	local Magnitude1: number = Interpolated.Magnitude
	local InterpolatedRatio = if Magnitude1 > 0.00001 then Interpolated / Magnitude1 else Vector2.zero
	
	if InterpolatedRatio == Vector2.zero then
		return Offset
	end
	local ScaledInterpolatedRatio = InterpolatedRatio * Magnitude
	
	if FFlagEnableVirtualCursorDebugging then
		if (ScaledInterpolatedRatio - Offset).Magnitude > 0 then
			print("Move input adjusted from", Offset, "to", ScaledInterpolatedRatio)
		end
		local DebugSnapshot = self._debugSnapshot
		
		if DebugSnapshot then
			DebugSnapshot.active = true
			DebugSnapshot.finalDir = InterpolatedRatio
			DebugSnapshot.intentFactor = ClampedValue1
			DebugSnapshot.confidence = AssistStrength.confidence
			DebugSnapshot.confidenceStrength = AssistStrength.confidenceStrength
			DebugSnapshot.inputFollowStrength = AssistStrength.inputFollowStrength
			DebugSnapshot.arrivalFactor = AssistStrength.arrivalFactor
			DebugSnapshot.assistStrength = AssistStrength.assistStrength
			DebugSnapshot.bestInfluence = BestInfluence
			DebugSnapshot.committed = Committed
		end
		if v2 then
			v2.state = "committed"
		end
	end
	return ScaledInterpolatedRatio
end

function MoveAssistController:clearDebugSnapshot() --[[ Line: 439 ]]
	self._debugSnapshot = nil
end

return MoveAssistController