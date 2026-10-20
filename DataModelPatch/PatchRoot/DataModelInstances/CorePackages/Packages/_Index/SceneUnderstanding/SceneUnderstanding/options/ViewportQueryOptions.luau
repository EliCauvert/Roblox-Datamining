local config = {
	maxDistance = 5000,
	maxScreenDivisions = 16,
	limit = 1e999
}

return {
	new = function(List)
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