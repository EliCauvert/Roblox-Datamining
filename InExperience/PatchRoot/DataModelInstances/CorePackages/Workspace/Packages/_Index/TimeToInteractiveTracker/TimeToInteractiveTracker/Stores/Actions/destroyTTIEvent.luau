local _ = require(script.Parent.Parent.types)

return function(Callback) --[[ Line: 7 ]]
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: Callback (copy)
		Callback(function(Tbl) --[[ Line: 9 ]]
			-- upvalues: p1 (copy)
			if Tbl[p1] == nil then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[p1] = nil
				
				return Copy
			end
		end)
	end
end