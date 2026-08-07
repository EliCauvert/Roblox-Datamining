-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local _ = require(parent_1.GraphQL)
local invariant = require(parent.jsutils.invariant).invariant
local map = luauPolyfillModule.Map
local t_1 = { Query = 0, Mutation = 1, Subscription = 2 }
t.DocumentType = t_1
local var3 = map.new(nil)

function t.operationName(p0) --[[ line: 36 ]]
	-- upvalues: t_1 (ref)
	local var4 = nil
	
	if p0 == t_1.Query then
		var4 = "Query"
		
		return var4
	elseif p0 == t_1.Mutation then
		var4 = "Mutation"
		
		return var4
	elseif p0 == t_1.Subscription then
		var4 = "Subscription"
	end
	return var4
end

function t.parser(p1) --[[ line: 51 ]]
	-- upvalues: var3 (ref), invariant (ref), boolean (ref), array (ref), t_1 (ref)
	local var5 = var3:get(p1)
	
	if var5 ~= nil then
		return var5
	end
	local _ = nil
	local _ = nil
	local _ = nil
	invariant(boolean.toJSBoolean(p1) and boolean.toJSBoolean(p1.kind), ("Argument of %s passed to parser was not a valid GraphQL "):format(tostring(p1)) .. "DocumentNode. You may need to use 'graphql-tag' or another method " .. "to convert your operation into a document")
	local var6 = array.filter(p1.definitions, function(p2) --[[ line: 63 ]]
		return p2.kind == "FragmentDefinition"
	end)
	local var7 = array.filter(p1.definitions, function(p3) --[[ line: 67 ]]
		return p3.kind == "OperationDefinition" and p3.operation == "query"
	end)
	local var8 = array.filter(p1.definitions, function(p4) --[[ line: 72 ]]
		return p4.kind == "OperationDefinition" and p4.operation == "mutation"
	end)
	local var9 = array.filter(p1.definitions, function(p5) --[[ line: 77 ]]
		return p5.kind == "OperationDefinition" and p5.operation == "subscription"
	end)
	invariant(if #var6 ~= 0 then if #var7 == 0 then if #var8 == 0 then #var9 ~= 0 else true else true else true, "Passing only a fragment to 'graphql' is not yet supported. You must include a query, subscription or mutation as well")
	invariant(#var7 + #var8 + #var9 <= 1, "react-apollo only supports a query, subscription, or a mutation per HOC. " .. ("%s had %s queries, %s "):format(tostring(p1), tostring(#var7), tostring(#var9)) .. ("subscriptions and %s mutations. "):format(tostring(#var8)) .. "You can use 'compose' to join multiple operation types to a component")
	local var10 = if #var7 == 0 and #var8 == 0 then t_1.Subscription elseif #var7 ~= 0 then t_1.Mutation else t_1.Query
	local var11 = if #var7 > 0 then var7 elseif #var8 > 0 then var8 else var9
	invariant(#var11 == 1, ("react-apollo only supports one definition per HOC. %s had "):format(tostring(p1)) .. ("%s definitions. "):format(tostring(#var11)) .. "You can use 'compose' to join multiple operation types to a component")
	local var12 = var11[1]
	local var13 = if var12.variableDefinitions then var12.variableDefinitions else {}
	var13 = {
		name = if var12.name and var12.name.kind == "Name" then var12.name.value else "data",
		type = var10,
		variables = var13
	}
	var3:set(p1, var13)
	
	return var13
end

return t