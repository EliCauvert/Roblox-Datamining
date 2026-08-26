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

local function checkDocument(p1)
	-- upvalues: invariant (ref), array (ref), invariantError (ref)
	invariant(p1 and p1.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	local var1 = array.map(array.filter(p1.definitions, function(p2)
		return p2.kind ~= "FragmentDefinition"
	end), function(p2)
		-- upvalues: invariantError (copy)
		if p2.kind ~= "OperationDefinition" then
			error(invariantError.new(("Schema type definitions not allowed in queries. Found: \"%s\""):format(p2.kind)))
		end
		return p2
	end)
	invariant(#var1 <= 1, ("Ambiguous GraphQL document: contains %s operations"):format(tostring(#var1)))
	
	return p1
end

t.checkDocument = checkDocument

function t.getOperationDefinition(p1)
	-- upvalues: checkDocument (ref), array (ref)
	checkDocument(p1)
	
	return array.filter(p1.definitions, function(p2)
		return p2.kind == "OperationDefinition"
	end)[1]
end

function t.getOperationName(p1)
	-- upvalues: array (ref), boolean (ref)
	local var1 = array.map(array.filter(p1.definitions, function(p2)
		-- upvalues: boolean (copy)
		return if boolean.toJSBoolean(p2.kind == "OperationDefinition") then p2.name else p2.kind == "OperationDefinition"
	end), function(p2)
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p2) and (boolean.toJSBoolean(p2.name) and (p2.name.value or nil))
	end)
	
	return if boolean.toJSBoolean(var1[1]) then var1[1] else nil
end

function t.getFragmentDefinitions(p1)
	-- upvalues: array (ref)
	return array.filter(p1.definitions, function(p2)
		return p2.kind == "FragmentDefinition"
	end)
end

function t.getQueryDefinition(p1)
	-- upvalues: checkDocument (ref), array (ref), invariant (ref), boolean (ref)
	checkDocument(p1)
	local var1 = array.filter(p1.definitions, function(p2)
		return p2.kind == "OperationDefinition"
	end)[1]
	invariant(boolean.toJSBoolean(var1) and var1.operation == "query", "Must contain a query definition.")
	
	return var1
end

function t.getFragmentDefinition(p1)
	-- upvalues: invariant (ref)
	invariant(p1.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	invariant(#p1.definitions <= 1, "Fragment must have exactly one definition.")
	local var1 = p1.definitions[1]
	invariant(var1.kind == "FragmentDefinition", "Must be a fragment definition.")
	
	return var1
end

function t.getMainDefinition(p1)
	-- upvalues: checkDocument (ref), boolean (ref), invariantError (ref)
	checkDocument(p1)
	local var1 = nil
	
	for i, v in ipairs(p1.definitions) do
		if v.kind == "OperationDefinition" then
			local operation = v.operation
			
			if operation ~= "query" and operation ~= "mutation" and operation ~= "subscription" then
				if v.kind == "FragmentDefinition" and not boolean.toJSBoolean(var1) then
					var1 = v
				end
			end
			return v
		end
	end
	if boolean.toJSBoolean(var1) then
		return var1
	end
	error(invariantError.new("Expected a parsed GraphQL query with a query, mutation, subscription, or a fragment."))
end

function t.getDefaultValues(p2)
	-- upvalues: array (ref), boolean (ref), valueToObjectRepresentation (ref)
	local t = {}
	local var2 = if p2 ~= nil then nil else p2.variableDefinitions
	
	if var2 ~= nil and #var2 > 0 then
		array.forEach(var2, function(p3)
			-- upvalues: boolean (copy), valueToObjectRepresentation (copy), t (ref)
			if boolean.toJSBoolean(p3.defaultValue) then
				valueToObjectRepresentation(t, p3.variable.name, p3.defaultValue)
			end
		end)
	end
	return t
end

return t