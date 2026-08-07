-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local instanceof = luauPolyfillModule.instanceof
local t = {
	isStringTypes = function(p0) --[[ line: 20 ]]
		return typeof(p0) == "string"
	end
}
local graphQLModule = require(parent.GraphQL)
local source = graphQLModule.Source
local kind = graphQLModule.Kind

function t.isSourceTypes(p1) --[[ line: 26 ]]
	-- upvalues: instanceof (ref), source (ref)
	return instanceof(p1, source)
end

function t.extractType(p2) --[[ line: 34 ]]
	-- upvalues: kind (ref)
	local var5 = p2
	while var5.kind == kind.LIST_TYPE or var5.kind == "NonNullType" do
		var5 = var5.type
	end
	return var5
end

function t.isWrappingTypeNode(p3) --[[ line: 47 ]]
	-- upvalues: kind (ref)
	return p3.kind ~= kind.NAMED_TYPE
end

function t.isListTypeNode(p4) --[[ line: 56 ]]
	-- upvalues: kind (ref)
	return p4.kind == kind.LIST_TYPE
end

function t.isNonNullTypeNode(p5) --[[ line: 65 ]]
	-- upvalues: kind (ref)
	return p5.kind == kind.NON_NULL_TYPE
end

local function printTypeNode(p6) --[[ line: 74 ]]
	-- upvalues: boolean (ref), kind (ref), printTypeNode (ref)
	return if boolean.toJSBoolean(p6.kind == kind.LIST_TYPE) then ("[%s]"):format(printTypeNode(p6.type)) elseif boolean.toJSBoolean(p6.kind == kind.NON_NULL_TYPE) then ("%s!"):format(printTypeNode(p6.type)) else p6.name.value
end

t.printTypeNode = printTypeNode
local t_1 = {
	A_SMALLER_THAN_B = -1,
	A_EQUALS_B = 0,
	A_GREATER_THAN_B = 1
}
t.CompareVal = t_1

function t.defaultStringComparator(p7, p8) --[[ line: 100 ]]
	-- upvalues: t_1 (ref)
	return if p7 == nil and p8 == nil then t_1.A_EQUALS_B elseif p7 == nil then t_1.A_SMALLER_THAN_B elseif p8 == nil then t_1.A_GREATER_THAN_B elseif p7 < p8 then t_1.A_SMALLER_THAN_B elseif p8 < p7 then t_1.A_GREATER_THAN_B else t_1.A_EQUALS_B
end

return t