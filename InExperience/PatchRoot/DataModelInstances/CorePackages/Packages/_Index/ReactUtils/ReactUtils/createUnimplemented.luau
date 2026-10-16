return function(p1) --[[ Line: 2 | Named "createUnimplemented" ]]
	return function() --[[ Line: 3 ]]
		-- upvalues: p1 (copy)
		error(`Calling unimplemented function {p0}`)
	end
end