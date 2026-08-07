-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local _ = require(script.Parent["merge-typedefs_types"])
local _ = require(parent.GraphQL)
local utilsModule = require(script.Parent.utils)
local extractType = utilsModule.extractType
local isWrappingTypeNode = utilsModule.isWrappingTypeNode
local isListTypeNode = utilsModule.isListTypeNode
local isNonNullTypeNode = utilsModule.isNonNullTypeNode
local printTypeNode = utilsModule.printTypeNode
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local compareNodes = require(parent.Utils).compareNodes
local mergeArguments = require(script.Parent.arguments).mergeArguments
local preventConflicts = nil
local safeChangeForFieldType = nil

local function fieldAlreadyExists(p0, p1, p2) --[[ line: 48 ]]
	-- upvalues: array (ref), boolean (ref), extractType (ref), error (ref)
	local var6 = array.find(p0, function(p3) --[[ line: 51 ]]
		-- upvalues: p1 (ref)
		return p3.name.value == p1.name.value
	end)
	
	if var6 and (not p2 or not boolean.toJSBoolean(p2.ignoreFieldConflicts)) then
		local var7 = extractType(var6.type)
		local var8 = extractType(p1.type)
		
		if var7.name.value ~= var8.name.value then
			error(error.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(p1.name.value), tostring(var7.name.value), tostring(var8.name.value))))
		end
	end
	return not not boolean.toJSBoolean(var6)
end

function t.mergeFields(p4, p5, p6, p7) --[[ line: 83 ]]
	-- upvalues: array (ref), boolean (ref), fieldAlreadyExists (ref), preventConflicts (write), isNonNullTypeNode (ref), mergeArguments (ref), mergeDirectives (ref), compareNodes (ref)
	local t = {}
	
	if p6 ~= nil then
		t = array.concat(t, p6)
	end
	if p5 ~= nil then
		for i, v in p5 do
			if boolean.toJSBoolean(fieldAlreadyExists(t, v, p7)) then
				local var10 = array.find(t, function(p8) --[[ line: 115 ]]
					-- upvalues: v (ref)
					return p8.name.value == v.name.value
				end)
				
				if not p7 or not boolean.toJSBoolean(p7.ignoreFieldConflicts) then
					if p7 and boolean.toJSBoolean(p7.throwOnConflict) then
						preventConflicts(p4, var10, v, false)
					else
						preventConflicts(p4, var10, v, true)
					end
					local var11 = isNonNullTypeNode(v.type)
					
					if boolean.toJSBoolean(if boolean.toJSBoolean(var11) then not boolean.toJSBoolean(isNonNullTypeNode(var10.type)) else var11) then
						var10.type = v.type
					end
				end
				var10.arguments = mergeArguments(if boolean.toJSBoolean(v.arguments) then v.arguments else {}, if boolean.toJSBoolean(var10.arguments) then var10.arguments else {}, p7)
				var10.directives = mergeDirectives(v.directives, var10.directives, p7)
				var10.description = if boolean.toJSBoolean(v.description) then v.description else var10.description
			else
				table.insert(t, v)
			end
		end
	end
	if p7 and boolean.toJSBoolean(p7.sort) then
		array.sort(t, compareNodes)
	end
	if p7 and p7.exclusions then
		local exclusions = p7.exclusions
		
		return array.filter(t, function(p9) --[[ line: 183 ]]
			-- upvalues: boolean (copy), array (copy), exclusions (ref), p4 (ref)
			return not boolean.toJSBoolean(array.includes(exclusions, ("%s.%s"):format(tostring(p4.name.value), tostring(p9.name.value))))
		end)
	end
	return t
end

preventConflicts = function(p10, p11, p12, p13) --[[ line: 194 | named "preventConflicts" ]]
	-- upvalues: printTypeNode (ref), boolean (ref), safeChangeForFieldType (write), error (ref)
	local var12 = if p13 ~= nil then false else p13
	local var13 = printTypeNode(p11.type)
	local var14 = printTypeNode(p12.type)
	
	if var13 ~= var14 and not boolean.toJSBoolean(safeChangeForFieldType(p11.type, p12.type, var12)) then
		error(error.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(p10.name.value), tostring(p11.name.value), tostring(var13), tostring(var14))))
	end
end

safeChangeForFieldType = function(p14, p15, p16) --[[ line: 223 | named "safeChangeForFieldType" ]]
	-- upvalues: boolean (ref), isWrappingTypeNode (ref), isNonNullTypeNode (ref), safeChangeForFieldType (write), isListTypeNode (ref)
	return if boolean.toJSBoolean(isWrappingTypeNode(p14)) or boolean.toJSBoolean(isWrappingTypeNode(p15)) then if boolean.toJSBoolean(isNonNullTypeNode(p15)) then safeChangeForFieldType(if boolean.toJSBoolean(isNonNullTypeNode(p14)) then p14.type else p14, p15.type) elseif boolean.toJSBoolean(isNonNullTypeNode(p14)) then safeChangeForFieldType(p15, p14, if p16 ~= nil then false else p16) elseif boolean.toJSBoolean(isListTypeNode(p14)) then isListTypeNode(p15) and safeChangeForFieldType(p14.type, p15.type) or isNonNullTypeNode(p15) and safeChangeForFieldType(p14, p15.type) else false else typeof(p14) == "table" and #p14 == 0 and (typeof(p15) == "table" and #p15 == 0) or tostring(p14) == tostring(p15)
end

return t