local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local naturalCompare = require(script.Parent.naturalCompare).naturalCompare
local t = {}

local function suggestionList(p0, p1) --[[ line: 34 ]]
	-- upvalues: t (ref), object (ref), naturalCompare (ref)
	local t_1 = {}
	local var4 = t.new(p0)
	local var5 = math.floor(p0:len() * 0.4) + 1
	
	for i = 1, #p1 do
		local var6 = p1[i]
		local var7 = var4:measure(var6, var5)
		
		if var7 ~= nil then
			t_1[var6] = var7
		end
	end
	local var8 = object.keys(t_1)
	table.sort(var8, function(p2, p3) --[[ line: 49 ]]
		-- upvalues: t_1 (ref), naturalCompare (copy)
		local var9 = t_1[p2] - t_1[p3]
		
		return if var9 == 0 then naturalCompare(p2, p3) < 0 else var9 < 0
	end)
	
	return var8
end

local stringToArray = nil
t.__index = t

function t.new(p4) --[[ line: 78 ]]
	-- upvalues: t (ref), stringToArray (write)
	local tbl = setmetatable({}, t)
	tbl._input = p4
	tbl._inputLowerCase = p4:lower()
	tbl._inputArray = stringToArray(tbl._inputLowerCase)
	local var11 = p4:len()
	tbl._rows = {
		table.create(var11 + 1, 0),
		table.create(var11 + 1, 0),
		table.create(var11 + 1, 0)
	}
	
	return tbl
end

function t:measure(p5, p6) --[[ line: 93 ]]
	-- upvalues: stringToArray (write)
	if self._input == p5 then
		return 0
	end
	local var12 = p5:lower()
	
	if self._inputLowerCase == var12 then
		return 1
	end
	local var13 = stringToArray(var12)
	local inputArray = self._inputArray
	
	if #var13 < #inputArray then
		local var14 = var13
		var13 = inputArray
		inputArray = var14
	end
	local var13Count = #var13
	local inputArrayCount = #inputArray
	
	if p6 < var13Count - inputArrayCount then
		return nil
	end
	local rows = self._rows
	
	for i = 0, inputArrayCount do
		rows[1][i + 1] = i
	end
	for i_2 = 1, var13Count do
		local var17 = rows[(i_2 - 1) % 3 + 1]
		local var18 = rows[i_2 % 3 + 1]
		var18[1] = i_2
		local var19 = i_2
		
		for i_1 = 1, inputArrayCount do
			local minValue = math.min(var17[i_1 + 1] + 1, var18[i_1] + 1, var17[i_1] + (if var13[i_2] == inputArray[i_1] then 0 else 1))
			
			if i_2 > 1 and i_1 > 1 and (var13[i_2] == inputArray[i_1 - 1] and var13[i_2 - 1] == inputArray[i_1]) then
				minValue = math.min(minValue, rows[(i_2 - 2) % 3 + 1][i_1 - 1] + 1)
			end
			if minValue < var19 then
				var19 = minValue
			end
			var18[i_1 + 1] = minValue
		end
		if p6 >= var19 then
			continue
		end
		return nil
	end
	local var21 = rows[var13Count % 3 + 1][inputArrayCount + 1]
	
	return if var21 <= p6 then var21 else nil
end

stringToArray = function(p7) --[[ line: 168 | named "stringToArray" ]]
	local t = {}
	
	for i = 1, p7:len() do
		t[i] = p7:byte(i)
	end
	return t
end

return { suggestionList = suggestionList }