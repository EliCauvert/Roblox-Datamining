local Parent = script.Parent.Parent.Parent
local InspectFunction = require(Parent.jsutils.inspect).inspect
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Kind = require(Parent.language.kinds).Kind
local IsNonNullTypeFunction = require(Parent.type.definition).isNonNullType
local Utilities = Parent.utilities
local TypeFromASTFunction = require(Utilities.typeFromAST).typeFromAST
local IsTypeSubTypeOfFunction = require(Utilities.typeComparators).isTypeSubTypeOf
local Callback = nil
local VariablesInAllowedPositionRuleModule = {
	VariablesInAllowedPositionRule = function(p1)
		-- upvalues: TypeFromASTFunction (copy), Callback (ref), InspectFunction (copy), GraphQLError (copy)
		local t = {}
		
		return {
			OperationDefinition = {
				enter = function()
					-- upvalues: t (ref)
					t = {}
				end,
				leave = function(_, p2)
					-- upvalues: p1 (copy), t (ref), TypeFromASTFunction (upval), Callback (upval), InspectFunction (upval), GraphQLError (upval)
					for _, recursiveVariableUsage in ipairs((p1:getRecursiveVariableUsages(p2))) do
						local Node = recursiveVariableUsage.node
						local Type = recursiveVariableUsage.type
						local DefaultValue = recursiveVariableUsage.defaultValue
						local Value = Node.name.value
						local Entry = t[Value]
						
						if Entry and Type then
							local Schema = p1:getSchema()
							local TypeFromASTResult = TypeFromASTFunction(Schema, Entry.type)
							
							if TypeFromASTResult and not Callback(Schema, TypeFromASTResult, Entry.defaultValue, Type, DefaultValue) then
								p1:reportError(GraphQLError.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(Value, InspectFunction(TypeFromASTResult), (InspectFunction(Type))), { Entry, Node }))
							end
						end
					end
				end
			},
			VariableDefinition = function(_, p3)
				-- upvalues: t (ref)
				t[p3.variable.name.value] = p3
			end
		}
	end
}

Callback = function(Schema, p2, DefaultValue, Type, DefaultValue1)
	-- upvalues: IsNonNullTypeFunction (copy), Kind (copy), IsTypeSubTypeOfFunction (copy)
	return if IsNonNullTypeFunction(Type) and not IsNonNullTypeFunction(p2) then (DefaultValue ~= nil and DefaultValue.kind ~= Kind.NULL or DefaultValue1 ~= nil) and IsTypeSubTypeOfFunction(Schema, p2, Type.ofType) else IsTypeSubTypeOfFunction(Schema, p2, Type)
end

return VariablesInAllowedPositionRuleModule