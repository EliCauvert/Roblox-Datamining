local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p0)
	if p0 ~= nil then
		if typeof(p0) == "table" then
			local t = {}
			
			for i, v in p0 do
				if v then
					table.insert(t, i)
				end
			end
			return table.concat(t, " ")
		elseif typeof(p0) == "string" then
			return p0
		end
		assert(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(p0))
	end
	return nil
end