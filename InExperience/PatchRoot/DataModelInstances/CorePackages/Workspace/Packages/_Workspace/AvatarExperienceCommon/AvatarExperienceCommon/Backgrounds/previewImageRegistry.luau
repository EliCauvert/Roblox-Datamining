local t = {}

return {
	register = function(Key, p1) --[[ Line: 5 ]]
		-- upvalues: t (ref)
		t[Key] = p1
	end,
	resolve = function(p1) --[[ Line: 9 ]]
		-- upvalues: t (ref)
		return t[p1]
	end,
	destroy = function(Key) --[[ Line: 13 ]]
		-- upvalues: t (ref)
		local Entry = t[Key]
		
		if Entry then
			t[Key] = nil
			Entry:Destroy()
		end
	end,
	clear = function() --[[ Line: 21 ]]
		-- upvalues: t (ref)
		local t1 = t
		t = {}
		
		for _, value in t1 do
			value:Destroy()
		end
	end
}