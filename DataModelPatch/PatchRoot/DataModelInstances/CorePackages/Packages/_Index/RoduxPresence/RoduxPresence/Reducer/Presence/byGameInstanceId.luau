local CreateReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1)
	-- upvalues: CreateReducerSliceModule (copy)
	return CreateReducerSliceModule("byGameInstanceId", "gameId", p1)
end