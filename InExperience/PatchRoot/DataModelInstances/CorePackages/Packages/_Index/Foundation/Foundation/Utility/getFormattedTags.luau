local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p1)
	if p1 ~= nil then
		if typeof(p1) == "table" then
			local t = {}
			
			for i, v in p1 do
				if v then
					table.insert(t, i)
				end
			end
			return table.concat(t, " ")
		elseif typeof(p1) == "string" then
			return p1
		end
		assert(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(p1))
	end
	return nil
end