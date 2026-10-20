local Parent = script.Parent.Parent
local DevAssertFunction = require(Parent.jsutils.devAssert).devAssert
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Callback = nil

local function assertValidName(p1)
	-- upvalues: Callback (ref)
	local CallbackResult = Callback(p1)
	
	if CallbackResult then
		error(CallbackResult)
	end
	return p1
end

Callback = function(Text: string)
	-- upvalues: DevAssertFunction (copy), GraphQLError (copy)
	DevAssertFunction(type(Text) == "string", "Expected name to be a string.")
	
	if string.len(Text) > 1 and Text:sub(1, 1) == "_" and Text:sub(2, 2) == "_" then
		return GraphQLError.new("Name \"" .. Text .. "\" must not begin with \"__\", which is reserved by GraphQL introspection.")
	else
		local StartIndex, EndIndex = string.find(Text, "[_%a][_%a%d]*")
		local IsLengthMatch: boolean = StartIndex == 1 and string.len(Text) == EndIndex
		
		return if IsLengthMatch then nil else GraphQLError.new("Names must match [_%a][_%a%d]* but \"" .. Text .. "\" does not.")
	end
end

return {
	assertValidName = assertValidName,
	isValidNameError = Callback
}