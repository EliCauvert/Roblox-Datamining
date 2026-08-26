local createReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1)
	-- upvalues: createReducerSliceModule (ref)
	return createReducerSliceModule("byPlaceId", "placeId", p1)
end