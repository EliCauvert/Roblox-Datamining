local config = {
	MAX_CONTROL_POINTS = 100,
	arc = function(p1, Value: number, p2)
		local Segments = p2 and p2.segments or math.max(2, (math.ceil(math.abs(Value) / 45)))
		assert(Segments + 1 <= 100, "path_shapes.arc: segment count exceeds the engine's 100-point limit")
		local v1 = 0.5 * (p2 and p2.radius or 1)
		local ClampedValue = math.clamp(Value, -360, 360)
		local ScaledTangent = math.tan(math.abs((math.rad(ClampedValue / Segments))) / 4) * 1.3333333333333333 * v1
		local v2: number = if ClampedValue >= 0 then 1 else -1
		local List = {}
		
		for i = 0, Segments do
			local Radians = math.rad(p1 + ClampedValue * (i / Segments))
			local ScaledCosine = math.cos(Radians) * v2
			local ScaledSine = math.sin(Radians) * v2
			table.insert(List, {
				x = 0.5 + v1 * math.sin(Radians),
				y = 0.5 - v1 * math.cos(Radians),
				inX = -ScaledCosine * ScaledTangent,
				inY = -ScaledSine * ScaledTangent,
				outX = ScaledCosine * ScaledTangent,
				outY = ScaledSine * ScaledTangent
			})
		end
		return List
	end
}

function config.ring(p3)
	-- upvalues: config (copy)
	return config.arc(0, 360, { segments = 8, radius = p3 and p3.radius })
end

function config.needle(Degrees: number, p3)
	local v3 = 0.5 * (p3 and p3.radius or 1)
	local v4 = 0.5 * (p3 and p3.innerRadius or 0)
	local Radians = math.rad(Degrees)
	
	local function _(p4)
		-- upvalues: Radians (copy)
		return {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = p4 * math.sin(Radians) + 0.5,
			y = 0.5 - p4 * math.cos(Radians)
		}
	end
	
	return {
		{
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v4 * math.sin(Radians) + 0.5,
			y = 0.5 - v4 * math.cos(Radians)
		},
		{
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v3 * math.sin(Radians) + 0.5,
			y = 0.5 - v3 * math.cos(Radians)
		}
	}
end

return table.freeze(config)