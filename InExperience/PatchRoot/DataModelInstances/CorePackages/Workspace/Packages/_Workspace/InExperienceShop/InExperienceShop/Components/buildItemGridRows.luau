local _ = require(script.Parent.Parent.Types)

local function _(p1, p2, Callback): number --[[ Line: 8 | Named "getItemSlotCost" ]]
	return if Callback(p1, p2) then 2 else 1
end

local function buildUniformRows(p1, p2: number) --[[ Line: 19 ]]
	local List = {}
	
	for i = 1, #p1, p2 do
		local t = {}
		table.move(p1, i, math.min(i + p2 - 1, #p1), 1, t)
		table.insert(List, t)
	end
	return List
end

return {
	ROBUX_TILE_SLOT_COST = 2,
	buildItemGridRows = function(p3, p4, Callback) --[[ Line: 33 ]]
		-- upvalues: buildUniformRows (copy)
		if Callback == nil then
			return (buildUniformRows(p3, p4))
		end
		local List = {}
		local Count = 1
		while Count <= #p3 do
			local List1 = {}
			local Total = 0
			local Count1 = 1
			while Count <= #p3 do
				local v1 = p3[Count]
				local Amount: number = if Callback(v1, Count1) then 2 else 1
				local v2: boolean = p4 < Total + Amount and #List1 > 0
				
				if not v2 then
					table.insert(List1, v1)
					Total += Amount
					Count += 1
					Count1 += 1
					v2 = p4 <= Total
				end
				if v2 then break end
			end
			table.insert(List, List1)
		end
		return List
	end
}