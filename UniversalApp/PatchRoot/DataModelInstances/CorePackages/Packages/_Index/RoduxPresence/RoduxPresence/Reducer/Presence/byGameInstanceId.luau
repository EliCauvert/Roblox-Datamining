local createReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1)
	-- upvalues: createReducerSliceModule (ref)
	return createReducerSliceModule("byGameInstanceId", "gameId", p1)
end