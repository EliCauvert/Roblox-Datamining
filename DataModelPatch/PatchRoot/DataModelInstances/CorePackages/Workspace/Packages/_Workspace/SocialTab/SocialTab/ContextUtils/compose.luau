local Llama = require(script:FindFirstAncestor("SocialTab").dependencies).llama

return function(...)
	-- upvalues: Llama (copy)
	local list = { ... }
	
	return function(p1)
		-- upvalues: Llama (upval), list (copy)
		return Llama.List.reduceRight(list, function(p2, Callback)
			return Callback(p2)
		end, p1)
	end
end