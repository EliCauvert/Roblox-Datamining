local httpService = game:GetService("HttpService")
local parent = script.Parent
local isArrayModule = require(parent.Array.isArray)
local _ = require(parent.Parent.ES7Types)
local formatValue = nil
local formatObjectValue = nil
local formatArray = nil
local formatObject = nil
local getObjectTag = nil

local function inspect(p0, p1) --[[ line: 51 ]]
	-- upvalues: formatValue (write)
	p1 = p1 or { depth = 2 }
	local depth = p1.depth or 2
	p1.depth = if depth >= 0 then depth else 2
	
	return formatValue(p0, {}, p1)
end

local function _(p2, p3) --[[ line: 58 | named "isIndexKey" ]]
	return type(p2) == "number" and (p2 <= p3 and (p2 >= 1 and math.floor(p2) == p2))
end

local _ = function(p4) --[[ line: 65 | named "getTableLength" ]]
	local var12 = 1
	local var13 = rawget(p4, var12)
	while var13 ~= nil do
		var12 += 1
		var13 = rawget(p4, var12)
	end
	return var12 - 1
end

local function sortKeysForPrinting(p5, p6) --[[ line: 75 ]]
	local var14 = type(p5)
	local var15 = type(p6)
	
	return if var14 == var15 and (var14 == "number" or var14 == "string") then p5 < p6 else var14 < var15
end

local _ = function(p7) --[[ line: 88 | named "rawpairs" ]]
	return next, p7, nil
end

local function getFragmentedKeys(p8) --[[ line: 92 ]]
	-- upvalues: sortKeysForPrinting (ref)
	local t = {}
	local var17 = 0
	local var18 = 1
	local var19 = rawget(p8, var18)
	while var19 ~= nil do
		var18 += 1
		var19 = rawget(p8, var18)
	end
	local var20 = var18 - 1
	
	for i, v in next, p8 do
		if not (type(i) == "number" and (i <= var20 and (i >= 1 and math.floor(i) == i))) then
			var17 += 1
			t[var17] = i
		end
	end
	table.sort(t, sortKeysForPrinting)
	
	return t, var17, var20
end

formatValue = function(p9, p10, p11) --[[ line: 106 | named "formatValue" ]]
	-- upvalues: httpService (ref), formatObjectValue (write)
	local var21 = typeof(p9)
	
	if var21 == "string" then
		return httpService:JSONEncode(p9)
	elseif var21 == "number" then
		return if p9 == p9 then if p9 == 1e999 then "Infinity" elseif p9 == -1e999 then "-Infinity" else tostring(p9) else "NaN"
	elseif var21 == "function" then
		local var22 = "[function"
		local debugInfo = debug.info(p9, "n")
		
		if debugInfo ~= nil and debugInfo ~= "" then
			var22 ..= " " .. debugInfo
		end
		return var22 .. "]"
	else
		return if var21 == "table" then formatObjectValue(p9, p10, p11) else tostring(p9)
	end
end

formatObjectValue = function(p12, p13, p14) --[[ line: 139 | named "formatObjectValue" ]]
	-- upvalues: formatValue (write), isArrayModule (ref), formatArray (write), formatObject (write)
	if table.find(p13, p12) ~= nil then
		return "[Circular]"
	end
	local list = { unpack(p13) }
	table.insert(list, p12)
	
	if typeof(p12.toJSON) == "function" then
		local var25 = p12:toJSON(p12)
		
		if var25 == p12 then
		end
		return if typeof(var25) == "string" then var25 else formatValue(var25, list, p14)
	else
		return if isArrayModule(p12) then formatArray(p12, list, p14) else formatObject(p12, list, p14)
	end
end

formatObject = function(p15, p16, p17) --[[ line: 164 | named "formatObject" ]]
	-- upvalues: getFragmentedKeys (ref), getObjectTag (write), formatValue (write)
	local var26 = ""
	local var27 = getmetatable(p15)
	
	if var27 and rawget(var27, "__tostring") then
		return tostring(p15)
	end
	local var28, var29, var30 = getFragmentedKeys(p15)
	
	if var30 == 0 and var29 == 0 then
		var26 ..= "{}"
		
		return var26
	elseif p17.depth < #p16 then
		var26 ..= "[" .. getObjectTag(p15) .. "]"
		
		return var26
	end
	local t = {}
	
	for i = 1, var30 do
		table.insert(t, formatValue(p15[i], p16, p17))
	end
	for i_1 = 1, var29 do
		local var32 = var28[i_1]
		table.insert(t, var32 .. ": " .. formatValue(p15[var32], p16, p17))
	end
	return var26 .. "{ " .. table.concat(t, ", ") .. " }"
end

formatArray = function(p18, p19, p20) --[[ line: 200 | named "formatArray" ]]
	-- upvalues: formatValue (write)
	local p18Count = #p18
	
	if p18Count == 0 then
		return "[]"
	elseif p20.depth < #p19 then
		return "[Array]"
	end
	local minValue = math.min(10, p18Count)
	local var35 = p18Count - minValue
	local t = {}
	
	for i = 1, minValue do
		t[i] = formatValue(p18[i], p19, p20)
	end
	if var35 == 1 then
		table.insert(t, "... 1 more item")
	elseif var35 > 1 then
		table.insert(t, ("... %s more items"):format(tostring(var35)))
	end
	return "[" .. table.concat(t, ", ") .. "]"
end

getObjectTag = function(_) --[[ line: 226 | named "getObjectTag" ]]
	return "Object"
end

return inspect