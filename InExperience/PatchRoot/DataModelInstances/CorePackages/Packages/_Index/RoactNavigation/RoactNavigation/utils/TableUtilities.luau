local t = {}
local t_1 = {}

local function _(p0)
	return if type(p0) == "string" then string.format("%s", p0) else string.format("[%s]", tostring(p0))
end

local function makeValueString(p1)
	local var5 = type(p1)
	
	return if var5 == "string" then string.format("%q", p1) elseif var5 == "function" or var5 == "table" then string.format("<%s>", tostring(p1)) else string.format("%s", tostring(p1))
end

local function printKeypair(p2, p3, p4, p5)
	-- upvalues: makeValueString (ref)
	print(string.format("%s%s = %s,%s", p4, if type(p2) == "string" then string.format("%s", p2) else string.format("[%s]", tostring(p2)), makeValueString(p3), if p5 then string.format(" -- %s", p5) else ""))
end

function t.ShallowEqual(p6, p7, p8)
	-- upvalues: t_1 (ref)
	if not p6 or not p7 then
		return false
	elseif p6 == p7 then
		return true
	elseif not p8 then
		p8 = t_1
	end
	for i, v in p6 do
		if p7[i] ~= v and not p8[i] then
			return false
		end
	end
	for i, v_1 in p7 do
		if p6[i] ~= v_1 and not p8[i] then
			return false
		end
	end
	return true
end

local function formatDeepEqualMessage(p9, p10)
	return if p10 == 0 then p9:gsub("{1}", "first"):gsub("{2}", "second") else p9
end

function t.DeepEqual(p11, p12, p13)
	-- upvalues: formatDeepEqualMessage (ref), t (ref)
	p13 = p13 or 0
	
	if p11 == p12 then
		return true
	elseif typeof(p11) ~= typeof(p12) then
		return false, formatDeepEqualMessage(("{1} is of type %s, but {2} is of type %s"):format(typeof(p11), typeof(p12)), p13)
	elseif typeof(p11) ~= "table" then
		return false, formatDeepEqualMessage("{1} ~= {2}", p13)
	end
	local var7
	local t_1 = {}
	
	for i, v in p11 do
		t_1[i] = true
		var7, var9 = t.DeepEqual(v, p12[i], p13 + 1)
		
		if not var7 then
			return false, formatDeepEqualMessage(var9:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i))), p13)
		end
	end
	for i_1, v_1 in p12 do
		if not t_1[i_1] then
			var7, var8 = t.DeepEqual(p11[i_1], v_1, p13 + 1)
			
			if not var7 then
				return false, formatDeepEqualMessage(var8:gsub("{1}", ("{1}[%s]"):format(tostring(i_1))):gsub("{2}", ("{2}[%s]"):format(tostring(i_1))), p13)
			end
		end
	end
	return true
end

function t.EqualKey(p14, p15, p16)
	return p14 and p15 and (p16 and p16 ~= "") and (p14[p16] and p15[p16] and p14[p16] == p15[p16])
end

function t.TableDifference(p17, p18)
	local t = {}
	
	for i, v in p17 do
		if p18[i] ~= p17[i] then
			t[i] = v
		end
	end
	return t
end

local _ = function(p19)
	local t = {}
	
	for i = 1, #p19 do
		t[p19[i]] = true
	end
	return t
end

local _ = function(p20)
	local t = {}
	
	for i, v in p20 do
		table.insert(t, i)
	end
	return t
end

function t.ListDifference(p21, p22)
	-- upvalues: t (ref)
	local tableDifference = t.TableDifference
	local t_1 = {}
	
	for i = 1, #p21 do
		t_1[p21[i]] = true
	end
	local t_2 = {}
	
	for i_1 = 1, #p22 do
		t_2[p22[i_1]] = true
	end
	local t_3 = {}
	
	for i_2, v in tableDifference(t_1, t_2) do
		table.insert(t_3, i_2)
	end
	return t_3
end

function t.CheckListConsistency(p23)
	local var16 = false
	local var17 = false
	local var18 = true
	local var19 = 1
	
	for i, v in p23 do
		if type(i) == "string" then
			var17 = true
		elseif type(i) == "number" then
			if var19 ~= i then
				var18 = false
			end
			var16 = true
		end
		return false
		if not var17 or not var16 then
			var19 += 1
			continue
		end
		return false
	end
	return if var16 then var18 else true
end

function t.RecursiveToString(p24, p25)
	-- upvalues: t (ref)
	p25 = p25 or ""
	
	if type(p24) ~= "table" then
		return tostring(p24)
	end
	local var20 = ""
	
	if not t.CheckListConsistency(p24) then
		var20 ..= "-- WARNING: this table fails the list consistency test\n"
	end
	var20 ..= "{\n"
	
	for i, v in p24 do
		if type(i) == "string" then
			var20 ..= "  " .. p25 .. tostring(i) .. " = " .. t.RecursiveToString(v, "  " .. p25) .. ";\n"
		end
		if type(i) == "number" then
			var20 ..= "  " .. p25 .. t.RecursiveToString(v, "  " .. p25) .. ",\n"
		end
	end
	return var20 .. p25 .. "}"
end

function t.Print(p26, p27)
	-- upvalues: makeValueString (ref), printKeypair (ref)
	p27 = p27 or "  "
	
	if type(p26) ~= "table" then
		error("TableUtilities.Print must be passed a table", 2)
	end
	local t = {}
	
	local function recurse(p28, p29, p30)
		-- upvalues: t (ref), p27 (write), makeValueString (copy), printKeypair (copy), recurse (ref)
		t[p28] = true
		local repeated = string.rep(p27, p30)
		local repeated_1 = string.rep(p27, p30 + 1)
		
		if p29 then
			print(string.format("%s%s = %s {", repeated, if type(p29) == "string" then string.format("%s", p29) else string.format("[%s]", tostring(p29)), makeValueString(p28)))
		else
			print(string.format("%s%s {", repeated, makeValueString(p28)))
		end
		for i, v in p28 do
			if type(v) ~= "table" then
				print(string.format("%s%s = %s,%s", repeated_1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", tostring(i)), makeValueString(v), ""))
			elseif t[v] then
				printKeypair(i, v, repeated_1, "Possible cycle")
			else
				recurse(v, i, p30 + 1)
			end
		end
		print(string.format("%s}%s", repeated, if p30 > 0 then "," else ""))
	end
	
	recurse(p26, nil, 0)
end

function t.FieldCount(p31)
	local var25 = 0
	
	for i in p31 do
		var25 += 1
	end
	return var25
end

return t