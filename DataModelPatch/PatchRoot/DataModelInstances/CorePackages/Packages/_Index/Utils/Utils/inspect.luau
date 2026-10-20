local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local InstanceofFunction = LuauPolyfillModule.instanceof
local Error = LuauPolyfillModule.Error
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Callback5 = nil
local GraphQLError = require(Parent.GraphQL).GraphQLError
local IsAggregateErrorFunction = require(script.Parent.AggregateError).isAggregateError
local InspectModule = {
	inspect = function(p1)
		-- upvalues: Callback (ref)
		return Callback(p1, {})
	end
}

Callback = function(JSON, ConcatResult)
	-- upvalues: Boolean (copy), Callback1 (ref)
	local ValueType = typeof(JSON)
	
	if ValueType == "string" then
		return "\"" .. JSON .. "\""
	elseif ValueType == "function" then
		local DebugInfo = debug.info(JSON, "n")
		
		return if Boolean.toJSBoolean(DebugInfo) then ("[function %s]"):format(DebugInfo) else "[function]"
	else
		return if ValueType == "table" then Callback1(JSON, ConcatResult) else tostring(JSON)
	end
end

local function formatError(JSON): string
	-- upvalues: InstanceofFunction (copy), GraphQLError (copy)
	return if InstanceofFunction(JSON, GraphQLError) then tostring(JSON) else ("%s: %s;\n %s"):format(tostring(JSON.name), tostring(JSON.message), (tostring(JSON.stack)))
end

Callback1 = function(JSON, p1)
	-- upvalues: InstanceofFunction (copy), Error (copy), IsAggregateErrorFunction (copy), GraphQLError (copy), Callback2 (ref), formatError (copy), Boolean (copy), Array (copy), Callback3 (ref), Callback (ref), Callback4 (ref)
	if JSON == nil then
		return "null"
	end
	if InstanceofFunction(JSON, Error) then
		return if IsAggregateErrorFunction(JSON) then (if InstanceofFunction(JSON, GraphQLError) then tostring(JSON) else ("%s: %s;\n %s"):format(tostring(JSON.name), tostring(JSON.message), (tostring(JSON.stack)))) .. "\n" .. Callback2(JSON.errors, p1) else formatError(JSON)
	end
	if Boolean.toJSBoolean(Array.includes(p1, JSON)) then
		return "[Circular]"
	end
	local ConcatResult = Array.concat({}, p1, { JSON })
	
	if Boolean.toJSBoolean(Callback3(JSON)) then
		local JSON1 = JSON:toJSON()
		
		if JSON1 ~= JSON then
			return if typeof(JSON1) == "string" then JSON1 else Callback(JSON1, ConcatResult)
		end
	elseif Boolean.toJSBoolean(Array.isArray(JSON)) then
		return Callback2(JSON, ConcatResult)
	end
	return Callback4(JSON, ConcatResult)
end

Callback3 = function(JSON): boolean
	return typeof(JSON.toJSON) == "function"
end

Callback4 = function(JSON, ConcatResult): string
	-- upvalues: Object (copy), Callback5 (ref), Array (copy), Callback (ref)
	local EntriesResult = Object.entries(JSON)
	
	return if #EntriesResult == 0 then "{}" elseif #ConcatResult > 3 then "[" .. tostring(Callback5(JSON)) .. "]" else "{ " .. tostring(Array.join(Array.map(EntriesResult, function(p1): string
		-- upvalues: Callback (upval), ConcatResult (copy)
		local Unpacked, Unpacked2 = table.unpack(p1, 1, 2)
		
		return tostring(Unpacked) .. ": " .. tostring(Callback(Unpacked2, ConcatResult))
	end), ", ")) .. " }"
end

Callback2 = function(Errors, ConcatResult): string
	-- upvalues: Callback (ref), Array (copy)
	if #Errors == 0 then
		return "[]"
	end
	if #ConcatResult > 3 then
		return "[Array]"
	end
	local CountErrors = #Errors
	local CountErrors1 = #Errors
	local List = {}
	local Count = 1
	while Count <= CountErrors do
		table.insert(List, Callback(Errors[Count], ConcatResult))
		Count += 1
	end
	if CountErrors1 == 1 then
		table.insert(List, "... 1 more item")
	elseif CountErrors1 > 1 then
		table.insert(List, ("... %s more items"):format((tostring(CountErrors1))))
	end
	return "[" .. tostring(Array.join(List, ", ")) .. "]"
end

Callback5 = function(_): string
	return "Object"
end

return InspectModule