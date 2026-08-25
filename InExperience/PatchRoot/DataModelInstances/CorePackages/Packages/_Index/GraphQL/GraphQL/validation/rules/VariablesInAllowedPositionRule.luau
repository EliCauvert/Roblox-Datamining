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

function t.VariablesInAllowedPositionRule(p0)
	-- upvalues: typeFromAST (ref), allowedVariableUsage (write), inspect (ref), graphQLError (ref)
	local t = {}
	
	return {
		OperationDefinition = {
			enter = function()
				-- upvalues: t (write)
				t = {}
			end,
			leave = function(_, p1)
				-- upvalues: p0 (ref), t (write), typeFromAST (copy), allowedVariableUsage (copy), inspect (copy), graphQLError (copy)
				for i, v in ipairs(p0:getRecursiveVariableUsages(p1)) do
					local node = v.node
					local type = v.type
					local defaultValue = v.defaultValue
					local value = node.name.value
					local var3 = t[value]
					
					if var3 and type then
						local schema = p0:getSchema()
						local var5 = typeFromAST(schema, var3.type)
						
						if var5 and not allowedVariableUsage(schema, var5, var3.defaultValue, type, defaultValue) then
							p0:reportError(graphQLError.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(value, inspect(var5), inspect(type)), { var3, node }))
						end
					end
				end
			end
		},
		VariableDefinition = function(_, p2)
			-- upvalues: t (write)
			t[p2.variable.name.value] = p2
		end
	}
end

allowedVariableUsage = function(p3, p4, p5, p6, p7)
	-- upvalues: isNonNullType (ref), kind (ref), isTypeSubTypeOf (ref)
	return if not (not isNonNullType(p6) or isNonNullType(p4)) then if (p5 ~= nil and p5.kind ~= kind.NULL) or p7 ~= nil then isTypeSubTypeOf(p3, p4, p6.ofType) else false else isTypeSubTypeOf(p3, p4, p6)
end

return t