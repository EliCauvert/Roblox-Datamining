local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local GraphQLModule = require(Parent.GraphQL)
local IsNonNullTypeFunction = GraphQLModule.isNonNullType
local Kind = GraphQLModule.Kind
local IsListTypeFunction = GraphQLModule.isListType
local InspectFunction = require(script.Parent.inspect).inspect

local function astFromType(OfType) --[[ Line: 25 ]]
	-- upvalues: Boolean (copy), IsNonNullTypeFunction (copy), astFromType (copy), Kind (copy), Error1 (copy), InspectFunction (copy), IsListTypeFunction (copy)
	if not Boolean.toJSBoolean(IsNonNullTypeFunction(OfType)) then
		return if Boolean.toJSBoolean(IsListTypeFunction(OfType)) then { kind = Kind.LIST_TYPE, type = astFromType(OfType.ofType) } else {
			kind = Kind.NAMED_TYPE,
			name = { kind = Kind.NAME, value = OfType.name }
		}
	end
	local AstFromTypeResult = astFromType(OfType.ofType)
	
	if AstFromTypeResult.kind == Kind.NON_NULL_TYPE then
		error(Error1.new(("Invalid type node %s. Inner type of non-null type cannot be a non-null type."):format((tostring(InspectFunction(OfType))))))
	end
	return { kind = Kind.NON_NULL_TYPE, type = AstFromTypeResult }
end

return { astFromType = astFromType }