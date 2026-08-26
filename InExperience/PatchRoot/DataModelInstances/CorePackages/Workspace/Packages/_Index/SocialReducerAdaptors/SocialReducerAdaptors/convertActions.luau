local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1, p2, p3)
	-- upvalues: llama (ref)
	return function(p4, p5)
		-- upvalues: p3 (ref), p2 (ref), llama (copy), p1 (ref)
		p4 = p4 or p3
		local list = { p5 }
		local type = p2[p5.type]
		
		if type then
			list = type(p5)
		end
		return llama.List.reduce(list, p1, p4)
	end
end