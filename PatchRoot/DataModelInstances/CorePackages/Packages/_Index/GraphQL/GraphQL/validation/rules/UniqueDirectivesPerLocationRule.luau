-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local predicatesModule = require(language.predicates)
local isTypeDefinitionNode = predicatesModule.isTypeDefinitionNode
local isTypeExtensionNode = predicatesModule.isTypeExtensionNode
local specifiedDirectives = require(parent.type.directives).specifiedDirectives

return {
	UniqueDirectivesPerLocationRule = function(p0) --[[ line: 27 ]]
		-- upvalues: specifiedDirectives (ref), kind (ref), isTypeDefinitionNode (ref), isTypeExtensionNode (ref), graphQLError (ref)
		local t = {}
		local schema = p0:getSchema()
		
		for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
			t[v.name] = not v.isRepeatable
		end
		for i_1, v_1 in ipairs(p0:getDocument().definitions) do
			if v_1.kind == kind.DIRECTIVE_DEFINITION then
				t[v_1.name.value] = not v_1.repeatable
			end
		end
		local t_1 = {}
		local t_2 = {}
		
		return {
			enter = function(_, p1) --[[ line: 50 ]]
				-- upvalues: kind (copy), t_1 (ref), isTypeDefinitionNode (copy), isTypeExtensionNode (copy), t_2 (ref), t (ref), p0 (ref), graphQLError (copy)
				if p1.directives == nil then return end
				local t_3
				local _ = nil
				
				if p1.kind == kind.SCHEMA_DEFINITION or p1.kind == kind.SCHEMA_EXTENSION then
					t_3 = t_1
				elseif isTypeDefinitionNode(p1) or isTypeExtensionNode(p1) then
					local value = p1.name.value
					t_3 = t_2[value]
					
					if t_3 == nil then
						t_3 = {}
						t_2[value] = t_3
					end
				else
					t_3 = {}
				end
				for i, v in ipairs(p1.directives) do
					local value = v.name.value
					
					if t[value] then
						if t_3[value] then
							p0:reportError(graphQLError.new(("The directive \"@%s\" can only be used once at this location."):format(value), { t_3[value], v }))
						else
							t_3[value] = v
						end
					end
				end
			end
		}
	end
}