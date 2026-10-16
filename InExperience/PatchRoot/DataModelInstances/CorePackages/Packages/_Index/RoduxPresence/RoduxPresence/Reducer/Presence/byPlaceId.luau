local CreateReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p1) --[[ Line: 2 ]]
	-- upvalues: CreateReducerSliceModule (copy)
	return CreateReducerSliceModule("byPlaceId", "placeId", p1)
end