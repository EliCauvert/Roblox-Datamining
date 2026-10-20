local Tbl = {}

local function _(Key)
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
	hasSeen = function(p1, p2): boolean
		-- upvalues: Tbl (copy)
		local Entry = Tbl[p1]
		
		return Entry ~= nil and Entry[p2] == true
	end,
	markSeen = function(Key, p1)
		-- upvalues: Tbl (copy)
		if not Tbl[Key] then
			Tbl[Key] = {}
		end
		Tbl[Key][p1] = true
	end,
	clearCategory = function(Key)
		-- upvalues: Tbl (copy)
		Tbl[Key] = nil
	end,
	clear = function()
		-- upvalues: Tbl (copy)
		table.clear(Tbl)
	end
}