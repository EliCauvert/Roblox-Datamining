return function(p0) --[[ line: 2 | named "createUnimplemented" ]]
	return function() --[[ line: 3 ]]
		-- upvalues: p0 (ref)
		error(`Calling unimplemented function {p0}`)
	end
end