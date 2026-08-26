local httpService = game:GetService("HttpService")
local parent = script.Parent
local isArrayModule = require(parent.Array.isArray)
local _ = require(parent.Parent.ES7Types)
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local formatObject = nil
local getObjectTag = nil

local function inspect(p1, p2)
	-- upvalues: formatValue (write)
	p2 = p2 or { depth = 2 }
	local depth = p2.depth or 2
	p2.depth = if depth >= 0 then depth else 2
	
	return formatValue(p1, {}, p2)
end

local function _(p1, p2)
	return type(p1) == "number" and (p1 <= p2 and (p1 >= 1 and math.floor(p1) == p1))
end

local _ = function(p1)
	local var1 = 1
	local var2 = rawget(p1, var1)
	while var2 ~= nil do
		var1 += 1
		var2 = rawget(p1, var1)
	end
	return var1 - 1
end

local function sortKeysForPrinting(p2, p3)
	local var3 = type(p2)
	local var4 = type(p3)
	
	return if var3 == var4 and (var3 == "number" or var3 == "string") then p2 < p3 else var3 < var4
end

local _ = function(p2)
	return next, p2, nil
end

local function getFragmentedKeys(p2)
	-- upvalues: sortKeysForPrinting (ref)
	local t = {}
	local var3 = 0
	local var4 = 1
	local var5 = rawget(p2, var4)
	while var5 ~= nil do
		var4 += 1
		var5 = rawget(p2, var4)
	end
	local var6 = var4 - 1
	
	for i, v in next, p2 do
		if not (type(i) == "number" and (i <= var6 and (i >= 1 and math.floor(i) == i))) then
			var3 += 1
			t[var3] = i
		end
	end
	table.sort(t, sortKeysForPrinting)
	
	return t, var3, var6
end

formatValue = function(p3, p4, p5)
	-- upvalues: httpService (ref), formatObjectValue (write)
	local var7 = typeof(p3)
	
	if var7 == "string" then
		return httpService:JSONEncode(p3)
	elseif var7 == "number" then
		return if p3 == p3 then if p3 == 1e999 then "Infinity" elseif p3 == -1e999 then "-Infinity" else tostring(p3) else "NaN"
	elseif var7 == "function" then
		local var8 = "[function"
		local debugInfo = debug.info(p3, "n")
		
		if debugInfo ~= nil and debugInfo ~= "" then
			var8 ..= " " .. debugInfo
		end
		return var8 .. "]"
	else
		return if var7 == "table" then formatObjectValue(p3, p4, p5) else tostring(p3)
	end
end

formatObjectValue = function(p3, p4, p5)
	-- upvalues: formatValue (write), isArrayModule (ref), formatArray (write), formatObject (write)
	if table.find(p4, p3) ~= nil then
		return "[Circular]"
	end
	local list = { unpack(p4) }
	table.insert(list, p3)
	
	if typeof(p3.toJSON) == "function" then
		local var7 = p3:toJSON(p3)
		
		if var7 == p3 then
		end
		return if typeof(var7) == "string" then var7 else formatValue(var7, list, p5)
	else
		return if isArrayModule(p3) then formatArray(p3, list, p5) else formatObject(p3, list, p5)
	end
end

formatObject = function(p3, p4, p5)
	-- upvalues: getFragmentedKeys (ref), getObjectTag (write), formatValue (write)
	local var7 = ""
	local var8 = getmetatable(p3)
	
	if var8 and rawget(var8, "__tostring") then
		return tostring(p3)
	end
	local var9, var10, var11 = getFragmentedKeys(p3)
	
	if var11 == 0 and var10 == 0 then
		var7 ..= "{}"
		
		return var7
	elseif p5.depth < #p4 then
		var7 ..= "[" .. getObjectTag(p3) .. "]"
		
		return var7
	end
	local t = {}
	
	for i = 1, var11 do
		table.insert(t, formatValue(p3[i], p4, p5))
	end
	for i_1 = 1, var10 do
		local var12 = var9[i_1]
		table.insert(t, var12 .. ": " .. formatValue(p3[var12], p4, p5))
	end
	return var7 .. "{ " .. table.concat(t, ", ") .. " }"
end

formatArray = function(p6, p7, p8)
	-- upvalues: formatValue (write)
	local p18Count = #p6
	
	if p18Count == 0 then
		return "[]"
	elseif p8.depth < #p7 then
		return "[Array]"
	end
	local minValue = math.min(10, p18Count)
	local var13 = p18Count - minValue
	local t = {}
	
	for i = 1, minValue do
		t[i] = formatValue(p6[i], p7, p8)
	end
	if var13 == 1 then
		table.insert(t, "... 1 more item")
	elseif var13 > 1 then
		table.insert(t, ("... %s more items"):format(tostring(var13)))
	end
	return "[" .. table.concat(t, ", ") .. "]"
end

getObjectTag = function(_)
	return "Object"
end

return inspect