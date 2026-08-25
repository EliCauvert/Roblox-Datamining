local parent = script.Parent.Parent
local devAssert = require(parent.jsutils.devAssert).devAssert
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local var0 = nil
local _ = nil

return {
	assertValidName = function(p0)
		-- upvalues: var0 (write)
		local var1 = var0(p0)
		
		if var1 then
			error(var1)
		end
		return p0
	end,
	isValidNameError = function(p1)
		-- upvalues: devAssert (ref), graphQLError (ref)
		devAssert(type(p1) == "string", "Expected name to be a string.")
		
		if string.len(p1) > 1 and p1:sub(1, 1) == "_" and p1:sub(2, 2) == "_" then
			return graphQLError.new("Name \"" .. p1 .. "\" must not begin with \"__\", which is reserved by GraphQL introspection.")
		end
		local matchIndex, matchIndex_1 = string.find(p1, "[_%a][_%a%d]*")
		
		return if matchIndex == 1 and string.len(p1) == matchIndex_1 then nil else graphQLError.new("Names must match [_%a][_%a%d]* but \"" .. p1 .. "\" does not.")
	end
}