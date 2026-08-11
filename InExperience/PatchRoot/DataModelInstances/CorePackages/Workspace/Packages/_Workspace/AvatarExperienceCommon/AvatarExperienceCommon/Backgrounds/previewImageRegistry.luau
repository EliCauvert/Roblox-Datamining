local t = {}

return {
	register = function(p0, p1) --[[ line: 5 ]]
		-- upvalues: t (write)
		t[p0] = p1
	end,
	resolve = function(p2) --[[ line: 9 ]]
		-- upvalues: t (write)
		return t[p2]
	end,
	destroy = function(p3) --[[ line: 13 ]]
		-- upvalues: t (write)
		local var1 = t[p3]
		
		if var1 then
			t[p3] = nil
			var1:Destroy()
		end
	end,
	clear = function() --[[ line: 21 ]]
		-- upvalues: t (write)
		t = {}
		
		for i, v in t do
			v:Destroy()
		end
	end
}