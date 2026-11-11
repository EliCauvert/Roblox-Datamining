local Llama = require(script:FindFirstAncestor("FriendsLanding").dependencies).llama

return function(p1, p2, p3)
	-- upvalues: Llama (copy)
	return function(p4, p5)
		-- upvalues: p3 (copy), p2 (copy), Llama (upval), p1 (copy)
		local P3 = p4 or p3
		local list = { p5 }
		local Callback = p2[p5.type]
		
		if Callback then
			list = Callback(p5)
		end
		return Llama.List.reduce(list, p1, P3)
	end
end