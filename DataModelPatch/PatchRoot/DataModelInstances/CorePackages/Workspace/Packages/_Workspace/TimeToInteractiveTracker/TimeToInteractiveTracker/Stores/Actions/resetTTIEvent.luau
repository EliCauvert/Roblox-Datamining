local _ = require(script.Parent.Parent.types)

return function(Callback)
	return function(p1)
		-- upvalues: Callback (copy)
		Callback(function(Tbl)
			-- upvalues: p1 (copy)
			local Entry = Tbl[p1]
			
			if Entry == nil then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[p1] = {
					startTime = nil,
					endTime = nil,
					deltaMs = nil,
					sent = nil,
					metadata = table.clone(Entry.metadata)
				}
				
				return Copy
			end
		end)
	end
end