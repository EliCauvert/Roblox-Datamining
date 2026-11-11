local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local IsArrayModule = require(Parent.Array.isArray)
local _ = require(Parent.Parent.ES7Types)
local Callback = nil
local Callback1 = nil
local Callback4 = nil
local Callback3 = nil
local Callback2 = nil

local function inspect(p1, p2)
	-- upvalues: Callback (ref)
	local P1 = p2 or { depth = 2 }
	local Depth = P1.depth or 2
	P1.depth = if Depth >= 0 then Depth else 2
	
	return Callback(p1, {}, P1)
end

local function _(Value: number, p1): boolean
	return type(Value) == "number" and (Value <= p1 and Value >= 1) and math.floor(Value) == Value
end

local _ = function(p1): number
	local Count = 1
	local RawValue = rawget(p1, Count)
	while RawValue ~= nil do
		Count += 1
		RawValue = rawget(p1, Count)
	end
	return Count - 1
end

local function sortKeysForPrinting(A, B): boolean
	local ValueType = type(A)
	local ValueType1 = type(B)
	
	return if ValueType == ValueType1 and (ValueType == "number" or ValueType == "string") then A < B else ValueType < ValueType1
end

local _ = function(p2)
	return next, p2, nil
end

local function getFragmentedKeys(p2)
	-- upvalues: sortKeysForPrinting (copy)
	local List = {}
	local Count = 0
	local Count1 = 1
	local RawValue = rawget(p2, Count1)
	while RawValue ~= nil do
		Count1 += 1
		RawValue = rawget(p2, Count1)
	end
	local CountDelta = Count1 - 1
	
	for i, _ in next, p2 do
		if type(i) ~= "number" or (i > CountDelta or (i < 1 or math.floor(i) ~= i)) then
			Count += 1
			List[Count] = i
		end
	end
	table.sort(List, sortKeysForPrinting)
	
	return List, Count, CountDelta
end

Callback = function(JSON, p3, p4)
	-- upvalues: HttpService (copy), Callback1 (ref)
	local ValueType = typeof(JSON)
	
	if ValueType == "string" then
		return HttpService:JSONEncode(JSON)
	end
	if ValueType == "number" then
		return if JSON == JSON then if JSON == 1e999 then "Infinity" elseif JSON == -1e999 then "-Infinity" else tostring(JSON) else "NaN"
	end
	if ValueType ~= "function" then
		return if ValueType == "table" then Callback1(JSON, p3, p4) else tostring(JSON)
	end
	local Text = "[function"
	local DebugInfo = debug.info(JSON, "n")
	
	if DebugInfo ~= nil and DebugInfo ~= "" then
		Text ..= " " .. DebugInfo
	end
	return Text .. "]"
end

Callback1 = function(Value, List, p3)
	-- upvalues: Callback (ref), IsArrayModule (copy), Callback4 (ref), Callback3 (ref)
	if table.find(List, Value) ~= nil then
		return "[Circular]"
	end
	local List1 = { unpack(List) }
	table.insert(List1, Value)
	
	if typeof(Value.toJSON) == "function" then
		local JSON = Value:toJSON(Value)
		
		if JSON ~= Value then
			return if typeof(JSON) == "string" then JSON else Callback(JSON, List1, p3)
		end
	elseif IsArrayModule(Value) then
		return Callback4(Value, List1, p3)
	end
	return Callback3(Value, List1, p3)
end

Callback3 = function(p3, p4, p5): string
	-- upvalues: getFragmentedKeys (copy), Callback2 (ref), Callback (ref)
	local Text = ""
	local Meta = getmetatable(p3)
	
	if Meta and rawget(Meta, "__tostring") then
		return (tostring(p3))
	end
	local FragmentedKeys, FragmentedKeys2, FragmentedKeys3 = getFragmentedKeys(p3)
	
	if FragmentedKeys3 == 0 and FragmentedKeys2 == 0 then
		Text ..= "{}"
		
		return Text
	end
	if p5.depth < #p4 then
		Text ..= "[" .. Callback2(p3) .. "]"
		
		return Text
	end
	local List = {}
	
	for i = 1, FragmentedKeys3 do
		table.insert(List, (Callback(p3[i], p4, p5)))
	end
	for i1 = 1, FragmentedKeys2 do
		local FragmentedKey = FragmentedKeys[i1]
		table.insert(List, FragmentedKey .. ": " .. Callback(p3[FragmentedKey], p4, p5))
	end
	return Text .. "{ " .. table.concat(List, ", ") .. " }"
end

Callback4 = function(p6, p7, p8): string
	-- upvalues: Callback (ref)
	local CountP15 = #p6
	
	if CountP15 == 0 then
		return "[]"
	end
	if p8.depth < #p7 then
		return "[Array]"
	end
	local Smallest = math.min(10, CountP15)
	local CountPDelta = CountP15 - Smallest
	local List = {}
	
	for i = 1, Smallest do
		List[i] = Callback(p6[i], p7, p8)
	end
	if CountPDelta == 1 then
		table.insert(List, "... 1 more item")
	elseif CountPDelta > 1 then
		table.insert(List, ("... %s more items"):format((tostring(CountPDelta))))
	end
	return "[" .. table.concat(List, ", ") .. "]"
end

Callback2 = function(_): string
	return "Object"
end

return inspect