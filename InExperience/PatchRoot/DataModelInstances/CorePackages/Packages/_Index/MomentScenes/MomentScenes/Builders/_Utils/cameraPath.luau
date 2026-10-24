local function _(Value: number): number
	return if Value < 0 then 0 elseif Value > 1 then Value - math.floor(Value) else Value
end

local _ = function(p1: number, p2: number, p3: number, p4, p5): number
	local v1 = p5 * p5
	
	return (p2 * 2 + (-p1 + p3) * p5 + (p1 * 2 - p2 * 5 + p3 * 4 - p4) * v1 + (-p1 + p2 * 3 - p3 * 3 + p4) * (v1 * p5)) * 0.5
end

local _ = function(p1, p2: number)
	return p1[(p2 - 1) % #p1 + 1]
end

local function sampleSegment(p1, Count: number, p2: number, AlphaRatio)
	local CountP7 = #p1
	local v1 = if CountP7 >= 3 then p1[(Count - 1 - 1) % #p1 + 1] else p1[Count]
	local v2 = p1[Count]
	local v3 = p1[p2]
	local v4 = if CountP7 >= 3 then p1[(p2 + 1 - 1) % #p1 + 1] else p1[p2]
	local YawDegrees: number = v1.yawDegrees
	local YawDegrees1: number = v2.yawDegrees
	local YawDegrees2: number = v3.yawDegrees
	local YawDegrees3 = v4.yawDegrees
	local ScaledAlphaRatio = AlphaRatio * AlphaRatio
	local ScaledYawDegrees = (YawDegrees1 * 2 + (-YawDegrees + YawDegrees2) * AlphaRatio + (YawDegrees * 2 - YawDegrees1 * 5 + YawDegrees2 * 4 - YawDegrees3) * ScaledAlphaRatio + (-YawDegrees + YawDegrees1 * 3 - YawDegrees2 * 3 + YawDegrees3) * (ScaledAlphaRatio * AlphaRatio)) * 0.5
	local PitchDegrees: number = v1.pitchDegrees
	local PitchDegrees1: number = v2.pitchDegrees
	local PitchDegrees2: number = v3.pitchDegrees
	local PitchDegrees3 = v4.pitchDegrees
	local ScaledAlphaRatio1 = AlphaRatio * AlphaRatio
	
	return ScaledYawDegrees, (PitchDegrees1 * 2 + (-PitchDegrees + PitchDegrees2) * AlphaRatio + (PitchDegrees * 2 - PitchDegrees1 * 5 + PitchDegrees2 * 4 - PitchDegrees3) * ScaledAlphaRatio1 + (-PitchDegrees + PitchDegrees1 * 3 - PitchDegrees2 * 3 + PitchDegrees3) * (ScaledAlphaRatio1 * AlphaRatio)) * 0.5
end

local function sampleKeys(Entry, Value: number)
	-- upvalues: sampleSegment (copy)
	if #Entry == 0 then
		return 0, 0
	end
	if #Entry == 1 then
		return Entry[1].yawDegrees, Entry[1].pitchDegrees
	end
	local ValueDelta = if Value < 0 then 0 elseif Value > 1 then Value - math.floor(Value) else Value
	local Entry1 = Entry[1]
	local Entry2 = Entry[#Entry]
	
	if ValueDelta <= Entry1.alpha then
		return Entry1.yawDegrees, Entry1.pitchDegrees
	end
	if Entry2.alpha <= ValueDelta then
		local v1 = 1 - Entry2.alpha
		
		if v1 <= 0 then
			return Entry2.yawDegrees, Entry2.pitchDegrees
		else
			return sampleSegment(Entry, #Entry, 1, (ValueDelta - Entry2.alpha) / v1)
		end
	else
		local Entry3 = nil
		local Entry4 = nil
		for i = 1, #Entry - 1 do
			Entry3 = Entry[i]
			Entry4 = Entry[i + 1]
			
			if ValueDelta <= Entry4.alpha then
				local AlphaDelta = Entry4.alpha - Entry3.alpha
				
				return sampleSegment(Entry, i, i + 1, if AlphaDelta > 0 then (ValueDelta - Entry3.alpha) / AlphaDelta else 0)
			end
		end
		return Entry2.yawDegrees, Entry2.pitchDegrees
	end
end

local function cframeAroundLookAt(Target, Z, Degrees: number, Degrees1: number): CFrame
	return CFrame.lookAt(Target + (CFrame.Angles(0, math.rad(Degrees), 0) * CFrame.Angles(-math.rad(Degrees1), 0, 0)):VectorToWorldSpace((Vector3.new(0, 0, Z))), Target)
end

local Closeup = {
	{ alpha = 0, yawDegrees = 0, pitchDegrees = 0 },
	{ alpha = 0.35, yawDegrees = 8, pitchDegrees = 4 },
	{ alpha = 0.7, yawDegrees = -6, pitchDegrees = 2 },
	{ alpha = 1, yawDegrees = 0, pitchDegrees = 0 }
}
local FullOrbit = {
	{ alpha = 0, yawDegrees = 0, pitchDegrees = 12 },
	{ alpha = 1, yawDegrees = 360, pitchDegrees = 12 }
}
local Static = { { alpha = 0, yawDegrees = 0, pitchDegrees = 0 } }
local config = {
	static = Static,
	subtle = Closeup,
	closeup = Closeup,
	fullOrbit = FullOrbit
}

return {
	eval = function(p1, p2, p3, p4)
		-- upvalues: sampleKeys (copy), cframeAroundLookAt (copy)
		local SampleKeysResult, SampleKeysResult2 = sampleKeys(p3, p4)
		
		return cframeAroundLookAt(p1, p2, SampleKeysResult, SampleKeysResult2)
	end,
	cframeAroundLookAt = cframeAroundLookAt,
	sampleKeys = sampleKeys,
	resolve = function(p1)
		-- upvalues: config (copy), Closeup (copy)
		return if p1 == "static" or p1 == "subtle" or p1 == "closeup" or p1 == "fullOrbit" then config[p1] else Closeup
	end,
	framingFor = function(p1): string
		return if p1 == "closeup" then "face" else "standing"
	end,
	EMOTE_ORBIT = Closeup,
	FULL_ORBIT = FullOrbit,
	STATIC = Static
}