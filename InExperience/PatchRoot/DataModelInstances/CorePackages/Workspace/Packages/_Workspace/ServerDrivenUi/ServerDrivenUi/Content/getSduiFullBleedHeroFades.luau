local function _(Value: number, p1: number): number
	return math.clamp(Value, 0, 1) ^ p1
end

local function buildTransparencySequence(Callback): NumberSequence
	local List = {}
	
	for i = 0, 19 do
		local IRatio = i / 19
		table.insert(List, NumberSequenceKeypoint.new(IRatio, 1 - Callback(IRatio)))
	end
	return NumberSequence.new(List)
end

local _ = function(p1: number, p2)
	return if p1 == nil or p1 ~= p1 or p1 <= 0 or p1 == 1e999 then p2 else p1
end

return function(p1: number, p2: number)
	-- upvalues: buildTransparencySequence (copy)
	local v1 = if p1 == nil or p1 ~= p1 or p1 <= 0 or p1 == 1e999 then 2.5 else p1
	local v2 = if p2 == nil or p2 ~= p2 or p2 <= 0 or p2 == 1e999 then 1.5 else p2
	
	return {
		bottomFadeTransparency = buildTransparencySequence(function(Value: number): number
			-- upvalues: v1 (copy)
			return math.clamp(Value, 0, 1) ^ v1
		end),
		cornerScrimTransparency = buildTransparencySequence(function(p3: number): number
			-- upvalues: v2 (copy)
			return math.clamp(1 - p3, 0, 1) ^ v2
		end)
	}
end