local _ = require(script.Parent.Parent.Types)

local function _(p0, p1, p2) --[[ line: 8 | named "getItemSlotCost" ]]
	return if p2(p0, p1) then 2 else 1
end

local function buildUniformRows(p3, p4) --[[ line: 19 ]]
	local t = {}
	
	for i = 1, #p3, p4 do
		local t_1 = {}
		table.move(p3, i, math.min(i + p4 - 1, #p3), 1, t_1)
		table.insert(t, t_1)
	end
	return t
end

return {
	ROBUX_TILE_SLOT_COST = 2,
	buildItemGridRows = function(p5, p6, p7) --[[ line: 33 ]]
		-- upvalues: buildUniformRows (ref)
		if p7 == nil then
			return buildUniformRows(p5, p6)
		end
		local t = {}
		local var4 = 1
		while var4 <= #p5 do
			local t_1 = {}
			local var6 = 0
			local var7 = 1
			repeat
				if var4 > #p5 then break end
				local var8 = p5[var4]
				local var9 = if p7(var8, var7) then 2 else 1
				
				if p6 < var6 + var9 and #t_1 > 0 then break end
				table.insert(t_1, var8)
				var6 += var9
				var4 += 1
				var7 += 1
			until p6 > var6
			table.insert(t, t_1)
		end
		return t
	end
}