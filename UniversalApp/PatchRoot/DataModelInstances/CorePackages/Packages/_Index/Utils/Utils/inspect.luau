local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local instanceof = luauPolyfillModule.instanceof
local error = luauPolyfillModule.Error
local t = {}
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local isJSONable = nil
local formatObject = nil
local getObjectTag = nil
local graphQLError = require(parent.GraphQL).GraphQLError
local isAggregateError = require(script.Parent.AggregateError).isAggregateError

function t.inspect(p0)
	-- upvalues: formatValue (write)
	return formatValue(p0, {})
end

formatValue = function(p1, p2)
	-- upvalues: boolean (ref), formatObjectValue (write)
	local var9 = typeof(p1)
	
	if var9 == "string" then
		return "\"" .. p1 .. "\""
	elseif var9 == "function" then
		local debugInfo = debug.info(p1, "n")
		
		return if boolean.toJSBoolean(debugInfo) then ("[function %s]"):format(debugInfo) else "[function]"
	end
	return if var9 == "table" then formatObjectValue(p1, p2) else tostring(p1)
end

local function formatError(p3)
	-- upvalues: instanceof (ref), graphQLError (ref)
	return if instanceof(p3, graphQLError) then tostring(p3) else ("%s: %s;\n %s"):format(tostring(p3.name), tostring(p3.message), tostring(p3.stack))
end

formatObjectValue = function(p4, p5)
	-- upvalues: instanceof (ref), error (ref), isAggregateError (ref), graphQLError (ref), formatArray (write), formatError (ref), boolean (ref), array (ref), isJSONable (write), formatValue (write), formatObject (write)
	if p4 == nil then
		return "null"
	elseif instanceof(p4, error) then
		return if isAggregateError(p4) then (if instanceof(p4, graphQLError) then tostring(p4) else ("%s: %s;\n %s"):format(tostring(p4.name), tostring(p4.message), tostring(p4.stack))) .. "\n" .. formatArray(p4.errors, p5) else formatError(p4)
	elseif boolean.toJSBoolean(array.includes(p5, p4)) then
		return "[Circular]"
	end
	local var11 = array.concat({}, p5, { p4 })
	
	if boolean.toJSBoolean(isJSONable(p4)) then
		local var12 = p4:toJSON()
		
		if var12 == p4 then
		end
		return if typeof(var12) == "string" then var12 else formatValue(var12, var11)
	else
		return if boolean.toJSBoolean(array.isArray(p4)) then formatArray(p4, var11) else formatObject(p4, var11)
	end
end

isJSONable = function(p6)
	return typeof(p6.toJSON) == "function"
end

formatObject = function(p7, p8)
	-- upvalues: object (ref), getObjectTag (write), array (ref), formatValue (write)
	local var13 = object.entries(p7)
	
	return if #var13 == 0 then "{}" elseif #p8 > 3 then "[" .. tostring(getObjectTag(p7)) .. "]" else "{ " .. tostring(array.join(array.map(var13, function(p9)
		-- upvalues: formatValue (copy), p8 (ref)
		local unpacked, unpacked_1 = table.unpack(p9, 1, 2)
		
		return tostring(unpacked) .. ": " .. tostring(formatValue(unpacked_1, p8))
	end), ", ")) .. " }"
end

formatArray = function(p10, p11)
	-- upvalues: formatValue (write), array (ref)
	if #p10 == 0 then
		return "[]"
	elseif #p11 > 3 then
		return "[Array]"
	end
	local p10Count = #p10
	local p10Count_1 = #p10
	local t = {}
	local var19 = 1
	while var19 <= p10Count do
		table.insert(t, formatValue(p10[var19], p11))
		var19 += 1
	end
	if p10Count_1 == 1 then
		table.insert(t, "... 1 more item")
	elseif p10Count_1 > 1 then
		table.insert(t, ("... %s more items"):format(tostring(p10Count_1)))
	end
	return "[" .. tostring(array.join(t, ", ")) .. "]"
end

getObjectTag = function(_)
	return "Object"
end

return t