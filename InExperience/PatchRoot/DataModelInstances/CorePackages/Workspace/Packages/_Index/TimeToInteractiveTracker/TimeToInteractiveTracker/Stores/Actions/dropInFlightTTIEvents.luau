local _ = require(script.Parent.Parent.types)

return function(Callback)
	return function()
		-- upvalues: Callback (copy)
		local List = {}
		Callback(function(List1)
			-- upvalues: List (copy)
			local t = {}
			
			for i, value in List1 do
				if value and (value.startTime == nil or value.sent == true) then
					t[i] = value
				else
					table.insert(List, i)
				end
			end
			return t
		end)
		
		return List
	end
end