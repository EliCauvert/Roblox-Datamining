local Tbl = {}

local function _(Key) --[[ Line: 20 | Named "getOrCreateCategory" ]]
	-- upvalues: Tbl (copy)
	if not Tbl[Key] then
		Tbl[Key] = {}
	end
	return Tbl[Key]
end

return {
	Category = {
		WidgetItems = "WidgetItems",
		UnifiedImpressions = "UnifiedImpressions"
	},
	hasSeen = function(p1, p2): boolean --[[ Line: 27 ]]
		-- upvalues: Tbl (copy)
		local Entry = Tbl[p1]
		
		return Entry ~= nil and Entry[p2] == true
	end,
	markSeen = function(Key, p1) --[[ Line: 32 ]]
		-- upvalues: Tbl (copy)
		if not Tbl[Key] then
			Tbl[Key] = {}
		end
		Tbl[Key][p1] = true
	end,
	clearCategory = function(Key) --[[ Line: 36 ]]
		-- upvalues: Tbl (copy)
		Tbl[Key] = nil
	end,
	clear = function() --[[ Line: 40 ]]
		-- upvalues: Tbl (copy)
		table.clear(Tbl)
	end
}