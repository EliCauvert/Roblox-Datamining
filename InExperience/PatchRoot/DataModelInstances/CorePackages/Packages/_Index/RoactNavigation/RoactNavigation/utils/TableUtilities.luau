local t = {}

local function _(p1): string --[[ Line: 8 | Named "makeKeyString" ]]
	return if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", (tostring(p1)))
end

local function makeValueString(Key): string --[[ Line: 16 ]]
	local ValueType = type(Key)
	
	return if ValueType == "string" then string.format("%q", Key) elseif ValueType == "function" or ValueType == "table" then string.format("<%s>", (tostring(Key))) else string.format("%s", (tostring(Key)))
end

local function printKeypair(p1, p2, Repeated, p3) --[[ Line: 27 ]]
	-- upvalues: makeValueString (copy)
	print(string.format("%s%s = %s,%s", Repeated, if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", (tostring(p1))), makeValueString(p2), if p3 then string.format(" -- %s", p3) else ""))
end

local TableUtilitiesModule = {
	ShallowEqual = function(List, List1, p1): boolean --[[ Line: 39 ]]
		-- upvalues: t (copy)
		if not List or not List1 then
			return false
		end
		if List == List1 then
			return true
		end
		if not p1 then
			p1 = t
		end
		for i, value in List do
			if List1[i] ~= value and not p1[i] then
				return false
			end
		end
		for i1, value1 in List1 do
			if List[i1] ~= value1 and not p1[i1] then
				return false
			end
		end
		return true
	end
}

local function formatDeepEqualMessage(Text: string, p2) --[[ Line: 64 ]]
	return if p2 == 0 then Text:gsub("{1}", "first"):gsub("{2}", "second") else Text
end

function TableUtilitiesModule.DeepEqual(List, List1, p2) --[[ Line: 75 ]]
	-- upvalues: formatDeepEqualMessage (copy), TableUtilitiesModule (copy)
	local P13 = p2 or 0
	
	if List == List1 then
		return true
	end
	if typeof(List) ~= typeof(List1) then
		return false, formatDeepEqualMessage(("{1} is of type %s, but {2} is of type %s"):format(typeof(List), (typeof(List1))), P13)
	end
	if typeof(List) ~= "table" then
		return false, formatDeepEqualMessage("{1} ~= {2}", P13)
	end
	local t = {}
	local DeepEqualResult2 = nil
	
	for i, value in List do
		t[i] = true
		local DeepEqualResult
		DeepEqualResult, DeepEqualResult2 = TableUtilitiesModule.DeepEqual(value, List1[i], P13 + 1)
		
		if not DeepEqualResult then
			return false, formatDeepEqualMessage(DeepEqualResult2:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i)))), P13)
		end
	end
	local DeepEqualResult2_1 = nil
	for i1, value1 in List1 do
		local Entry = t[i1]
		
		if not Entry then
			local DeepEqualResult1
			DeepEqualResult1, DeepEqualResult2_1 = TableUtilitiesModule.DeepEqual(List[i1], value1, P13 + 1)
			Entry = DeepEqualResult1
		end
		if not Entry then
			return false, formatDeepEqualMessage(DeepEqualResult2_1:gsub("{1}", ("{1}[%s]"):format((tostring(i1)))):gsub("{2}", ("{2}[%s]"):format((tostring(i1)))), P13)
		end
	end
	return true
end

function TableUtilitiesModule.EqualKey(p3, p4, p5): boolean --[[ Line: 127 ]]
	return p3 and p4 and p5 and p5 ~= "" and p3[p5] and p4[p5] and p3[p5] == p4[p5] or false
end

function TableUtilitiesModule.TableDifference(List, p3) --[[ Line: 138 ]]
	local t = {}
	
	for i, value in List do
		if p3[i] ~= List[i] then
			t[i] = value
		end
	end
	return t
end

local _ = function(p4) --[[ Line: 155 | Named "membershipTable" ]]
	local t = {}
	
	for i = 1, #p4 do
		t[p4[i]] = true
	end
	return t
end

local _ = function(List) --[[ Line: 166 | Named "listOfKeys" ]]
	local List1 = {}
	
	for i, _ in List do
		table.insert(List1, i)
	end
	return List1
end

function TableUtilitiesModule.ListDifference(p5, p6) --[[ Line: 178 ]]
	-- upvalues: TableUtilitiesModule (copy)
	local TableDifferenceFunction = TableUtilitiesModule.TableDifference
	local t = {}
	
	for i = 1, #p5 do
		t[p5[i]] = true
	end
	local t1 = {}
	
	for i1 = 1, #p6 do
		t1[p6[i1]] = true
	end
	local List = {}
	
	for i2, _ in TableDifferenceFunction(t, t1) do
		table.insert(List, i2)
	end
	return List
end

function TableUtilitiesModule.CheckListConsistency(List): boolean --[[ Line: 188 ]]
	local Flag = false
	local Flag1 = false
	local Flag2 = true
	local Count = 1
	
	for i, _ in List do
		if type(i) == "string" then
			Flag1 = true
		else
			if type(i) ~= "number" then
				return false
			end
			if Count ~= i then
				Flag2 = false
			end
			Flag = true
		end
		if Flag1 and Flag then
			return false
		end
		Count += 1
	end
	return not Flag or Flag2
end

function TableUtilitiesModule.RecursiveToString(List, p7): string --[[ Line: 223 ]]
	-- upvalues: TableUtilitiesModule (copy)
	local P25 = p7 or ""
	
	if type(List) ~= "table" then
		return (tostring(List))
	end
	local Text = ""
	
	if not TableUtilitiesModule.CheckListConsistency(List) then
		Text ..= "-- WARNING: this table fails the list consistency test\n"
	end
	local Text1 = Text .. "{\n"
	
	for i, value in List do
		if type(i) == "string" then
			Text1 ..= "  " .. P25 .. tostring(i) .. " = " .. TableUtilitiesModule.RecursiveToString(value, "  " .. P25) .. ";\n"
		end
		if type(i) == "number" then
			Text1 ..= "  " .. P25 .. TableUtilitiesModule.RecursiveToString(value, "  " .. P25) .. ",\n"
		end
	end
	return Text1 .. P25 .. "}"
end

function TableUtilitiesModule.Print(p8, p9) --[[ Line: 257 ]]
	-- upvalues: makeValueString (copy), printKeypair (copy)
	local Text = p9 or "  "
	
	if type(p8) ~= "table" then
		error("TableUtilities.Print must be passed a table", 2)
	end
	local t = {}
	
	local function recurse(Key, p10, Count: number) --[[ Line: 267 ]]
		-- upvalues: t (copy), Text (ref), makeValueString (upval), printKeypair (upval), recurse (copy)
		t[Key] = true
		local Repeated = string.rep(Text, Count)
		local Repeated1 = string.rep(Text, Count + 1)
		
		if p10 then
			print(string.format("%s%s = %s {", Repeated, if type(p10) == "string" then string.format("%s", p10) else string.format("[%s]", (tostring(p10))), makeValueString(Key)))
		else
			print(string.format("%s%s {", Repeated, makeValueString(Key)))
		end
		for i, value in Key do
			if type(value) ~= "table" then
				print(string.format("%s%s = %s,%s", Repeated1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", (tostring(i))), makeValueString(value), ""))
				continue
			end
			if t[value] then
				printKeypair(i, value, Repeated1, "Possible cycle")
			else
				recurse(value, i, Count + 1)
			end
		end
		print(string.format("%s}%s", Repeated, if Count > 0 then "," else ""))
	end
	
	recurse(p8, nil, 0)
end

function TableUtilitiesModule.FieldCount(List): number --[[ Line: 301 ]]
	local Count = 0
	
	for _ in List do
		Count += 1
	end
	return Count
end

return TableUtilitiesModule