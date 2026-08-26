local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local naturalCompare = require(script.Parent.naturalCompare).naturalCompare
local t = {}

local function suggestionList(p1, p2)
	-- upvalues: t (ref), object (ref), naturalCompare (ref)
	local t_1 = {}
	local var1 = t.new(p1)
	local var2 = math.floor(p1:len() * 0.4) + 1
	
	for i = 1, #p2 do
		local var3 = p2[i]
		local var4 = var1:measure(var3, var2)
		
		if var4 ~= nil then
			t_1[var3] = var4
		end
	end
	local var5 = object.keys(t_1)
	table.sort(var5, function(p3, p4)
		-- upvalues: t_1 (ref), naturalCompare (copy)
		local var6 = t_1[p3] - t_1[p4]
		
		return if var6 == 0 then naturalCompare(p3, p4) < 0 else var6 < 0
	end)
	
	return var5
end

local stringToArray = nil
t.__index = t

function t.new(p3)
	-- upvalues: t (ref), stringToArray (write)
	local tbl = setmetatable({}, t)
	tbl._input = p3
	tbl._inputLowerCase = p3:lower()
	tbl._inputArray = stringToArray(tbl._inputLowerCase)
	local var6 = p3:len()
	tbl._rows = {
		table.create(var6 + 1, 0),
		table.create(var6 + 1, 0),
		table.create(var6 + 1, 0)
	}
	
	return tbl
end

function t:measure(p3, p4)
	-- upvalues: stringToArray (write)
	if self._input == p3 then
		return 0
	end
	local var6 = p3:lower()
	
	if self._inputLowerCase == var6 then
		return 1
	end
	local var7 = stringToArray(var6)
	local inputArray = self._inputArray
	
	if #var7 < #inputArray then
		local var8 = var7
		var7 = inputArray
		inputArray = var8
	end
	local var13Count = #var7
	local inputArrayCount = #inputArray
	
	if p4 < var13Count - inputArrayCount then
		return nil
	end
	local rows = self._rows
	
	for i = 0, inputArrayCount do
		rows[1][i + 1] = i
	end
	for i_2 = 1, var13Count do
		local var9 = rows[(i_2 - 1) % 3 + 1]
		local var10 = rows[i_2 % 3 + 1]
		var10[1] = i_2
		local var11 = i_2
		
		for i_1 = 1, inputArrayCount do
			local minValue = math.min(var9[i_1 + 1] + 1, var10[i_1] + 1, var9[i_1] + (if var7[i_2] == inputArray[i_1] then 0 else 1))
			
			if i_2 > 1 and i_1 > 1 and (var7[i_2] == inputArray[i_1 - 1] and var7[i_2 - 1] == inputArray[i_1]) then
				minValue = math.min(minValue, rows[(i_2 - 2) % 3 + 1][i_1 - 1] + 1)
			end
			if minValue < var11 then
				var11 = minValue
			end
			var10[i_1 + 1] = minValue
		end
		if p4 >= var11 then
			continue
		end
		return nil
	end
	local var12 = rows[var13Count % 3 + 1][inputArrayCount + 1]
	
	return if var12 <= p4 then var12 else nil
end

stringToArray = function(p5)
	local t = {}
	
	for i = 1, p5:len() do
		t[i] = p5:byte(i)
	end
	return t
end

return { suggestionList = suggestionList }