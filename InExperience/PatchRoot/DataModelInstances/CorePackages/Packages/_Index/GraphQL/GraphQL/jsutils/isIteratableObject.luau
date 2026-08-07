return {
	isIteratableObject = function(p0) --[[ line: 27 ]]
		return typeof(p0) == "table" and (next(p0) == nil or #p0 ~= 0)
	end
}