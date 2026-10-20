local _ = require(script.Parent.Parent.types)

return function(Callback)
	return function(p1)
		-- upvalues: Callback (copy)
		Callback(function(Tbl)
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