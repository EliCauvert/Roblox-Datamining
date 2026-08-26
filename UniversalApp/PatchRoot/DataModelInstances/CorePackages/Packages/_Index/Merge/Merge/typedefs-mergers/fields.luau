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

local function fieldAlreadyExists(p1, p2, p3)
	-- upvalues: array (ref), boolean (ref), extractType (ref), error (ref)
	local var1 = array.find(p1, function(p4)
		-- upvalues: p2 (ref)
		return p4.name.value == p2.name.value
	end)
	
	if var1 and (not p3 or not boolean.toJSBoolean(p3.ignoreFieldConflicts)) then
		local var2 = extractType(var1.type)
		local var3 = extractType(p2.type)
		
		if var2.name.value ~= var3.name.value then
			error(error.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(p2.name.value), tostring(var2.name.value), tostring(var3.name.value))))
		end
	end
	return not not boolean.toJSBoolean(var1)
end

function t.mergeFields(p1, p2, p3, p4)
	-- upvalues: array (ref), boolean (ref), fieldAlreadyExists (ref), preventConflicts (write), isNonNullTypeNode (ref), mergeArguments (ref), mergeDirectives (ref), compareNodes (ref)
	local t = {}
	
	if p3 ~= nil then
		t = array.concat(t, p3)
	end
	if p2 ~= nil then
		for i, v in p2 do
			if boolean.toJSBoolean(fieldAlreadyExists(t, v, p4)) then
				local var1 = array.find(t, function(p5)
					-- upvalues: v (ref)
					return p5.name.value == v.name.value
				end)
				
				if not p4 or not boolean.toJSBoolean(p4.ignoreFieldConflicts) then
					if p4 and boolean.toJSBoolean(p4.throwOnConflict) then
						preventConflicts(p1, var1, v, false)
					else
						preventConflicts(p1, var1, v, true)
					end
					local var2 = isNonNullTypeNode(v.type)
					
					if boolean.toJSBoolean(if boolean.toJSBoolean(var2) then not boolean.toJSBoolean(isNonNullTypeNode(var1.type)) else var2) then
						var1.type = v.type
					end
				end
				var1.arguments = mergeArguments(if boolean.toJSBoolean(v.arguments) then v.arguments else {}, if boolean.toJSBoolean(var1.arguments) then var1.arguments else {}, p4)
				var1.directives = mergeDirectives(v.directives, var1.directives, p4)
				var1.description = if boolean.toJSBoolean(v.description) then v.description else var1.description
			else
				table.insert(t, v)
			end
		end
	end
	if p4 and boolean.toJSBoolean(p4.sort) then
		array.sort(t, compareNodes)
	end
	if p4 and p4.exclusions then
		local exclusions = p4.exclusions
		
		return array.filter(t, function(p5)
			-- upvalues: boolean (copy), array (copy), exclusions (ref), p1 (ref)
			return not boolean.toJSBoolean(array.includes(exclusions, ("%s.%s"):format(tostring(p1.name.value), tostring(p5.name.value))))
		end)
	end
	return t
end

preventConflicts = function(p5, p6, p7, p8)
	-- upvalues: printTypeNode (ref), boolean (ref), safeChangeForFieldType (write), error (ref)
	local var3 = if p8 ~= nil then false else p8
	local var4 = printTypeNode(p6.type)
	local var5 = printTypeNode(p7.type)
	
	if var4 ~= var5 and not boolean.toJSBoolean(safeChangeForFieldType(p6.type, p7.type, var3)) then
		error(error.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(p5.name.value), tostring(p6.name.value), tostring(var4), tostring(var5))))
	end
end

safeChangeForFieldType = function(p5, p6, p7)
	-- upvalues: boolean (ref), isWrappingTypeNode (ref), isNonNullTypeNode (ref), safeChangeForFieldType (write), isListTypeNode (ref)
	return if boolean.toJSBoolean(isWrappingTypeNode(p5)) or boolean.toJSBoolean(isWrappingTypeNode(p6)) then if boolean.toJSBoolean(isNonNullTypeNode(p6)) then safeChangeForFieldType(if boolean.toJSBoolean(isNonNullTypeNode(p5)) then p5.type else p5, p6.type) elseif boolean.toJSBoolean(isNonNullTypeNode(p5)) then safeChangeForFieldType(p6, p5, if p7 ~= nil then false else p7) elseif boolean.toJSBoolean(isListTypeNode(p5)) then isListTypeNode(p6) and safeChangeForFieldType(p5.type, p6.type) or isNonNullTypeNode(p6) and safeChangeForFieldType(p5, p6.type) else false else typeof(p5) == "table" and #p5 == 0 and (typeof(p6) == "table" and #p6 == 0) or tostring(p5) == tostring(p6)
end

return t