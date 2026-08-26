local parent = script.Parent.Parent
local devAssert = require(parent.jsutils.devAssert).devAssert
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local var1 = nil
local _ = nil

return {
	assertValidName = function(p1)
		-- upvalues: var1 (write)
		local var2 = var1(p1)
		
		if var2 then
			error(var2)
		end
		return p1
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