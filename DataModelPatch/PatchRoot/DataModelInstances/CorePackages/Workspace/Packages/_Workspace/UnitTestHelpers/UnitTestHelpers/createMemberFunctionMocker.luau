local Jest = require(script.Parent.Parent.JestGlobals).jest

return function(p1)
	-- upvalues: Jest (copy)
	local List = {}
	local Meta = getmetatable(p1)
	
	return function(Key)
		-- upvalues: Meta (copy), Jest (upval), List (copy)
		local Entry = Meta[Key]
		local FnResult = Jest.fn()
		Meta[Key] = FnResult
		table.insert(List, function()
			-- upvalues: Meta (upval), Key (copy), Entry (copy)
			Meta[Key] = Entry
		end)
		
		return FnResult
	end, function()
		-- upvalues: List (copy)
		for i = #List, 1, -1 do
			List[i]()
		end
		table.clear(List)
	end
end