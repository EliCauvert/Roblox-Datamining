local createReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p0) --[[ line: 2 ]]
	-- upvalues: createReducerSliceModule (ref)
	return createReducerSliceModule("byGameId", "universeId", p0)
end