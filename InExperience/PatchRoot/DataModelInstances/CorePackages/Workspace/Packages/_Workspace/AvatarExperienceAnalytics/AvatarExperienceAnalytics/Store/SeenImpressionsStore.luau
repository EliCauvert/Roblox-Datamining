local t = {
	WidgetItems = "WidgetItems",
	UnifiedImpressions = "UnifiedImpressions"
}
local t_1 = {}

local function _(p0) --[[ line: 20 | named "getOrCreateCategory" ]]
	-- upvalues: t_1 (ref)
	if not t_1[p0] then
		t_1[p0] = {}
	end
	return t_1[p0]
end

return {
	Category = t,
	hasSeen = function(p1, p2) --[[ line: 27 ]]
		-- upvalues: t_1 (ref)
		local var2 = t_1[p1]
		
		return var2 ~= nil and var2[p2] == true
	end,
	markSeen = function(p3, p4) --[[ line: 32 ]]
		-- upvalues: t_1 (ref)
		if not t_1[p3] then
			t_1[p3] = {}
		end
		t_1[p3][p4] = true
	end,
	clearCategory = function(p5) --[[ line: 36 ]]
		-- upvalues: t_1 (ref)
		t_1[p5] = nil
	end,
	clear = function() --[[ line: 40 ]]
		-- upvalues: t_1 (ref)
		table.clear(t_1)
	end
}