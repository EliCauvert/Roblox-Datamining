local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local PredicatesModule = require(Language.predicates)
local IsTypeDefinitionNodeFunction = PredicatesModule.isTypeDefinitionNode
local IsTypeExtensionNodeFunction = PredicatesModule.isTypeExtensionNode
local SpecifiedDirectives = require(Parent.type.directives).specifiedDirectives

return {
	UniqueDirectivesPerLocationRule = function(p1)
		-- upvalues: SpecifiedDirectives (copy), Kind (copy), IsTypeDefinitionNodeFunction (copy), IsTypeExtensionNodeFunction (copy), GraphQLError (copy)
		local NoIsRepeatables = {}
		local Schema = p1:getSchema()
		local Directives = if Schema then Schema:getDirectives() else SpecifiedDirectives
		for _, directive in ipairs(Directives) do
			NoIsRepeatables[directive.name] = not directive.isRepeatable
		end
		for _, definition in ipairs(p1:getDocument().definitions) do
			if definition.kind == Kind.DIRECTIVE_DEFINITION then
				NoIsRepeatables[definition.name.value] = not definition.repeatable
			end
		end
		local t = {}
		local t1 = {}
		
		return {
			enter = function(_, p2)
				-- upvalues: Kind (upval), t (copy), IsTypeDefinitionNodeFunction (upval), IsTypeExtensionNodeFunction (upval), t1 (copy), NoIsRepeatables (copy), p1 (copy), GraphQLError (upval)
				if p2.directives == nil then return end
				local T = nil
				if p2.kind == Kind.SCHEMA_DEFINITION or p2.kind == Kind.SCHEMA_EXTENSION then
					T = t
				elseif IsTypeDefinitionNodeFunction(p2) or IsTypeExtensionNodeFunction(p2) then
					local Value = p2.name.value
					T = t1[Value]
					
					if T == nil then
						T = {}
						t1[Value] = T
					end
				else
					T = {}
				end
				for _, directive in ipairs(p2.directives) do
					local Value = directive.name.value
					
					if NoIsRepeatables[Value] then
						if T[Value] then
							p1:reportError(GraphQLError.new(("The directive \"@%s\" can only be used once at this location."):format(Value), { T[Value], directive }))
						else
							T[Value] = directive
						end
					end
				end
			end
		}
	end
}