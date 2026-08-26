local t = {
	WidgetItems = "WidgetItems",
	UnifiedImpressions = "UnifiedImpressions"
}
local t_1 = {}

local function _(p1)
	-- upvalues: t_1 (ref)
	if not t_1[p1] then
		t_1[p1] = {}
	end
	return t_1[p1]
end

return {
	Category = t,
	hasSeen = function(p1, p2)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		return var1 ~= nil and var1[p2] == true
	end,
	markSeen = function(p1, p2)
		-- upvalues: t_1 (ref)
		if not t_1[p1] then
			t_1[p1] = {}
		end
		t_1[p1][p2] = true
	end,
	clearCategory = function(p1)
		-- upvalues: t_1 (ref)
		t_1[p1] = nil
	end,
	clear = function()
		-- upvalues: t_1 (ref)
		table.clear(t_1)
	end
}