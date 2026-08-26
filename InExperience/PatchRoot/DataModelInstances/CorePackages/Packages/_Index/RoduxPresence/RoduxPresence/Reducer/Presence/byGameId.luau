local createReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1)
	-- upvalues: createReducerSliceModule (ref)
	return createReducerSliceModule("byGameId", "universeId", p1)
end