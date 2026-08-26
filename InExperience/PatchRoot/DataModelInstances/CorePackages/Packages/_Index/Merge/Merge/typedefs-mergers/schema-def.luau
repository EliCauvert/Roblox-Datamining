local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])
local t_1 = {
	query = "Query",
	mutation = "Mutation",
	subscription = "Subscription"
}
t.DEFAULT_OPERATION_TYPE_NAME_MAP = t_1

local function mergeOperationTypes(p1, p2)
	-- upvalues: t_1 (ref), array (ref), boolean (ref)
	local var1 = if p1 ~= nil then {} else p1
	local var2 = if p2 ~= nil then {} else p2
	local t = {}
	
	for i, v in t_1 do
		local var3 = array.find(var1, function(p3)
			-- upvalues: v (ref)
			return p3.operation == v
		end)
		local var4 = if boolean.toJSBoolean(var3) then var3 else array.find(var2, function(p3)
			-- upvalues: v (ref)
			return p3.operation == v
		end)
		
		if var4 then
			table.insert(t, var4)
		end
	end
	return t
end

function t.mergeSchemaDefs(p3, p4, p5)
	-- upvalues: boolean (ref), kind (ref), mergeDirectives (ref), mergeOperationTypes (ref), object (ref)
	return if boolean.toJSBoolean(p4) then {
		kind = if p3.kind == kind.SCHEMA_DEFINITION or p4.kind == kind.SCHEMA_DEFINITION then kind.SCHEMA_DEFINITION else kind.SCHEMA_EXTENSION,
		description = if boolean.toJSBoolean(p3.description) then p3.description else p4.description,
		directives = mergeDirectives(p3.directives, p4.directives, p5),
		operationTypes = mergeOperationTypes(p3.operationTypes, p4.operationTypes)
	} elseif p5 and boolean.toJSBoolean(p5.convertExtensions) then object.assign({}, p3, { kind = kind.SCHEMA_DEFINITION }) else p3
end

return t