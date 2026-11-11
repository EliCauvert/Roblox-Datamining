return {
	isNonNullObject = function(p1): boolean
		return p1 ~= nil and type(p1) == "table"
	end
}