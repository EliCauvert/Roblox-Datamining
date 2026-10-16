local _ = require(script.Parent.Parent.types)

return function(Callback) --[[ Line: 7 ]]
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: Callback (copy)
		Callback(function(Tbl) --[[ Line: 9 ]]
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