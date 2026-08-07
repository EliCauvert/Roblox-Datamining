local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local nullModule = require(parent_1.luaUtils.null)
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local formatObject = nil
local getObjectTag = nil

local function inspect(p0) --[[ line: 33 ]]
	-- upvalues: formatValue (write)
	return formatValue(p0, {})
end

formatValue = function(p1, p2) --[[ line: 37 | named "formatValue" ]]
	-- upvalues: httpService (ref), nullModule (ref), formatObjectValue (write)
	local var9 = typeof(p1)
	
	return if var9 == "string" then httpService:JSONEncode(p1) elseif var9 == "number" then if p1 == p1 then if p1 == 1e999 then "Infinity" elseif p1 == -1e999 then "-Infinity" else tostring(p1) else "NaN" elseif var9 == "function" then "[function]" elseif var9 == "table" then if p1 == nullModule then "null" else formatObjectValue(p1, p2) else tostring(p1)
end

formatObjectValue = function(p3, p4) --[[ line: 65 | named "formatObjectValue" ]]
	-- upvalues: formatValue (write), array (ref), formatArray (write), formatObject (write)
	if table.find(p4, p3) ~= nil then
		return "[Circular]"
	end
	local list = { unpack(p4) }
	table.insert(list, p3)
	
	if typeof(p3.toJSON) == "function" then
		local var11 = p3:toJSON(p3)
		
		if var11 == p3 then
		end
		return if typeof(var11) == "string" then var11 else formatValue(var11, list)
	else
		return if array.isArray(p3) then formatArray(p3, list) else formatObject(p3, list)
	end
end

formatObject = function(p5, p6) --[[ line: 90 | named "formatObject" ]]
	-- upvalues: object (ref), getObjectTag (write), formatValue (write)
	local var12 = object.keys(p5)
	
	if #var12 == 0 then
		return "{}"
	elseif #p6 > 2 then
		return "[" .. getObjectTag(p5) .. "]"
	end
	local t = {}
	
	for i = 1, #var12 do
		local var14 = var12[i]
		t[i] = var14 .. ": " .. formatValue(p5[var14], p6)
	end
	return "{ " .. table.concat(t, ", ") .. " }"
end

formatArray = function(p7, p8) --[[ line: 111 | named "formatArray" ]]
	-- upvalues: formatValue (write)
	local p7Count = #p7
	
	if p7Count == 0 then
		return "[]"
	elseif #p8 > 2 then
		return "[Array]"
	end
	local minValue = math.min(10, p7Count)
	local var17 = p7Count - minValue
	local t = {}
	
	for i = 1, minValue do
		t[i] = formatValue(p7[i], p8)
	end
	if var17 == 1 then
		table.insert(t, "... 1 more item")
	elseif var17 > 1 then
		table.insert(t, ("... %d more items"):format(var17))
	end
	return "[" .. table.concat(t, ", ") .. "]"
end

getObjectTag = function(_) --[[ line: 137 | named "getObjectTag" ]]
	return "Object"
end

return { inspect = inspect }