return {
	isNonNullObject = function(p0) --[[ line: 9 ]]
		return p0 ~= nil and type(p0) == "table"
	end
}