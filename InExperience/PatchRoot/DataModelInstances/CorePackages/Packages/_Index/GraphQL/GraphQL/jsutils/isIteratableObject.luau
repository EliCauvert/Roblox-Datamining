return {
	isIteratableObject = function(p1): boolean --[[ Line: 27 ]]
		return typeof(p1) == "table" and (next(p1) == nil or #p1 ~= 0)
	end
}