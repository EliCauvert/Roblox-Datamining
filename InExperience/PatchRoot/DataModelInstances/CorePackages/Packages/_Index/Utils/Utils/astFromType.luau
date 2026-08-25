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

local function astFromType(p0)
	-- upvalues: boolean (ref), isNonNullType (ref), astFromType (ref), kind (ref), error (ref), inspect (ref), isListType (ref)
	if boolean.toJSBoolean(isNonNullType(p0)) then
		local var4 = astFromType(p0.ofType)
		
		if var4.kind == kind.NON_NULL_TYPE then
			error(error.new(("Invalid type node %s. Inner type of non-null type cannot be a non-null type."):format(tostring(inspect(p0)))))
		end
		return { kind = kind.NON_NULL_TYPE, type = var4 }
	else
		return if boolean.toJSBoolean(isListType(p0)) then { kind = kind.LIST_TYPE, type = astFromType(p0.ofType) } else {
			kind = kind.NAMED_TYPE,
			name = { kind = kind.NAME, value = p0.name }
		}
	end
end

t.astFromType = astFromType

return t