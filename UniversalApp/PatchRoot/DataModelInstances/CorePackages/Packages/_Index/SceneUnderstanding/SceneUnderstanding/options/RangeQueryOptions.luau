local config = { maxDistance = 100, limit = 1e999 }

return {
	new = function(List) --[[ Line: 30 ]]
		-- upvalues: config (copy)
		local Copy = table.clone(config)
		
		if List then
			for i, value in List do
				Copy[i] = value
			end
		end
		return Copy
	end
}