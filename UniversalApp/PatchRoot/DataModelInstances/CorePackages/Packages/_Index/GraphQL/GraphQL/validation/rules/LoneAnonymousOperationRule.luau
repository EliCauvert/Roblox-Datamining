local Parent = script.Parent.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Kind = require(Parent.language.kinds).Kind

return {
	LoneAnonymousOperationRule = function(p1) --[[ Line: 26 ]]
		-- upvalues: Array (copy), Kind (copy), GraphQLError (copy)
		local Count = 0
		
		return {
			Document = function(_, p2) --[[ Line: 29 ]]
				-- upvalues: Count (ref), Array (upval), Kind (upval)
				Count = #Array.filter(p2.definitions, function(p3): boolean --[[ Line: 30 ]]
					-- upvalues: Kind (upval)
					return p3.kind == Kind.OPERATION_DEFINITION
				end)
			end,
			OperationDefinition = function(_, p2) --[[ Line: 34 ]]
				-- upvalues: Count (ref), p1 (copy), GraphQLError (upval)
				if not p2.name and Count > 1 then
					p1:reportError(GraphQLError.new("This anonymous operation must be the only defined operation.", p2))
				end
			end
		}
	end
}