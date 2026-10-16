local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local InstanceofFunction = LuauPolyfillModule.instanceof
local GraphQLModule = require(Parent.GraphQL)
local Source = GraphQLModule.Source
local Kind = GraphQLModule.Kind

local function printTypeNode(Type) --[[ Line: 74 ]]
	-- upvalues: Boolean (copy), Kind (copy), printTypeNode (copy)
	return if Boolean.toJSBoolean(Type.kind == Kind.LIST_TYPE) then ("[%s]"):format(printTypeNode(Type.type)) elseif Boolean.toJSBoolean(Type.kind == Kind.NON_NULL_TYPE) then ("%s!"):format(printTypeNode(Type.type)) else Type.name.value
end

local CompareVal = {
	A_SMALLER_THAN_B = -1,
	A_EQUALS_B = 0,
	A_GREATER_THAN_B = 1
}

return {
	isStringTypes = function(p1): boolean --[[ Line: 20 ]]
		return typeof(p1) == "string"
	end,
	isSourceTypes = function(p1) --[[ Line: 26 ]]
		-- upvalues: InstanceofFunction (copy), Source (copy)
		return InstanceofFunction(p1, Source)
	end,
	extractType = function(Type) --[[ Line: 34 ]]
		-- upvalues: Kind (copy)
		local Type1 = Type
		while Type1.kind == Kind.LIST_TYPE or Type1.kind == "NonNullType" do
			Type1 = Type1.type
		end
		return Type1
	end,
	isWrappingTypeNode = function(p1): boolean --[[ Line: 47 ]]
		-- upvalues: Kind (copy)
		return p1.kind ~= Kind.NAMED_TYPE
	end,
	isListTypeNode = function(p1): boolean --[[ Line: 56 ]]
		-- upvalues: Kind (copy)
		return p1.kind == Kind.LIST_TYPE
	end,
	isNonNullTypeNode = function(p1): boolean --[[ Line: 65 ]]
		-- upvalues: Kind (copy)
		return p1.kind == Kind.NON_NULL_TYPE
	end,
	printTypeNode = printTypeNode,
	CompareVal = CompareVal,
	defaultStringComparator = function(p1, p2) --[[ Line: 100 ]]
		-- upvalues: CompareVal (copy)
		return if p1 == nil and p2 == nil then CompareVal.A_EQUALS_B elseif p1 == nil then CompareVal.A_SMALLER_THAN_B elseif p2 == nil then CompareVal.A_GREATER_THAN_B elseif p1 < p2 then CompareVal.A_SMALLER_THAN_B elseif p2 < p1 then CompareVal.A_GREATER_THAN_B else CompareVal.A_EQUALS_B
	end
}