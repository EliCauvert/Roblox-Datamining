return function()
	local Tbl = {}
	
	return {
		isPlaceRefused = function(p1): boolean
			-- upvalues: Tbl (copy)
			return Tbl[p1] == true
		end,
		markPlaceRefused = function(Key)
			-- upvalues: Tbl (copy)
			Tbl[Key] = true
		end,
		reset = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end
	}
end