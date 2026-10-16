local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Kind = require(Parent.GraphQL).Kind
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])
local config = {
	query = "Query",
	mutation = "Mutation",
	subscription = "Subscription"
}

local function mergeOperationTypes(OperationTypes, OperationTypes1) --[[ Line: 37 ]]
	-- upvalues: config (copy), Array (copy), Boolean (copy)
	local T = if OperationTypes == nil then {} else OperationTypes
	local T1 = if OperationTypes1 == nil then {} else OperationTypes1
	local List = {}
	
	for _, Operation in config do
		local FindResult = Array.find(T, function(p1): boolean --[[ Line: 50 ]]
			-- upvalues: Operation (copy)
			return p1.operation == Operation
		end)
		local FindResult1 = Boolean.toJSBoolean(FindResult) and FindResult or Array.find(T1, function(p1): boolean --[[ Line: 54 ]]
			-- upvalues: Operation (copy)
			return p1.operation == Operation
		end)
		
		if FindResult1 then
			table.insert(List, FindResult1)
		end
	end
	return List
end

return {
	DEFAULT_OPERATION_TYPE_NAME_MAP = config,
	mergeSchemaDefs = function(p1, p2, p3) --[[ Line: 66 ]]
		-- upvalues: Boolean (copy), Kind (copy), MergeDirectivesFunction (copy), mergeOperationTypes (copy), Object (copy)
		return if Boolean.toJSBoolean(p2) then {
			kind = if p1.kind == Kind.SCHEMA_DEFINITION or p2.kind == Kind.SCHEMA_DEFINITION then Kind.SCHEMA_DEFINITION else Kind.SCHEMA_EXTENSION,
			description = Boolean.toJSBoolean(p1.description) and p1.description or p2.description,
			directives = MergeDirectivesFunction(p1.directives, p2.directives, p3),
			operationTypes = mergeOperationTypes(p1.operationTypes, p2.operationTypes)
		} elseif p3 and Boolean.toJSBoolean(p3.convertExtensions) then Object.assign({}, p1, { kind = Kind.SCHEMA_DEFINITION }) else p1
	end
}