local t = {}

return {
	add = function(Key) --[[ Line: 19 ]]
		-- upvalues: t (ref)
		t[Key] = true
	end,
	remove = function(Key) --[[ Line: 23 ]]
		-- upvalues: t (ref)
		t[Key] = nil
	end,
	has = function(p1): boolean --[[ Line: 27 ]]
		-- upvalues: t (ref)
		return t[p1] == true
	end,
	clear = function() --[[ Line: 31 ]]
		-- upvalues: t (ref)
		t = {}
	end
}