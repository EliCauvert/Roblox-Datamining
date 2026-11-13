--!native

local _ = require("./easing")

local function _(p1: number, p2, p3): number
	local v1 = 1 - p1
	
	return v1 * 3 * v1 * p1 * p2 + v1 * 3 * p1 * p1 * p3 + p1 * p1 * p1
end

return function(p1: number, p2, p3: number, p4)
	for _, value in { p1, p2, p3, p4 } do
		assert(value == value and math.abs(value) < 1e999, "Compose cubicBezier needs finite control points")
	end
	assert(p1 >= 0 and (p1 <= 1 and p3 >= 0) and p3 <= 1, "Compose cubicBezier x control points must be in [0, 1]")
	
	return function(p5: number): number
		-- upvalues: p1 (copy), p3 (copy), p2 (copy), p4 (copy)
		if p5 <= 0 then
			return 0
		end
		if p5 >= 1 then
			return 1
		end
		local v1 = 0
		local v2 = 1
		local v3 = nil
		
		for _ = 1, 40 do
			v3 = (v1 + v2) / 2
			local v4 = 1 - v3
			local v5 = v4 * 3 * v4 * v3 * p1 + v4 * 3 * v3 * v3 * p3 + v3 * v3 * v3
			
			if v5 == p5 then
				local v6 = 1 - v3
				
				return v6 * 3 * v6 * v3 * p2 + v6 * 3 * v3 * v3 * p4 + v3 * v3 * v3
			end
			if v5 < p5 then
				v1 = v3
			else
				v2 = v3
			end
		end
		local v7 = (v1 + v2) / 2
		local v8 = 1 - v7
		
		return v8 * 3 * v8 * v7 * p2 + v8 * 3 * v7 * v7 * p4 + v7 * v7 * v7
	end
end