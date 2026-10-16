local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local _ = require(Parent1.GraphQL)
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local ValueToObjectRepresentationFunction = require(script.Parent.storeUtils).valueToObjectRepresentation

local function checkDocument(p1) --[[ Line: 29 ]]
	-- upvalues: InvariantFunction (copy), Array (copy), InvariantError (copy)
	InvariantFunction(p1 and p1.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	local MapResult = Array.map(Array.filter(p1.definitions, function(p2): boolean --[[ Line: 36 ]]
		return p2.kind ~= "FragmentDefinition"
	end), function(p2) --[[ Line: 39 ]]
		-- upvalues: InvariantError (upval)
		if p2.kind ~= "OperationDefinition" then
			error(InvariantError.new(("Schema type definitions not allowed in queries. Found: \"%s\""):format(p2.kind)))
		end
		return p2
	end)
	InvariantFunction(#MapResult <= 1, ("Ambiguous GraphQL document: contains %s operations"):format((tostring(#MapResult))))
	
	return p1
end

return {
	checkDocument = checkDocument,
	getOperationDefinition = function(p1) --[[ Line: 57 ]]
		-- upvalues: checkDocument (copy), Array (copy)
		checkDocument(p1)
		
		return Array.filter(p1.definitions, function(p2): boolean --[[ Line: 59 ]]
			return p2.kind == "OperationDefinition"
		end)[1]
	end,
	getOperationName = function(p1) --[[ Line: 65 ]]
		-- upvalues: Array (copy), Boolean (copy)
		local MapResult = Array.map(Array.filter(p1.definitions, function(p2) --[[ Line: 67 ]]
			-- upvalues: Boolean (upval)
			return if Boolean.toJSBoolean(p2.kind == "OperationDefinition") then p2.name else p2.kind == "OperationDefinition"
		end), function(p2) --[[ Line: 74 ]]
			-- upvalues: Boolean (upval)
			return Boolean.toJSBoolean(p2) and Boolean.toJSBoolean(p2.name) and p2.name.value or nil
		end)
		
		return Boolean.toJSBoolean(MapResult[1]) and MapResult[1] or nil
	end,
	getFragmentDefinitions = function(p1) --[[ Line: 84 ]]
		-- upvalues: Array (copy)
		return (Array.filter(p1.definitions, function(p2): boolean --[[ Line: 85 ]]
			return p2.kind == "FragmentDefinition"
		end))
	end,
	getQueryDefinition = function(p1) --[[ Line: 91 ]]
		-- upvalues: checkDocument (copy), Array (copy), InvariantFunction (copy), Boolean (copy)
		checkDocument(p1)
		local FilterResultEntry = Array.filter(p1.definitions, function(p2): boolean --[[ Line: 59 ]]
			return p2.kind == "OperationDefinition"
		end)[1]
		InvariantFunction(Boolean.toJSBoolean(FilterResultEntry) and FilterResultEntry.operation == "query", "Must contain a query definition.")
		
		return FilterResultEntry
	end,
	getFragmentDefinition = function(p1) --[[ Line: 99 ]]
		-- upvalues: InvariantFunction (copy)
		InvariantFunction(p1.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
		InvariantFunction(#p1.definitions <= 1, "Fragment must have exactly one definition.")
		local Definition = p1.definitions[1]
		InvariantFunction(Definition.kind == "FragmentDefinition", "Must be a fragment definition.")
		
		return Definition
	end,
	getMainDefinition = function(p1) --[[ Line: 120 ]]
		-- upvalues: checkDocument (copy), Boolean (copy), InvariantError (copy)
		checkDocument(p1)
		local v1 = nil
		
		for _, definition in ipairs(p1.definitions) do
			if definition.kind == "OperationDefinition" then
				local Operation = definition.operation
				
				if Operation == "query" or Operation == "mutation" or Operation == "subscription" then
					return definition
				end
			end
			if definition.kind == "FragmentDefinition" and not Boolean.toJSBoolean(v1) then
				v1 = definition
			end
		end
		if Boolean.toJSBoolean(v1) then
			return v1
		else
			error(InvariantError.new("Expected a parsed GraphQL query with a query, mutation, subscription, or a fragment."))
		end
	end,
	getDefaultValues = function(p2) --[[ Line: 148 ]]
		-- upvalues: Array (copy), Boolean (copy), ValueToObjectRepresentationFunction (copy)
		local t = {}
		local VariableDefinitions = if p2 == nil then nil else p2.variableDefinitions
		
		if VariableDefinitions ~= nil and #VariableDefinitions > 0 then
			Array.forEach(VariableDefinitions, function(p3) --[[ Line: 157 ]]
				-- upvalues: Boolean (upval), ValueToObjectRepresentationFunction (upval), t (copy)
				if Boolean.toJSBoolean(p3.defaultValue) then
					ValueToObjectRepresentationFunction(t, p3.variable.name, p3.defaultValue)
				end
			end)
		end
		return t
	end
}