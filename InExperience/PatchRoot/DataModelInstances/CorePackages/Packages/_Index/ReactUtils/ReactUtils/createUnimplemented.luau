return function(p0)
	return function()
		-- upvalues: p0 (ref)
		error(`Calling unimplemented function {p0}`)
	end
end