local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local instanceof = luauPolyfillModule.instanceof
local t = {
	isStringTypes = function(p1)
		return typeof(p1) == "string"
	end
}
local graphQLModule = require(parent.GraphQL)
local source = graphQLModule.Source
local kind = graphQLModule.Kind

function t.isSourceTypes(p1)
	-- upvalues: instanceof (ref), source (ref)
	return instanceof(p1, source)
end

function t.extractType(p1)
	-- upvalues: kind (ref)
	local var1 = p1
	while var1.kind == kind.LIST_TYPE or var1.kind == "NonNullType" do
		var1 = var1.type
	end
	return var1
end

function t.isWrappingTypeNode(p2)
	-- upvalues: kind (ref)
	return p2.kind ~= kind.NAMED_TYPE
end

function t.isListTypeNode(p2)
	-- upvalues: kind (ref)
	return p2.kind == kind.LIST_TYPE
end

function t.isNonNullTypeNode(p2)
	-- upvalues: kind (ref)
	return p2.kind == kind.NON_NULL_TYPE
end

local function printTypeNode(p2)
	-- upvalues: boolean (ref), kind (ref), printTypeNode (ref)
	return if boolean.toJSBoolean(p2.kind == kind.LIST_TYPE) then ("[%s]"):format(printTypeNode(p2.type)) elseif boolean.toJSBoolean(p2.kind == kind.NON_NULL_TYPE) then ("%s!"):format(printTypeNode(p2.type)) else p2.name.value
end

t.printTypeNode = printTypeNode
local t_1 = {
	A_SMALLER_THAN_B = -1,
	A_EQUALS_B = 0,
	A_GREATER_THAN_B = 1
}
t.CompareVal = t_1

function t.defaultStringComparator(p2, p3)
	-- upvalues: t_1 (ref)
	return if p2 == nil and p3 == nil then t_1.A_EQUALS_B elseif p2 == nil then t_1.A_SMALLER_THAN_B elseif p3 == nil then t_1.A_GREATER_THAN_B elseif p2 < p3 then t_1.A_SMALLER_THAN_B elseif p3 < p2 then t_1.A_GREATER_THAN_B else t_1.A_EQUALS_B
end

return t