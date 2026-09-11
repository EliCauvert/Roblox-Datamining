local t = {}

return {
	add = function(p1)
		-- upvalues: t (write)
		t[p1] = true
	end,
	remove = function(p1)
		-- upvalues: t (write)
		t[p1] = nil
	end,
	has = function(p1)
		-- upvalues: t (write)
		return t[p1] == true
	end,
	clear = function()
		-- upvalues: t (write)
		t = {}
	end
}