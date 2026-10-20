local CreateReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1)
	-- upvalues: CreateReducerSliceModule (copy)
	return CreateReducerSliceModule("byGameId", "universeId", p1)
end