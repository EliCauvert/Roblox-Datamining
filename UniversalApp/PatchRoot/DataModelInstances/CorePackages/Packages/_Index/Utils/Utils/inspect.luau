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

function t.inspect(p1)
	-- upvalues: formatValue (write)
	return formatValue(p1, {})
end

formatValue = function(p1, p2)
	-- upvalues: boolean (ref), formatObjectValue (write)
	local var1 = typeof(p1)
	
	if var1 == "string" then
		return "\"" .. p1 .. "\""
	elseif var1 == "function" then
		local debugInfo = debug.info(p1, "n")
		
		return if boolean.toJSBoolean(debugInfo) then ("[function %s]"):format(debugInfo) else "[function]"
	end
	return if var1 == "table" then formatObjectValue(p1, p2) else tostring(p1)
end

local function formatError(p1)
	-- upvalues: instanceof (ref), graphQLError (ref)
	return if instanceof(p1, graphQLError) then tostring(p1) else ("%s: %s;\n %s"):format(tostring(p1.name), tostring(p1.message), tostring(p1.stack))
end

formatObjectValue = function(p1, p2)
	-- upvalues: instanceof (ref), error (ref), isAggregateError (ref), graphQLError (ref), formatArray (write), formatError (ref), boolean (ref), array (ref), isJSONable (write), formatValue (write), formatObject (write)
	if p1 == nil then
		return "null"
	elseif instanceof(p1, error) then
		return if isAggregateError(p1) then (if instanceof(p1, graphQLError) then tostring(p1) else ("%s: %s;\n %s"):format(tostring(p1.name), tostring(p1.message), tostring(p1.stack))) .. "\n" .. formatArray(p1.errors, p2) else formatError(p1)
	elseif boolean.toJSBoolean(array.includes(p2, p1)) then
		return "[Circular]"
	end
	local var1 = array.concat({}, p2, { p1 })
	
	if boolean.toJSBoolean(isJSONable(p1)) then
		local var2 = p1:toJSON()
		
		if var2 == p1 then
		end
		return if typeof(var2) == "string" then var2 else formatValue(var2, var1)
	else
		return if boolean.toJSBoolean(array.isArray(p1)) then formatArray(p1, var1) else formatObject(p1, var1)
	end
end

isJSONable = function(p1)
	return typeof(p1.toJSON) == "function"
end

formatObject = function(p1, p2)
	-- upvalues: object (ref), getObjectTag (write), array (ref), formatValue (write)
	local var1 = object.entries(p1)
	
	return if #var1 == 0 then "{}" elseif #p2 > 3 then "[" .. tostring(getObjectTag(p1)) .. "]" else "{ " .. tostring(array.join(array.map(var1, function(p3)
		-- upvalues: formatValue (copy), p2 (ref)
		local unpacked, unpacked_1 = table.unpack(p3, 1, 2)
		
		return tostring(unpacked) .. ": " .. tostring(formatValue(unpacked_1, p2))
	end), ", ")) .. " }"
end

formatArray = function(p1, p2)
	-- upvalues: formatValue (write), array (ref)
	if #p1 == 0 then
		return "[]"
	elseif #p2 > 3 then
		return "[Array]"
	end
	local p10Count = #p1
	local p10Count_1 = #p1
	local t = {}
	local var1 = 1
	while var1 <= p10Count do
		table.insert(t, formatValue(p1[var1], p2))
		var1 += 1
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