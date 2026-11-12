local _ = require(script.Parent.ItemAnchors)
local ItemVisibilityModule = require(script.Parent.ItemVisibility)
local config = { purchasable = 3, resale = 3, owned = 2, unavailable = 1 }

return {
	APPEAR_WEIGHT = 0.45,
	KEEP_WEIGHT = 0.3,
	PIN_WEIGHT = 0.15,
	viewCoverage = function(List): number
		-- upvalues: ItemVisibilityModule (copy)
		local Count = 0
		
		for i = 0, 71 do
			local Angle = i / 72 * 2 * 3.141592653589793
			local _Vector3 = Vector3.new(math.sin(Angle), 0, -math.cos(Angle))
			local Largest = 0
			
			for _, value in List do
				Largest = math.max(Largest, ItemVisibilityModule.facingWeight(value, CFrame.identity, _Vector3, vector.create(0, 0, 0)))
			end
			if Largest >= 0.6 then
				Count += 1
			end
		end
		return Count / 72
	end,
	priceRanks = function(List)
		local List1 = {}
		local t = {}
		
		for _, value in List do
			if not t[value] then
				t[value] = true
				table.insert(List1, value)
			end
		end
		table.sort(List1)
		local t1 = {}
		
		for i, value1 in List1 do
			t1[value1] = i - 1
		end
		local t2 = {}
		
		for i1, value2 in List do
			t2[i1] = t1[value2]
		end
		return t2
	end,
	score = function(p1, p2, p3: number, p4: number): number
		-- upvalues: config (copy)
		return config[p2] * 10000 + p4 * 2 + p1 * ((1 - p3) * 0.8 + 1)
	end,
	isLastResort = function(p1): boolean
		return p1 == "unavailable"
	end,
	isEligible = function(p1: number, p2, p3): boolean
		return if p3 then p1 > 0.15 else (if p2 then 0.3 else 0.45) <= p1
	end
}