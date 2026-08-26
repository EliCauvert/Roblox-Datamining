local t = {}
local t_1 = {}

local function _(p1)
	return if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", tostring(p1))
end

local function makeValueString(p1)
	local var1 = type(p1)
	
	return if var1 == "string" then string.format("%q", p1) elseif var1 == "function" or var1 == "table" then string.format("<%s>", tostring(p1)) else string.format("%s", tostring(p1))
end

local function printKeypair(p1, p2, p3, p4)
	-- upvalues: makeValueString (ref)
	print(string.format("%s%s = %s,%s", p3, if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", tostring(p1)), makeValueString(p2), if p4 then string.format(" -- %s", p4) else ""))
end

function t.ShallowEqual(p1, p2, p3)
	-- upvalues: t_1 (ref)
	if not p1 or not p2 then
		return false
	elseif p1 == p2 then
		return true
	elseif not p3 then
		p3 = t_1
	end
	for i, v in p1 do
		if p2[i] ~= v and not p3[i] then
			return false
		end
	end
	for i, v_1 in p2 do
		if p1[i] ~= v_1 and not p3[i] then
			return false
		end
	end
	return true
end

local function formatDeepEqualMessage(p4, p5)
	return if p5 == 0 then p4:gsub("{1}", "first"):gsub("{2}", "second") else p4
end

function t.DeepEqual(p4, p5, p6)
	-- upvalues: formatDeepEqualMessage (ref), t (ref)
	p6 = p6 or 0
	
	if p4 == p5 then
		return true
	elseif typeof(p4) ~= typeof(p5) then
		return false, formatDeepEqualMessage(("{1} is of type %s, but {2} is of type %s"):format(typeof(p4), typeof(p5)), p6)
	elseif typeof(p4) ~= "table" then
		return false, formatDeepEqualMessage("{1} ~= {2}", p6)
	end
	local var1
	local t_1 = {}
	
	for i, v in p4 do
		t_1[i] = true
		var1, var9 = t.DeepEqual(v, p5[i], p6 + 1)
		
		if not var1 then
			return false, formatDeepEqualMessage(var9:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i))), p6)
		end
	end
	for i_1, v_1 in p5 do
		if not t_1[i_1] then
			var1, var8 = t.DeepEqual(p4[i_1], v_1, p6 + 1)
			
			if not var1 then
				return false, formatDeepEqualMessage(var8:gsub("{1}", ("{1}[%s]"):format(tostring(i_1))):gsub("{2}", ("{2}[%s]"):format(tostring(i_1))), p6)
			end
		end
	end
	return true
end

function t.EqualKey(p7, p8, p9)
	return p7 and p8 and (p9 and p9 ~= "") and (p7[p9] and p8[p9] and p7[p9] == p8[p9])
end

function t.TableDifference(p7, p8)
	local t = {}
	
	for i, v in p7 do
		if p8[i] ~= p7[i] then
			t[i] = v
		end
	end
	return t
end

local _ = function(p9)
	local t = {}
	
	for i = 1, #p9 do
		t[p9[i]] = true
	end
	return t
end

local _ = function(p10)
	local t = {}
	
	for i, v in p10 do
		table.insert(t, i)
	end
	return t
end

function t.ListDifference(p11, p12)
	-- upvalues: t (ref)
	local tableDifference = t.TableDifference
	local t_1 = {}
	
	for i = 1, #p11 do
		t_1[p11[i]] = true
	end
	local t_2 = {}
	
	for i_1 = 1, #p12 do
		t_2[p12[i_1]] = true
	end
	local t_3 = {}
	
	for i_2, v in tableDifference(t_1, t_2) do
		table.insert(t_3, i_2)
	end
	return t_3
end

function t.CheckListConsistency(p13)
	local var2 = false
	local var3 = false
	local var4 = true
	local var5 = 1
	
	for i, v in p13 do
		if type(i) == "string" then
			var3 = true
		elseif type(i) == "number" then
			if var5 ~= i then
				var4 = false
			end
			var2 = true
		end
		return false
		if not var3 or not var2 then
			var5 += 1
			continue
		end
		return false
	end
	return if var2 then var4 else true
end

function t.RecursiveToString(p14, p15)
	-- upvalues: t (ref)
	p15 = p15 or ""
	
	if type(p14) ~= "table" then
		return tostring(p14)
	end
	local var6 = ""
	
	if not t.CheckListConsistency(p14) then
		var6 ..= "-- WARNING: this table fails the list consistency test\n"
	end
	var6 ..= "{\n"
	
	for i, v in p14 do
		if type(i) == "string" then
			var6 ..= "  " .. p25 .. tostring(i) .. " = " .. t.RecursiveToString(v, "  " .. p25) .. ";\n"
		end
		if type(i) == "number" then
			var6 ..= "  " .. p25 .. t.RecursiveToString(v, "  " .. p25) .. ",\n"
		end
	end
	return var6 .. p25 .. "}"
end

function t.Print(p16, p17)
	-- upvalues: makeValueString (ref), printKeypair (ref)
	p17 = p17 or "  "
	
	if type(p16) ~= "table" then
		error("TableUtilities.Print must be passed a table", 2)
	end
	local t = {}
	
	local function recurse(p18, p19, p20)
		-- upvalues: t (ref), p17 (write), makeValueString (copy), printKeypair (copy), recurse (ref)
		t[p18] = true
		local repeated = string.rep(p17, p20)
		local repeated_1 = string.rep(p17, p20 + 1)
		
		if p19 then
			print(string.format("%s%s = %s {", repeated, if type(p19) == "string" then string.format("%s", p19) else string.format("[%s]", tostring(p19)), makeValueString(p18)))
		else
			print(string.format("%s%s {", repeated, makeValueString(p18)))
		end
		for i, v in p18 do
			if type(v) ~= "table" then
				print(string.format("%s%s = %s,%s", repeated_1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", tostring(i)), makeValueString(v), ""))
			elseif t[v] then
				printKeypair(i, v, repeated_1, "Possible cycle")
			else
				recurse(v, i, p20 + 1)
			end
		end
		print(string.format("%s}%s", repeated, if p20 > 0 then "," else ""))
	end
	
	recurse(p16, nil, 0)
end

function t.FieldCount(p18)
	local var7 = 0
	
	for i in p18 do
		var7 += 1
	end
	return var7
end

return t