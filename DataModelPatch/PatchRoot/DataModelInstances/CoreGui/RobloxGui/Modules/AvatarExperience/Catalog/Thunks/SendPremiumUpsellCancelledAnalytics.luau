return function(Callback, p1, p2)
	return function(_)
		-- upvalues: Callback (copy), p1 (copy), p2 (copy)
		Callback(p1, p2)
	end
end