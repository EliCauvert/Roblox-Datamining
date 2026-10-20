local HttpService = game:GetService("HttpService")
local IsArrayModule = require(script.Parent.isArray)
local ObjectKeysModule = require(script.Parent.objectKeys)
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil

local function _(p1, p2): number?
	for i = 1, #p1 do
		if p1[i] == p2 then
			return i
		end
	end
	return nil
end

local function inspect(p3)
	-- upvalues: Callback (ref)
	return Callback(p3, {})
end

Callback = function(JSON, JSONs)
	-- upvalues: HttpService (copy), Callback1 (ref)
	local ValueType = typeof(JSON)
	
	return if ValueType == "string" then HttpService:JSONEncode(JSON) elseif ValueType == "number" then if JSON == JSON then if JSON == 1e999 then "Infinity" elseif JSON == -1e999 then "-Infinity" else tostring(JSON) else "NaN" elseif ValueType == "function" then "[function]" elseif ValueType == "table" then Callback1(JSON, JSONs) else tostring(JSON)
end

Callback1 = function(Input, p3)
	-- upvalues: Callback (ref), IsArrayModule (copy), Callback2 (ref), Callback3 (ref)
	local v1: number? = nil
	
	for i = 1, #p3 do
		if p3[i] ~= Input then
			continue
		end
		v1 = i
		break
	end
	if v1 ~= nil then
		return "[Circular]"
	end
	local JSONs = { unpack(p3) }
	table.insert(JSONs, Input)
	
	if typeof(Input.toJSON) == "function" then
		local JSON = Input:toJSON(Input)
		
		if JSON ~= Input then
			return if typeof(JSON) == "string" then JSON else Callback(JSON, JSONs)
		end
	elseif IsArrayModule(Input) then
		return Callback2(Input, JSONs)
	end
	return Callback3(Input, JSONs)
end

Callback3 = function(JSON, JSONs): string
	-- upvalues: ObjectKeysModule (copy), Callback4 (ref), Callback (ref)
	local ObjectKeysModuleResult = ObjectKeysModule(JSON)
	
	if #ObjectKeysModuleResult == 0 then
		return "{}"
	end
	if #JSONs > 3 then
		return "[" .. Callback4(JSON) .. "]"
	end
	local List = {}
	
	for i = 1, #ObjectKeysModuleResult do
		local ObjectKeysModuleResultEntry = ObjectKeysModuleResult[i]
		List[i] = ObjectKeysModuleResultEntry .. ": " .. Callback(JSON[ObjectKeysModuleResultEntry], JSONs)
	end
	return "{ " .. table.concat(List, ", ") .. " }"
end

Callback2 = function(JSON, JSONs): string
	-- upvalues: Callback (ref)
	local CountJSON = #JSON
	
	if CountJSON == 0 then
		return "[]"
	end
	if #JSONs > 3 then
		return "[Array]"
	end
	local Smallest = math.min(3, CountJSON)
	local CountJSONDelta = CountJSON - Smallest
	local List = {}
	
	for i = 1, Smallest do
		List[i] = Callback(JSON[i], JSONs)
	end
	if CountJSONDelta == 1 then
		table.insert(List, "... 1 more item")
	elseif CountJSONDelta > 1 then
		table.insert(List, ("... %s more items"):format(CountJSONDelta))
	end
	return "[" .. table.concat(List, ", ") .. "]"
end

Callback4 = function(_): string
	return "Object"
end

return { inspect = inspect }