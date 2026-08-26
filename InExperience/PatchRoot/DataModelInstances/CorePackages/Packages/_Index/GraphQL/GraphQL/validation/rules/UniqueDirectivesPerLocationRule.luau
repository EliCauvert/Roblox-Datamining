local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local predicatesModule = require(language.predicates)
local isTypeDefinitionNode = predicatesModule.isTypeDefinitionNode
local isTypeExtensionNode = predicatesModule.isTypeExtensionNode
local specifiedDirectives = require(parent.type.directives).specifiedDirectives

return {
	UniqueDirectivesPerLocationRule = function(p1)
		-- upvalues: specifiedDirectives (ref), kind (ref), isTypeDefinitionNode (ref), isTypeExtensionNode (ref), graphQLError (ref)
		local t = {}
		local schema = p1:getSchema()
		
		for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
			t[v.name] = not v.isRepeatable
		end
		for i_1, v_1 in ipairs(p1:getDocument().definitions) do
			if v_1.kind == kind.DIRECTIVE_DEFINITION then
				t[v_1.name.value] = not v_1.repeatable
			end
		end
		local t_1 = {}
		local t_2 = {}
		
		return {
			enter = function(_, p2)
				-- upvalues: kind (copy), t_1 (ref), isTypeDefinitionNode (copy), isTypeExtensionNode (copy), t_2 (ref), t (ref), p1 (ref), graphQLError (copy)
				if p2.directives == nil then return end
				local t_3
				local _ = nil
				
				if p2.kind == kind.SCHEMA_DEFINITION or p2.kind == kind.SCHEMA_EXTENSION then
					t_3 = t_1
				elseif isTypeDefinitionNode(p2) or isTypeExtensionNode(p2) then
					local value = p2.name.value
					t_3 = t_2[value]
					
					if t_3 == nil then
						t_3 = {}
						t_2[value] = t_3
					end
				else
					t_3 = {}
				end
				for i, v in ipairs(p2.directives) do
					local value = v.name.value
					
					if t[value] then
						if t_3[value] then
							p1:reportError(graphQLError.new(("The directive \"@%s\" can only be used once at this location."):format(value), { t_3[value], v }))
						else
							t_3[value] = v
						end
					end
				end
			end
		}
	end
}