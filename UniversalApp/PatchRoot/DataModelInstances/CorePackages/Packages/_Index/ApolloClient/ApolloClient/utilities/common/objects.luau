return {
	isNonNullObject = function(p1): boolean --[[ Line: 9 ]]
		return p1 ~= nil and type(p1) == "table"
	end
}