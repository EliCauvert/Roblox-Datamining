-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local isExecutableDefinitionNode = require(language.predicates).isExecutableDefinitionNode

return {
	ExecutableDefinitionsRule = function(p0) --[[ line: 23 ]]
		-- upvalues: isExecutableDefinitionNode (ref), kind (ref), graphQLError (ref)
		return {
			Document = function(_, p1) --[[ line: 25 ]]
				-- upvalues: isExecutableDefinitionNode (copy), kind (copy), p0 (ref), graphQLError (copy)
				for i, v in ipairs(p1.definitions) do
					if not isExecutableDefinitionNode(v) then
						local _ = nil
						p0:reportError(graphQLError.new(("The %s definition is not executable."):format(if v.kind == kind.SCHEMA_DEFINITION or v.kind == kind.SCHEMA_EXTENSION then "schema" else "\"" .. v.name.value .. "\""), v))
					end
				end
				return false
			end
		}
	end
}