local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local LuauPolyfillModule = require(Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local NullModule = require(Parent.Parent.luaUtils.null)
local Callback = nil
local Callback1 = nil
local Callback3 = nil
local Callback2 = nil
local Callback4 = nil

local function inspect(p1)
	-- upvalues: Callback (ref)
	return Callback(p1, {})
end

Callback = function(JSON, p1)
	-- upvalues: HttpService (copy), NullModule (copy), Callback1 (ref)
	local ValueType = typeof(JSON)
	
	return if ValueType == "string" then HttpService:JSONEncode(JSON) elseif ValueType == "number" then if JSON == JSON then if JSON == 1e999 then "Infinity" elseif JSON == -1e999 then "-Infinity" else tostring(JSON) else "NaN" elseif ValueType == "function" then "[function]" elseif ValueType == "table" then if JSON == NullModule then "null" else Callback1(JSON, p1) else tostring(JSON)
end

Callback1 = function(Value, List)
	-- upvalues: Callback (ref), Array (copy), Callback3 (ref), Callback2 (ref)
	if table.find(List, Value) ~= nil then
		return "[Circular]"
	end
	local List1 = { unpack(List) }
	table.insert(List1, Value)
	
	if typeof(Value.toJSON) == "function" then
		local JSON = Value:toJSON(Value)
		
		if JSON ~= Value then
			return if typeof(JSON) == "string" then JSON else Callback(JSON, List1)
		end
	elseif Array.isArray(Value) then
		return Callback3(Value, List1)
	end
	return Callback2(Value, List1)
end

Callback2 = function(p1, p2): string
	-- upvalues: Object (copy), Callback4 (ref), Callback (ref)
	local KeysResult = Object.keys(p1)
	
	if #KeysResult == 0 then
		return "{}"
	end
	if #p2 > 2 then
		return "[" .. Callback4(p1) .. "]"
	end
	local List = {}
	
	for i = 1, #KeysResult do
		local KeysResultEntry = KeysResult[i]
		List[i] = KeysResultEntry .. ": " .. Callback(p1[KeysResultEntry], p2)
	end
	return "{ " .. table.concat(List, ", ") .. " }"
end

Callback3 = function(p3, p4): string
	-- upvalues: Callback (ref)
	local CountP5 = #p3
	
	if CountP5 == 0 then
		return "[]"
	end
	if #p4 > 2 then
		return "[Array]"
	end
	local Smallest = math.min(10, CountP5)
	local CountPDelta = CountP5 - Smallest
	local List = {}
	
	for i = 1, Smallest do
		List[i] = Callback(p3[i], p4)
	end
	if CountPDelta == 1 then
		table.insert(List, "... 1 more item")
	elseif CountPDelta > 1 then
		table.insert(List, ("... %d more items"):format(CountPDelta))
	end
	return "[" .. table.concat(List, ", ") .. "]"
end

Callback4 = function(_): string
	return "Object"
end

return { inspect = inspect }