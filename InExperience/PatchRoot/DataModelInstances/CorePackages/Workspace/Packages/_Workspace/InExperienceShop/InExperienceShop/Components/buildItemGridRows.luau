local _ = require(script.Parent.Parent.Types)

local function _(p1, p2, p3)
	return if p3(p1, p2) then 2 else 1
end

local function buildUniformRows(p1, p2)
	local t = {}
	
	for i = 1, #p1, p2 do
		local t_1 = {}
		table.move(p1, i, math.min(i + p2 - 1, #p1), 1, t_1)
		table.insert(t, t_1)
	end
	return t
end

return {
	ROBUX_TILE_SLOT_COST = 2,
	buildItemGridRows = function(p3, p4, p5)
		-- upvalues: buildUniformRows (ref)
		if p5 == nil then
			return buildUniformRows(p3, p4)
		end
		local t = {}
		local var1 = 1
		while var1 <= #p3 do
			local t_1 = {}
			local var2 = 0
			local var3 = 1
			repeat
				if var1 > #p3 then break end
				local var4 = p3[var1]
				local var5 = if p5(var4, var3) then 2 else 1
				
				if p4 < var2 + var5 and #t_1 > 0 then break end
				table.insert(t_1, var4)
				var2 += var5
				var1 += 1
				var3 += 1
			until p4 > var2
			table.insert(t, t_1)
		end
		return t
	end
}