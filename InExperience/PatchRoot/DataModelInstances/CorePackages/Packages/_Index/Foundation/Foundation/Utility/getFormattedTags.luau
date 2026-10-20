local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(List)
	if List ~= nil then
		if typeof(List) == "table" then
			local List1 = {}
			
			for i, value in List do
				if value then
					table.insert(List1, i)
				end
			end
			return table.concat(List1, " ")
		else
			if typeof(List) == "string" then
				return List
			end
			assert(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(List))
		end
	end
	return nil
end