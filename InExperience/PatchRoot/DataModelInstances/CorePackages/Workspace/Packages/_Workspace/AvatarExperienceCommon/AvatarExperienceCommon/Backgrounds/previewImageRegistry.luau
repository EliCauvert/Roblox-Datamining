local t = {}

return {
	register = function(Key, p1)
		-- upvalues: t (ref)
		t[Key] = p1
	end,
	resolve = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	destroy = function(Key)
		-- upvalues: t (ref)
		local Entry = t[Key]
		
		if Entry then
			t[Key] = nil
			Entry:Destroy()
		end
	end,
	clear = function()
		-- upvalues: t (ref)
		local t1 = t
		t = {}
		
		for _, value in t1 do
			value:Destroy()
		end
	end
}