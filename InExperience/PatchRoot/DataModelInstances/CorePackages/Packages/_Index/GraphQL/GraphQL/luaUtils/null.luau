return (setmetatable({ __NULL_IDENTIFIER__ = "__GRAPHQL_NULL_OBJECT__" }, {
	__metatable = false,
	__newindex = function(_, p1, _) --[[ Line: 7 ]]
		error(("%q (%s) is not a valid member of %s"):format(tostring(p1), typeof(p1), "null"), 2)
	end,
	__tostring = function(): string --[[ Line: 17 ]]
		return "null"
	end
}))