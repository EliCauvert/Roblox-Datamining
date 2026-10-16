local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local _ = require(Parent1.GraphQL)
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local DocumentType = { Query = 0, Mutation = 1, Subscription = 2 }
local NewResult = LuauPolyfillModule.Map.new(nil)

return {
	DocumentType = DocumentType,
	operationName = function(Mutation): string --[[ Line: 36 ]]
		-- upvalues: DocumentType (copy)
		local v1: string? = nil
		
		if Mutation == DocumentType.Query then
			v1 = "Query"
			
			return v1
		end
		if Mutation == DocumentType.Mutation then
			v1 = "Mutation"
			
			return v1
		end
		if Mutation == DocumentType.Subscription then
			v1 = "Subscription"
		end
		return v1
	end,
	parser = function(p1) --[[ Line: 51 ]]
		-- upvalues: NewResult (copy), InvariantFunction (copy), Boolean (copy), Array (copy), DocumentType (copy)
		local GetResult = NewResult:get(p1)
		
		if GetResult == nil then
			InvariantFunction(Boolean.toJSBoolean(p1) and Boolean.toJSBoolean(p1.kind), ("Argument of %s passed to parser was not a valid GraphQL "):format((tostring(p1))) .. "DocumentNode. You may need to use 'graphql-tag' or another method " .. "to convert your operation into a document")
			local FilterResult = Array.filter(p1.definitions, function(p2): boolean --[[ Line: 67 ]]
				return p2.kind == "OperationDefinition" and p2.operation == "query"
			end)
			local FilterResult1 = Array.filter(p1.definitions, function(p2): boolean --[[ Line: 72 ]]
				return p2.kind == "OperationDefinition" and p2.operation == "mutation"
			end)
			local FilterResult2 = Array.filter(p1.definitions, function(p2): boolean --[[ Line: 77 ]]
				return p2.kind == "OperationDefinition" and p2.operation == "subscription"
			end)
			InvariantFunction(#Array.filter(p1.definitions, function(p2): boolean --[[ Line: 63 ]]
				return p2.kind == "FragmentDefinition"
			end) == 0 or (#FilterResult ~= 0 or #FilterResult1 ~= 0 or #FilterResult2 ~= 0), "Passing only a fragment to 'graphql' is not yet supported. You must include a query, subscription or mutation as well")
			InvariantFunction(#FilterResult + #FilterResult1 + #FilterResult2 <= 1, "react-apollo only supports a query, subscription, or a mutation per HOC. " .. ("%s had %s queries, %s "):format(tostring(p1), tostring(#FilterResult), (tostring(#FilterResult2))) .. ("subscriptions and %s mutations. "):format((tostring(#FilterResult1))) .. "You can use 'compose' to join multiple operation types to a component")
			local Subscription = if #FilterResult == 0 and #FilterResult1 == 0 then DocumentType.Subscription elseif #FilterResult == 0 then DocumentType.Mutation else DocumentType.Query
			local FilterResult3 = if #FilterResult > 0 then FilterResult elseif #FilterResult1 > 0 then FilterResult1 else FilterResult2
			InvariantFunction(#FilterResult3 == 1, ("react-apollo only supports one definition per HOC. %s had "):format((tostring(p1))) .. ("%s definitions. "):format((tostring(#FilterResult3))) .. "You can use 'compose' to join multiple operation types to a component")
			local FilterResultEntry = FilterResult3[1]
			local config = {
				name = if FilterResultEntry.name and FilterResultEntry.name.kind == "Name" then FilterResultEntry.name.value else "data",
				type = Subscription,
				variables = FilterResultEntry.variableDefinitions and FilterResultEntry.variableDefinitions or {}
			}
			NewResult:set(p1, config)
			
			return config
		else
			return GetResult
		end
	end
}