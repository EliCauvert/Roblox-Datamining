return function(p1)
	return function()
		-- upvalues: p1 (copy)
		error(`Calling unimplemented function {p0}`)
	end
end