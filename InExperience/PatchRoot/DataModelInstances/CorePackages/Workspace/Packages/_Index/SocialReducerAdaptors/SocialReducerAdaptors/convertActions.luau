local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p0, p1, p2)
	-- upvalues: llama (ref)
	return function(p3, p4)
		-- upvalues: p2 (ref), p1 (ref), llama (copy), p0 (ref)
		p3 = p3 or p2
		local list = { p4 }
		local type = p1[p4.type]
		
		if type then
			list = type(p4)
		end
		return llama.List.reduce(list, p0, p3)
	end
end