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
local var1 = map.new(nil)

function t.operationName(p1)
	-- upvalues: t_1 (ref)
	local var2 = nil
	
	if p1 == t_1.Query then
		var2 = "Query"
		
		return var2
	elseif p1 == t_1.Mutation then
		var2 = "Mutation"
		
		return var2
	elseif p1 == t_1.Subscription then
		var2 = "Subscription"
	end
	return var2
end

function t.parser(p1)
	-- upvalues: var1 (ref), invariant (ref), boolean (ref), array (ref), t_1 (ref)
	local var2 = var1:get(p1)
	
	if var2 ~= nil then
		return var2
	end
	local _ = nil
	local _ = nil
	local _ = nil
	invariant(boolean.toJSBoolean(p1) and boolean.toJSBoolean(p1.kind), ("Argument of %s passed to parser was not a valid GraphQL "):format(tostring(p1)) .. "DocumentNode. You may need to use 'graphql-tag' or another method " .. "to convert your operation into a document")
	local var3 = array.filter(p1.definitions, function(p2)
		return p2.kind == "FragmentDefinition"
	end)
	local var4 = array.filter(p1.definitions, function(p2)
		return p2.kind == "OperationDefinition" and p2.operation == "query"
	end)
	local var5 = array.filter(p1.definitions, function(p2)
		return p2.kind == "OperationDefinition" and p2.operation == "mutation"
	end)
	local var6 = array.filter(p1.definitions, function(p2)
		return p2.kind == "OperationDefinition" and p2.operation == "subscription"
	end)
	invariant(if #var3 ~= 0 then if #var4 == 0 then if #var5 == 0 then #var6 ~= 0 else true else true else true, "Passing only a fragment to 'graphql' is not yet supported. You must include a query, subscription or mutation as well")
	invariant(#var4 + #var5 + #var6 <= 1, "react-apollo only supports a query, subscription, or a mutation per HOC. " .. ("%s had %s queries, %s "):format(tostring(p1), tostring(#var4), tostring(#var6)) .. ("subscriptions and %s mutations. "):format(tostring(#var5)) .. "You can use 'compose' to join multiple operation types to a component")
	local var7 = if #var4 == 0 and #var5 == 0 then t_1.Subscription elseif #var4 ~= 0 then t_1.Mutation else t_1.Query
	local var8 = if #var4 > 0 then var4 elseif #var5 > 0 then var5 else var6
	invariant(#var8 == 1, ("react-apollo only supports one definition per HOC. %s had "):format(tostring(p1)) .. ("%s definitions. "):format(tostring(#var8)) .. "You can use 'compose' to join multiple operation types to a component")
	local var9 = var8[1]
	local var10 = if var9.variableDefinitions then var9.variableDefinitions else {}
	var10 = {
		name = if var9.name and var9.name.kind == "Name" then var9.name.value else "data",
		type = var7,
		variables = var10
	}
	var1:set(p1, var10)
	
	return var10
end

return t