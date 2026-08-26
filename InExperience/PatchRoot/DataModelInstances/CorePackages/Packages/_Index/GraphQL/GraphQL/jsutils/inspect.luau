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

local function inspect(p1)
	-- upvalues: formatValue (write)
	return formatValue(p1, {})
end

formatValue = function(p1, p2)
	-- upvalues: httpService (ref), nullModule (ref), formatObjectValue (write)
	local var1 = typeof(p1)
	
	return if var1 == "string" then httpService:JSONEncode(p1) elseif var1 == "number" then if p1 == p1 then if p1 == 1e999 then "Infinity" elseif p1 == -1e999 then "-Infinity" else tostring(p1) else "NaN" elseif var1 == "function" then "[function]" elseif var1 == "table" then if p1 == nullModule then "null" else formatObjectValue(p1, p2) else tostring(p1)
end

formatObjectValue = function(p1, p2)
	-- upvalues: formatValue (write), array (ref), formatArray (write), formatObject (write)
	if table.find(p2, p1) ~= nil then
		return "[Circular]"
	end
	local list = { unpack(p2) }
	table.insert(list, p1)
	
	if typeof(p1.toJSON) == "function" then
		local var1 = p1:toJSON(p1)
		
		if var1 == p1 then
		end
		return if typeof(var1) == "string" then var1 else formatValue(var1, list)
	else
		return if array.isArray(p1) then formatArray(p1, list) else formatObject(p1, list)
	end
end

formatObject = function(p1, p2)
	-- upvalues: object (ref), getObjectTag (write), formatValue (write)
	local var1 = object.keys(p1)
	
	if #var1 == 0 then
		return "{}"
	elseif #p2 > 2 then
		return "[" .. getObjectTag(p1) .. "]"
	end
	local t = {}
	
	for i = 1, #var1 do
		local var2 = var1[i]
		t[i] = var2 .. ": " .. formatValue(p1[var2], p2)
	end
	return "{ " .. table.concat(t, ", ") .. " }"
end

formatArray = function(p3, p4)
	-- upvalues: formatValue (write)
	local p7Count = #p3
	
	if p7Count == 0 then
		return "[]"
	elseif #p4 > 2 then
		return "[Array]"
	end
	local minValue = math.min(10, p7Count)
	local var3 = p7Count - minValue
	local t = {}
	
	for i = 1, minValue do
		t[i] = formatValue(p3[i], p4)
	end
	if var3 == 1 then
		table.insert(t, "... 1 more item")
	elseif var3 > 1 then
		table.insert(t, ("... %d more items"):format(var3))
	end
	return "[" .. table.concat(t, ", ") .. "]"
end

getObjectTag = function(_)
	return "Object"
end

return { inspect = inspect }