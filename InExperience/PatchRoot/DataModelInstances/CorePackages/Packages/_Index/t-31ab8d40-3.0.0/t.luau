local t = {
	type = function(p0)
		return function(p1)
			-- upvalues: p0 (ref)
			local var6 = type(p1)
			
			if var6 == p0 then
				return true
			end
			return false, string.format("%s expected, got %s", p0, var6)
		end
	end,
	typeof = function(p2)
		return function(p3)
			-- upvalues: p2 (ref)
			local var7 = typeof(p3)
			
			if var7 == p2 then
				return true
			end
			return false, string.format("%s expected, got %s", p2, var7)
		end
	end,
	any = function(p4)
		if p4 == nil then
			return false, "any expected, got nil"
		end
		return true
	end
}
t.boolean = t.typeof("boolean")
t.thread = t.typeof("thread")
t.callback = t.typeof("function")
t["function"] = t.callback
t.none = t.typeof("nil")
t["nil"] = t.none
t.string = t.typeof("string")
t.table = t.typeof("table")
t.userdata = t.type("userdata")

function t.number(p5)
	local var8 = typeof(p5)
	
	if var8 ~= "number" then
		return false, string.format("number expected, got %s", var8)
	elseif p5 == p5 then
		return true
	end
	return false, "unexpected NaN value"
end

function t.nan(p6)
	local var9 = typeof(p6)
	
	if var9 ~= "number" then
		return false, string.format("number expected, got %s", var9)
	elseif p6 == p6 then
		return false, "unexpected non-NaN value"
	end
	return true
end

t.Axes = t.typeof("Axes")
t.BrickColor = t.typeof("BrickColor")
t.CatalogSearchParams = t.typeof("CatalogSearchParams")
t.CFrame = t.typeof("CFrame")
t.Color3 = t.typeof("Color3")
t.ColorSequence = t.typeof("ColorSequence")
t.ColorSequenceKeypoint = t.typeof("ColorSequenceKeypoint")
t.DateTime = t.typeof("DateTime")
t.DockWidgetPluginGuiInfo = t.typeof("DockWidgetPluginGuiInfo")
t.Enum = t.typeof("Enum")
t.EnumItem = t.typeof("EnumItem")
t.Enums = t.typeof("Enums")
t.Faces = t.typeof("Faces")
t.Instance = t.typeof("Instance")
t.NumberRange = t.typeof("NumberRange")
t.NumberSequence = t.typeof("NumberSequence")
t.NumberSequenceKeypoint = t.typeof("NumberSequenceKeypoint")
t.PathWaypoint = t.typeof("PathWaypoint")
t.PhysicalProperties = t.typeof("PhysicalProperties")
t.Random = t.typeof("Random")
t.Ray = t.typeof("Ray")
t.RaycastParams = t.typeof("RaycastParams")
t.RaycastResult = t.typeof("RaycastResult")
t.RBXScriptConnection = t.typeof("RBXScriptConnection")
t.RBXScriptSignal = t.typeof("RBXScriptSignal")
t.Rect = t.typeof("Rect")
t.Region3 = t.typeof("Region3")
t.Region3int16 = t.typeof("Region3int16")
t.TweenInfo = t.typeof("TweenInfo")
t.UDim = t.typeof("UDim")
t.UDim2 = t.typeof("UDim2")
t.Vector2 = t.typeof("Vector2")
t.Vector2int16 = t.typeof("Vector2int16")
t.Vector3 = t.typeof("Vector3")
t.Vector3int16 = t.typeof("Vector3int16")

function t.literal(...)
	-- upvalues: t (ref)
	local var10 = select("#", ...)
	
	if var10 == 1 then
		local var11 = ...
		
		return function(p7)
			-- upvalues: var11 (ref)
			if p7 == var11 then
				return true
			end
			return false, string.format("expected %s, got %s", tostring(var11), tostring(p7))
		end
	end
	local t_1 = {}
	
	for i = 1, var10 do
		t_1[i] = t.literal(select(i, ...))
	end
	return t.union(table.unpack(t_1, 1, var10))
end

t.exactly = t.literal

function t.keyOf(p8)
	-- upvalues: t (ref)
	local t_1 = {}
	local var14 = 0
	
	for i in pairs(p8) do
		var14 += 1
		t_1[var14] = i
	end
	return t.literal(table.unpack(t_1, 1, var14))
end

function t.valueOf(p9)
	-- upvalues: t (ref)
	local t_1 = {}
	local var16 = 0
	
	for i, v in pairs(p9) do
		var16 += 1
		t_1[var16] = v
	end
	return t.literal(table.unpack(t_1, 1, var16))
end

function t.integer(p10)
	-- upvalues: t (ref)
	local var17, var18 = t.number(p10)
	
	if not var17 then
		return false, var18 or ""
	elseif p10 % 1 == 0 then
		return true
	end
	return false, string.format("integer expected, got %s", p10)
end

function t.numberMin(a)
	-- upvalues: t (ref)
	return function(p11)
		-- upvalues: t (copy), a (ref)
		local var19, var20 = t.number(p11)
		
		if not var19 then
			return false, var20 or ""
		elseif a <= p11 then
			return true
		end
		return false, string.format("number >= %s expected, got %s", a, p11)
	end
end

function t.numberMax(a)
	-- upvalues: t (ref)
	return function(p12)
		-- upvalues: t (copy), a (ref)
		local var21, var22 = t.number(p12)
		
		if not var21 then
			return false, var22
		elseif p12 <= a then
			return true
		end
		return false, string.format("number <= %s expected, got %s", a, p12)
	end
end

function t.numberMinExclusive(a)
	-- upvalues: t (ref)
	return function(p13)
		-- upvalues: t (copy), a (ref)
		local var23, var24 = t.number(p13)
		
		if not var23 then
			return false, var24 or ""
		elseif a < p13 then
			return true
		end
		return false, string.format("number > %s expected, got %s", a, p13)
	end
end

function t.numberMaxExclusive(a)
	-- upvalues: t (ref)
	return function(p14)
		-- upvalues: t (copy), a (ref)
		local var25, var26 = t.number(p14)
		
		if not var25 then
			return false, var26 or ""
		elseif p14 < a then
			return true
		end
		return false, string.format("number < %s expected, got %s", a, p14)
	end
end

t.numberPositive = t.numberMinExclusive(0)
t.numberNegative = t.numberMaxExclusive(0)

function t.numberConstrained(p15, p16)
	-- upvalues: t (ref)
	assert(t.number(p15))
	assert(t.number(p16))
	local var27 = t.numberMin(p15)
	local var28 = t.numberMax(p16)
	
	return function(p17)
		-- upvalues: var27 (ref), var28 (ref)
		local var29, var30 = var27(p17)
		
		if not var29 then
			return false, var30 or ""
		end
		local var31, var32 = var28(p17)
		
		if var31 then
			return true
		end
		return false, var32 or ""
	end
end

function t.numberConstrainedExclusive(p18, p19)
	-- upvalues: t (ref)
	assert(t.number(p18))
	assert(t.number(p19))
	local var33 = t.numberMinExclusive(p18)
	local var34 = t.numberMaxExclusive(p19)
	
	return function(p20)
		-- upvalues: var33 (ref), var34 (ref)
		local var35, var36 = var33(p20)
		
		if not var35 then
			return false, var36 or ""
		end
		local var37, var38 = var34(p20)
		
		if var37 then
			return true
		end
		return false, var38 or ""
	end
end

function t.match(p21)
	-- upvalues: t (ref)
	assert(t.string(p21))
	
	return function(p22)
		-- upvalues: t (copy), p21 (ref)
		local var39, var40 = t.string(p22)
		
		if not var39 then
			return false, var40
		elseif string.match(p22, p21) == nil then
			return false, string.format("%q failed to match pattern %q", p22, p21)
		end
		return true
	end
end

function t.optional(p23)
	-- upvalues: t (ref)
	assert(t.callback(p23))
	
	return function(p24)
		-- upvalues: p23 (ref)
		if p24 == nil then
			return true
		end
		local var41, var42 = p23(p24)
		
		if var41 then
			return true
		end
		return false, string.format("(optional) %s", var42 or "")
	end
end

function t.tuple(...)
	local list = { ... }
	
	return function(...)
		-- upvalues: list (ref)
		local list_1 = { ... }
		
		for i, v in ipairs(list) do
			local var45, var46 = v(list_1[i])
			
			if var45 == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i, var46 or "")
			end
		end
		return true
	end
end

function t.keys(p25)
	-- upvalues: t (ref)
	assert(t.callback(p25))
	
	return function(p26)
		-- upvalues: t (copy), p25 (ref)
		local var47, var48 = t.table(p26)
		
		if var47 == false then
			return false, var48 or ""
		end
		for i in pairs(p26) do
			local var49, var50 = p25(i)
			
			if var49 == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), var50 or "")
			end
		end
		return true
	end
end

function t.values(p27)
	-- upvalues: t (ref)
	assert(t.callback(p27))
	
	return function(p28)
		-- upvalues: t (copy), p27 (ref)
		local var51, var52 = t.table(p28)
		
		if var51 == false then
			return false, var52 or ""
		end
		for i, v in pairs(p28) do
			local var53, var54 = p27(v)
			
			if var53 == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), var54 or "")
			end
		end
		return true
	end
end

function t.map(p29, p30)
	-- upvalues: t (ref)
	assert(t.callback(p29))
	assert(t.callback(p30))
	local var55 = t.keys(p29)
	local var56 = t.values(p30)
	
	return function(p31)
		-- upvalues: var55 (ref), var56 (ref)
		local var57, var58 = var55(p31)
		
		if not var57 then
			return false, var58 or ""
		end
		local var59, var60 = var56(p31)
		
		if var59 then
			return true
		end
		return false, var60 or ""
	end
end

function t.set(value)
	-- upvalues: t (ref)
	return t.map(value, t.literal(true))
end

local var1 = t.keys(t.integer)

function t.array(p32)
	-- upvalues: t (ref), var1 (ref)
	assert(t.callback(p32))
	local var61 = t.values(p32)
	
	return function(p33)
		-- upvalues: var1 (copy), var61 (ref)
		local var62, var63 = var1(p33)
		
		if var62 == false then
			return false, string.format("[array] %s", var63 or "")
		end
		local var64 = 0
		
		for i in ipairs(p33) do
			var64 += 1
		end
		for i_1 in pairs(p33) do
			if i_1 < 1 or var64 < i_1 then
				return false, string.format("[array] key %s must be sequential", tostring(i_1))
			end
		end
		local var65, var66 = var61(p33)
		
		if var65 then
			return true
		end
		return false, string.format("[array] %s", var66 or "")
	end
end

function t.strictArray(...)
	-- upvalues: t (ref), var1 (ref)
	local list = { ... }
	assert(t.array(t.callback)(list))
	
	return function(p34)
		-- upvalues: var1 (copy), list (ref)
		local var68, var69 = var1(p34)
		
		if var68 == false then
			return false, string.format("[strictArray] %s", var69 or "")
		elseif #list < #p34 then
			return false, string.format("[strictArray] Array size exceeds limit of %d", #list)
		end
		for i, v in pairs(list) do
			local var70, var71 = v(p34[i])
			
			if not var70 then
				return false, string.format("[strictArray] Array index #%d - %s", i, var71)
			end
		end
		return true
	end
end

local var2 = t.array(t.callback)

function t.union(...)
	-- upvalues: var2 (ref)
	local list = { ... }
	assert(var2(list))
	
	return function(p35)
		-- upvalues: list (ref)
		for i, v in ipairs(list) do
			if v(p35) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

t.some = t.union

function t.intersection(...)
	-- upvalues: var2 (ref)
	local list = { ... }
	assert(var2(list))
	
	return function(p36)
		-- upvalues: list (ref)
		for i, v in ipairs(list) do
			local var74, var75 = v(p36)
			
			if not var74 then
				return false, var75 or ""
			end
		end
		return true
	end
end

t.every = t.intersection
local var3 = t.map(t.any, t.callback)

function t.interface(p37)
	-- upvalues: var3 (ref), t (ref)
	assert(var3(p37))
	
	return function(p38)
		-- upvalues: t (copy), p37 (ref)
		local var76, var77 = t.table(p38)
		
		if var76 == false then
			return false, var77 or ""
		end
		for i, v in pairs(p37) do
			local var78, var79 = v(p38[i])
			
			if var78 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var79 or "")
			end
		end
		return true
	end
end

function t.strictInterface(p39)
	-- upvalues: var3 (ref), t (ref)
	assert(var3(p39))
	
	return function(p40)
		-- upvalues: t (copy), p39 (ref)
		local var80, var81 = t.table(p40)
		
		if var80 == false then
			return false, var81 or ""
		end
		for i, v in pairs(p39) do
			local var82, var83 = v(p40[i])
			
			if var82 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var83 or "")
			end
		end
		for i_1 in pairs(p40) do
			if not p39[i_1] then
				return false, string.format("[interface] unexpected field %q", tostring(i_1))
			end
		end
		return true
	end
end

function t.instanceOf(p41, p42)
	-- upvalues: t (ref)
	assert(t.string(p41))
	local var84 = if p42 ~= nil then t.children(p42) else nil
	
	return function(p43)
		-- upvalues: t (copy), p41 (ref), var84 (write)
		local var85, var86 = t.Instance(p43)
		
		if not var85 then
			return false, var86 or ""
		elseif p43.ClassName ~= p41 then
			return false, string.format("%s expected, got %s", p41, p43.ClassName)
		elseif var84 then
			local var87, var88 = var84(p43)
			
			if var87 then
				return true
			else
				return false, var88
			end
		end
	end
end

t.instance = t.instanceOf

function t.instanceIsA(p44, p45)
	-- upvalues: t (ref)
	assert(t.string(p44))
	local var89 = if p45 ~= nil then t.children(p45) else nil
	
	return function(p46)
		-- upvalues: t (copy), p44 (ref), var89 (write)
		local var90, var91 = t.Instance(p46)
		
		if not var90 then
			return false, var91 or ""
		elseif not p46:IsA(p44) then
			return false, string.format("%s expected, got %s", p44, p46.ClassName)
		elseif var89 then
			local var92, var93 = var89(p46)
			
			if var92 then
				return true
			else
				return false, var93
			end
		end
	end
end

function t.enum(p47)
	-- upvalues: t (ref)
	assert(t.Enum(p47))
	
	return function(p48)
		-- upvalues: t (copy), p47 (ref)
		local var94, var95 = t.EnumItem(p48)
		
		if not var94 then
			return false, var95
		elseif p48.EnumType == p47 then
			return true
		end
		return false, string.format("enum of %s expected, got enum of %s", tostring(p47), tostring(p48.EnumType))
	end
end

local var4 = t.tuple(t.callback, t.callback)

function t.wrap(p49, p50)
	-- upvalues: var4 (ref)
	assert(var4(p49, p50))
	
	return function(...)
		-- upvalues: p50 (ref), p49 (ref)
		assert(p50(...))
		
		return p49(...)
	end
end

function t.strict(p51)
	return function(...)
		-- upvalues: p51 (ref)
		assert(p51(...))
	end
end

local var5 = t.map(t.string, t.callback)

function t.children(p52)
	-- upvalues: var5 (ref), t (ref)
	assert(var5(p52))
	
	return function(p53)
		-- upvalues: t (copy), p52 (ref)
		local var96, var97 = t.Instance(p53)
		
		if not var96 then
			return false, var97 or ""
		end
		local var99
		local t_1 = {}
		
		for i, v in ipairs(p53:GetChildren()) do
			var99 = v.Name
			
			if p52[var99] then
				if not t_1[var99] then
					t_1[var99] = v
					continue
				end
				return false, string.format("Cannot process multiple children with the same name %q", var99)
			end
		end
		for i_1, v_1 in pairs(p52) do
			var99, var100 = v_1(t_1[i_1])
			
			if not var99 then
				return false, string.format("[%s.%s] %s", p53:GetFullName(), i_1, var100 or "")
			end
		end
		return true
	end
end

return t