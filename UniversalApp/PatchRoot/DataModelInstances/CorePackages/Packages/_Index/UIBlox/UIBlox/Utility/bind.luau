return function(Callback, p1)
	return function(p2, ...)
		-- upvalues: p1 (copy), Callback (copy)
		return if p2 == p1 then Callback(p1, ...) else Callback(p1, p2, ...)
	end
end