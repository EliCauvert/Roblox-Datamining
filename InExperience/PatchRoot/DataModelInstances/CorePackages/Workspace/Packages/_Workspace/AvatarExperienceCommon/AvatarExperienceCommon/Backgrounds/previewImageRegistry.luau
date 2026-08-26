local t = {}

return {
	register = function(p1, p2)
		-- upvalues: t (write)
		t[p1] = p2
	end,
	resolve = function(p1)
		-- upvalues: t (write)
		return t[p1]
	end,
	destroy = function(p1)
		-- upvalues: t (write)
		local var1 = t[p1]
		
		if var1 then
			t[p1] = nil
			var1:Destroy()
		end
	end,
	clear = function()
		-- upvalues: t (write)
		t = {}
		
		for i, v in t do
			v:Destroy()
		end
	end
}