-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local _ = require(parent_1.GraphQL)
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local valueToObjectRepresentation = require(script.Parent.storeUtils).valueToObjectRepresentation

local function checkDocument(p0) --[[ line: 29 ]]
	-- upvalues: invariant (ref), array (ref), invariantError (ref)
	invariant(p0 and p0.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	local var4 = array.map(array.filter(p0.definitions, function(p1) --[[ line: 36 ]]
		return p1.kind ~= "FragmentDefinition"
	end), function(p2) --[[ line: 39 ]]
		-- upvalues: invariantError (copy)
		if p2.kind ~= "OperationDefinition" then
			error(invariantError.new(("Schema type definitions not allowed in queries. Found: \"%s\""):format(p2.kind)))
		end
		return p2
	end)
	invariant(#var4 <= 1, ("Ambiguous GraphQL document: contains %s operations"):format(tostring(#var4)))
	
	return p0
end

t.checkDocument = checkDocument

function t.getOperationDefinition(p3) --[[ line: 57 ]]
	-- upvalues: checkDocument (ref), array (ref)
	checkDocument(p3)
	
	return array.filter(p3.definitions, function(p4) --[[ line: 59 ]]
		return p4.kind == "OperationDefinition"
	end)[1]
end

function t.getOperationName(p5) --[[ line: 65 ]]
	-- upvalues: array (ref), boolean (ref)
	local var5 = array.map(array.filter(p5.definitions, function(p6) --[[ line: 67 ]]
		-- upvalues: boolean (copy)
		return if boolean.toJSBoolean(p6.kind == "OperationDefinition") then p6.name else p6.kind == "OperationDefinition"
	end), function(p7) --[[ line: 74 ]]
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p7) and (boolean.toJSBoolean(p7.name) and (p7.name.value or nil))
	end)
	
	return if boolean.toJSBoolean(var5[1]) then var5[1] else nil
end

function t.getFragmentDefinitions(p8) --[[ line: 84 ]]
	-- upvalues: array (ref)
	return array.filter(p8.definitions, function(p9) --[[ line: 85 ]]
		return p9.kind == "FragmentDefinition"
	end)
end

function t.getQueryDefinition(p10) --[[ line: 91 ]]
	-- upvalues: checkDocument (ref), array (ref), invariant (ref), boolean (ref)
	checkDocument(p10)
	local var6 = array.filter(p10.definitions, function(p11) --[[ line: 59 ]]
		return p11.kind == "OperationDefinition"
	end)[1]
	invariant(boolean.toJSBoolean(var6) and var6.operation == "query", "Must contain a query definition.")
	
	return var6
end

function t.getFragmentDefinition(p12) --[[ line: 99 ]]
	-- upvalues: invariant (ref)
	invariant(p12.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	invariant(#p12.definitions <= 1, "Fragment must have exactly one definition.")
	local var7 = p12.definitions[1]
	invariant(var7.kind == "FragmentDefinition", "Must be a fragment definition.")
	
	return var7
end

function t.getMainDefinition(p13) --[[ line: 120 ]]
	-- upvalues: checkDocument (ref), boolean (ref), invariantError (ref)
	checkDocument(p13)
	local var8 = nil
	
	for i, v in ipairs(p13.definitions) do
		if v.kind == "OperationDefinition" then
			local operation = v.operation
			
			if operation ~= "query" and operation ~= "mutation" and operation ~= "subscription" then
				if v.kind == "FragmentDefinition" and not boolean.toJSBoolean(var8) then
					var8 = v
				end
			end
			return v
		end
	end
	if boolean.toJSBoolean(var8) then
		return var8
	end
	error(invariantError.new("Expected a parsed GraphQL query with a query, mutation, subscription, or a fragment."))
end

function t.getDefaultValues(p14) --[[ line: 148 ]]
	-- upvalues: array (ref), boolean (ref), valueToObjectRepresentation (ref)
	local t = {}
	local var10 = if p14 ~= nil then nil else p14.variableDefinitions
	
	if var10 ~= nil and #var10 > 0 then
		array.forEach(var10, function(p15) --[[ line: 157 ]]
			-- upvalues: boolean (copy), valueToObjectRepresentation (copy), t (ref)
			if boolean.toJSBoolean(p15.defaultValue) then
				valueToObjectRepresentation(t, p15.variable.name, p15.defaultValue)
			end
		end)
	end
	return t
end

return t