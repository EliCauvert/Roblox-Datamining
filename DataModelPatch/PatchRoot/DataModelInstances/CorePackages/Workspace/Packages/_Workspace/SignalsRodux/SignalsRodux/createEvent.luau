return function()
	local Tbl = {}
	
	return function(Key)
		-- upvalues: Tbl (copy)
		Tbl[Key] = true
		
		return function()
			-- upvalues: Tbl (upval), Key (copy)
			Tbl[Key] = nil
		end
	end, function(...)
		-- upvalues: Tbl (copy)
		for i in table.clone(Tbl) do
			i(...)
		end
	end
end