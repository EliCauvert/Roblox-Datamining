local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local PromiseModule = require(Parent.Promise)
local GraphQLModule = require(Parent.GraphQL)
local Kind = GraphQLModule.Kind
local ValidateFunction = GraphQLModule.validate
local SpecifiedRules = GraphQLModule.specifiedRules
local ConcatASTFunction = GraphQLModule.concatAST
local VersionInfo = GraphQLModule.versionInfo
local _ = require(script.Parent.loaders)
local AggregateError = require(script.Parent.AggregateError).AggregateError
local Callback = nil

local function validateGraphQlDocuments(p1, p2, p3) --[[ Line: 66 ]]
	-- upvalues: Callback (ref), PromiseModule (copy), Map (copy), Kind (copy), Array (copy), ConcatASTFunction (copy), ValidateFunction (copy)
	local CallbackResult = if p3 == nil then Callback() else p3
	
	return PromiseModule.resolve():andThen(function() --[[ Line: 74 ]]
		-- upvalues: Map (upval), p2 (copy), Kind (upval), Array (upval), PromiseModule (upval), ConcatASTFunction (upval), ValidateFunction (upval), p1 (copy), CallbackResult (copy)
		local NewMap = Map.new()
		local List = {}
		
		for _, value in p2 do
			if value.document then
				local Definitions = {}
				
				for _, definition in value.document.definitions do
					if definition.kind == Kind.FRAGMENT_DEFINITION then
						NewMap:set(definition.name.value, definition)
					else
						table.insert(Definitions, definition)
					end
				end
				table.insert(List, {
					location = value.location,
					document = { kind = Kind.DOCUMENT, definitions = Definitions }
				})
			end
		end
		local List1 = {}
		local config = {
			kind = Kind.DOCUMENT,
			definitions = Array.concat({}, NewMap:values())
		}
		PromiseModule.all(Array.map(List, function(p4) --[[ Line: 104 ]]
			-- upvalues: PromiseModule (upval), ConcatASTFunction (upval), config (copy), ValidateFunction (upval), p1 (upval), CallbackResult (upval), List1 (copy)
			return PromiseModule.resolve():andThen(function() --[[ Line: 105 ]]
				-- upvalues: ConcatASTFunction (upval), config (upval), p4 (copy), ValidateFunction (upval), p1 (upval), CallbackResult (upval), List1 (upval)
				local ValidateResult = ValidateFunction(p1, ConcatASTFunction({ config, p4.document }), CallbackResult)
				
				if #ValidateResult > 0 then
					table.insert(List1, { filePath = p4.location, errors = ValidateResult })
				end
			end)
		end)):expect()
		
		return List1
	end)
end

Callback = function() --[[ Line: 185 | Named "createDefaultRules" ]]
	-- upvalues: VersionInfo (copy), Array (copy), SpecifiedRules (copy)
	local MapResult = {
		"NoUnusedFragmentsRule",
		"NoUnusedVariablesRule",
		"KnownDirectivesRule"
	}
	
	if VersionInfo.major < 15 then
		MapResult = Array.map(MapResult, function(Text: string): string --[[ Line: 192 ]]
			return (Text:gsub("Rule$", "", 1))
		end)
	end
	return Array.filter(SpecifiedRules, function(p4): boolean --[[ Line: 200 ]]
		-- upvalues: Array (upval), MapResult (ref)
		return not Array.includes(MapResult, (debug.info(p4, "n")))
	end)
end

return {
	validateGraphQlDocuments = validateGraphQlDocuments,
	checkValidationErrors = function(List) --[[ Line: 123 ]]
		-- upvalues: Error1 (copy), AggregateError (copy), Array (copy)
		if #List > 0 then
			local List1 = {}
			
			for _, value in List do
				for _, _error in value.errors do
					local NewError = Error1.new()
					NewError.name = "GraphQLDocumentError"
					NewError.message = ("%s: %s"):format(tostring(NewError.name), (tostring(_error.message)))
					NewError.stack = NewError.message
					
					if _error.locations then
						for _, location in _error.locations do
							NewError.stack = tostring(NewError.stack) .. ("\n    at %s:%s:%s"):format(tostring(value.filePath), tostring(location.line), (tostring(location.column)))
						end
					end
					table.insert(List1, NewError)
				end
			end
			error(AggregateError.new(List1, ("GraphQL Document Validation failed with %s errors;\n  %s"):format(tostring(#List1), (tostring(Array.join(Array.map(List1, function(p4, p5): string --[[ Line: 170 ]]
				return ("Error %s: %s"):format(tostring(p5), (tostring(p4.stack)))
			end), "\n\n"))))))
		end
	end,
	createDefaultRules = Callback
}