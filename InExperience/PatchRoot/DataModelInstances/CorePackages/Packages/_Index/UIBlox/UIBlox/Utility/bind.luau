return function(Callback, p1) --[[ Line: 7 ]]
	return function(p2, ...) --[[ Line: 8 ]]
		-- upvalues: p1 (copy), Callback (copy)
		return if p2 == p1 then Callback(p1, ...) else Callback(p1, p2, ...)
	end
end