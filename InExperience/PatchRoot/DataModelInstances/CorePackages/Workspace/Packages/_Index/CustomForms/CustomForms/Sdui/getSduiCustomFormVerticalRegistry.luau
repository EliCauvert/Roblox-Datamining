local function createSduiCustomFormVerticalRegistry()
	local Tbl = {}
	
	return {
		getVertical = function(p1)
			-- upvalues: Tbl (copy)
			return Tbl[p1]
		end,
		registerVertical = function(Key, p1)
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		debug_clear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiCustomFormVerticalRegistry (copy)
	if v1 == nil then
		v1 = createSduiCustomFormVerticalRegistry()
	end
	return v1
end