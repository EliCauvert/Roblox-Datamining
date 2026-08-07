-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

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

local function mergeOperationTypes(p0, p1) --[[ line: 37 ]]
	-- upvalues: t_1 (ref), array (ref), boolean (ref)
	local var4 = if p0 ~= nil then {} else p0
	local var5 = if p1 ~= nil then {} else p1
	local t = {}
	
	for i, v in t_1 do
		local var7 = array.find(var4, function(p2) --[[ line: 50 ]]
			-- upvalues: v (ref)
			return p2.operation == v
		end)
		local var8 = if boolean.toJSBoolean(var7) then var7 else array.find(var5, function(p3) --[[ line: 54 ]]
			-- upvalues: v (ref)
			return p3.operation == v
		end)
		
		if var8 then
			table.insert(t, var8)
		end
	end
	return t
end

function t.mergeSchemaDefs(p4, p5, p6) --[[ line: 66 ]]
	-- upvalues: boolean (ref), kind (ref), mergeDirectives (ref), mergeOperationTypes (ref), object (ref)
	return if boolean.toJSBoolean(p5) then {
		kind = if p4.kind == kind.SCHEMA_DEFINITION or p5.kind == kind.SCHEMA_DEFINITION then kind.SCHEMA_DEFINITION else kind.SCHEMA_EXTENSION,
		description = if boolean.toJSBoolean(p4.description) then p4.description else p5.description,
		directives = mergeDirectives(p4.directives, p5.directives, p6),
		operationTypes = mergeOperationTypes(p4.operationTypes, p5.operationTypes)
	} elseif p6 and boolean.toJSBoolean(p6.convertExtensions) then object.assign({}, p4, { kind = kind.SCHEMA_DEFINITION }) else p4
end

return t