local parent = script.Parent.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local kind = require(parent.language.kinds).Kind
local isNonNullType = require(parent.type.definition).isNonNullType
local utilities = parent.utilities
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local isTypeSubTypeOf = require(utilities.typeComparators).isTypeSubTypeOf
local t = {}
local allowedVariableUsage = nil

function t.VariablesInAllowedPositionRule(p1)
	-- upvalues: typeFromAST (ref), allowedVariableUsage (write), inspect (ref), graphQLError (ref)
	local t = {}
	
	return {
		OperationDefinition = {
			enter = function()
				-- upvalues: t (write)
				t = {}
			end,
			leave = function(_, p2)
				-- upvalues: p1 (ref), t (write), typeFromAST (copy), allowedVariableUsage (copy), inspect (copy), graphQLError (copy)
				for i, v in ipairs(p1:getRecursiveVariableUsages(p2)) do
					local node = v.node
					local type = v.type
					local defaultValue = v.defaultValue
					local value = node.name.value
					local var1 = t[value]
					
					if var1 and type then
						local schema = p1:getSchema()
						local var2 = typeFromAST(schema, var1.type)
						
						if var2 and not allowedVariableUsage(schema, var2, var1.defaultValue, type, defaultValue) then
							p1:reportError(graphQLError.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(value, inspect(var2), inspect(type)), { var1, node }))
						end
					end
				end
			end
		},
		VariableDefinition = function(_, p3)
			-- upvalues: t (write)
			t[p3.variable.name.value] = p3
		end
	}
end

allowedVariableUsage = function(p2, p3, p4, p5, p6)
	-- upvalues: isNonNullType (ref), kind (ref), isTypeSubTypeOf (ref)
	return if not (not isNonNullType(p5) or isNonNullType(p3)) then if (p4 ~= nil and p4.kind ~= kind.NULL) or p6 ~= nil then isTypeSubTypeOf(p2, p3, p5.ofType) else false else isTypeSubTypeOf(p2, p3, p5)
end

return t