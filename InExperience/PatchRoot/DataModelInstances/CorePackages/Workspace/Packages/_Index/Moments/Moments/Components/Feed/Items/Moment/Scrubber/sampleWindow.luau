local function _(p1): boolean
	return p1 ~= p1
end

return {
	estimateVelocity = function(Entry)
		local CountEntry = #Entry
		
		if CountEntry < 2 then
			return 0
		end
		local Entry1 = Entry[1]
		local Entry2 = Entry[CountEntry]
		local TimeDelta = Entry2.time - Entry1.time
		
		if TimeDelta <= 0 or TimeDelta ~= TimeDelta then
			return 0
		else
			local PositionRatio = (Entry2.position - Entry1.position) / TimeDelta
			
			return if PositionRatio ~= PositionRatio then 0 else PositionRatio
		end
	end,
	planTargets = function(p1, p2, p3, p4)
		local Granularity: number = p4.granularity
		
		if p1 ~= p1 or Granularity <= 0 or #p4.bands == 0 or p4.maxSamples <= 0 then
			return {}
		end
		local v1 = p2 ~= p2
		local v2 = if v1 then 0 else p2
		local ScaledMaxLeadFraction = p4.maxLeadFraction * (p3.max - p3.min)
		local Rounded = math.round((p1 + math.clamp(v2 * p4.predictionLead, -ScaledMaxLeadFraction, ScaledMaxLeadFraction)) / Granularity)
		
		local function _(p5)
			-- upvalues: p4 (copy)
			for _, band in p4.bands do
				if p5 <= band.radius + 0.000000001 then
					return band.stride
				end
			end
			return nil
		end
		
		local Floored = math.floor(p4.bands[#p4.bands].radius / Granularity + 0.000000001)
		local List = {}
		local t = {}
		
		local function consider(Value: number)
			-- upvalues: List (copy), p4 (copy), Granularity (copy), Rounded (copy), p3 (copy), t (copy)
			if p4.maxSamples <= #List then return end
			local ScaledMagnitude = math.abs(Value) * Granularity
			local Stride = nil
			
			for _, band in p4.bands do
				if ScaledMagnitude <= band.radius + 0.000000001 then
					Stride = band.stride
					break
				end
			end
			if Stride == nil or Value % Stride ~= 0 then return end
			local ScaledRounded = (Rounded + Value) * Granularity
			
			if ScaledRounded >= p3.min and p3.max >= ScaledRounded and not t[ScaledRounded] then
				t[ScaledRounded] = true
				table.insert(List, ScaledRounded)
				
				return
			end
		end
		
		if p4.maxSamples > #List then
			local ScaledGranularity = Granularity * 0
			local Stride = nil
			
			for _, band in p4.bands do
				if ScaledGranularity <= band.radius + 0.000000001 then
					Stride = band.stride
					break
				end
			end
			if Stride ~= nil and 0 % Stride == 0 then
				local ScaledRounded = (Rounded + 0) * Granularity
				
				if ScaledRounded >= p3.min and p3.max >= ScaledRounded and not t[ScaledRounded] then
					t[ScaledRounded] = true
					table.insert(List, ScaledRounded)
				end
			end
		end
		for i = 1, Floored do
			if p4.maxSamples <= #List then break end
			consider(i)
			consider(-i)
		end
		table.sort(List)
		
		return List
	end,
	diff = function(List, List1)
		local t = {}
		local Fetch = {}
		
		for _, value in List do
			t[value] = true
			
			if not List1[value] then
				table.insert(Fetch, value)
			end
		end
		local List2 = {}
		
		for i in List1 do
			if not t[i] then
				table.insert(List2, i)
			end
		end
		table.sort(List2)
		
		return { fetch = Fetch, evict = List2 }
	end,
	selectFrameTime = function(p6, List)
		local v3 = nil
		local v4 = 1e999
		
		for _, value in List do
			local Magnitude = math.abs(value - p6)
			
			if Magnitude < v4 then
				v4 = Magnitude
				v3 = value
			end
		end
		return v3
	end,
	defaultConfig = {
		granularity = 0.2,
		predictionLead = 0.4,
		maxLeadFraction = 0.2,
		maxSamples = 40,
		bands = {
			{ radius = 1, stride = 1 },
			{ radius = 3, stride = 3 },
			{ radius = 8, stride = 8 }
		}
	}
}