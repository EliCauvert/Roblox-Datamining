local t = {}

return {
	add = function(Key)
		-- upvalues: t (ref)
		t[Key] = true
	end,
	remove = function(Key)
		-- upvalues: t (ref)
		t[Key] = nil
	end,
	has = function(p1): boolean
		-- upvalues: t (ref)
		return t[p1] == true
	end,
	clear = function()
		-- upvalues: t (ref)
		t = {}
	end
}