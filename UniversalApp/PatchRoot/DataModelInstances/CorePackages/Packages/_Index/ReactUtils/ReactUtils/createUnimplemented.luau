return function(p1)
	return function()
		-- upvalues: p1 (ref)
		error(`Calling unimplemented function {p0}`)
	end
end