local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local IsExecutableDefinitionNodeFunction = require(Language.predicates).isExecutableDefinitionNode

return {
	ExecutableDefinitionsRule = function(p1) --[[ Line: 23 ]]
		-- upvalues: IsExecutableDefinitionNodeFunction (copy), Kind (copy), GraphQLError (copy)
		return {
			Document = function(_, p2): boolean --[[ Line: 25 ]]
				-- upvalues: IsExecutableDefinitionNodeFunction (upval), Kind (upval), p1 (copy), GraphQLError (upval)
				for _, definition in ipairs(p2.definitions) do
					if not IsExecutableDefinitionNodeFunction(definition) then
						p1:reportError(GraphQLError.new(("The %s definition is not executable."):format(if definition.kind == Kind.SCHEMA_DEFINITION or definition.kind == Kind.SCHEMA_EXTENSION then "schema" else "\"" .. definition.name.value .. "\""), definition))
					end
				end
				return false
			end
		}
	end
}