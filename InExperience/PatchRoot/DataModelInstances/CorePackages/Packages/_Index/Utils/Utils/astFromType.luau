local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local graphQLModule = require(parent.GraphQL)
local isNonNullType = graphQLModule.isNonNullType
local kind = graphQLModule.Kind
local isListType = graphQLModule.isListType
local inspect = require(script.Parent.inspect).inspect

local function astFromType(p1)
	-- upvalues: boolean (ref), isNonNullType (ref), astFromType (ref), kind (ref), error (ref), inspect (ref), isListType (ref)
	if boolean.toJSBoolean(isNonNullType(p1)) then
		local var1 = astFromType(p1.ofType)
		
		if var1.kind == kind.NON_NULL_TYPE then
			error(error.new(("Invalid type node %s. Inner type of non-null type cannot be a non-null type."):format(tostring(inspect(p1)))))
		end
		return { kind = kind.NON_NULL_TYPE, type = var1 }
	else
		return if boolean.toJSBoolean(isListType(p1)) then { kind = kind.LIST_TYPE, type = astFromType(p1.ofType) } else {
			kind = kind.NAMED_TYPE,
			name = { kind = kind.NAME, value = p1.name }
		}
	end
end

t.astFromType = astFromType

return t