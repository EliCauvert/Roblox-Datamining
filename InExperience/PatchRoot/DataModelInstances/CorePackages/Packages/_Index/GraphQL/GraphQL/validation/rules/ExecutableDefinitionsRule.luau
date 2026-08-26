local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local isExecutableDefinitionNode = require(language.predicates).isExecutableDefinitionNode

return {
	ExecutableDefinitionsRule = function(p1)
		-- upvalues: isExecutableDefinitionNode (ref), kind (ref), graphQLError (ref)
		return {
			Document = function(_, p2)
				-- upvalues: isExecutableDefinitionNode (copy), kind (copy), p1 (ref), graphQLError (copy)
				for i, v in ipairs(p2.definitions) do
					if not isExecutableDefinitionNode(v) then
						local _ = nil
						p1:reportError(graphQLError.new(("The %s definition is not executable."):format(if v.kind == kind.SCHEMA_DEFINITION or v.kind == kind.SCHEMA_EXTENSION then "schema" else "\"" .. v.name.value .. "\""), v))
					end
				end
				return false
			end
		}
	end
}